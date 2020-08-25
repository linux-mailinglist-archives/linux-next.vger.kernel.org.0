Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8EC251910
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 14:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgHYMwc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Aug 2020 08:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbgHYMwY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Aug 2020 08:52:24 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6C6C061574
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2020 05:52:23 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id n3so812377pjq.1
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2020 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vIytrGmOTGv6Wx92lYL4uK5ugZiXxYb4E61nUOLfY2Q=;
        b=J8zTJWdLbS0PKD8nrMC73fuoU3HEeK6h0THOCJNja1fUVfH+dSRdehS/Mdy8c/PNA+
         hwaVQ5hLRArPTELZdpeN8GgsKfZnfg9InXueh/RZcP6LepowY4j0lrtNJY8wjXGcyhsj
         zQzbN7t3nAG0uSlPu/kk6z13uGV2hsqFCkZPYPGwsZOss2DhSclwCGz0329lHsouZ9yT
         k4/LhgUznjfjg998aBWdkASU/c/5i0q0+5xNilO8b37/FChR3l9qyedF7o4neyHIkr7u
         PCamVyBR8yOgS5XfO1Gt0+OMbtau0qgRL9zLoePOXV8oGSUgI8Om0906k6u3sz0ZFdt1
         Uq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vIytrGmOTGv6Wx92lYL4uK5ugZiXxYb4E61nUOLfY2Q=;
        b=gSZsnNJLi6ZVhcTRqaH4OBagfUiyhC29FlrZ2L+cK29ky8KylMwJIqwY3gFCTH5dBL
         Sp9dFiRkOU+MqDjBENEXDBgljM5MDBkYbpOWlgcbjKi3pPv3rDkKyKuI/azefvfQQ+kT
         MuiF4Pzi86xiLZx6+HWY5Da6dGBdIPiO1g3Wz52vIxuYGgPfVCSO4Bc06xG0xm8UXR/M
         ZoefSh/77vau4uDE7EIak1qyIf0khUTMVOJ4V2Nel7kV8D1JY4lLjV/6+3nJ9heST1M+
         JObWv8lIjyJq/t1C/c0PN1dPC+jthLnHDMWof4gSOd5FZkZabXTWdSgSg+rOv0hD5qN5
         WVMA==
X-Gm-Message-State: AOAM532/2jaelb/l6MaqbPj/nfzj31rIzJsGptCvG+uDNL+SUdy9H1Kj
        +LwvuiaGvOFio6c1ZLTFxxP+D1Xe/XT4oQ==
X-Google-Smtp-Source: ABdhPJzgmZGMmLFw3Sa+KZ8suL/xGj56AD7/g4isaatpuVmUqC9VIIzIH8NZU8TAx87C5U+Nf3Ohzg==
X-Received: by 2002:a17:90a:f317:: with SMTP id ca23mr1477114pjb.53.1598359942520;
        Tue, 25 Aug 2020 05:52:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y29sm2731528pff.59.2020.08.25.05.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 05:52:21 -0700 (PDT)
Message-ID: <5f450985.1c69fb81.d0e74.7478@mx.google.com>
Date:   Tue, 25 Aug 2020 05:52:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200825
Subject: next/master baseline: 368 runs, 20 regressions (next-20200825)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 368 runs, 20 regressions (next-20200825)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =

rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 83/88  =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 83/88  =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 0/1    =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 0/1    =

sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-8    | multi_v7_defconf=
ig           | 0/1    =

sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | sunxi_defconfig =
             | 0/1    =

sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-8    | sunxi_defconfig =
             | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200825/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200825
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3a00d3dfd4b68b208ecd5405e676d06c8ad6bb63 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d1f560dfd32ca09fb433

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d1f560dfd32ca09fb=
434
      failing since 118 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f44d354974cc7a9749fb42b

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f44d354974cc7a9=
749fb42f
      new failure (last pass: next-20200824)
      1 lines

    2020-08-25 08:59:02.167000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-08-25 08:59:02.167000  (user:khilman) is already connected
    2020-08-25 08:59:18.764000  =00
    2020-08-25 08:59:18.765000  =

    2020-08-25 08:59:18.765000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-08-25 08:59:18.765000  =

    2020-08-25 08:59:18.765000  DRAM:  948 MiB
    2020-08-25 08:59:18.780000  RPI 3 Model B (0xa02082)
    2020-08-25 08:59:18.866000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-08-25 08:59:18.899000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d4700ef960b2c79fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d4700ef960b2c79fb=
42c
      failing since 1 day (last pass: next-20200821, first fail: next-20200=
824)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d702b9e92a2ade9fb443

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d702b9e92a2ade9fb=
444
      failing since 31 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d857bc45f69fcf9fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d857bc45f69fcf9fb=
42c
      failing since 31 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d9a3aaa45163fe9fb46c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d9a3aaa45163fe9fb=
