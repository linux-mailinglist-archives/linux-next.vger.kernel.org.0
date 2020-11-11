Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9962AF608
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 17:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgKKQRU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 11:17:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgKKQRU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2020 11:17:20 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B3EC0613D1
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 08:17:20 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id t18so1230259plo.0
        for <linux-next@vger.kernel.org>; Wed, 11 Nov 2020 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PamShHWABeK9FG3pj1YZr7+UK6O/G76joJsw8LjrAY4=;
        b=TAE5bAGNXFcfhygHzCG/BpLO+Xb5y8F6rozqPbR+IHffCBH2EwUkkr2B2fSbsw6fbw
         ESAJDBcf1h84Sd2NL4+KoHL56A1nMBNviYyKLKR2raGiV8Zp4w+R8Npiya0M0zLG10PG
         I5X8fjGGebAAEvc4tMUCsvI33dUN/zySRNfocYQIbVjsRQeLBfVdp6yk3MX0AUe1289r
         XgDC+JI9CxLsczwhS8CJHK4ve2wmaKhfQi/9ElOA7248g+QRr+QGLWArrPB0LHPdE7YL
         SmCNxNuuDMIuNc2J2XPfiK/EhoN+77w+qtrI4DYKDATdPcD4tdmbW+Ekv5VlGg77tiPZ
         Zx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PamShHWABeK9FG3pj1YZr7+UK6O/G76joJsw8LjrAY4=;
        b=soyHHK57gd/NNPDJZqfuaNf1XheHYua5nbP9V6hqJDHnn3eWZyxbHzVrRiuWwJphYS
         xmWhC/tsi8zH2nKpaMmM84OG5Yw8n6Th4EXz7EfQaA1gN/DXj+B5lPTQL/omfsnkWkJv
         7iEOS57r8zFJw5wL6ZLnorvS1ISgJFhu1ICakFuffo9vkBqqVBeUXxksiOXXE+MQ0dF3
         DJEyXV85b8yIjZNUCrKx97ZF0L2B+tIn2QJG2MzAjddThjL+bE6rJ23dEYlunldFkW5+
         bzfnmfrinGM+qpIWl+WWDL2eHQ3bobAU7MNocCzLgEtibUEwiECq2yIYIxpkObmF33He
         a4yA==
X-Gm-Message-State: AOAM533ba+tA450/aMFc2iJiDYNjNgIuX8JKQE/1wM0xs0DLg+s1cUKY
        qEicksNDece28lD+B7C5h+vB265jwgdKmQ==
X-Google-Smtp-Source: ABdhPJxbv+EWtqN3vFYaBPtm8BBUiAqWJdAO22rZ21SHinRBCRWgiekyIyzGGzAUP9aCMlP6DjPDIw==
X-Received: by 2002:a17:902:7283:b029:d7:e4f5:adc7 with SMTP id d3-20020a1709027283b02900d7e4f5adc7mr13393062pll.20.1605111439159;
        Wed, 11 Nov 2020 08:17:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 185sm2625559pfg.173.2020.11.11.08.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:17:18 -0800 (PST)
Message-ID: <5fac0e8e.1c69fb81.fda10.49e4@mx.google.com>
Date:   Wed, 11 Nov 2020 08:17:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20201111
Subject: next/master baseline: 817 runs, 21 regressions (next-20201111)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 817 runs, 21 regressions (next-20201111)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b            | arm    | lab-collabora | gcc-8    | bcm2835_de=
fconfig            | 1          =

bcm2836-rpi-2-b            | arm    | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b            | arm64  | lab-baylibre  | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b            | arm64  | lab-baylibre  | gcc-8    | defconfig =
                   | 1          =

bcm2837-rpi-3-b            | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b            | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1028a-rdb            | arm64  | lab-nxp       | clang-10 | defconfig =
                   | 1          =

fsl-ls1028a-rdb            | arm64  | lab-nxp       | clang-11 | defconfig =
                   | 1          =

fsl-lx2160a-rdb            | arm64  | lab-nxp       | clang-11 | defconfig =
                   | 1          =

