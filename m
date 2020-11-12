Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C122B0337
	for <lists+linux-next@lfdr.de>; Thu, 12 Nov 2020 11:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgKLK6H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Nov 2020 05:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgKLK6D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Nov 2020 05:58:03 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5148C0613D1
        for <linux-next@vger.kernel.org>; Thu, 12 Nov 2020 02:58:02 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id j5so2587074plk.7
        for <linux-next@vger.kernel.org>; Thu, 12 Nov 2020 02:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xNdKOhSomX1rA9TrrIvRIZc6Mvu6DmA/pe0oKo45a3g=;
        b=mFW3tKdIINLY2/KnbaCXLIXbzqH5Vsr0hxhktw/CL+J3rxs87/8sqANNfU1q/gqch+
         LIzzCqLIZJoDxEAZFgvX0SQvQGi1D5GvXTgLtFxztQ/z+FpkpviYrqxm2cqkoK8qFe55
         PXLo4hqFYoYn/SzJHLgVAcMCkxtoKnLizQwoTRAFPUPQjdECvVC0XWqAvQWUWpXsuYIe
         Vp6/EsTZ3VKGTS7moiwGjPv0I4m7s/NctEDwPPGiKOJIF59SOFcS/J6wlj809L9jp9T0
         FkRVrIxHb24vcSRNuLCv3oBbdm2z9iMvFC+AttQgxOsmbwtzV/m5TEpTDD5V5HSXHsNg
         UNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xNdKOhSomX1rA9TrrIvRIZc6Mvu6DmA/pe0oKo45a3g=;
        b=ZHtsH+aVxGb2/8qI9N7qFGqyVu1UIselNDjG0ibOzEPbWXa1sDzG1yo8UW/DFS49Iv
         XXl+/JupqKzg5gOefj6mw6T3rQipOYb0ZHIqaz0vlOdT+6E4jO+gTFU7rjCducxGGDMP
         uZgKUIQj1CU8hcIm9ERl/Nx5E9stnbUfzjfKgdm9Bc/p1z/W6jWDlOrdbtxeQHfgtX1y
         UcvoCDmAaOWrpfq/sjdzEVtFB/kLdtUeGpEnJuyPHhJn1NXCHq2wYKUGUbAM9ML347yQ
         eMvpIMlEaMaNwcHBItaVsxBwcM6vwSsDfOqwANWKfaDGii39nhEWXuG31QI2G3A05feA
         +FkQ==
X-Gm-Message-State: AOAM531vFcrjo1CqjqvKdkbOIG1VZ/ZWX9xJ8/+Gh5AaCDgPUoAjy8hJ
        N+x4SkM3B3wXrjtesk37/IOQBpd6ZRE20A==
X-Google-Smtp-Source: ABdhPJw8WkN0aWMCThgMFPjTLUv3loRA8MVzlQSMGWpE/KMQqRlfhQ3SoZ/lp7ISJuHXqbT4sWYIig==
X-Received: by 2002:a17:902:900a:b029:d7:d966:1a44 with SMTP id a10-20020a170902900ab02900d7d9661a44mr18601911plp.8.1605178679106;
        Thu, 12 Nov 2020 02:57:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d12sm3091269pjs.27.2020.11.12.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 02:57:58 -0800 (PST)
Message-ID: <5fad1536.1c69fb81.1311d.5d2e@mx.google.com>
Date:   Thu, 12 Nov 2020 02:57:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20201112
Subject: next/master baseline: 817 runs, 19 regressions (next-20201112)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 817 runs, 19 regressions (next-20201112)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | clang-10 | defconfig  =
                  | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | clang-11 | defconfig  =
                  | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

beagle-xm                  | arm   | lab-baylibre  | gcc-8    | omap2plus_d=
efconfig          | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

fsl-ls2088a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =

fsl-lx2160a-rdb            | arm64 | lab-nxp       | clang-10 | defconfig  =
                  | 1          =

fsl-lx2160a-rdb            | arm64 | lab-nxp       | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

fsl-lx2160a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =

imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230       | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =

