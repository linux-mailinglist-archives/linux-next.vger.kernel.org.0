Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5696840ACF6
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 14:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232326AbhINMCv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 08:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232388AbhINMCs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Sep 2021 08:02:48 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E01FC061574
        for <linux-next@vger.kernel.org>; Tue, 14 Sep 2021 05:01:31 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id bb10so8026339plb.2
        for <linux-next@vger.kernel.org>; Tue, 14 Sep 2021 05:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KaqiakvCZPDICLMJN0teCBMWryabKLw2NHzmy1ABgxg=;
        b=y7vchY7SSj90EJNNrpLxisrNbC4DLMkqbZ1wX9ZjVvMx9kZwcAMZ8nFmC+HgaiMOD0
         iGbelLcrQlolK/QClEq+ZlvvL9r9lTRhqoOAjIi0azbdufHFOVza/oK+q8AncptlcmCe
         h/c59joZB8mYBxXWAKru4hOqlYz8PnASU2m6t9RekTm/lotxQWD843yC8/t6l2sZpyop
         be9l2JKSaZU6dQvZCtmVuQ6ruENUXyM3iPR/M+kk2sbVzAzJu2gHx5w4lulsBvC9+Dce
         YALi+RpWN5l8kUDqGBLGTV9rFmrfhZhGNipRl1in9B12fZjXGkg+LVJ+PRq6w/2yLXKU
         8cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KaqiakvCZPDICLMJN0teCBMWryabKLw2NHzmy1ABgxg=;
        b=8GD6y0ku8jgmQmawoWAEBDA+0TjS63ySavGRombVUxGo2UbSWMMZDWcWEacvlLXbv9
         fwrFXqFuPwYoiEtNkuIHZxrUZPJpF/+5IjanW86Ka7ZVPlCkenu1tY2SPe4bsENY+KnS
         +1KjOu6pJosRBbohnCK8XvqLRZHzoEj6GOW+i7ZT7ao6+1Rz/zUg07wKq4fcnxyd3PQP
         JGzSaBO5+dDBMoz5E3q8ljVMYXsBuf4/wT7eV6EOmeOzB7qECjGRL44ut5DDyKa7/M6F
         0Jo6iBtJooooVcMELFzWXN1nhnkcBwRmZfsRM9M3Mrjb/eGkMJNgua+lNu6xrxZJ3vUd
         Okig==
X-Gm-Message-State: AOAM5334OEJkl+KgSbF4flVuDZ7tq2B6hz04vbV1eUA4LvL0ZFHlUcQ+
        v0qtL26GbaN0RipQgjT3lOc6OXnP2jY4qo++
X-Google-Smtp-Source: ABdhPJxsma6KocQajWoVN/RRoTfiAX0oLzQU1nzq5UtxwhXlAx0Kv7jupkaHSPfRo5xoOIBUgDcr/g==
X-Received: by 2002:a17:903:102:b0:13a:66a8:f28 with SMTP id y2-20020a170903010200b0013a66a80f28mr14783288plc.62.1631620890355;
        Tue, 14 Sep 2021 05:01:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w127sm10608464pfc.15.2021.09.14.05.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 05:01:30 -0700 (PDT)
Message-ID: <61408f1a.1c69fb81.f093d.d903@mx.google.com>
Date:   Tue, 14 Sep 2021 05:01:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210914
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 692 runs, 35 regressions (next-20210914)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 692 runs, 35 regressions (next-20210914)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre  | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre  | clang-12 | defconfig=
                    | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | clang-12 | multi_v7_=
defconfig           | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-8    | omap2plus=
_defconfig          | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =

hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =

hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

imx6q-sabresd                | arm   | lab-nxp       | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp       | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 2          =

imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
+crypto             | 1          =

imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | clang-12 | defconfig=
                    | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre  | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip       | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-collabora | gcc-8    | versatile=
_defconfig          | 1          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210914/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210914
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      815c5020b5ab041761fdd4272783a6104a92fd9e =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6140596556aaa7c02b99a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6140596556aaa7c02b99a=
2dc
        failing since 201 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61405d436331a36e4099a31a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210905123925+fed41=
342a82f-1~exp1~20210904224639.138)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405d436331a36e4099a=
31b
        failing since 88 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | clang-12 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/614062946cd032978f99a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210905123925+fed41=
342a82f-1~exp1~20210904224639.138)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614062946cd032978f99a=
2e0
        failing since 88 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61405a9b621acff01199a2e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405a9b621acff01199a=
2e5
        failing since 88 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61405bef2a7b2f480b99a2f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405bef2a7b2f480b99a=
2f9
        failing since 88 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61405e981c5637eeab99a2ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405e981c5637eeab99a=
2ee
        failing since 88 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | clang-12 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61405be770b5b6ec9f99a2ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210905123925+fed41=
342a82f-1~exp1~20210904224639.138)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405be770b5b6ec9f99a=
2eb
        failing since 1 day (last pass: next-20210908, first fail: next-202=
10913) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61405a2f3e3ac5b15299a38e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405a2f3e3ac5b15299a=
38f
        failing since 49 days (last pass: next-20210723, first fail: next-2=
0210726) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61405b8532b422554f99a2e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405b8532b422554f99a=
2e9
        failing since 7 days (last pass: next-20210903, first fail: next-20=
210907) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-8    | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6140579fb9fbb834bc99a310

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6140579fb9fbb834bc99a=
311
        new failure (last pass: next-20210913) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61405d286331a36e4099a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405d286331a36e4099a=
