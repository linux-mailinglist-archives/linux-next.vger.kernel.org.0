Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 824673CFA98
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 15:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbhGTMv7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 08:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238876AbhGTMpK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 08:45:10 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FB6C061767
        for <linux-next@vger.kernel.org>; Tue, 20 Jul 2021 06:25:26 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id t9so22497180pgn.4
        for <linux-next@vger.kernel.org>; Tue, 20 Jul 2021 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0/uuszlrdj84oN22fsrRD2LQKh7VBf3capq6tlGEdeQ=;
        b=W7EmzRtxAfXL8/lG3o4gclFkFuuPaDgmSRu+Cm31vaZuk+p08pLO/ys70MfROL28zx
         Mubwj786IzjWrgcByYwrlHlYuZOfVXVLWXmPSnO7vfEjcWv9jhBGZ8L4yULxu0NBD2h0
         R75vYuv2vlfGnuqrZTK5eBMWxyt+7J/YwcxkqlmhRutXYztEq6X3sQ9nUJ4qdbCTKYwr
         I/PMAaInLRFB5ZgcAc94xSSxM6NOL5CoYxnJp98YRDWrcHoLW70xeNsQPSSmfyZHlCLu
         uVQlbPrHnq4wMcrLkVM7+zCUVXjbPn5fMwBCPzagPLCcP7Enj/8TuQu5dm8wCcWBs2rI
         DBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0/uuszlrdj84oN22fsrRD2LQKh7VBf3capq6tlGEdeQ=;
        b=hNSsmC6vcLGzQ1y7J2YyyaM4kRGsfkPpt1IpNLptPnCFuaBQytt2mU/bKaycmg7B8s
         7IN22X79jmPDqZ/As359ZnhXvbsoeGMsQqI5mdWkC3oJOfPlnIavUsSygYkRy1OdRHyK
         kGN5kkvp5F7BXkt2F95bDkLr5iT6ZelcVOrbPEg4hGoNyzLo5pv5BCC2uhSHH/nxCdxT
         EWdtXMoUBe+Kh5QXEqbDxy3qPYnuWCwgJAbPax+TvzD7iVMRC585CzxxjCmd17AEUxEt
         chXnU4zkX5uT3JTzuJFaWhRETDsEqR6TBJihZXADevjJ9yTjlGSoQJ9JCkc2KNUTj2um
         3UGg==
X-Gm-Message-State: AOAM5303TGp+SWG5Dvk2kKgbxtA2MsuNIYzm9PHpbQmiDALw42h4xXxk
        /aS8MyQ+a/XR8NAPDXAPvltfmrjwf+x37h8c
X-Google-Smtp-Source: ABdhPJxH68YinWsotSCU3NGFbb3ETOEYg6DqS1b5snp8sNT5nws0BL1KwnYz2CmxD/X3qWr/eUlnAg==
X-Received: by 2002:a62:37c2:0:b029:2ff:f7dd:1620 with SMTP id e185-20020a6237c20000b02902fff7dd1620mr31524543pfa.33.1626787525241;
        Tue, 20 Jul 2021 06:25:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ca16sm19575418pjb.44.2021.07.20.06.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 06:25:24 -0700 (PDT)
Message-ID: <60f6cec4.1c69fb81.3532c.aa36@mx.google.com>
Date:   Tue, 20 Jul 2021 06:25:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210720
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 593 runs, 27 regressions (next-20210720)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 593 runs, 27 regressions (next-20210720)

Regressions Summary
-------------------

platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained   | arm    | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 1          =

bcm2836-rpi-2-b         | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre  | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre  | clang-12 | defconfig    =
                | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =

beagle-xm               | arm    | lab-baylibre  | clang-10 | multi_v7_defc=
onfig           | 1          =

beagle-xm               | arm    | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm    | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 1          =

beagle-xm               | arm    | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 1          =

d2500cc                 | x86_64 | lab-clabbe    | clang-10 | x86_64_defcon=
fig             | 1          =

d2500cc                 | x86_64 | lab-clabbe    | clang-12 | x86_64_defcon=
fig             | 1          =

d2500cc                 | x86_64 | lab-clabbe    | gcc-8    | x86_64_defcon=
fig             | 1          =

d2500cc                 | x86_64 | lab-clabbe    | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =

fsl-lx2160a-rdb         | arm64  | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

hifive-unleashed-a00    | riscv  | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =

imx6q-sabresd           | arm    | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx8mp-evk              | arm64  | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

imx8mp-evk              | arm64  | lab-nxp       | gcc-8    | defconfig    =
                | 1          =

kontron-kbox-a-230-ls   | arm64  | lab-kontron   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls   | arm64  | lab-kontron   | gcc-8    | defconfig    =
                | 1          =

meson-g12b-odroid-n2    | arm64  | lab-baylibre  | clang-12 | defconfig    =
                | 1          =

qemu_arm-versatilepb    | arm    | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb    | arm    | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb    | arm    | lab-cip       | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb    | arm    | lab-collabora | gcc-8    | versatile_def=
config          | 1          =

sun50i-a64-bananapi-m64 | arm64  | lab-clabbe    | clang-12 | defconfig    =
                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210720/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210720
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3568c2c543e25d1a47bd97a607171511e7d44a45 =



