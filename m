Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AA02A3CD7
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 07:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgKCGe0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 01:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725982AbgKCGeZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2020 01:34:25 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A4AC0617A6
        for <linux-next@vger.kernel.org>; Mon,  2 Nov 2020 22:34:25 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id u2so2159855pls.10
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2020 22:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EAMlIvNTStSgHUek1LxlzfF6eiDYl9m/RK4Ssfi6YIU=;
        b=M78Kvw58NIOTrAp5X7P/vl1Rsq2y3AqY2PiqZ293J39Vtuu/okHjg02LConGaul/oT
         DmV+koxWlqExDpgNTvsVti0MByScOikkR63QWpJKH5209IoexzC12PEESAosR2JMlwJl
         W5LCraxvLKbTvCMSmQ9bvbq5o9Bt5KqKJwNeglqhAVM+T8ygUKxq4dcDArzjnEL8h8oL
         2GFoZhkTZIR1+GVjtMD+WbK3ZwXVFxNbNY3G/GyH4o8TsC8G0pnpqKnNJVB1vFwnzgPM
         lowioYR7XUoAOWomfdFDtoP8Sfo9uRKcQHQmAZ09nO8AhUlAmEDXCmVfcZfTHyFihQ5c
         gC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EAMlIvNTStSgHUek1LxlzfF6eiDYl9m/RK4Ssfi6YIU=;
        b=SAlkiZQJ37/FokHp+/OibBAVGumvFyAlYoexxK4xud4Mm36xbsqRJVR6hBO4X7PQMF
         Cfb5WMRot0awxT3Y/4YltjqaDKZEhxxYps4ZaHtECp9c2LSD2g/hNvhcNCPh0qdB5P0c
         vhQ7Qf8oAko29Qm+UnBeIq1a8vWhfSpKSU3Xzw2+pAx9Ru8EEJLiMWOonMBwNKKzbhw1
         ZtxeDejgvDKx+wFWgW7lmSLkRuWC36Xekyahkkd1EA6yNLcyRbSk8uPSOCSYj6ZPIdBb
         R+FsLJJkX4Plk9C2mQp3eRLxcaLomr2TvJAVp3jEAsOC8Jt/9BjqXjHs2EZr+/n9QAZU
         TsDQ==
X-Gm-Message-State: AOAM530/rrO9Ky5jgNNKnlcDFVw0hLBSPNkxIyZCBFNRKFodJywIr3HI
        8QxfQaLIxbOOfcUjRksN6ZTYM3XjyYkopQ==
X-Google-Smtp-Source: ABdhPJwHqFrpgV7WuajW/VjrziQVOSsFy9+s+y4fvQo5PodcZkvCYexro8donncUdlwNsxWxfgrMSQ==
X-Received: by 2002:a17:902:8c8a:b029:d6:d1e7:e78e with SMTP id t10-20020a1709028c8ab02900d6d1e7e78emr6473437plo.39.1604385264807;
        Mon, 02 Nov 2020 22:34:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a4sm15629853pfa.65.2020.11.02.22.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 22:34:23 -0800 (PST)
Message-ID: <5fa0f9ef.1c69fb81.ea90a.b114@mx.google.com>
Date:   Mon, 02 Nov 2020 22:34:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc2-238-g6462cab89467
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 309 runs,
 7 regressions (v5.10-rc2-238-g6462cab89467)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 309 runs, 7 regressions (v5.10-rc2-238-g6462ca=
b89467)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | sama5_defconfi=
g              | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre | gcc-8    | omap2plus_defc=
onfig          | 1          =

imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =

panda                    | arm   | lab-baylibre | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc2-238-g6462cab89467/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc2-238-g6462cab89467
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6462cab89467882a7723521df206328c7d47223e =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre | gcc-8    | sama5_defconfi=
g              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa0c4b3a9ab62305b3fe7f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa0c4b3a9ab62305b3fe=
7fa
        failing since 181 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa0c48f54d28a1feb3fe7e8

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fa0c48f54d28a1f=
eb3fe7ed
        new failure (last pass: v5.10-rc1-410-g125436cab6b8)
        1 lines

    2020-11-03 02:44:35.741000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-03 02:44:35.741000+00:00  (user:khilman) is already connected
    2020-11-03 02:44:51.339000+00:00  =00
    2020-11-03 02:44:51.340000+00:00  =

    2020-11-03 02:44:51.356000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-03 02:44:51.356000+00:00  =

    2020-11-03 02:44:51.357000+00:00  DRAM:  948 MiB
    2020-11-03 02:44:51.371000+00:00  RPI 3 Model B (0xa02082)
    2020-11-03 02:44:51.463000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-03 02:44:51.496000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (379 line(s) more)  =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
beagle-xm                | arm   | lab-baylibre | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa0c7571b3c9816e93fe7df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa0c7571b3c9816e93fe=
7e0
        failing since 0 day (last pass: v5.10-rc1-410-g125436cab6b8, first =
fail: v5.10-rc1-622-ga2808d2bc1fb) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa0c41f0b6af78f013fe7ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa0c41f0b6af78f013fe=
7ee
        failing since 8 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa0c6d8b125d3499e3fe7f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa0c6d8b125d3499e3fe=
7f1
        failing since 8 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa0c50c60d88c4bad3fe7de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa0c50c60d88c4bad3fe=
7df
        new failure (last pass: v5.10-rc1-622-ga2808d2bc1fb) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
panda                    | arm   | lab-baylibre | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa0c7c3e941830ea63fe7e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-2=
38-g6462cab89467/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa0c7c3e941830ea63fe=
7e1
        new failure (last pass: v5.10-rc1-622-ga2808d2bc1fb) =

 =20
