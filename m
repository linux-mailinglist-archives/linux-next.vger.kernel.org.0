Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549B8244714
	for <lists+linux-next@lfdr.de>; Fri, 14 Aug 2020 11:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgHNJdv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Aug 2020 05:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgHNJdv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Aug 2020 05:33:51 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C611AC061383
        for <linux-next@vger.kernel.org>; Fri, 14 Aug 2020 02:33:50 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id m8so4302835pfh.3
        for <linux-next@vger.kernel.org>; Fri, 14 Aug 2020 02:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pOTwX82NPiwGVGTJ5TQCZ/Q4ZDMntoueZaynrqd40Sk=;
        b=OqIw46DnekYRlKPy7H6mKX4odhxVTYSDfb6sYKFsVCS/9EFucSbryFbFw0L2xKd4OB
         FpqjeW3IzhkS1+caH7eL3BaUbGN+axd+w4709mxQatWxtM0MXlmG3Aiff6NTnZwAF94C
         I0DRNd03J9MTLKejLZP+bGjB8Tt0FQGLoBt6SbhltQhJaeT/9NXhEOTu2WYDvB3+IgZs
         tAdnhMftL/+rzKji/aw4kECTh0ZKuhVFR0CpbBmuMfkgSnds3DF/9j8yZMWGRD/+xtZQ
         2jztitgHIzV0cucv053nEjGmz8xJn9k6mGbIwD98WBqEQd+rof1E+bjfBFrU7hnvSh3z
         HJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pOTwX82NPiwGVGTJ5TQCZ/Q4ZDMntoueZaynrqd40Sk=;
        b=mIKFo0y9O2ksz48UWvh+p8TP3rwhn6qCAkp8SoP0r/CdZJgodSGPVcwjYVcmUMxZxk
         51KNbssqQmpcVJwUvHhmc5aIXVfXAXLQO7NQJHiBp6XliRjOVWAUFwsJlBJ4NORHcks6
         ZO61RSFSqcqIP4RXEuCSQFgwiB0+LpEf0BgnvApwwECimalddidMckyI+lAZgYQQuu/b
         3X6jYMpD6f69ewHW3yztwjC5rBTCglW8ometEVv2C/h5QDyc9zIWhvNR9nPI1hmAmPuq
         BOrXIkt4Fm20feJY+9Roppp3WkGygJ2i7gJlV+Ys0sMxVACGGA6nrHlCBTYHhyK7IX7y
         8+8Q==
X-Gm-Message-State: AOAM533DHMbTAUVcug5yMC28MNM1AbiJNQK+tjkl7Ve4uTO3xTuInnR2
        6QQ+OcaSkyXLUegiCA80KWewSBp3i8LkEQ==
X-Google-Smtp-Source: ABdhPJyue+lNALxwCZhCOGFXtYal88kiVEyBYZP3z3Q9ftS81Ks6DjSXsmrID1HUqjTE79dxbLKxMA==
X-Received: by 2002:a63:ef0c:: with SMTP id u12mr1180014pgh.327.1597397629289;
        Fri, 14 Aug 2020 02:33:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z25sm8892265pfg.150.2020.08.14.02.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 02:33:48 -0700 (PDT)
Message-ID: <5f365a7c.1c69fb81.3f79c.5343@mx.google.com>
Date:   Fri, 14 Aug 2020 02:33:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200814
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 473 runs, 36 regressions (next-20200814)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 473 runs, 36 regressions (next-20200814)

Regressions Summary
-------------------

platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained       | arm    | lab-baylibre  | gcc-8    | sama5_def=
config              | 0/1    =

bcm2837-rpi-3-b             | arm64  | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =

exynos5422-odroidxu3        | arm    | lab-collabora | clang-10 | multi_v7_=
defconfig           | 0/1    =

exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | exynos_de=
fconfig             | 0/1    =

exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 0/1    =

exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

imx6q-var-dt6customboard    | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

omap4-panda                 | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 4/5    =

omap4-panda                 | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                 | arm    | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 4/5    =

omap4-panda                 | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                 | arm    | lab-baylibre  | gcc-8    | omap2plus=
_defconfig          | 0/1    =

omap4-panda                 | arm    | lab-collabora | gcc-8    | omap2plus=
_defconfig          | 0/1    =

qemu_x86_64                 | x86_64 | lab-baylibre  | gcc-8    | x86_64_de=
fconfig             | 0/1    =

qemu_x86_64-uefi            | x86_64 | lab-baylibre  | clang-9  | x86_64_de=
fconfig             | 0/1    =

qemu_x86_64-uefi            | x86_64 | lab-baylibre  | gcc-8    | x86_64_de=
fconfig             | 0/1    =

rk3399-gru-kevin            | arm64  | lab-collabora | clang-10 | defconfig=
                    | 84/88  =

rk3399-gru-kevin            | arm64  | lab-collabora | gcc-8    | defconfig=
                    | 84/88  =

rk3399-gru-kevin            | arm64  | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 84/88  =

sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | clang-10 | defconfig=
                    | 0/1    =

sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | gcc-8    | defconfig=
                    | 0/1    =

sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | sunxi_def=
config              | 0/1    =

sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =

sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200814/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200814
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4993e4fe12af2d71b6a3ad16e1fcdc566795fda1 =



Test Regressions
---------------- =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained       | arm    | lab-baylibre  | gcc-8    | sama5_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f36220f822000358a52c1c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f36220f822000358a52c=
1c9
      failing since 107 days (last pass: next-20200424, first fail: next-20=
200428) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b             | arm64  | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f361b7782631e858f52c1b7

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f361b7782631e85=
8f52c1ba
      new failure (last pass: next-20200813)
      1 lines =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
