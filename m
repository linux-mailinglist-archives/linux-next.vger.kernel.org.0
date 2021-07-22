Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2C43D2CBD
	for <lists+linux-next@lfdr.de>; Thu, 22 Jul 2021 21:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhGVStM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jul 2021 14:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhGVStK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jul 2021 14:49:10 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98F6C061575
        for <linux-next@vger.kernel.org>; Thu, 22 Jul 2021 12:29:43 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id c11so303579plg.11
        for <linux-next@vger.kernel.org>; Thu, 22 Jul 2021 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MU5JERh1kX1bHjj4FTqbvsXF+c5jaBn0nJus8JL/MZQ=;
        b=sYoVlsVz+DYTYOEWjoYIuuagnsmftzx9wGw7ONrgGWMgjyRrtgymu/bVzIFg7lw9dw
         A/PPvQpj2UUtUMZiDVorUcBa59zPqiBOgcrzR2E/YDEU3FtYtKvp2hsD6o+vZLL2ozs0
         3vOEH5yZ6QJXQSL7MpN0gqjE+JLdb5sSVdmiiXtzMFg4ZjeTFux/9+EKBigO2WFu1hZV
         fr2CBeN+sHusseBCWfGpWfQu0DovGx6hJjF6K4+krGKebR9d3GlkhnCqSM3RRZvEyzN2
         3cirUxYMfDRPW4ZOK/QDmnsa+penzoezQy1HT0ACgftYvGTMe11WSkh5dOZAPaE/nFfw
         hEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MU5JERh1kX1bHjj4FTqbvsXF+c5jaBn0nJus8JL/MZQ=;
        b=cqBjsDy7cIOCgHRvTlRsiLRQ8JxMtDaFGgt6gqZYIT5pDIvckuRusoqNzGvQC4v/EG
         oe5+hByIGVpsSXjsWWaBI5e/if8OJ75Jy6iQjfZkK3rkRDQbPLhf8a0RXLDUjQ2oaXWW
         wnG2KMIGD7eCHvMaye6oJMm70oOyZXVVKJOuhTYvFoG2BjvGFFWBUrPKEDp+aPOfXuEU
         VNP1+HNncFjtBKFHWLeku/WW8KmfAAdbgEmsr64DpskJKTqjXLikT0hNru7THhvUxQkZ
         pBaqgrEweIJ+mMMeai6HQAFXsv78/m8ck8K58IbBwEA5vK/bOSRlQdzPutdy5ght38x2
         MIUg==
X-Gm-Message-State: AOAM533IQy7CnM+Bvpij1c1VmsOxGcc2if3MDzyFI21qsu7WJp1Fh6p4
        kyHsyMc0NzSHQlezCYzLtc5fLZQolLeorW3m
X-Google-Smtp-Source: ABdhPJwH7u6N69teJX2BI6chg5eK0oEb35EhHZuVE2YWXXNB+hFbHX8PwbXzrW/a0OIh4RiKdZSqsQ==
X-Received: by 2002:a17:903:2309:b029:12a:965b:333 with SMTP id d9-20020a1709032309b029012a965b0333mr1193639plh.31.1626982182845;
        Thu, 22 Jul 2021 12:29:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id nl2sm25986398pjb.10.2021.07.22.12.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 12:29:42 -0700 (PDT)
Message-ID: <60f9c726.1c69fb81.87f6a.f588@mx.google.com>
Date:   Thu, 22 Jul 2021 12:29:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20210722
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/master baseline: 614 runs, 27 regressions (next-20210722)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 614 runs, 27 regressions (next-20210722)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =

bcm2837-rpi-3-b-32    | arm   | lab-baylibre    | gcc-8    | bcm2835_defcon=
fig            | 1          =

beagle-xm             | arm   | lab-baylibre    | clang-10 | multi_v7_defco=
nfig           | 1          =

beagle-xm             | arm   | lab-baylibre    | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

