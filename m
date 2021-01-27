Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F524305367
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 07:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbhA0GcQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 01:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbhA0DNQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 22:13:16 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A75C0617A7
        for <linux-next@vger.kernel.org>; Tue, 26 Jan 2021 19:12:29 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id i63so276792pfg.7
        for <linux-next@vger.kernel.org>; Tue, 26 Jan 2021 19:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nuGMjIjs4SiZamQvjVW/nO0RAzvr3+UKtSaLYy3QlV8=;
        b=jD8oxw/h/qap+oGnTZbKjA1yR0h9BJ1XECus626+MBb8ofWtTNv84Ac6dymKN1IvwX
         eBiXZ7D8h+pMDvGbDMTY8J+1nwf61KGKm3W67u2VhyVYvr+k+BoiDgDepC2TnMcDwsVJ
         I32sJbVjjn/SUL8mGzVA+Yx3dsbAuZ/F76OutH2COGuUkxaIyDaQI2Ql4ToxciX5F8qv
         6L+UPZ6jIwSZNvYJbv99Rjcx+Mp4OKxGiDt+Q4POKTR4xpw9JJiXIqGWl9TlmPFP/eCX
         NCfJ7WZC9RPR5UNd47tjWGMUo4RsIu/eNxNmsQuVOzVWB9AsPTE0DaVl1y5WPbAtYuA8
         SToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nuGMjIjs4SiZamQvjVW/nO0RAzvr3+UKtSaLYy3QlV8=;
        b=dqM9SQ0slApeCdAJ4S1B2vGE4TIaZTAuI8KvuAT0B8Fq2n5iYz6vhJqbz6bbjGaYqa
         LJ+R3AKnQmcyXFVP9HH400m1ISM7wi56IXB++3SWj6oAtzOqYZIZN1ivuvTkukbB52D9
         yTOk1p6WqPPCbCg7eim88hXIBgD32IMX2JQUBtDmqmrpTX+at9NxV/VEfZZBtlVhvm22
         SIUXiOYZTO35VqHRd3gzpPDn/9kYZJjDWNdjHIFEqMPvrPrH2FQqWjSKeSH5ebwbYcOT
         fjtlk0wXtGLL1DRapq25gVs8J3+ciVDhgbvf4dQ2/7c/BO/CH1nPaDoyEt7iP/C1FLqn
         2YkA==
X-Gm-Message-State: AOAM531hBmZr3y4Rt4W/SzmLB6mIie0o0ixtoZTcB/ljJIouOLyyH8tS
        +BcrJL9wFz0hljNeJg3iHJpPqFVE3968qsv8
X-Google-Smtp-Source: ABdhPJzXHsEObOjUmk4GCtN9CXUsP7VbOsJ2VsbR5imB2TyvsHJCOM2PocD0pqje/r43YIc5dd53tA==
X-Received: by 2002:a63:1f1e:: with SMTP id f30mr2099464pgf.141.1611717149140;
        Tue, 26 Jan 2021 19:12:29 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a20sm434913pfo.104.2021.01.26.19.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 19:12:28 -0800 (PST)
Message-ID: <6010da1c.1c69fb81.4fa7.1e91@mx.google.com>
Date:   Tue, 26 Jan 2021 19:12:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-rc5-278-g3e6d74db7e02
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 290 runs,
 10 regressions (v5.11-rc5-278-g3e6d74db7e02)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 290 runs, 10 regressions (v5.11-rc5-278-g3e6d7=
4db7e02)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b-32         | arm   | lab-baylibre    | gcc-8    | bcm2835_d=
efconfig            | 1          =

imx6q-var-dt6customboard   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

meson-gxbb-p200            | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =

qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =

qemu_i386                  | i386  | lab-broonie     | gcc-8    | i386_defc=
onfig               | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc5-278-g3e6d74db7e02/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc5-278-g3e6d74db7e02
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3e6d74db7e02b19e52e72fac6b984f48bef6398a =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b-32         | arm   | lab-baylibre    | gcc-8    | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60109ff0a775a2da95d3dfdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60109ff0a775a2da95d3d=
fdc
        new failure (last pass: v5.11-rc4-510-gb26032ee8758) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6010a7e4f2c993727bd3dfe8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6010a7e4f2c993727bd3d=
fe9
        failing since 5 days (last pass: v5.11-rc4-275-g31be679b2913, first=
 fail: v5.11-rc4-315-gcbe1658e272d) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6010a6403dab7a2f95d3dfe8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6010a6403dab7a2f95d3d=
fe9
        new failure (last pass: v5.11-rc4-379-gdd9d91177430) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60109de712a9334275d3dfd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60109de712a9334275d3d=
fda
        failing since 71 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60109e12a372efbbf3d3dff4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60109e12a372efbbf3d3d=
ff5
        failing since 71 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60109ddeb263ea1ca3d3dffb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60109ddeb263ea1ca3d3d=
ffc
        failing since 71 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60109da21ed7d2ce71d3dfed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60109da21ed7d2ce71d3d=
fee
        failing since 71 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60109db803949b9b6bd3dff3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60109db803949b9b6bd3d=
ff4
        failing since 71 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6010a574f793e92a31d3dfdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm64/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt=
-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/arm64/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt=
-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6010a574f793e92a31d3d=
fe0
        new failure (last pass: v5.11-rc4-275-g31be679b2913) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_i386                  | i386  | lab-broonie     | gcc-8    | i386_defc=
onfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6010a08c1cfa2f1729d3dfdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/i386/i386_defconfig/gcc-8/lab-broonie/baseline-qemu_i386.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-2=
78-g3e6d74db7e02/i386/i386_defconfig/gcc-8/lab-broonie/baseline-qemu_i386.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6010a08c1cfa2f1729d3d=
fe0
        new failure (last pass: v5.11-rc4-510-gb26032ee8758) =

 =20
