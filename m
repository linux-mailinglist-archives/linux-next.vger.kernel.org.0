Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEE739016C
	for <lists+linux-next@lfdr.de>; Tue, 25 May 2021 14:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbhEYM6A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 May 2021 08:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232943AbhEYM55 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 May 2021 08:57:57 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E178C061756
        for <linux-next@vger.kernel.org>; Tue, 25 May 2021 05:56:25 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id y202so184674pfc.6
        for <linux-next@vger.kernel.org>; Tue, 25 May 2021 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GjrvGCFH5FCMAByD6fpNkpNpDCUAqp5hYYD0JG0WHxs=;
        b=SpdNj8GnJ1n+rur55A0yqXT8kD6t6cgt/wdvJmnzLTbymbUbieEb1nz+aIBO5HrMSq
         osJnVZi8rxHtMKj9xjKyOmbJ1xaVi4A/jUG6n+qrS5j8vH4R1qYVM1RuUUd6IApKvb3A
         Tdlq6PxLp549vGyld2wwmEaANvGQmNo5/3yK4NC7fT9bkahHNKSGv8WrnPU+itN53lon
         AXwUd2LqJrk0CdCS1bPciqoYznzYkrSjnlPG3nKU4iZVL+UOxfpNYQqDVZHm0VOvdFmM
         gH4gEVAisLpRKP3ewJotsJre6WKVK60riZIbYnzkQLjNd4muO3/wQVnZ3uNZVukyxk08
         1VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GjrvGCFH5FCMAByD6fpNkpNpDCUAqp5hYYD0JG0WHxs=;
        b=B+ji4ujh+mX0QZslQMPf5FU0N/T7H6YUWe8Oszhp0ace78LZkYgBvAHukIxN1DUmjW
         C4IdIv2SMKdisfHXH+MDARUQMrgSc3kKqngBfT37jUPRExKoF3ioKLL93rfl9mV4GN+0
         QxoIRwAm3bft4CRgXZYxNZzT5WhbRhZT/t1Z13lA0OnDgjYty688mXvX/2G2GYGMjUzH
         BN/e8T5GXm801GPOmDxYX4nY1ERJ9RwupWieyCa3u70Mthpt7qWdXkZz+92XBuzmloXC
         lDh5w7ZdfrjynzHxu+7+rWOvjOLkdGv7IfNiJH6Tx8iMfDdM3WGuhzi52wgqQuoZ8I+9
         Nwdg==
X-Gm-Message-State: AOAM531cW4kjt+aD8YSG4YbUiQZAxFJ1fi57Vb8xZu0IdKGDAvg6GS7C
        F/tOTyH0/pOLZea1uznLP7WRouwL2LZghuTA
X-Google-Smtp-Source: ABdhPJzzp+bBOln3JhqDuZMqNN1pJxRMtveNzfJWzkyvCBgUy62rGEbNlbuSu09umf8saKu67NfiRQ==
X-Received: by 2002:a63:aa48:: with SMTP id x8mr18693381pgo.359.1621947384850;
        Tue, 25 May 2021 05:56:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 204sm13317505pfy.56.2021.05.25.05.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 05:56:24 -0700 (PDT)
Message-ID: <60acf3f8.1c69fb81.963f.bb10@mx.google.com>
Date:   Tue, 25 May 2021 05:56:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210525
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: next/master baseline: 457 runs, 12 regressions (next-20210525)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 457 runs, 12 regressions (next-20210525)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

imx6q-sabresd         | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx8mp-evk            | arm64 | lab-nxp         | clang-12 | defconfig     =
               | 1          =

imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig     =
               | 1          =

meson-gxm-khadas-vim2 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana       | arm64 | lab-collabora   | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =

qemu_arm-versatilepb  | arm   | lab-broonie     | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-collabora   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-linaro-lkft | gcc-8    | versatile_defc=
onfig          | 1          =

r8a77950-salvator-x   | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210525/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210525
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5d765451c2409e63563fa6a3e8005bd03ab9e82f =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60acb6e38a18f3b852b3afa0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210525/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210525/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acb6e38a18f3b852b3a=
fa1
        failing since 89 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6q-sabresd         | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60acb489e2431af298b3afaf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210525/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210525/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acb48ae2431af298b3a=
fb0
        failing since 211 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx8mp-evk            | arm64 | lab-nxp         | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60acbafdf2778bb5ceb3af9b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210508012545+a1a19=
7b54ec6-1~exp1~20210507233254.88)
  Plain log:   https://storage.kernelci.org//next/master/next-20210525/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210525/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acbafdf2778bb5ceb3a=
f9c
        new failure (last pass: next-20210524) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60acb5a2b51f629c75b3af9e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210525/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210525/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acb5a2b51f629c75b3a=
f9f
        new failure (last pass: next-20210524) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
meson-gxm-khadas-vim2 | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60acc16be3f6c4b4e6b3af97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210525/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210525/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acc16be3f6c4b4e6b3a=
f98
        new failure (last pass: next-20210521) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
mt8173-elm-hana       | arm64 | lab-collabora   | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60acb832564d738112b3b011

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210525/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210525/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60acb832564d738112b3b025
        failing since 48 days (last pass: next-20210323, first fail: next-2=
0210406)

    2021-05-25 08:41:17.991000+00:00  <8>[   55.759702] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60a=
cb832564d738112b3b02b
        failing since 48 days (last pass: next-20210323, first fail: next-2=
0210406) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-broonie     | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60acb6e97f393845d6b3afd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210525/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210525/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acb6e97f393845d6b3a=
fda
        failing since 188 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60acb4127e95f5bf19b3af9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210525/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210525/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acb4127e95f5bf19b3a=
f9b
        failing since 188 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-collabora   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60acb6bee4832b4696b3afa3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210525/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210525/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acb6bee4832b4696b3a=
fa4
        failing since 188 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-linaro-lkft | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60acd0ed9c15f98ae1b3afaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210525/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210525/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acd0ed9c15f98ae1b3a=
fab
        failing since 188 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
r8a77950-salvator-x   | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60acb95d5b312d9ed9b3afa9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210525/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210525/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60acb95d5b312d9ed9b3a=
faa
        failing since 1 day (last pass: next-20210521, first fail: next-202=
10524) =

 =20