beagle-xm             | arm   | lab-baylibre    | gcc-8    | multi_v7_defco=
nfig           | 1          =

beagle-xm             | arm   | lab-baylibre    | gcc-8    | omap2plus_defc=
onfig          | 1          =

hifive-unleashed-a00  | riscv | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =

imx6q-sabresd         | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx6sx-sdb            | arm   | lab-nxp         | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx8mp-evk            | arm64 | lab-nxp         | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230  | arm64 | lab-baylibre    | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

meson-gxm-q200        | arm64 | lab-baylibre    | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

meson-gxm-q200        | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 2          =

qemu_arm-versatilepb  | arm   | lab-baylibre    | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-broonie     | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-collabora   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-linaro-lkft | gcc-8    | versatile_defc=
onfig          | 1          =

rk3328-rock64         | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210722/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210722
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7468cbf5c917ec48c66b0dd157b306f36345cab8 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60f9877fd5ff055fc285c256

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f9877fd5ff055fc285c=
257
        failing since 147 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f9896ee6dc7b69b285c25b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f9896ee6dc7b69b285c=
25c
        failing since 35 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f981d97f1ae0536b85c269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f981d97f1ae0536b85c=
26a
        failing since 35 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f986c51b3269dcee85c288

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f986c61b3269dcee85c=
289
        failing since 35 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60f9881ace9bf325d985c262

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f9881ace9bf325d985c=
263
        failing since 35 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32    | arm   | lab-baylibre    | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60f9826620e284ffe185c289

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f9826620e284ffe185c=
28a
        failing since 42 days (last pass: next-20210609, first fail: next-2=
0210610) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beagle-xm             | arm   | lab-baylibre    | clang-10 | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60f9878cc8abcc4bf385c295

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f9878cc8abcc4bf385c=
296
        failing since 226 days (last pass: next-20201207, first fail: next-=
20201208) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beagle-xm             | arm   | lab-baylibre    | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60f98393a705d6158185c267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f98393a705d6158185c=
268
        failing since 8 days (last pass: next-20201208, first fail: next-20=
210714) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beagle-xm             | arm   | lab-baylibre    | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60f984e537bfcbee2285c2c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f984e537bfcbee2285c=
2c4
        failing since 8 days (last pass: next-20201208, first fail: next-20=
210714) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beagle-xm             | arm   | lab-baylibre    | gcc-8    | omap2plus_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f9863bc7b25cf08c85c28d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f9863bc7b25cf08c85c=
28e
        failing since 2 days (last pass: next-20210719, first fail: next-20=
210720) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
hifive-unleashed-a00  | riscv | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60f9812b4a5683c91085c268

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f9812b4a5683c91085c=
269
        failing since 83 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6q-sabresd         | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f9844429f451801c85c263

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f9844429f451801c85c=
264
        failing since 269 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6sx-sdb            | arm   | lab-nxp         | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60f98bef9ea278128585c261

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f98bef9ea278128585c=
262
        new failure (last pass: next-20210720) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx8mp-evk            | arm64 | lab-nxp         | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f98a9bf64748193c85c258

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f98a9bf64748193c85c=
259
        new failure (last pass: next-20210720) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f98781d5ff055fc285c25b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f98781d5ff055fc285c=
25c
        new failure (last pass: next-20210719) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f987bf453e7b8a8a85c25e

  Results:     92 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
60f987bf453e7b8a8a85c262
        new failure (last pass: next-20210720)

    2021-07-22T14:59:02.476709  /lava-30032/1/../bin/lava-test-case
    2021-07-22T14:59:02.477001  <8>[   19.055269] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>
    2021-07-22T14:59:02.477157  /lava-30032/1/../bin/lava-test-case
    2021-07-22T14:59:02.477303  <8>[   19.074551] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2021-07-22T14:59:02.477449  /lava-30032/1/../bin/lava-test-case
    2021-07-22T14:59:02.477591  <8>[   19.090229] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dpass>
    2021-07-22T14:59:02.477742  /lava-30032/1/../bin/lava-test-case   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