fsl-lx2160a-rdb            | arm64  | lab-nxp       | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64  | lab-nxp       | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64  | lab-nxp       | gcc-8    | defconfig =
                   | 1          =

imx8mp-evk                 | arm64  | lab-nxp       | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64  | lab-nxp       | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | clang-11 | x86_64_def=
config             | 1          =

r8a774c0-ek874             | arm64  | lab-cip       | gcc-8    | defconfig =
                   | 2          =

sun50i-h6-orangepi-3       | arm64  | lab-clabbe    | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-orangepi-3       | arm64  | lab-clabbe    | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201111/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201111
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3e14f70c05cda4794901ed8f976de3a88deebcc0 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b            | arm    | lab-collabora | gcc-8    | bcm2835_de=
fconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabdba80d3b495a3adb8876

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabdba80d3b495a3adb8=
877
        failing since 14 days (last pass: next-20201027, first fail: next-2=
0201028) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
bcm2836-rpi-2-b            | arm    | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabde8d007eb6a453db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabde8d007eb6a453db8=
854
        failing since 41 days (last pass: next-20200929, first fail: next-2=
0200930) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
bcm2837-rpi-3-b            | arm64  | lab-baylibre  | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd9620d7739f7b5db8854

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fabd9620d7739f7=
b5db8857
        new failure (last pass: next-20201109)
        2 lines

    2020-11-11 12:27:39.532000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-11 12:27:39.533000+00:00  (user:khilman) is already connected
    2020-11-11 12:27:55.474000+00:00  =00
    2020-11-11 12:27:55.475000+00:00  =

    2020-11-11 12:27:55.490000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-11 12:27:55.490000+00:00  =

    2020-11-11 12:27:55.490000+00:00  DRAM:  948 MiB
    2020-11-11 12:27:55.506000+00:00  RPI 3 Model B (0xa02082)
    2020-11-11 12:27:55.597000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-11 12:27:55.628000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (387 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
bcm2837-rpi-3-b            | arm64  | lab-baylibre  | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd3eb604bb87b72db8864

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fabd3eb604bb87b=
72db8867
        new failure (last pass: next-20201110)
        1 lines

    2020-11-11 12:04:54.701000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-11 12:04:54.701000+00:00  (user:khilman) is already connected
    2020-11-11 12:05:09.824000+00:00  =00
    2020-11-11 12:05:09.824000+00:00  =

    2020-11-11 12:05:09.824000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-11 12:05:09.824000+00:00  =

    2020-11-11 12:05:09.825000+00:00  DRAM:  948 MiB
    2020-11-11 12:05:09.840000+00:00  RPI 3 Model B (0xa02082)
    2020-11-11 12:05:09.929000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-11 12:05:09.960000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (381 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
bcm2837-rpi-3-b            | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd5a58d320912a0db88a4

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fabd5a58d320912=
a0db88a7
        new failure (last pass: next-20201110)
        1 lines

    2020-11-11 12:12:22.701000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-11 12:12:22.702000+00:00  (user:khilman) is already connected
    2020-11-11 12:12:38.381000+00:00  =00
    2020-11-11 12:12:38.381000+00:00  =

    2020-11-11 12:12:38.382000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-11 12:12:38.382000+00:00  =

    2020-11-11 12:12:38.382000+00:00  DRAM:  948 MiB
    2020-11-11 12:12:38.397000+00:00  RPI 3 Model B (0xa02082)
    2020-11-11 12:12:38.484000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-11 12:12:38.516000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (380 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
bcm2837-rpi-3-b            | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd7e70517c9a6eddb8861

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fabd7e70517c9a6=
eddb8864
        failing since 1 day (last pass: next-20201109, first fail: next-202=
01110)
        2 lines

    2020-11-11 12:21:53.910000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-11 12:21:53.911000+00:00  (user:khilman) is already connected
    2020-11-11 12:22:09.301000+00:00  =00
    2020-11-11 12:22:09.301000+00:00  =

    2020-11-11 12:22:09.301000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-11 12:22:09.302000+00:00  =

    2020-11-11 12:22:09.302000+00:00  DRAM:  948 MiB
    2020-11-11 12:22:09.316000+00:00  RPI 3 Model B (0xa02082)
    2020-11-11 12:22:09.404000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-11 12:22:09.436000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (387 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
fsl-ls1028a-rdb            | arm64  | lab-nxp       | clang-10 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabdc9ee86619764ddb887a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1028a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1028a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabdc9ee86619764ddb8=
87b
        new failure (last pass: next-20201110) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
fsl-ls1028a-rdb            | arm64  | lab-nxp       | clang-11 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabdbc3df665d17e0db8854

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1028a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1028a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabdbc3df665d17e0db8=
855
        new failure (last pass: next-20201110) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
fsl-lx2160a-rdb            | arm64  | lab-nxp       | clang-11 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabdaebf868ac4f7cdb8865

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabdaebf868ac4f7cdb8=
866
        new failure (last pass: next-20201110) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
fsl-lx2160a-rdb            | arm64  | lab-nxp       | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd77a89f08465a2db887b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabd77a89f08465a2db8=
87c
        new failure (last pass: next-20201110) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-nxp       | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabdd3d91ba9f1736db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabdd3d91ba9f1736db8=
854
        new failure (last pass: next-20201109) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-nxp       | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd58a4778b40e79db885f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabd58a4778b40e79db8=
860
        failing since 1 day (last pass: next-20201109, first fail: next-202=
01110) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-nxp       | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd77789f08465a2db886f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabd77789f08465a2db8=
870
        new failure (last pass: next-20201110) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-nxp       | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd997bd0b2d199cdb888f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabd997bd0b2d199cdb8=
890
        new failure (last pass: next-20201110) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-broonie   | clang-11 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd790e38ea0eb11db8856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/x86_=
64/x86_64_defconfig/clang-11/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/x86_=
64/x86_64_defconfig/clang-11/lab-broonie/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabd790e38ea0eb11db8=
857
        new failure (last pass: next-20201110) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a774c0-ek874             | arm64  | lab-cip       | gcc-8    | defconfig =
                   | 2          =


  Details:     https://kernelci.org/test/plan/id/5fabd4afe4d00b60b5db8853

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fabd4afe4d00b6=
0b5db8857
        new failure (last pass: next-20201110)
        11 lines

    2020-11-11 12:10:13.810000+00:00  kern  :alert :   ESR =3D 0x96000006
    2020-11-11 12:10:13.811000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-11-11 12:10:13.811000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-11-11 12:10:13.811000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-11-11 12:10:13.811000+00:00  kern  :alert : Data abort info:
    2020-11-11 12:10:13.811000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000006
    2020-11-11 12:10:13.811000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-11-11 12:10:13.811000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D000000008511e000
    2020-11-11 12:10:13.864000+00:00  kern  :alert : [0000000000000078] pgd=
=3D000000008511d003, p4d=3D000000008511d003, pud=3D000000008511b003, pmd=3D=
0000000000000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fabd4afe4d00b6=
0b5db8858
        new failure (last pass: next-20201110)
        2 lines

    2020-11-11 12:10:13.864000+00:00  kern  :emerg : Code: f9003c01 d65f03c=
0 d503233f d50323bf (f9403c00)    =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-orangepi-3       | arm64  | lab-clabbe    | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd982dbd69f67a4db8881

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabd982dbd69f67a4db8=
882
        new failure (last pass: next-20201110) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-orangepi-3       | arm64  | lab-clabbe    | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd69a9ffaa6cf75db886f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabd69a9ffaa6cf75db8=
870
        new failure (last pass: next-20201110) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-pine-h64-model-b | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabde06afc368d858db8866

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabde06afc368d858db8=
867
        new failure (last pass: next-20201110) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-pine-h64-model-b | arm64  | lab-baylibre  | gcc-8    | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fabd858da59e10c77db887a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201111/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fabd858da59e10c77db8=
87b
        new failure (last pass: next-20201110) =

 =20
