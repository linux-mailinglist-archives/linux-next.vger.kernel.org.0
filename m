Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5794F22BD16
	for <lists+linux-next@lfdr.de>; Fri, 24 Jul 2020 06:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgGXEl3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Jul 2020 00:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgGXEl3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Jul 2020 00:41:29 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A80DC0619D3
        for <linux-next@vger.kernel.org>; Thu, 23 Jul 2020 21:41:29 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d1so3816852plr.8
        for <linux-next@vger.kernel.org>; Thu, 23 Jul 2020 21:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=c/kcp9zDBDmjrK271DIvskMZyVTeDn1iN74urbpqf2U=;
        b=e+4MSpijadiXuf6493ICZn8UdXmlm891aXVJ5Y+BUCw+JUv1j4pMhmdOFZjAa+I3Fk
         5ESIUgcqCp1HM3gq89Wyb8JbQKQywRn2q45sh/+BoJGPXc2ILFfm3KwKo/zUeaohwmPN
         rJqBZUhVAcinI7htR97cOrG8a3sfN624XY70PDseFaXxARH33z1iix4GiXfKGeYso0c0
         qUyI9g/PjsyIX1yP01VQ51kCG5RyIO3M77Aa6p2Epz3z4OyvvqK2qvkvP8HO64QSjX52
         In6aAWK7BZddYVLknyujtoZLH/j5vy5SOs67vhUqNQ6HHox/pfWf1EZVdo01/iXxrEAq
         pdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=c/kcp9zDBDmjrK271DIvskMZyVTeDn1iN74urbpqf2U=;
        b=K2XRV8h/VFU/3Nm3sI5TCRO3JoHLJZ2dv9bQpzO8le1Lbwl3hC02Bx4Yzv374W+lgM
         qMsj6ifnuNJ1ibtTUP/EYW9BrmwRYHE7xVdi5ouX/wPRjJydfxx9LCDPDK7y7qmPEXf5
         fgdDqLQpZ2HBhSev3MBgVNrlRNh5lo741HxB/47ePTaEmbbglWllKaUqAJzr0+Ms6Zj0
         ZNClsxGkjMdApsXuHtsS6OWj0BcncYdqud8BrM2m5sb0eoywuYKjjWWI3JskiFUC0jsw
         Elc4LeyULFTKXXrmt6sN9Y+LM8u3rEBRmMYwF+glslmTW0oTExLjs4yL63acM+NY/pEU
         L/QQ==
X-Gm-Message-State: AOAM530jAJOalRp+OhGfcaNVnSisaaIOMHVlM4REK3Nwrp4wn3BBiVT7
        Gpnpj+3ly2nduwKejOFftD8/1T9la/g=
X-Google-Smtp-Source: ABdhPJzwlje4lhoB9DpD+8CEiBrzQBTjaW+9TJgLK5sziSJdR5lI0UyoHSBlDEL8pyW/xvAuxCYtuQ==
X-Received: by 2002:a17:902:bd49:: with SMTP id b9mr6748672plx.43.1595565687760;
        Thu, 23 Jul 2020 21:41:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 7sm4629122pgw.85.2020.07.23.21.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 21:41:26 -0700 (PDT)
Message-ID: <5f1a6676.1c69fb81.f5005.ffa0@mx.google.com>
Date:   Thu, 23 Jul 2020 21:41:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200723
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 473 runs, 36 regressions (next-20200723)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 473 runs, 36 regressions (next-20200723)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
at91-sama5d4_xplained     | arm    | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 0/1    =

bcm2837-rpi-3-b           | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 4/5    =

bcm2837-rpi-3-b           | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 4/5    =

exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | exynos_defc=
onfig             | 0/1    =

imx6q-var-dt6customboard  | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

meson8b-odroidc1          | arm    | lab-baylibre  | clang-10 | multi_v7_de=
fconfig           | 3/5    =

meson8b-odroidc1          | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 3/5    =

meson8b-odroidc1          | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 3/5    =

omap4-panda               | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 4/5    =

omap4-panda               | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda               | arm    | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 4/5    =

omap4-panda               | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda               | arm    | lab-baylibre  | gcc-8    | omap2plus_d=
efconfig          | 0/1    =

omap4-panda               | arm    | lab-collabora | gcc-8    | omap2plus_d=
efconfig          | 0/1    =

qemu_i386                 | i386   | lab-baylibre  | gcc-8    | i386_defcon=
fig               | 0/1    =

qemu_i386-uefi            | i386   | lab-baylibre  | gcc-8    | i386_defcon=
fig               | 0/1    =

qemu_x86_64-uefi          | x86_64 | lab-baylibre  | clang-10 | x86_64_defc=
onfig             | 0/1    =

qemu_x86_64-uefi-mixed    | x86_64 | lab-baylibre  | gcc-8    | x86_64_defc=
onfig             | 0/1    =

sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig  =
                  | 0/1    =

sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig  =
                  | 0/1    =

sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =

sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | sunxi_defco=
nfig              | 0/1    =

sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =

sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200723/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200723
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4f5baedd579d5499876eadb1de12ddfdadcaa3ab =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
at91-sama5d4_xplained     | arm    | lab-baylibre  | gcc-8    | sama5_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a268973127cfb7185bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a268973127cfb7185b=
b19
      failing since 86 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b           | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a2c1b2d5576948c85bb18

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1a2c1b2d557694=
8c85bb1b
      new failure (last pass: next-20200722)
      2 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
bcm2837-rpi-3-b           | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a28afbe70c1a56985bb1f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1a28afbe70c1a5=
6985bb22
      failing since 8 days (last pass: next-20200714, first fail: next-2020=
0715)
      1 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