46d
      failing since 1 day (last pass: next-20200821, first fail: next-20200=
824)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f44d4448493d6f73c9fb42b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f44d4448493d6f=
73c9fb431
      failing since 40 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-25 09:05:03.232000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-25 09:05:03.238000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-25 09:05:03.244000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-25 09:05:03.249000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-25 09:05:03.255000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-25 09:05:03.261000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-25 09:05:03.267000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-25 09:05:03.273000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-25 09:05:03.278000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-08-25 09:05:03.284000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f44d6605371b404fc9fb42b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f44d6605371b40=
4fc9fb431
      failing since 40 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-25 09:14:02.674000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-25 09:14:02.680000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-25 09:14:02.686000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-25 09:14:02.692000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-25 09:14:02.698000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-25 09:14:02.704000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-25 09:14:02.710000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-25 09:14:02.716000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-25 09:14:02.722000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-08-25 09:14:02.728000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d34f0609c8cca89fb430

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d34f0609c8cca89fb=
431
      failing since 34 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 83/88  =


  Details:     https://kernelci.org/test/plan/id/5f44d1eb402a9b85ed9fb450

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f44d1eb402a9b8=
5ed9fb4a9
      failing since 5 days (last pass: next-20200819, first fail: next-2020=
0820)
      11 lines

    2020-08-25 08:54:57.138000  kern  :alert : Mem abort info:
    2020-08-25 08:54:57.142000  kern  :alert :   ESR =3D 0x96000006
    2020-08-25 08:54:57.147000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-08-25 08:54:57.151000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-08-25 08:54:57.154000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-08-25 08:54:57.158000  kern  :alert : Data abort info:
    2020-08-25 08:54:57.162000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-08-25 08:54:57.165000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-08-25 08:54:57.172000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000eb396000
    2020-08-25 08:54:57.184000  kern  :alert : [0000000000000010] pgd=3D000=
00000eb397003, p4d=3D00000000eb397003, pud=3D00000000eb398003, pmd=3D000000=
0000000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f44d1eb402a=
9b85ed9fb4aa
      failing since 5 days (last pass: next-20200819, first fail: next-2020=
0820)
      2 lines

    2020-08-25 08:54:57.205000  kern  :emerg : Code: 2a0303f4 721d102a 5400=
0040 b4000089 (f9400928) =

      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 83/88  =


  Details:     https://kernelci.org/test/plan/id/5f44d0ab32740dbec49fb466

  Results:     83 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f44d0ab32740db=
ec49fb4bf
      failing since 5 days (last pass: next-20200819, first fail: next-2020=
0820)
      11 lines

    2020-08-25 08:49:37.327000  kern  :alert : Mem abort info:
    2020-08-25 08:49:37.330000  kern  :alert :   ESR =3D 0x96000006
    2020-08-25 08:49:37.336000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-08-25 08:49:37.339000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-08-25 08:49:37.343000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-08-25 08:49:37.346000  kern  :alert : Data abort info:
    2020-08-25 08:49:37.350000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-08-25 08:49:37.354000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-08-25 08:49:37.361000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000ebecf000
    2020-08-25 08:49:37.373000  kern  :alert : [0000000000000010] pgd=3D000=
00000ebf2f003, p4d=3D00000000ebf2f003, pud=3D00000000ebf34003, pmd=3D000000=
0000000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f44d0ab3274=
0dbec49fb4c0
      failing since 5 days (last pass: next-20200819, first fail: next-2020=
0820)
      2 lines

    2020-08-25 08:49:37.394000  kern  :emerg : Code: 1a9f07e7 f10000df 7a40=
08e4 54000521 (f94008c8) =

      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d57bf75eb727db9fb436

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d57bf75eb727db9fb=
437
      failing since 1 day (last pass: next-20200821, first fail: next-20200=
824)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d4f6092cbe05499fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d4f6092cbe05499fb=
42c
      failing since 38 days (last pass: next-20200715, first fail: next-202=
00717)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d6c3a9fea799309fb451

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d6c3a9fea799309fb=
452
      failing since 38 days (last pass: next-20200716, first fail: next-202=
00717)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d545f8872253769fb435

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d545f8872253769fb=
436
      failing since 38 days (last pass: next-20200715, first fail: next-202=
00717)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d6ebb9e92a2ade9fb435

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d6ebb9e92a2ade9fb=
436
      failing since 38 days (last pass: next-20200716, first fail: next-202=
00717)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-baylibre  | gcc-8    | sunxi_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d1efe6be1f56ca9fb436

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d1efe6be1f56ca9fb=
437
      failing since 35 days (last pass: next-20200717, first fail: next-202=
00720)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
sun7i-a20-cubieboard2 | arm   | lab-clabbe    | gcc-8    | sunxi_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f44d2b2f9eace68909fb43f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f44d2b2f9eace68909fb=
440
      failing since 35 days (last pass: next-20200717, first fail: next-202=
00720)  =20