meson-gxl-s905d-p230  | arm64 | lab-baylibre    | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f996de39feadcb1e85c27f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f996de39feadcb1e85c=
280
        new failure (last pass: next-20210714) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
meson-gxm-q200        | arm64 | lab-baylibre    | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60f98da6af72b8f93f85c279

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-meson=
-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-meson=
-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60f98da6af72b8f=
93f85c280
        new failure (last pass: next-20210720)
        11 lines

    2021-07-22T15:24:11.453888  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address ffcf00002c300000
    2021-07-22T15:24:11.454077  kern  :alert : Mem abort info:
    2021-07-22T15:24:11.454272  kern  :alert :   ESR =3D 0x96000044
    2021-07-22T15:24:11.454471  ker<8>[   16.020691] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D11>
    2021-07-22T15:24:11.454659  n  :alert :   EC =3D 0x25: DABT (current EL=
), IL =3D 32 bits
    2021-07-22T15:24:11.454838  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-07-22T15:24:11.455002  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-07-22T15:24:11.455160  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2021-07-22T15:24:11.455317  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60f98da6af72b8f=
93f85c281
        new failure (last pass: next-20210720)
        2 lines

    2021-07-22T15:24:11.506690  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
044
    2021-07-22T15:24:11.506920  kern  :alert :   CM =3D 0, WnR =3D 1
    2021-07-22T15:24:11.507049  kern  :alert : [ffcf00002c300000] address b=
etween user and kernel address ranges
    2021-07-22T15:24:11.507166  kern  :emerg : Internal e<8>[   16.062114] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2021-07-22T15:24:11.507277  rror: Oop<8>[   16.071455] <LAVA_SIGNAL_END=
RUN 0_dmesg 581190_1.5.2.4.1>
    2021-07-22T15:24:11.507386  s: 96000044 [#1] PREEMPT SMP
    2021-07-22T15:24:11.507492  kern  :emerg : Code: 8b09000a 3400042b eb08=
015f 54ffff22 (3900014b) =

    2021-07-22T15:24:11.507597  + set +x   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
meson-gxm-q200        | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/60f98cb520a77a159b85c28d

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60f98cb520a77a1=
59b85c294
        new failure (last pass: next-20210720)
        9 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60f98cb520a77a1=
59b85c295
        new failure (last pass: next-20210720)
        2 lines

    2021-07-22T15:20:12.868866  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-07-22T15:20:12.869100  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2021-07-22T15:20:12.869295  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000092c8000
    2021-07-22T15:20:12.869450  kern  :alert : [0000000000000000] pgd=3D080=
00000092c9003
    2021-07-22T15:20:12.869597  kern  :emerg : Internal error: Oops: 860000=
06 [#1] PREEMPT SMP<8>[   15.962982] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3De=
merg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-07-22T15:20:12.869744  =

    2021-07-22T15:20:12.869887  kern  :emerg :<8>[   15.972793] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 581168_1.5.2.4.1>
    2021-07-22T15:20:12.870029   Code: bad PC value
    2021-07-22T15:20:12.870169  + set +x   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre    | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f9846a62a4d3e65485c278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f9846a62a4d3e65485c=
279
        failing since 246 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-broonie     | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f989fbc9cfbd3fb285c26b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f989fbc9cfbd3fb285c=
26c
        failing since 246 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f9833d24ce41bc2185c2dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f9833d24ce41bc2185c=
2de
        failing since 246 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-collabora   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f988a1a26106eb6985c257

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f988a1a26106eb6985c=
258
        failing since 246 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-linaro-lkft | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f9815936c952066985c25b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f9815936c952066985c=
25c
        failing since 246 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
rk3328-rock64         | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f985b4a117955e3885c285

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210722/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f985b4a117955e3885c=
286
        failing since 37 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =20
