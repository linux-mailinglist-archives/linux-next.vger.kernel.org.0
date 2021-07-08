Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6FB3BF4CA
	for <lists+linux-next@lfdr.de>; Thu,  8 Jul 2021 06:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbhGHEeO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Jul 2021 00:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhGHEeN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Jul 2021 00:34:13 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F42C061574
        for <linux-next@vger.kernel.org>; Wed,  7 Jul 2021 21:31:32 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id d12so4626410pgd.9
        for <linux-next@vger.kernel.org>; Wed, 07 Jul 2021 21:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8KjbuuLkzcg5mwNqk1NMtGGHZKf11VD4Wpe/TI1fLHQ=;
        b=FGAJ1Dpji3c9zRudhNPovqA5OkK1CMPnSsKmDobcfT1w33+GpGc71Pxx70kYZsxxdZ
         +MAo0OQG2aO+YT4XS3yXXZy/XCjGezI+SFtr9lZsINPKQuasRWLNTmm3u9KFsy4cWA1K
         2aNd1L8zjsDQuaTnV6ocByl2YExJWJ5A4AZ3PsNm8LZmThSZ5jz2rf6ODK5LGjzqF8hu
         HGMwowcuZGIr1smG0kfCCcP946ii8eV9Vd0zmyrztEN5YjQvjI7R7grYgzAhQRV1ecPL
         4+lEwXvZLo2w8Ha0Gh8yW3Yp+CKXfX+FOg2GhikfK/JbDKpQNWvZTfg+Q92Z8TiQWLB8
         Td9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8KjbuuLkzcg5mwNqk1NMtGGHZKf11VD4Wpe/TI1fLHQ=;
        b=uVzWWWS1mOVK66WEHx+YYufOcP4So+w0Od7BmdFTEftgdEOWiGvDzlo1D8Q+CXifzZ
         lqrtqvGkzSZyzlbDn4HUjDVn1EP4u+kNGgZ607MTtzslzr5f/BpySQPEdT3Xc6aY5rt5
         ex6VRrXUknX0jsp2slVyqZRviiqnqtiX0JXFcurm+wfrh4rMXrRtdWQrnkM/cmFf7y2e
         DXFXynY7uuyR1mhF8/0/ogeE6DPfDo5NwdtOm7AuaFMKh8PaommGxdK48lDFL9ZfCRsN
         SpbwyaZMWVkOkzZfSvIX2o0o5gdoBzU6f179oK3Eov0Ytd+zeVBpZ3OG6zqSfJ66mcSn
         9zDA==
X-Gm-Message-State: AOAM531Ya4FhlNpFVuV23x4TPlwrkSbJgPwvSTM+7ppSSrxckIqca/xG
        7SMb19WQAH1U16/L0CPA6EKYWoKzeqrR8cAo
X-Google-Smtp-Source: ABdhPJwoyrHQbGi6RF9XFBSBTSWY1L8WCQE+7hiPqUn6BCS9qQPnmC0cgmieFTwcqNb3VtCF7yDIqQ==
X-Received: by 2002:a05:6a00:2162:b029:308:9346:2f55 with SMTP id r2-20020a056a002162b029030893462f55mr29043941pff.49.1625718691957;
        Wed, 07 Jul 2021 21:31:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z3sm932787pgl.77.2021.07.07.21.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 21:31:27 -0700 (PDT)
Message-ID: <60e67f9f.1c69fb81.ba5fc.4081@mx.google.com>
Date:   Wed, 07 Jul 2021 21:31:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.13-12392-g47fac7b4f4b23
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 374 runs,
 23 regressions (v5.13-12392-g47fac7b4f4b23)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 374 runs, 23 regressions (v5.13-12392-g47fac7b=
4f4b23)

Regressions Summary
-------------------

platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15       | arm   | lab-linaro-lkft | gcc-8    | multi_v7_def=
config           | 1          =

am57xx-beagle-x15       | arm   | lab-linaro-lkft | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15       | arm   | lab-linaro-lkft | gcc-8    | omap2plus_de=
fconfig          | 1          =

bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =

beaglebone-black        | arm   | lab-cip         | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beaglebone-black        | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config           | 1          =

beaglebone-black        | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beaglebone-black        | arm   | lab-collabora   | gcc-8    | omap2plus_de=
fconfig          | 1          =

hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 1          =

hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx6q-sabresd           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =

imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig   =
                 | 1          =

imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

meson-g12a-x96-max      | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-12392-g47fac7b4f4b23/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-12392-g47fac7b4f4b23
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      47fac7b4f4b23f7335229b54c6a0ff9e8ee65e19 =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15       | arm   | lab-linaro-lkft | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e65ec900dbca15b611796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e65ec900dbca15b6117=
96b
        failing since 0 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-12051-g62c20406acf9b) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15       | arm   | lab-linaro-lkft | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e65f7d6d86e7c305117970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft=
/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft=
/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e65f7d6d86e7c305117=
971
        failing since 0 day (last pass: v5.13-2793-g5c4584a79cad, first fai=
l: v5.13-12051-g62c20406acf9b) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15       | arm   | lab-linaro-lkft | gcc-8    | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e65f930d27dc601611796e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57=
xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57=
xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e65f930d27dc6016117=
96f
        failing since 1 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e6498a647ea19d8b11796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e6498a647ea19d8b117=
96b
        failing since 153 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/60e644046314c6d4d7117998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e644046314c6d4d7117=
999
        failing since 1 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e648150d6bfc84b81179d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e648150d6bfc84b8117=
9d7
        failing since 1 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre    | gcc-8    | bcm2835_defc=
onfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60e64300fb76851eec1179a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e64300fb76851eec117=
9a5
        failing since 1 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black        | arm   | lab-cip         | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e6456abb6be10a9d117977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baselin=
e-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baselin=
e-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e6456abb6be10a9d117=
978
        failing since 1 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black        | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e6459e1b7dcbff62117999

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e6459e1b7dcbff62117=
99a
        new failure (last pass: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black        | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e6467c0f3f13cfb111799f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e6467c0f3f13cfb1117=
9a0
        failing since 1 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black        | arm   | lab-collabora   | gcc-8    | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e64ab3b7cc13aaf6117983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e64ab3b7cc13aaf6117=
984
        new failure (last pass: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/60e6458c1b7dcbff6211798b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e6458c1b7dcbff62117=
98c
        failing since 6 days (last pass: v5.13-rc7-277-gfd6ae26c403a, first=
 fail: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e649eb45fd2404f811797a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e649eb45fd2404f8117=
97b
        failing since 1 day (last pass: v5.13-1843-g646572bd9313, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6q-sabresd           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e6463cd627899d071179e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabres=
d.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabres=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e6463cd627899d07117=
9e2
        failing since 255 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/60e64561678bfa5dfe11797c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e64561678bfa5dfe117=
97d
        new failure (last pass: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e64895cb83a24e7b11798e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e64895cb83a24e7b117=
98f
        failing since 0 day (last pass: v5.13-11972-g079b16c442fd, first fa=
il: v5.13-12051-g62c20406acf9b) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
meson-g12a-x96-max      | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/60e6440a6314c6d4d711799b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-=
max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-=
max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e6440a6314c6d4d7117=
99c
        new failure (last pass: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e643bb505d66fe7211796c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e643bb505d66fe72117=
96d
        failing since 233 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e64563a0ec85773511796e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e64563a0ec857735117=
96f
        failing since 233 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e64283a2a3f8685811797b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e64283a2a3f86858117=
97c
        failing since 233 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e642383243d10b0611798e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e642383243d10b06117=
98f
        failing since 233 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e6642d6fb8f83e0111796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e6642d6fb8f83e01117=
96b
        failing since 233 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e6482fb140191d37117982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12392=
-g47fac7b4f4b23/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e6482fb140191d37117=
983
        failing since 0 day (last pass: v5.13-11972-g079b16c442fd, first fa=
il: v5.13-12051-g62c20406acf9b) =

 =20