exynos5422-odroidxu3        | arm    | lab-collabora | clang-10 | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f363adf7826b4b92752c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f363adf7826b4b92752c=
1a8
      failing since 0 day (last pass: next-20200812, first fail: next-20200=
813) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | exynos_de=
fconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3633c86b4447980352c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3633c86b4447980352c=
1a8
      failing since 23 days (last pass: next-20200630, first fail: next-202=
00721) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f36314b42502ee9fc52c1ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f36314b42502ee9fc52c=
1ac
      failing since 20 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f363507a7375035f052c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f363507a7375035f052c=
1a7
      failing since 20 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3640a432d1e37b7152c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3640a432d1e37b7152c=
1a7
      failing since 20 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
imx6q-var-dt6customboard    | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f362801211ab18efc52c1af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f362801211ab18efc52c=
1b0
      failing since 2 days (last pass: next-20200810, first fail: next-2020=
0811) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3624fac6cb4a11cf52c1b0

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3624fac6cb4a1=
1cf52c1b4
      failing since 29 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3626c32689adf86d52c1dd

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3626c32689adf=
86d52c1e1
      failing since 29 days (last pass: next-20200710, first fail: next-202=
00715)
      60 lines =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3624bb3b056ddd4652c1d4

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3624bb3b056dd=
d4652c1d8
      failing since 29 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3626de52048a832752c1b0

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3626de52048a8=
32752c1b4
      failing since 29 days (last pass: next-20200710, first fail: next-202=
00715)
      60 lines =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-baylibre  | gcc-8    | omap2plus=
_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f36246b72a4680bcd52c1e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f36246b72a4680bcd52c=
1ea
      failing since 23 days (last pass: next-20200706, first fail: next-202=
00721) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-collabora | gcc-8    | omap2plus=
_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3624267c9e57f30252c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3624267c9e57f30252c=
1a7
      failing since 23 days (last pass: next-20200706, first fail: next-202=
00721) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
qemu_x86_64                 | x86_64 | lab-baylibre  | gcc-8    | x86_64_de=
fconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f36206f6a143eca5952c1c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f36206f6a143eca5952c=
1c8
      new failure (last pass: next-20200813) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
qemu_x86_64-uefi            | x86_64 | lab-baylibre  | clang-9  | x86_64_de=
fconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3622b527d3e67fdd52c1d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-9 (clang version 9.0.1-+20191211082622+c1a0a213378-1~e=
xp1~20191211193200.102 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/x86_=
64/x86_64_defconfig/clang-9/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/x86_=
64/x86_64_defconfig/clang-9/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3622b527d3e67fdd52c=
1d1
      new failure (last pass: next-20200813) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
qemu_x86_64-uefi            | x86_64 | lab-baylibre  | gcc-8    | x86_64_de=
fconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3620716a143eca5952c1d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3620716a143eca5952c=
1d4
      new failure (last pass: next-20200813) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
rk3399-gru-kevin            | arm64  | lab-collabora | clang-10 | defconfig=
                    | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f361cd269681686ab52c1a6

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f361cd269681686ab52c1e6
      failing since 14 days (last pass: next-20200728, first fail: next-202=
00729) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
rk3399-gru-kevin            | arm64  | lab-collabora | gcc-8    | defconfig=
                    | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f361bfa376c24c57352c1cc

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f361bfa376c24c57352c20c
      failing since 13 days (last pass: next-20200728, first fail: next-202=
00731) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
rk3399-gru-kevin            | arm64  | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f361df18387d3062a52c1ed

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f361df28387d3062a52c22d
      failing since 14 days (last pass: next-20200728, first fail: next-202=
00729) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | clang-10 | defconfig=
                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3625557a534c28c152c1af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3625557a534c28c152c=
1b0
      failing since 27 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f36225985a013e1ff52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f36225985a013e1ff52c=
1a7
      failing since 27 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | gcc-8    | defconfig=
                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3623c5018b565b9e52c1cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3623c5018b565b9e52c=
1ce
      failing since 27 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3626ce2689adf86d52c20a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3626ce2689adf86d52c=
20b
      failing since 27 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3624367972768ce352c1b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3624367972768ce352c=
1b3
      failing since 27 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f362798f56a4e476d52c1ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f362798f56a4e476d52c=
1ad
      failing since 27 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f36243e7972768ce352c1cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f36243e7972768ce352c=
1ce
      failing since 27 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3627976fce0cda5152c1a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3627976fce0cda5152c=
1aa
      failing since 27 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f361e06a16c62a59352c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f361e06a16c62a59352c=
1a7
      failing since 24 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f361e11a16c62a59352c1b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f361e11a16c62a59352c=
1b6
      failing since 24 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f36255f7a534c28c152c1b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f36255f7a534c28c152c=
1b9
      failing since 27 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f362971fbabacaf3452c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f362971fbabacaf3452c=
1a7
      failing since 27 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f361f3eb65d53920b52c1ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f361f3eb65d53920b52c=
1ae
      failing since 27 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3624d2ee4abb97d952c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3624d2ee4abb97d952c=
1a7
      failing since 2 days (last pass: next-20200519, first fail: next-2020=
0811) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3628a9d754c0ae8e52c1ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3628a9d754c0ae8e52c=
1f0
      failing since 2 days (last pass: next-20200519, first fail: next-2020=
0811) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f361f6cf2864c550752c1fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200814/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200814/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f361f6cf2864c550752c=
1fe
      failing since 2 days (last pass: next-20200519, first fail: next-2020=
0811) =20