sun50i-h6-orangepi-3       | arm64 | lab-clabbe    | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-h6-orangepi-3       | arm64 | lab-clabbe    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre  | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201112/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201112
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a60b1e1fe9ca5f9d9a79e89a8d71228a8e04d35c =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/5face7bbf47dc1bbf8db8859

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face7bbf47dc1bbf8db8=
85a
        failing since 15 days (last pass: next-20201027, first fail: next-2=
0201028) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5face33f0306aa096fdb886c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face33f0306aa096fdb8=
86d
        failing since 42 days (last pass: next-20200929, first fail: next-2=
0200930) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5face485b08d87a880db8885

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5face485b08d87a8=
80db8888
        new failure (last pass: next-20201111)
        1 lines

    2020-11-12 07:28:04.231000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-12 07:28:04.231000+00:00  (user:khilman) is already connected
    2020-11-12 07:28:20.243000+00:00  =00
    2020-11-12 07:28:20.243000+00:00  =

    2020-11-12 07:28:20.243000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-12 07:28:20.244000+00:00  =

    2020-11-12 07:28:20.244000+00:00  DRAM:  948 MiB
    2020-11-12 07:28:20.259000+00:00  RPI 3 Model B (0xa02082)
    2020-11-12 07:28:20.346000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-12 07:28:20.378000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (381 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | clang-11 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5face3c9d1989af3d9db885f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5face3c9d1989af3=
d9db8862
        new failure (last pass: next-20201111)
        2 lines

    2020-11-12 07:24:56.804000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-12 07:24:56.804000+00:00  (user:khilman) is already connected
    2020-11-12 07:25:12.716000+00:00  =00
    2020-11-12 07:25:12.716000+00:00  =

    2020-11-12 07:25:12.717000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-12 07:25:12.732000+00:00  =

    2020-11-12 07:25:12.732000+00:00  DRAM:  948 MiB
    2020-11-12 07:25:12.749000+00:00  RPI 3 Model B (0xa02082)
    2020-11-12 07:25:12.838000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-12 07:25:12.868000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (383 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5face1a62df889663adb8858

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face1a62df889663adb8=
859
        new failure (last pass: next-20201111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
beagle-xm                  | arm   | lab-baylibre  | gcc-8    | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5facdd18fd78b7fb60db8879

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5facdd18fd78b7fb60db8=
87a
        new failure (last pass: next-20201111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5face0b5bf452e3423db886d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face0b5bf452e3423db8=
86e
        new failure (last pass: next-20201111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls2088a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5face2f92d0d5a1c6ddb88a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face2f92d0d5a1c6ddb8=
8a1
        new failure (last pass: next-20201111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-lx2160a-rdb            | arm64 | lab-nxp       | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5face5dd6b69b2409ddb885b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face5dd6b69b2409ddb8=
85c
        new failure (last pass: next-20201111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-lx2160a-rdb            | arm64 | lab-nxp       | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5face0dd1e4b071bf6db8864

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-lx2160=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-lx2160=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face0dd1e4b071bf6db8=
865
        new failure (last pass: next-20201110) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-lx2160a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5face30dbbc7eb7e8adb885e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face30dbbc7eb7e8adb8=
85f
        new failure (last pass: next-20201111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5face17c95abec4273db886f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face17c95abec4273db8=
870
        failing since 17 days (last pass: next-20201023, first fail: next-2=
0201026) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5face6056ac3c66e5cdb889d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face6056ac3c66e5cdb8=
89e
        failing since 0 day (last pass: next-20201109, first fail: next-202=
01111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5face2e92d0d5a1c6ddb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face2e92d0d5a1c6ddb8=
854
        failing since 0 day (last pass: next-20201110, first fail: next-202=
01111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxl-s905d-p230       | arm64 | lab-baylibre  | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5face22a6a88946b6cdb889d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face22a6a88946b6cdb8=
89e
        new failure (last pass: next-20201111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-orangepi-3       | arm64 | lab-clabbe    | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5face09133cc3a7dacdb8871

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face09133cc3a7dacdb8=
872
        failing since 0 day (last pass: next-20201110, first fail: next-202=
01111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-orangepi-3       | arm64 | lab-clabbe    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5face4f4fa9c26a0d6db8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face4f4fa9c26a0d6db8=
854
        failing since 0 day (last pass: next-20201110, first fail: next-202=
01111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre  | clang-11 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5face1a42df889663adb8853

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face1a42df889663adb8=
854
        failing since 0 day (last pass: next-20201110, first fail: next-202=
01111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5face94e9bb23e8becdb885d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5face94e9bb23e8becdb8=
85e
        failing since 0 day (last pass: next-20201110, first fail: next-202=
01111) =

 =20
