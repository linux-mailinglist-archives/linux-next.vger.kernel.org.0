Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE683E249D
	for <lists+linux-next@lfdr.de>; Fri,  6 Aug 2021 09:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238787AbhHFH63 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Aug 2021 03:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbhHFH62 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Aug 2021 03:58:28 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E009C061798
        for <linux-next@vger.kernel.org>; Fri,  6 Aug 2021 00:58:12 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id a8so15276792pjk.4
        for <linux-next@vger.kernel.org>; Fri, 06 Aug 2021 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Dyu61A0/gN0tL+TLU0SffH8A4A32vyjhol0aI1TU41Y=;
        b=C4UzQeDgWdktILlnoO5bfTvwD+7JeO+pmileM+14H6iEj27kAGhw3iR7dEb1M7wyZG
         zYv/3TvvA+Lzf41/uM7bNxU2ZRBQy/9POnMplL+vdog0lJtyU0RyGNT2t08bRLgp6TxC
         XrkWgx2zOkyv70+kjZx/UdahEwm/LPnm+32XuoxMHJ1OZ9tdgF6QK7KAJTPf0oJ29hrQ
         7y1fKMdDdtxpI9yS2F7u6nqjNNSidSL3ZSZ95X8rduVE7s8vaDmnzi5tNWJxoiUMUkGo
         gTFysNoCny0ExsgHYZFAxHq48mhBWRH5ibXtILNnIBiKY+VUI3UIBYIcPB2lI2V2mgmm
         h6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Dyu61A0/gN0tL+TLU0SffH8A4A32vyjhol0aI1TU41Y=;
        b=bpHYupc6Jg0CFEQxWHbba0zNQziOhVAcLv446HivJPBxZdRJbBkaxSgczhR+KVZFjU
         jStwFwVLeXDeASFI8YeNOu8P8k96lVhjOWA2p1EAi4Rj7AqgrgxNaYhmsjX07DUGlYUJ
         WO3P6WV/fvLQNgc9AxCwx/U3S4TTFA262iJOKRwtTCu5rZzC7bqOlmCZbh5DFDicaG0k
         5BlATE1tWxjAyoUdGmTbDX5oJLRJhEYlIALDP0gBtfSG+Gt6l57JQQohgm9Yt6Pc6UKf
         hmI3iGrO/aHvgDEWjS8NVEKWhiIezVGnhidQqx6b97Mrc41SCdYsO8U1h5IIcTpRRwEz
         PNrg==
X-Gm-Message-State: AOAM532Kb7sLngRsK7mMYyhKDiSdsyy9wk4dJ+RaIaKN1n7BdQTxlP8A
        b5v891eK3q3zi1W+srmK+ezIVnsjXE2GqQ==
X-Google-Smtp-Source: ABdhPJzeFNtv4zawfyjzY63UL+cl94wEZSklMmft0JqxeSBcUMrV/Jno4UDpmGb53+qXPtJiIHDo4w==
X-Received: by 2002:a17:90a:498b:: with SMTP id d11mr20143075pjh.49.1628236691496;
        Fri, 06 Aug 2021 00:58:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g25sm9460117pfk.138.2021.08.06.00.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 00:58:11 -0700 (PDT)
Message-ID: <610ceb93.1c69fb81.af9e0.c658@mx.google.com>
Date:   Fri, 06 Aug 2021 00:58:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.14-rc4-389-g3082d2ab7f69
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 350 runs,
 13 regressions (v5.14-rc4-389-g3082d2ab7f69)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 350 runs, 13 regressions (v5.14-rc4-389-g3082d=
2ab7f69)

Regressions Summary
-------------------

platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+ima       | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | omap2plus_de=
fconfig          | 1          =

fsl-ls1043a-rdb         | arm64 | lab-nxp         | gcc-8    | defconfig+cr=
ypto             | 1          =

imx6q-sabresd           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =

imx6ul-14x14-evk        | arm   | lab-nxp         | gcc-8    | multi_v7_def=
config+crypto    | 1          =

imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+cr=
ypto             | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig   =
                 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-rc4-389-g3082d2ab7f69/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-rc4-389-g3082d2ab7f69
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3082d2ab7f699002754d31112b10767fa3557e30 =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610cb53aa2332323c8b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cb53aa2332323c8b13=
66f
        failing since 30 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/610cb7e2920e0fbc23b13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cb7e2920e0fbc23b13=
663
        failing since 30 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/610cb8e64d06a601ebb13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cb8e64d06a601ebb13=
664
        new failure (last pass: v5.14-rc4-200-g928b53f6fae6) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/610cba9ed58906710eb1368c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cba9ed58906710eb13=
68d
        failing since 24 days (last pass: v5.10-rc7-201-gc9b6935dc4f4, firs=
t fail: v5.14-rc1-225-g25a1eba130d1) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/610cb79189afd7bc19b1366b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cb79189afd7bc19b13=
66c
        new failure (last pass: v5.14-rc3-353-gf8730f66145e) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
fsl-ls1043a-rdb         | arm64 | lab-nxp         | gcc-8    | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/610cbbd10111d2908bb13665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-ls1043a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-ls1043a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cbbd10111d2908bb13=
666
        new failure (last pass: v5.14-rc4-328-ga270ca22e1fb) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6q-sabresd           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/610cb4656a0307ab22b136c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cb4656a0307ab22b13=
6c5
        failing since 284 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6ul-14x14-evk        | arm   | lab-nxp         | gcc-8    | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/610cb7fe8f5803ac2ab1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/multi_v7_defconfig+crypto/gcc-8/lab-nxp/baseline-imx6u=
l-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/multi_v7_defconfig+crypto/gcc-8/lab-nxp/baseline-imx6u=
l-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cb7fe8f5803ac2ab13=
670
        new failure (last pass: v5.14-rc4-328-ga270ca22e1fb) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/610cbb728b902786a6b1366c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cbb728b902786a6b13=
66d
        failing since 1 day (last pass: v5.14-rc4-251-gbe32e0f17dc1, first =
fail: v5.14-rc4-297-gb828f2c9def4) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/610cb05b77f9bf25a9b13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cb05b77f9bf25a9b13=
675
        failing since 262 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/610cb05777f9bf25a9b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cb05777f9bf25a9b13=
66f
        failing since 262 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/610cc5b2d056b36702b13690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cc5b2d056b36702b13=
691
        failing since 262 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/610cb8ad597c0eb1ddb13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-3=
89-g3082d2ab7f69/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610cb8ad597c0eb1ddb13=
665
        new failure (last pass: v5.14-rc4-328-ga270ca22e1fb) =

 =20