exynos5422-odroidxu3      | arm    | lab-collabora | gcc-8    | exynos_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a37c8b890b3cc8b85bb4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a37c8b890b3cc8b85b=
b4b
      failing since 2 days (last pass: next-20200630, first fail: next-2020=
0721) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
imx6q-var-dt6customboard  | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2f408cf8da673d85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2f408cf8da673d85b=
b19
      failing since 17 days (last pass: next-20200703, first fail: next-202=
00706) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
meson8b-odroidc1          | arm    | lab-baylibre  | clang-10 | multi_v7_de=
fconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a3048587fedee0485bb42

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1a3048587fede=
e0485bb46
      failing since 3 days (last pass: next-20200716, first fail: next-2020=
0720)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f1a=
3048587fedee0485bb47
      failing since 3 days (last pass: next-20200716, first fail: next-2020=
0720)
      53 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
meson8b-odroidc1          | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a28ff756166621785bb1a

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1a28ff7561666=
21785bb1e
      failing since 3 days (last pass: next-20200717, first fail: next-2020=
0720)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f1a=
28ff756166621785bb1f
      failing since 3 days (last pass: next-20200717, first fail: next-2020=
0720)
      49 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
meson8b-odroidc1          | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a2e0ca884ad2bf785bb54

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1a2e0ca884ad2=
bf785bb58
      failing since 3 days (last pass: next-20200717, first fail: next-2020=
0720)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f1a=
2e0ca884ad2bf785bb59
      failing since 3 days (last pass: next-20200717, first fail: next-2020=
0720)
      49 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a295621d80623bd85bb25

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1a295621d8062=
3bd85bb29
      failing since 8 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a2dfca0f97b556385bb51

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1a2dfca0f97b5=
56385bb55
      failing since 8 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-collabora | gcc-8    | multi_v7_de=
fconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a28868c5755b12085bb3e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1a28868c5755b=
12085bb42
      failing since 8 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a2ded52b2a1477185bb79

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f1a2ded52b2a14=
77185bb7d
      failing since 8 days (last pass: next-20200706, first fail: next-2020=
0715)
      60 lines =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-baylibre  | gcc-8    | omap2plus_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2ab4cdec08b45185bb46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2ab4cdec08b45185b=
b47
      failing since 2 days (last pass: next-20200706, first fail: next-2020=
0721) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
omap4-panda               | arm    | lab-collabora | gcc-8    | omap2plus_d=
efconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2a21d4df2a356585bba7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2a21d4df2a356585b=
ba8
      failing since 2 days (last pass: next-20200706, first fail: next-2020=
0721) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_i386                 | i386   | lab-baylibre  | gcc-8    | i386_defcon=
fig               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a29d769c8301d0c85bb29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a29d769c8301d0c85b=
b2a
      new failure (last pass: next-20200722) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_i386-uefi            | i386   | lab-baylibre  | gcc-8    | i386_defcon=
fig               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a29dcbf761b708385bb20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/i386=
/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a29dcbf761b708385b=
b21
      new failure (last pass: next-20200722) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_x86_64-uefi          | x86_64 | lab-baylibre  | clang-10 | x86_64_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a28fce4fbe3c7a085bb26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a28fce4fbe3c7a085b=
b27
      new failure (last pass: next-20200722) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
qemu_x86_64-uefi-mixed    | x86_64 | lab-baylibre  | gcc-8    | x86_64_defc=
onfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a299475b3449c1985bb48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a299475b3449c1985b=
b49
      new failure (last pass: next-20200722) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2919355b453f2c85bc38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2919355b453f2c85b=
c39
      new failure (last pass: next-20200722) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2a6b2d550b311285bb3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2a6b2d550b311285b=
b3e
      failing since 7 days (last pass: next-20200715, first fail: next-2020=
0716) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | clang-10 | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a33a5b99510c68c85bb47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a33a5b99510c68c85b=
b48
      failing since 6 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2718330edac37e85bb2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2718330edac37e85b=
b30
      failing since 6 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig  =
                  | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a299a75b3449c1985bb4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a299a75b3449c1985b=
b4f
      failing since 6 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun50i-a64-pine64-plus    | arm64  | lab-baylibre  | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2b5ee0f02f9b7985bb1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2b5ee0f02f9b7985b=
b1d
      failing since 6 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a294e89e8361ef485bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a294e89e8361ef485b=
b19
      failing since 6 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2ddade97c38da285bb33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2ddade97c38da285b=
b34
      failing since 6 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2a7cf7cdda4c9485bb47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2a7cf7cdda4c9485b=
b48
      failing since 6 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2d9fb570543ae985bb2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2d9fb570543ae985b=
b2b
      failing since 6 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2b8de0f02f9b7985bb5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2b8de0f02f9b7985b=
b5e
      failing since 3 days (last pass: next-20200717, first fail: next-2020=
0720) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-cubieboard2     | arm    | lab-clabbe    | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2c9721b4f701cc85bb2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2c9721b4f701cc85b=
b2f
      failing since 3 days (last pass: next-20200717, first fail: next-2020=
0720) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a287b8c5755b12085bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a287b8c5755b12085b=
b19
      failing since 6 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a3046587fedee0485bb3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a3046587fedee0485b=
b40
      failing since 6 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                  | arch   | lab           | compiler | defconfig  =
                  | results
--------------------------+--------+---------------+----------+------------=
------------------+--------
sun7i-a20-olinuxino-lime2 | arm    | lab-baylibre  | gcc-8    | sunxi_defco=
nfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a2d64a5d1114c2c85bb1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200723/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200723/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a2d64a5d1114c2c85b=
b1f
      failing since 6 days (last pass: next-20200716, first fail: next-2020=
0717) =20
