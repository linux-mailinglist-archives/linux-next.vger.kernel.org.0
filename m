Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 611E329D9EC
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 00:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbgJ1XGh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 19:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731423AbgJ1XGg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2020 19:06:36 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001FAC0613CF
        for <linux-next@vger.kernel.org>; Wed, 28 Oct 2020 16:06:35 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id j7so1295231oie.12
        for <linux-next@vger.kernel.org>; Wed, 28 Oct 2020 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uOuy6Lj4DrulnmlCVlBHW5xFhiA3mVTAC//PolMAoD4=;
        b=ROZOAY2ZndSLV+FdpXjdO2dmbZgfidczghIS99Fyfh8sLZNNcttJeQKOdAb/j2fpqB
         YiSTBvf4abKKOghbqGiJNuCgYAPVim+j5CY4MIeouNB6obWIZpAE8ELRGl+8KYB/BWUL
         DzJ6bMRCzaTAKMdZDzI/KuDkrUd1AIjw2Sv0zKXpLBRrWDJ0LLEjQYc/IWxGSnzpYZpA
         tPzsRyD3VzaDr1HlJ793UilQiY4cFL2B2Bj8w92uC6VlX3KmycLd3YOgk4WM8Z4U8nPb
         v0gDS2kAar5qZ98gJTF2u+SPIlYCdzzpBfNjYltBHbNJMiJGWgHwe2b7sciMPZhX84ln
         aWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uOuy6Lj4DrulnmlCVlBHW5xFhiA3mVTAC//PolMAoD4=;
        b=L4UbkADQIW3TsTIZdeg/sdGwQSVzMrNQrJt1Ez8pNn+CX++mjctlQDiOykAASRUV+M
         etTBP1it1bbVUeWhJW6Ly0MaumeU+DBm/9W8eTt/QDmkbKL+/6jysj29iuqu0Py98his
         xq36KQKocK/HofUFAmODUB4LwaamznrQKyJUMpFz7q9XJpmeDcB5zb9yYE+vY2oyyXl7
         +I7Gb4fP55GrvS7+mTcRaR3fqXqZV+r1PuaAap0e9Ri0hGeqnfQBoRF52KfvMw8i+AA6
         EFHdJCpIyCF1Dp+GmsKsYutopqjImRv90WGfq9neOa/sf6/fSThpdApYvU3ojJ1KJuzF
         ZDCA==
X-Gm-Message-State: AOAM532mQ5UsImPb4/ExKsim8Ca4jnm0yfjSofqsQfh5v37MfKDA5ZML
        korzUil2SK5M6tUwweChrZ3Dig8hMNFyXg==
X-Google-Smtp-Source: ABdhPJwFaAYRvVhCkRq6xdoRCi9APl4STf3mRs8jKqpsjGt0IV9o5VVqSx5MBzAaWShPaKAHIyWKkg==
X-Received: by 2002:a17:90a:fd0d:: with SMTP id cv13mr2436415pjb.34.1603857405246;
        Tue, 27 Oct 2020 20:56:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 22sm3915713pjw.34.2020.10.27.20.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 20:56:44 -0700 (PDT)
Message-ID: <5f98ebfc.1c69fb81.214c1.8651@mx.google.com>
Date:   Tue, 27 Oct 2020 20:56:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc1-241-g9727e4ed9bd3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 369 runs,
 10 regressions (v5.10-rc1-241-g9727e4ed9bd3)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 369 runs, 10 regressions (v5.10-rc1-241-g9727e=
4ed9bd3)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 1          =

fsl-ls1046a-rdb          | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =

panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc1-241-g9727e4ed9bd3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc1-241-g9727e4ed9bd3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9727e4ed9bd37c1bec87eb8cc83c114c508fba51 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5f98b94a9de0912f75381012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f98b94a9de0912f75381=
013
        failing since 175 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/5f98b531a1f38dd185381078

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f98b531a1f38dd1=
8538107d
        new failure (last pass: v5.10-rc1-155-gee89b55f83b5)
        1 lines

    2020-10-28 00:00:54.887000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-10-28 00:00:54.887000+00:00  (user:khilman) is already connected
    2020-10-28 00:01:10.013000+00:00  =00
    2020-10-28 00:01:10.014000+00:00  =

    2020-10-28 00:01:10.030000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-10-28 00:01:10.030000+00:00  =

    2020-10-28 00:01:10.030000+00:00  DRAM:  948 MiB
    2020-10-28 00:01:10.046000+00:00  RPI 3 Model B (0xa02082)
    2020-10-28 00:01:10.137000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-10-28 00:01:10.169000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (379 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5f98b7fff47a8161a138101d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f98b7fff47a8161=
a1381022
        failing since 1 day (last pass: v5.9-14860-gd56fc2efcc70, first fai=
l: v5.10-rc1-155-gee89b55f83b5)
        2 lines

    2020-10-28 00:12:41.043000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-10-28 00:12:41.043000+00:00  (user:khilman) is already connected
    2020-10-28 00:12:56.391000+00:00  =00
    2020-10-28 00:12:56.391000+00:00  =

    2020-10-28 00:12:56.391000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-10-28 00:12:56.392000+00:00  =

    2020-10-28 00:12:56.392000+00:00  DRAM:  948 MiB
    2020-10-28 00:12:56.407000+00:00  RPI 3 Model B (0xa02082)
    2020-10-28 00:12:56.493000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-10-28 00:12:56.525000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (383 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
beagle-xm                | arm   | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f98bb6259f4499563381021

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f98bb6259f4499563381=
022
        failing since 1 day (last pass: v5.9-14860-gd56fc2efcc70, first fai=
l: v5.10-rc1-155-gee89b55f83b5) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
fsl-ls1046a-rdb          | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5f98b8a9874c9dad2e38101c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-fsl-ls1046a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-fsl-ls1046a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f98b8a9874c9dad2e381=
01d
        new failure (last pass: v5.10-rc1-155-gee89b55f83b5) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f98bac71f0011e2ee381012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f98bac71f0011e2ee381=
013
        failing since 2 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f98bacfe5a45e3ebf381012

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f98bacfe5a45e3ebf381=
013
        failing since 2 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/5f98b72bd3d49426bc381021

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f98b72bd3d49426bc381=
022
        new failure (last pass: v5.10-rc1-155-gee89b55f83b5) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f98b97f0e3ed056bc381040

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f98b97f0e3ed05=
6bc381046
        failing since 83 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35)
        60 lines

    2020-10-28 00:21:14.015000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c802
    2020-10-28 00:21:14.020000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c803
    2020-10-28 00:21:14.026000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c804
    2020-10-28 00:21:14.032000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c805
    2020-10-28 00:21:14.038000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c806
    2020-10-28 00:21:14.043000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c807
    2020-10-28 00:21:14.049000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c808
    2020-10-28 00:21:14.059000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c809
    2020-10-28 00:21:14.061000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80a
    2020-10-28 00:21:14.066000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80b =

    ... (49 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f98bb4959f449956338101c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-2=
41-g9727e4ed9bd3/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f98bb4959f4499563381=
01d
        failing since 83 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35) =

 =20
