Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D16318534
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 07:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbhBKGYT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 01:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhBKGYQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Feb 2021 01:24:16 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A435C061574
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 22:23:36 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id z9so2844204pjl.5
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 22:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jw2joto0ycumV0U105pGz2eBQ7kFFltrv693bC8E6yA=;
        b=EyXI5Fb7WIemfGTID7VGqr/QIFs1yG1J+QYmQ/l7dWmNiC5FyfaaeAo0H80e3BDWqq
         VXbgmM+2BMgfOy9MALOjRvOvTi4fqa0MiPpg3ffHGvZJmnP07vonUcHVRhnJY4yNfa72
         QXtRahwLQBJoTq/CJPd780YNQKnEL2/SH5kcGJMxAx04cCgYCC72d2wsswCWlUE4Lr+O
         9eE91+pW0DeYYhQ4oDeRbDNhFCHn/kxWwG4x7IWRiKZXbTADA2iDuDbHvjRZig3SYTDJ
         MZnl6DRktfgOLmW/PDyo6V2x8xJDvXy1WRVjSy4fPendFGHokmMpYnNQaP80Smjf8V9y
         9egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jw2joto0ycumV0U105pGz2eBQ7kFFltrv693bC8E6yA=;
        b=ahxvMmy08MCvB7thsD+KGqzsPPQA9sUsiLN6YhK8cO4UIuyEyJ6itPS96/blOk+GYO
         uI8EtRhh5XdVcATZXMDgnduqG6N3WbGUTIPsRyC3HU72vAT+OtKSl7MC9bfBeVlITNsN
         OTP1VIO7nIZjEwzHuFl2wZSXVM7izyZZkUqTxbnxv7pdrXpWvkyO+wbyMxiihHM3H/gX
         QficHagb5XJc1i34rgAvRIyE0trnFCShjvYkvkx/rIhhw+FUyrr1IuJ6tV2AMDLctkJ8
         lLYPL2fkaJcl7pYpiyeAn4N1vLhWC7aBY6ujdCjgks+S7jK4aaEZRNpr2IPHWotA0hYB
         xN/A==
X-Gm-Message-State: AOAM5339MUCLUAHC6LNkLNGhROywizOoOcmmfIrH8qMbCjDaSPnhJKTM
        SqVCjbDZUnu/Tl60qGgyzladQzVOx/0iSA==
X-Google-Smtp-Source: ABdhPJyFYOHz7PSHmrPnSntOigzuoxMm2NI6HTVwQRxlOFilbS9PAGj0Tgu7HsLfi8QU6fIbL79+ew==
X-Received: by 2002:a17:90b:1a87:: with SMTP id ng7mr2580747pjb.211.1613024615331;
        Wed, 10 Feb 2021 22:23:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v26sm3988627pff.195.2021.02.10.22.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 22:23:34 -0800 (PST)
Message-ID: <6024cd66.1c69fb81.1cfd6.9c19@mx.google.com>
Date:   Wed, 10 Feb 2021 22:23:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.11-rc7-180-g4a7073d1d81e
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 193 runs,
 6 regressions (v5.11-rc7-180-g4a7073d1d81e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 193 runs, 6 regressions (v5.11-rc7-180-g4a7073=
d1d81e)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =

meson-g12b-odroid-n2     | arm64 | lab-baylibre | gcc-8    | defconfig     =
               | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc7-180-g4a7073d1d81e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc7-180-g4a7073d1d81e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4a7073d1d81e68341c8776a443494218212220c4 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602498480fb628eb923abe62

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
80-g4a7073d1d81e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
80-g4a7073d1d81e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/602498480fb628eb=
923abe67
        new failure (last pass: v5.11-rc7-135-gfeb8c1ad740c)
        2 lines

    2021-02-11 02:34:41.070000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2021-02-11 02:34:41.070000+00:00  (user:khilman) is already connected
    2021-02-11 02:34:55.859000+00:00  =00
    2021-02-11 02:34:55.859000+00:00  =

    2021-02-11 02:34:55.875000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2021-02-11 02:34:55.875000+00:00  =

    2021-02-11 02:34:55.875000+00:00  DRAM:  948 MiB
    2021-02-11 02:34:55.891000+00:00  RPI 3 Model B (0xa02082)
    2021-02-11 02:34:55.981000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2021-02-11 02:34:56.013000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (389 line(s) more)  =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6024995e18a2d537fc3abe7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
80-g4a7073d1d81e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
80-g4a7073d1d81e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6024995e18a2d537fc3ab=
e7d
        failing since 21 days (last pass: v5.11-rc4-275-g31be679b2913, firs=
t fail: v5.11-rc4-315-gcbe1658e272d) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602499761778efbb1b3abe62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
80-g4a7073d1d81e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
80-g4a7073d1d81e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602499761778efbb1b3ab=
e63
        new failure (last pass: v5.11-rc7-135-gfeb8c1ad740c) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60249b059100894a573abe78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
80-g4a7073d1d81e/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
80-g4a7073d1d81e/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60249b059100894a573ab=
e79
        new failure (last pass: v5.11-rc6-329-g3463a75620c7) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
meson-g12b-odroid-n2     | arm64 | lab-baylibre | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60249930981e0568473abe63

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
80-g4a7073d1d81e/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odr=
oid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
80-g4a7073d1d81e/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odr=
oid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60249930981e056=
8473abe69
        new failure (last pass: v5.11-rc6-329-g3463a75620c7)
        7 lines

    2021-02-11 02:40:27.269000+00:00  :alert :   ESR =3D 0x86000004   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60249930981e056=
8473abe6a
        new failure (last pass: v5.11-rc6-329-g3463a75620c7)
        2 lines

    2021-02-11 02:40:27.270000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-02-11 02:40:27.270000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-02-11 02:40:27.271000+00:00  kern  :alert : [00163b00000000<8>[   =
16.288164] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2021-02-11 02:40:27.271000+00:00  00] addres<8>[   16.297523] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 708636_1.5.2.4.1>   =

 =20
