Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C633F50C6
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 20:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhHWSv7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 14:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbhHWSv7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 14:51:59 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF28C061575
        for <linux-next@vger.kernel.org>; Mon, 23 Aug 2021 11:51:16 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w68so16148453pfd.0
        for <linux-next@vger.kernel.org>; Mon, 23 Aug 2021 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZZWDb4H27/6WjvKX5ryXzmeVVFBXzezUaHAAJEAtYWE=;
        b=UmbPdnWrot08CpSbzUjwcPfxVSqtMOt3zz/BqFTe15TWRxeRSA5HZQDe2SGF1EfbTo
         +116S1vHITKbb3g7u92skUzYTOGsi6TbJW+xHW8f+iQRwb8t8AyVkjvy4Q2PVHy/fQHC
         kIUDGysoou7H9YMHG7YcyAnVdn9ZscQWxZNzqonQO22zNZ/PjOUxxhfPXlQhc1Dw38qT
         cWiiRpoUfywgs4nHFavnCT2afJu4f0r1GNEhT6FwB4ee7QafLdxycWkMB2weE8SJNTju
         kY7A66xhReD+1H9edlq0NqX//AoW3O4Pk5NJjMIeaGWsNJcP98gOka4aZS1gsmrl6GRd
         RWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZZWDb4H27/6WjvKX5ryXzmeVVFBXzezUaHAAJEAtYWE=;
        b=o15IYPNOXPqIK+jeqBDO7kfSQXSwfGyYI1CdFuCi0yLam8AHibYZJf6U+AZ6wiPLjw
         fpQGjZgU6MqXzA+kHFqPiunVwkWuSWewPXIPNlDwIw/1jnNMzD1lSGyFTF+vh8vD8U30
         Ohk4IkEemoyIRoZOk+SsJZ9j7Vg82/vMaC5aMIPBw04N2kxYYQ392VJxuj62M/owpnDi
         mGYOH4ZBAjEPKk7XDFwoOK1bYs9TynA9KRd/wGPE1dE3YLzmuDUdrh5UnufaRzKTiw8n
         eqqFhHvqoP9UC0NUI7cPSvAQIcc/thCehoqP8vfuv0eoItUlY47ImRgbjXDG21THe5f5
         mTBA==
X-Gm-Message-State: AOAM5304Osh2/9MNkHCNAj9ullmWrtnGWRPEwPrZrISsZ+sQm4FP4qEj
        9i9A9DqJnI6Q+ix8349Qe3a0G0J/y7G+D6SK
X-Google-Smtp-Source: ABdhPJzWPFrrKxvQ+pKP/RjSLMGPwExfYae4uw0CMA38G6GsuDh5Xb6YJYXU02eYEObBo1D2LCd5iQ==
X-Received: by 2002:a05:6a00:ac8:b029:320:a6bb:880d with SMTP id c8-20020a056a000ac8b0290320a6bb880dmr35380108pfl.41.1629744675574;
        Mon, 23 Aug 2021 11:51:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x2sm3479pjq.35.2021.08.23.11.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 11:51:15 -0700 (PDT)
Message-ID: <6123ee23.1c69fb81.e5580.002d@mx.google.com>
Date:   Mon, 23 Aug 2021 11:51:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20210823
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/master baseline: 368 runs, 18 regressions (next-20210823)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 368 runs, 18 regressions (next-20210823)

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

beagle-xm            | arm   | lab-baylibre    | clang-12 | multi_v7_defcon=
fig           | 1          =

beagle-xm            | arm   | lab-baylibre    | gcc-8    | multi_v7_defcon=
fig           | 1          =

beagle-xm            | arm   | lab-baylibre    | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

beagle-xm            | arm   | lab-baylibre    | gcc-8    | omap2plus_defco=
nfig          | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =

rk3288-veyron-jaq    | arm   | lab-collabora   | clang-12 | multi_v7_defcon=
fig           | 1          =

rk3288-veyron-jaq    | arm   | lab-collabora   | gcc-8    | multi_v7_defcon=
fig           | 1          =

rk3288-veyron-jaq    | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq    | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210823/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210823
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      46debfec12b4e038b93c62a86bd78ae62f9ba4ea =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6123b320c7160fb04b8e2c83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123b320c7160fb04b8e2=
c84
        failing since 179 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6123aa5e8cca8cd5748e2cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123aa5e8cca8cd5748e2=
cc4
        failing since 74 days (last pass: next-20210609, first fail: next-2=
0210610) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
beagle-xm            | arm   | lab-baylibre    | clang-12 | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6123b1984dd1432ac68e2cbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123b1984dd1432ac68e2=
cbd
        new failure (last pass: next-20210820) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
beagle-xm            | arm   | lab-baylibre    | gcc-8    | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6123ad0d9a8d24eae58e2cb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123ad0d9a8d24eae58e2=
cb9
        new failure (last pass: next-20210820) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
beagle-xm            | arm   | lab-baylibre    | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6123aec57d7da453b68e2c9b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123aec57d7da453b68e2=
c9c
        failing since 27 days (last pass: next-20210723, first fail: next-2=
0210726) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
beagle-xm            | arm   | lab-baylibre    | gcc-8    | omap2plus_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123b01a24ba0d01c98e2cb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123b01a24ba0d01c98e2=
cb6
        failing since 0 day (last pass: next-20210818, first fail: next-202=
10820) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/6123af2dc6726af8dd8e2c95

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123af2dc6726af8dd8e2=
c96
        failing since 115 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123ab12cf36c2e96e8e2c98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123ab12cf36c2e96e8e2=
c99
        failing since 301 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6ul-pico-hobbit   | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123c4838a660bacf48e2cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123c4838a660bacf48e2=
cc0
        new failure (last pass: next-20210820) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123b2035e45b5e0468e2c7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123b2035e45b5e0468e2=
c7b
        failing since 278 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123c6f668886c243c8e2c93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123c6f668886c243c8e2=
c94
        failing since 278 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123ad319dad385dda8e2c87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123ad319dad385dda8e2=
c88
        failing since 278 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123adce4a56e7af628e2cf9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123adce4a56e7af628e2=
cfa
        failing since 278 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6123ab172fdf443d148e2db0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123ab172fdf443d148e2=
db1
        failing since 278 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3288-veyron-jaq    | arm   | lab-collabora   | clang-12 | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6123c10d5e851a06cf8e2dc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123c10d5e851a06cf8e2=
dc1
        failing since 5 days (last pass: next-20210813, first fail: next-20=
210818) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3288-veyron-jaq    | arm   | lab-collabora   | gcc-8    | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6123b940bd65c7c1d08e2c91

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123b940bd65c7c1d08e2=
c92
        failing since 5 days (last pass: next-20210813, first fail: next-20=
210818) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3288-veyron-jaq    | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6123bb7ffc44a441248e2c8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123bb7ffc44a441248e2=
c90
        failing since 5 days (last pass: next-20210813, first fail: next-20=
210818) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3288-veyron-jaq    | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6123bd561e7163a3b08e2cb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210823/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6123bd561e7163a3b08e2=
cb2
        failing since 5 days (last pass: next-20210813, first fail: next-20=
210818) =

 =20
