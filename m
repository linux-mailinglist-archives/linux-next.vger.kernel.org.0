Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2D740BEBA
	for <lists+linux-next@lfdr.de>; Wed, 15 Sep 2021 06:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhIOEKW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Sep 2021 00:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbhIOEKT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Sep 2021 00:10:19 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83153C061574
        for <linux-next@vger.kernel.org>; Tue, 14 Sep 2021 21:09:01 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so3374415pjb.1
        for <linux-next@vger.kernel.org>; Tue, 14 Sep 2021 21:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1iE5xVZnJYwbVL0snrcWXWYK8tEHZotbg9PDKjEYBoU=;
        b=U60AWZw4U3N3523og7nD9oY8jyD3mu0jeO8BJgIfrmcS6ZXZqagyzbqTGbupKtRdt7
         gwqwGJvY0b9sgD084IPgkUlnK4/o3uUKEWGHoFAsplcqftjKEpbaZkt+xZ3dpoYNw+FU
         u0NEDskhpMVjYTAlTrZzfRoCRYG5B0ZwXMVTSKdsEHCek3qdMsvDHUzUs31bYCZjBm88
         6J4MukQt9RJ018jCUoUUHc6CmBFw0dQB2C3LKWhcqsF+QxOc4ImZsma9GpEs6y4n7PK+
         hOtebhDgM6qNLR/EUdkYpJLcUDLs37BqFcHuDvFDSbUS3qa5jtxrC9+z5U0nWwVYMixS
         jCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1iE5xVZnJYwbVL0snrcWXWYK8tEHZotbg9PDKjEYBoU=;
        b=T7c6JmrXJOEJIyXDc7UqEK7OkR+thn5D6a26PXGyK6YYcOehU+0gVHde5bEvXkdp6B
         IC8e34iBZaWaErhWQHpvYKkulctd5k1d4R7UhrLkT8WnNfp6VQpxzGiW3plS/yNlu7qc
         XwHPLCKfvlEEnJbWeBZ11uba0WZd6M2ZyXAszljN9yxqtzUFb5Q+T9TnZIc+8OOBblEn
         YiOoOLAA2KIsNd880yU4U322zP6lKxH9rMZgBpOmWnilKNe/nlvNmH1nsoIWP5VltCHE
         hC8kgRBPeFe2j3LoUbxsFOOLqihyTjNMok41Vl3b4wdoa2md4hooJ4uP8sIwxjUMUgNt
         Ccsw==
X-Gm-Message-State: AOAM531ohdV0A+rUcux8PMZ4v2In+lIY+P9ts15NDM0608wYeUgOjyuQ
        vIEQtoUT1A7Gz886gqxxUYcdsPO9Zh4f2jhK
X-Google-Smtp-Source: ABdhPJzDQ3T0+7kezb9+5DwpkzmXbN3wdnZQOGd6IiluUYB83SUF0ZlUcDPdxGgzwajDAOJeVlKpBg==
X-Received: by 2002:a17:90a:3f8d:: with SMTP id m13mr6043676pjc.199.1631678940469;
        Tue, 14 Sep 2021 21:09:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h13sm12951378pgf.14.2021.09.14.21.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 21:09:00 -0700 (PDT)
Message-ID: <614171dc.1c69fb81.5c8b1.804a@mx.google.com>
Date:   Tue, 14 Sep 2021 21:09:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc1-253-gee71904c02ea
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 552 runs,
 31 regressions (v5.15-rc1-253-gee71904c02ea)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 552 runs, 31 regressions (v5.15-rc1-253-gee719=
04c02ea)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig+crypto    | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-8    | omap2pl=
us_defconfig          | 1          =

hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+ima                | 2          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+ima                | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 2          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+crypto             | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+ima                | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc1-253-gee71904c02ea/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc1-253-gee71904c02ea
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ee71904c02eaa7ea392f0821b205826c3bb0ea25 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61413cddf2e5431a2999a312

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413cddf2e5431a2999a=
313
        failing since 222 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614138d208e13823fb99a2fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614138d208e13823fb99a=
2fc
        failing since 70 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61413e8756c958d91f99a32b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413e8756c958d91f99a=
32c
        failing since 70 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/614138aed83c6217ee99a2e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-=
beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-=
beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614138aed83c6217ee99a=
2e1
        failing since 0 day (last pass: v5.14-11292-g7436a05fa7a4, first fa=
il: v5.15-rc1-148-g00d39c2c1e6d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61413a101f756b488f99a2dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413a101f756b488f99a=
2de
        failing since 4 days (last pass: v5.14-10568-g1006eb19726f, first f=
ail: v5.14-10891-g7e703ab62392) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61413aed214440db8b99a2eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413aed214440db8b99a=
2ec
        new failure (last pass: v5.15-rc1-148-g00d39c2c1e6d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-8    | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61413a8bb5a78f81d199a303

  Results:     1 PASS, 1 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
61413a8bb5a78f81d199a307
        new failure (last pass: v5.15-rc1-148-g00d39c2c1e6d)

    2021-09-15T00:12:39.266623  Segmentation fault
    2021-09-15T00:12:39.280991  sh: 0: unknown operand
    2021-09-15T00:12:40.291025  /lava-850747/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61413a53fa63ab202799a2e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413a53fa63ab202799a=
2e4
        failing since 70 days (last pass: v5.13-1843-g646572bd9313, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61414317689aea446c99a2ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61414317689aea446c99a=
2f0
        failing since 75 days (last pass: v5.13-rc7-277-gfd6ae26c403a, firs=
t fail: v5.13-2793-g5c4584a79cad) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614139db790010629d99a30b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614139db790010629d99a=
30c
        failing since 324 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61413932aaa1f1549999a340

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61413932aaa1f15=
49999a347
        new failure (last pass: v5.15-rc1-148-g00d39c2c1e6d)
        12 lines

    2021-09-15T00:06:55.300156  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.387143] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-09-15T00:06:55.300302  0098
    2021-09-15T00:06:55.300410  kern  :alert : Mem abort info:
    2021-09-15T00:06:55.300511  kern  :alert :   ESR =3D 0x96000046
    2021-09-15T00:06:55.300610  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-15T00:06:55.300709  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-09-15T00:06:55.300805  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61413932aaa1f15=
49999a348
        new failure (last pass: v5.15-rc1-148-g00d39c2c1e6d)
        2 lines

    2021-09-15T00:06:55.301464  kern  :alert :<8>[   14.414065] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61413c3ad1d057c65199a2df

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61413c3ad1d057c=
65199a2e6
        new failure (last pass: v5.15-rc1-148-g00d39c2c1e6d)
        12 lines

    2021-09-15T00:19:49.094834  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.208952] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-09-15T00:19:49.095079  0098   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61413c3ad1d057c=
65199a2e7
        new failure (last pass: v5.15-rc1-148-g00d39c2c1e6d)
        2 lines

    2021-09-15T00:19:49.095882  kern  :alert : Mem abort info:
    2021-09-15T00:19:49.095994  kern  :alert :   ESR =3D 0x96000046
    2021-09-15T00:19:49.096103  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-15T00:19:49.096207  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-09-15T00:19:49.096315  kern  :alert :   EA<8>[   14.235784] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2021-09-15T00:19:49.096417   =3D 0, S1PTW =3D 0
    2021-09-15T00:19:49.096515  kern  :alert :  <8>[   14.246331] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 655673_1.5.2.4.1>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61413e335787865c7f99a2e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413e335787865c7f99a=
2e5
        new failure (last pass: v5.15-rc1-148-g00d39c2c1e6d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6141425843ee2a123999a309

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6141425843ee2a123999a=
30a
        failing since 12 days (last pass: v5.14-619-gacb79da497df, first fa=
il: v5.14-6828-g521f6987a116) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61413d485f0b90a36199a2fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+ima/gcc-8/lab-baylibre/baseline-meson-g12b=
-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+ima/gcc-8/lab-baylibre/baseline-meson-g12b=
-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413d485f0b90a36199a=
2fb
        failing since 0 day (last pass: v5.14-10891-g7e703ab62392, first fa=
il: v5.15-rc1-148-g00d39c2c1e6d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61413885c4ce48ca3199a312

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413885c4ce48ca3199a=
313
        new failure (last pass: v5.15-rc1-148-g00d39c2c1e6d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614136a2b66a14bfdd99a2f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614136a2b66a14bfdd99a=
2f7
        failing since 302 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61413a80a1adb305b299a305

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413a80a1adb305b299a=
306
        failing since 302 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614136a3eede9b43cd99a2fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614136a3eede9b43cd99a=
2fe
        failing since 302 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61413a5371c05a82bf99a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413a5371c05a82bf99a=
2dd
        failing since 302 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614158eda13bfbf69799a2e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614158eda13bfbf69799a=
2e3
        failing since 302 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6141380a8d8d89b8f899a31d

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/6141380a8d8d89b8f899a323
        failing since 64 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-15T00:02:04.135367  /lava-4523902/1/../bin/lava-test-case
    2021-09-15T00:02:04.146503  <8>[   52.536516] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/6141380a8d8d89b8f899a324
        failing since 64 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-15T00:02:03.100619  /lava-4523902/1/../bin/lava-test-case
    2021-09-15T00:02:03.111643  <8>[   51.501262] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61413daa9446ada9f399a2e2

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61413daa9446ada9f399a2e8
        failing since 64 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-15T00:25:58.902099  /lava-4524089/1/../bin/lava-test-case
    2021-09-15T00:25:58.913429  <8>[   25.367777] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61413daa9446ada9f399a2e9
        failing since 64 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-15T00:25:57.867010  /lava-4524089/1/../bin/lava-test-case
    2021-09-15T00:25:57.877975  <8>[   24.332329] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614138e1a8795cfb8899a387

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe=
/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe=
/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614138e1a8795cfb8899a=
388
        failing since 1 day (last pass: v5.14-10891-g7e703ab62392, first fa=
il: v5.14-11292-g7436a05fa7a4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61413aaa2813cac55699a2ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a6=
4-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a6=
4-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413aaa2813cac55699a=
2ee
        failing since 0 day (last pass: v5.14-10891-g7e703ab62392, first fa=
il: v5.15-rc1-148-g00d39c2c1e6d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61413c7632b4056aad99a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413c7632b4056aad99a=
2e8
        new failure (last pass: v5.15-rc1-148-g00d39c2c1e6d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61413ea62cd3594f2a99a316

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc1-2=
53-gee71904c02ea/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61413ea62cd3594f2a99a=
317
        failing since 6 days (last pass: v5.14-9872-gea617cdef108, first fa=
il: v5.14-10568-g1006eb19726f) =

 =20