2db
        failing since 298 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61405ef4f86f39d88e99a2de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405ef4f86f39d88e99a=
2df
        failing since 298 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61406351d28c8da5aa99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61406351d28c8da5aa99a=
2db
        failing since 298 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/614055d4806ca6902a99a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614055d4806ca6902a99a=
2dd
        failing since 137 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/614062bafe1ddd69cd99a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614062bafe1ddd69cd99a=
2dd
        failing since 75 days (last pass: next-20210624, first fail: next-2=
0210629) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61406b6efa98aa986799a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61406b6efa98aa986799a=
2db
        failing since 75 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabresd                | arm   | lab-nxp       | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61405be1e76ffdfa7399a2f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405be2e76ffdfa7399a=
2fa
        failing since 323 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp       | clang-12 | defconfig=
+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61405bbaf06c444f7599a2e8

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210905123925+fed41=
342a82f-1~exp1~20210904224639.138)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mn-ddr=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mn-ddr=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61405bbaf06c444=
f7599a2ef
        failing since 1 day (last pass: next-20210910, first fail: next-202=
10913)
        12 lines

    2021-09-14T08:21:55.949804  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   65.530092] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-09-14T08:21:55.950036  0098
    2021-09-14T08:21:55.950152  kern  :alert : Mem abort info:
    2021-09-14T08:21:55.950262  kern  :alert :   ESR =3D 0x96000047
    2021-09-14T08:21:55.950368  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-14T08:21:55.950473  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-09-14T08:21:55.950609  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61405bbaf06c444=
f7599a2f0
        failing since 1 day (last pass: next-20210910, first fail: next-202=
10913)
        2 lines

    2021-09-14T08:21:55.992686  kern  :alert :   FSC =3D 0x07: level 3 tran=
slat<8>[   65.561542] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Df=
ail UNITS=3Dlines MEASUREMENT=3D2>
    2021-09-14T08:21:55.992919  ion fault   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6140581dbea55fb98099a2da

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6140581dbea55fb=
98099a2e1
        new failure (last pass: next-20210913)
        12 lines

    2021-09-14T08:06:15.811376  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.159725] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-09-14T08:06:15.811647  0098
    2021-09-14T08:06:15.811861  kern  :alert : Mem abort info:
    2021-09-14T08:06:15.812023  kern  :alert :   ESR =3D 0x96000046
    2021-09-14T08:06:15.812162  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-14T08:06:15.812313  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-09-14T08:06:15.812443  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6140581dbea55fb=
98099a2e2
        new failure (last pass: next-20210913)
        2 lines

    2021-09-14T08:06:15.854125  kern  :alert :   FSC =3D 0x06: level 2 tran=
slat<8>[   14.190460] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Df=
ail UNITS=3Dlines MEASUREMENT=3D2>
    2021-09-14T08:06:15.854373  ion fault
    2021-09-14T08:06:15.854521  kern  :alert : Data ab<8>[   14.202346] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 653715_1.5.2.4.1>
    2021-09-14T08:06:15.854653  ort info:   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6140592532cd09b02a99a2e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6140592532cd09b02a99a=
2e4
        failing since 6 days (last pass: next-20210907, first fail: next-20=
210908) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61405d787e013b542699a309

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405d787e013b542699a=
30a
        failing since 4 days (last pass: next-20210908, first fail: next-20=
210909) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | clang-12 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61406292b323e2af9899a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210905123925+fed41=
342a82f-1~exp1~20210904224639.138)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61406292b323e2af9899a=
2e0
        new failure (last pass: next-20210910) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61405c51086c31d5be99a3a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405c51086c31d5be99a=
3a1
        new failure (last pass: next-20210913) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61405a33d1efeee95c99a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405a33d1efeee95c99a=
2dc
        new failure (last pass: next-20210913) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre  | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6140548eed2c4ac1fe99a2ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6140548eed2c4ac1fe99a=
2ee
        failing since 300 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip       | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61405487ed2c4ac1fe99a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405487ed2c4ac1fe99a=
2e8
        failing since 300 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm   | lab-collabora | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6140544021d3911f0499a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6140544021d3911f0499a=
2db
        failing since 300 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61405a49d1efeee95c99a3d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405a49d1efeee95c99a=
3d1
        failing since 90 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61405802a3e7cd9eae99a2ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405802a3e7cd9eae99a=
2ee
        failing since 1 day (last pass: next-20210910, first fail: next-202=
10913) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61405ad4269463559599a307

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405ad4269463559599a=
308
        failing since 7 days (last pass: next-20210906, first fail: next-20=
210907) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61405c3cb292aec33799a334

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405c3cb292aec33799a=
335
        failing since 215 days (last pass: next-20210209, first fail: next-=
20210210) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61405f0ef86f39d88e99a355

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61405f0ef86f39d88e99a=
356
        failing since 1 day (last pass: next-20210910, first fail: next-202=
10913) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/614060741e195b262899a2f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210914/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614060741e195b262899a=
2f5
        new failure (last pass: next-20210913) =

 =20
