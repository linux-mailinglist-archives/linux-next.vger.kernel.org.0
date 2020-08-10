Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D333F2403C7
	for <lists+linux-next@lfdr.de>; Mon, 10 Aug 2020 11:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgHJJBi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Aug 2020 05:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbgHJJBh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Aug 2020 05:01:37 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB247C061756
        for <linux-next@vger.kernel.org>; Mon, 10 Aug 2020 02:01:37 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id u128so4830663pfb.6
        for <linux-next@vger.kernel.org>; Mon, 10 Aug 2020 02:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MJ2JWhxVYJHvWHQYZxLRFiCfYhx2nXZboLvKucVnuec=;
        b=dB3L2uLMTM8dYUuLoBmKqSHfqr3ida0FfezMcJlQP7UwED3BZz9r5Ojydvlcm/gyp/
         jAihnRRPpCv8QNRgBpHJwOvTfbjwJq7ZyKr3MUv7x9ZzJQ8/oZLMXxVjSqjwEUR6dE5q
         W9/FbiYoANy9VjyoZGQtjgQIgaXWtBWbGEd3I8ynw79wZtlD22lxit+z7WmBS7qHYGJq
         0in8mRosYBY8oVM0YKYkuw9jRAJi+uHahr8xXPszkaXBgNkE0aWHHiNhv0mAATOfYchQ
         TbzbY1nP71CZp3/VOjpr4/etH6qqNL47WlCUR6pxIMVbvQ/Ih3tnu/lT9/ch1jI5WANV
         0BGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MJ2JWhxVYJHvWHQYZxLRFiCfYhx2nXZboLvKucVnuec=;
        b=C3vEHOwMTZxDO/KyBMls1+AxrbGg0thB5xJQYQR2wsOZ54HdeYfiSuU3qL+Jbs7QDs
         JkInQp7tZH5uehja93/aiEgX5ZMyL5mtEwly6XAqK6tAgD+XOWbNHLCpka8Mzl8DSXpg
         OC3MQzETjP4py1eClohyt/sxyX9X/x78XtSB2fALFzgzx+dRq1JOYiVo3dopvQAVRY1H
         qhglO+8m/v0BNIIX2pCtSfkCIhqAjdTIfQ9+jIxcd8rJ9aSgWJ6Ecu73bQrd1RQf8Jfy
         jOlfHuFuHFYNgyM8TuVbm+U2v8UPDeQgU3NEDDdBvB3rA8R+o50FroxCYaIElfl54g+3
         lB3Q==
X-Gm-Message-State: AOAM530vF5eBm+EMRD+iqw8zgO01G7ATew6yABQAAvv2zMzglGMkUjDa
        s5duf3eCTdiiesomOUjABQuMr+uQuTo=
X-Google-Smtp-Source: ABdhPJwoD1nJn9V9l+GPImN4TR3e4mN4mOi3aJesQwIh8IShx5GYnJ2hUCvcF5Q/zfYU/zwmC5qIBw==
X-Received: by 2002:a63:e017:: with SMTP id e23mr21021100pgh.125.1597050096278;
        Mon, 10 Aug 2020 02:01:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f3sm22786957pfj.206.2020.08.10.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 02:01:35 -0700 (PDT)
Message-ID: <5f310cef.1c69fb81.a7b92.c7e6@mx.google.com>
Date:   Mon, 10 Aug 2020 02:01:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200810
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 290 runs, 16 regressions (next-20200810)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 290 runs, 16 regressions (next-20200810)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 4/5    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

omap3-beagle-xm       | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =

rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 84/88  =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 84/88  =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 84/88  =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 0/1    =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | sunxi_defconfig =
             | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200810/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200810
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f80535b9aa10b0bbed0fb727247c03e20580db1c =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30d4c96085e9526b52c1c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30d4c96085e9526b52c=
1c3
      failing since 103 days (last pass: next-20200424, first fail: next-20=
200428) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f30d39a6aec00a35652c1f2

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f30d39b6aec00a3=
5652c1f5
      failing since 3 days (last pass: next-20200805, first fail: next-2020=
0806)
      1 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30d1de974e97c72f52c1bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30d1de974e97c72f52c=
1bc
      failing since 19 days (last pass: next-20200630, first fail: next-202=
00721) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30d45dd04ebd0e9852c1d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30d45dd04ebd0e9852c=
1da
      failing since 16 days (last pass: next-20200723, first fail: next-202=
00724) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30d95495357f202352c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30d95495357f202352c=
1a7
      failing since 16 days (last pass: next-20200723, first fail: next-202=
00724) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30dbdf54a410ed9552c1ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30dbdf54a410ed9552c=
1af
      failing since 16 days (last pass: next-20200723, first fail: next-202=
00724) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap3-beagle-xm       | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30d678d64d02a96752c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap3-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap3-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30d678d64d02a96752c=
1a7
      new failure (last pass: next-20200807) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f30d556ef7bec42dc52c204

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f30d556ef7bec4=
2dc52c208
      failing since 25 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f30d5e826f9ebc6e752c1d8

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f30d5e826f9ebc=
6e752c1dc
      failing since 25 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30d2c5acb082824952c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30d2c5acb082824952c=
1a7
      failing since 19 days (last pass: next-20200706, first fail: next-202=
00721) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f30d44283eebcce5d52c1b0

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f30d44383eebcce5d52c1f0
      failing since 10 days (last pass: next-20200728, first fail: next-202=
00729) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f30d2c8acb082824952c1a9

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f30d2c8acb082824952c1e9
      failing since 9 days (last pass: next-20200728, first fail: next-2020=
0731) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f30d3895ed4d3917e52c1b8

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f30d3895ed4d3917e52c1f8
      failing since 10 days (last pass: next-20200728, first fail: next-202=
00729) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30d602bf989e352e52c1ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30d602bf989e352e52c=
1ad
      failing since 23 days (last pass: next-20200716, first fail: next-202=
00717) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30d745ced7ec95cd52c1ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30d745ced7ec95cd52c=
1ac
      failing since 23 days (last pass: next-20200715, first fail: next-202=
00717) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | sunxi_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30d29eace9d63a1952c1d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200810/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200810/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30d29eace9d63a1952c=
1d7
      failing since 20 days (last pass: next-20200717, first fail: next-202=
00720) =20
