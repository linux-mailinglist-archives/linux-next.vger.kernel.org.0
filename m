Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098923B3BB4
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 06:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhFYElf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 00:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhFYEle (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Jun 2021 00:41:34 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D879AC061574
        for <linux-next@vger.kernel.org>; Thu, 24 Jun 2021 21:39:13 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso4807224pjp.2
        for <linux-next@vger.kernel.org>; Thu, 24 Jun 2021 21:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XAo73trO3PBQFOe7rSzdA8zv4mp7HtL8AsyxP4aB4jI=;
        b=EG7pjavFw1Ga1PZsFRwn+CmL6wApVU+YAKct5V2ZkEqF4AxhoS3VGAyUCjGgk0Xjlv
         KutgsSje45564UrF4p/UhpBNDFWKGkEIlDdzzGTPC4ACDqspAlFwsz42NT9YCJBqe3SL
         Wmffz4g2g1HFFwS1/q9qdJhkcncdy8zwEeLBW4UFcBzL1NHs3cIoMZrc2Fux1kwaZwUn
         f4Zx6gy0fXfp8MZFQZGM46H+y9QSins4qLTma96P/uYvWjcUr+O7WDG8v+fLn9SxLGGB
         DOVDQbHSfqwiw+pVPoDFWnl/KIBHK8/8z/4UgBDTkKxHovtvMU4ys5JNFpgaHx8iFX9m
         IFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XAo73trO3PBQFOe7rSzdA8zv4mp7HtL8AsyxP4aB4jI=;
        b=ipwCl2r46+/5eXGEYTcD6HqD0H17XPPEPFQeZMxMgISifXNFXCpfun2W5BfWPM2C9y
         W8S+8u/ghXhvXsFnbsIpcp4xrGss662PRmpLu3p7Mnelwn8z/Kqf4lwWiLnpBFPAEhdX
         eWT+Mn+ZHETsxdU3bnbDC73LeHsjxtiP01RhUIXQb9ik3mDfgxbe5RNo3d8GdU64f/7V
         kg3sBsoacxxIhWBpaIkbinoi0hwI2ycI8Ge9jGx039L1O0qPkiUUag4gc55PVCKQAm8L
         4cd2rxFY9ZIhToXrdQru2hsGR6D4doxbPpteEgfa3pHJtvzek9LZldG+Yu0HPv3T4ELp
         tNkg==
X-Gm-Message-State: AOAM53319TWImu21LSjmKq3zxFtdUkNoIs6VcTFX7lGS34AEVs9V/P9O
        cPBuR7mS+tgP1EHvtS6bgJZvjMTCOl6ZWjLW
X-Google-Smtp-Source: ABdhPJzBKmWjbiij5LvzvckEKLFpdZym1AcOYnUDwE5ewUV0vwLab11IVlp/hX49KtVlgPV8o+R/XA==
X-Received: by 2002:a17:90a:708a:: with SMTP id g10mr19118013pjk.108.1624595953008;
        Thu, 24 Jun 2021 21:39:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v14sm4016936pgo.89.2021.06.24.21.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 21:39:12 -0700 (PDT)
Message-ID: <60d55df0.1c69fb81.a0435.bf71@mx.google.com>
Date:   Thu, 24 Jun 2021 21:39:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.13-rc7-277-gfd6ae26c403a
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 275 runs,
 9 regressions (v5.13-rc7-277-gfd6ae26c403a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 275 runs, 9 regressions (v5.13-rc7-277-gfd6ae2=
6c403a)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =

imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-rc7-277-gfd6ae26c403a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-rc7-277-gfd6ae26c403a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fd6ae26c403a93331dcf4b5fcfb84bf4b5ff2926 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60d528f4c0192ec841413268

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d528f4c0192ec841413=
269
        failing since 140 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60d52110f94ee52efd4132c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d52110f94ee52efd413=
2c5
        failing since 0 day (last pass: v5.13-rc7-180-g67b894d4fc9d, first =
fail: v5.13-rc7-204-gf41e09ab2272) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d524827d72ec9d6e413268

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d524827d72ec9d6e413=
269
        failing since 242 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d523b97c80fedbc6413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d523b97c80fedbc6413=
272
        new failure (last pass: v5.13-rc7-180-g67b894d4fc9d) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/60d5266a25887e95c8413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d5266a25887e95c8413=
272
        failing since 3 days (last pass: v5.13-rc6-296-g227cd20c3337, first=
 fail: v5.13-rc7-108-ga39bc0c7697f) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d51f576f0190de86413298

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d51f576f0190de86413=
299
        failing since 220 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d51f6c7da9a49f1841328e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d51f6c7da9a49f18413=
28f
        failing since 220 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d51f326f0190de8641326b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d51f326f0190de86413=
26c
        failing since 220 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d51efc60dccf3e8b41327e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc7-2=
77-gfd6ae26c403a/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d51efc60dccf3e8b413=
27f
        failing since 220 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