Test Regressions
---------------- =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained   | arm    | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68c9681d8c2c5471160ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68c9681d8c2c547116=
0ad
        failing since 244 days (last pass: next-20201106, first fail: next-=
20201117) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b         | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60f6879a0ee6318d0d1160a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f6879a0ee6318d0d116=
0a6
        failing since 145 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre  | clang-12 | defconfig+CON=
..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f687f9e9885fe7f91160c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f687f9e9885fe7f9116=
0c7
        failing since 32 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre  | clang-12 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68c46ad80eaa1261160cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68c46ad80eaa126116=
0d0
        failing since 32 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f6894dc84d3981611160c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f6894dc84d398161116=
0c7
        failing since 32 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68d9a9e3ced616611609a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68d9a9e3ced6166116=
09b
        failing since 32 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
beagle-xm               | arm    | lab-baylibre  | clang-10 | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68cac6a8d5eaf831160ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68cac6a8d5eaf83116=
0bb
        failing since 223 days (last pass: next-20201207, first fail: next-=
20201208) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
beagle-xm               | arm    | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60f688492b6f17ec9f1160c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f688492b6f17ec9f116=
0c6
        failing since 5 days (last pass: next-20201208, first fail: next-20=
210714) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
beagle-xm               | arm    | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60f6899d1f19abb7d41160ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f6899d1f19abb7d4116=
0af
        failing since 5 days (last pass: next-20201208, first fail: next-20=
210714) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
beagle-xm               | arm    | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68b4954a68e8ca7116142

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68b4954a68e8ca7116=
143
        new failure (last pass: next-20210719) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
d2500cc                 | x86_64 | lab-clabbe    | clang-10 | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60f695e1f45c50d16511609a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/x86_=
64/x86_64_defconfig/clang-10/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/x86_=
64/x86_64_defconfig/clang-10/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f695e1f45c50d165116=
09b
        failing since 14 days (last pass: next-20210603, first fail: next-2=
0210706) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
d2500cc                 | x86_64 | lab-clabbe    | clang-12 | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68d4744876b13891160c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/x86_=
64/x86_64_defconfig/clang-12/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/x86_=
64/x86_64_defconfig/clang-12/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68d4744876b1389116=
0c4
        failing since 14 days (last pass: next-20210603, first fail: next-2=
0210706) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
d2500cc                 | x86_64 | lab-clabbe    | gcc-8    | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60f686b617157c325b1160a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/x86_=
64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/x86_=
64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f686b617157c325b116=
0a5
        failing since 14 days (last pass: next-20210603, first fail: next-2=
0210706) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
d2500cc                 | x86_64 | lab-clabbe    | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60f689ff3e18c4ddcd1160b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f689ff3e18c4ddcd116=
0b2
        failing since 14 days (last pass: next-20210603, first fail: next-2=
0210706) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
fsl-lx2160a-rdb         | arm64  | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f6893b0a487c5d7d1160b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f6893b0a487c5d7d116=
0b3
        failing since 0 day (last pass: next-20210714, first fail: next-202=
10719) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
hifive-unleashed-a00    | riscv  | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68936c84d39816111609a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68936c84d398161116=
09b
        failing since 81 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd           | arm    | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68b5d2d5c1a4fa91160b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68b5d2d5c1a4fa9116=
0b8
        failing since 267 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
imx8mp-evk              | arm64  | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f689d819bb96f3361160d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f689d819bb96f336116=
0d1
        failing since 0 day (last pass: next-20210714, first fail: next-202=
10719) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
imx8mp-evk              | arm64  | lab-nxp       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60f69145c5cf787f0c1160b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f69145c5cf787f0c116=
0b1
        failing since 19 days (last pass: next-20210630, first fail: next-2=
0210701) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls   | arm64  | lab-kontron   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60f688dbb8de2ecaec1160b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f688dbb8de2ecaec116=
0ba
        failing since 0 day (last pass: next-20210714, first fail: next-202=
10719) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls   | arm64  | lab-kontron   | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68dc834032f30c91160db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68dc834032f30c9116=
0dc
        failing since 5 days (last pass: next-20210712, first fail: next-20=
210714) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
meson-g12b-odroid-n2    | arm64  | lab-baylibre  | clang-12 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68c32e57a4080d21160cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68c32e57a4080d2116=
0d0
        new failure (last pass: next-20210719) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb    | arm    | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68a881bab8f9fbb1160b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68a881bab8f9fbb116=
0b4
        failing since 244 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb    | arm    | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68ef25f3208d2d51160b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68ef25f3208d2d5116=
0b4
        failing since 244 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb    | arm    | lab-cip       | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68abef6bee1883611609c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68abef6bee18836116=
09d
        failing since 244 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb    | arm    | lab-collabora | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68aecdf69ed53451160a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68aecdf69ed5345116=
0a6
        failing since 244 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
sun50i-a64-bananapi-m64 | arm64  | lab-clabbe    | clang-12 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60f68c3f3b944e19311160b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210720/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60f68c3f3b944e1931116=
0b9
        new failure (last pass: next-20210708) =

 =20
