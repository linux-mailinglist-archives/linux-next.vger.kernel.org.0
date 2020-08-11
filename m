Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48E5241BC8
	for <lists+linux-next@lfdr.de>; Tue, 11 Aug 2020 15:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728700AbgHKNvo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Aug 2020 09:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728753AbgHKNvi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Aug 2020 09:51:38 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF963C06174A
        for <linux-next@vger.kernel.org>; Tue, 11 Aug 2020 06:51:37 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id o1so6862333plk.1
        for <linux-next@vger.kernel.org>; Tue, 11 Aug 2020 06:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=p4+RUJZ/tqag6IQRjbwn5hL9K8nMIPQ/Czt3BqfsMAg=;
        b=X6N8bBuHiHhcpvkOTxxo4gs0iVDa13Gs7ycjpRxCmErDAmdh1x77O8H2GXXhDkXugE
         cggKXHpBIBbT6M13ft6VEs1ad17rsYGmJBr+q8Y82lZlXsluFf3A33r2x5nAeoPOCvGW
         It9ZiI0Ebh2nvhs7CWCaTCj8InqQAL5cZJd7d7ZCwu/FAVcv69F/WBjHB15XiHYA7P5R
         FEq+O7kihnOtWDrE5q9bW83pfDqLhP5opXFsMVR43sddCYNsmnKkbQZjQHg5VmbdQWr5
         r+73RUXPV8H4O9bqXpQkhCKHGdjjBJ3BODtS4Jx97jWTFPZvUKi2WckuzEup2MVZEOaw
         qf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=p4+RUJZ/tqag6IQRjbwn5hL9K8nMIPQ/Czt3BqfsMAg=;
        b=lLv0tBJfDIoKCAH4LZBJNmdukJj4ERcMllm/rXZMEMkoxHw2pn9MiogzlP8iID7DTt
         hj4Prz0/zrUoaSIyhpAlYLrhd2MCx5VXqpB72+sY3/Ofdy0dOBF3HMDoWdyUUu8SKDCi
         3DuLWg+Az/aKGzCllPk0hGldnaLAACPUQlmfHi2Y0i7Uho/R/HyKEiRpPdF1MlZGmqh2
         +C4d2YSs9A+/4RDIAX+aqtkWrkMiDdQZildmG5Yzm2TAdg1Pa6SZ00LXm0cdV4kCPqpp
         crITeu+TBCxs3nIpqEFq56Srbg/UAfwFmP/oOh9OdugAV25qAkopyz1ZFP99ZFv7bPXX
         tamQ==
X-Gm-Message-State: AOAM530ojcX0q5IiSLs1DxODrSWDKDD20iZlkmNvyg03irNcf7tmVclB
        X4fMzf3ofmBGUpXJvNZHUSKLnXy5jSs=
X-Google-Smtp-Source: ABdhPJxHc7OcK7GTdJ6abl3NqruRnO14Dz7C+aEkuTEBHqBJtdB709blPeboh7/siJwsdokIWQRdbQ==
X-Received: by 2002:a17:90a:94c4:: with SMTP id j4mr1167107pjw.155.1597153895731;
        Tue, 11 Aug 2020 06:51:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b15sm2921960pje.52.2020.08.11.06.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 06:51:34 -0700 (PDT)
Message-ID: <5f32a266.1c69fb81.a6a7a.a1d2@mx.google.com>
Date:   Tue, 11 Aug 2020 06:51:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200811
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 409 runs, 34 regressions (next-20200811)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 409 runs, 34 regressions (next-20200811)

Regressions Summary
-------------------

platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained       | arm   | lab-baylibre  | gcc-8    | sama5_defc=
onfig              | 0/1    =

bcm2837-rpi-3-b             | arm64 | lab-baylibre  | clang-10 | defconfig =
                   | 4/5    =

bcm2837-rpi-3-b             | arm   | lab-baylibre  | gcc-8    | bcm2835_de=
fconfig            | 0/1    =

exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | exynos_def=
config             | 0/1    =

exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

imx6q-var-dt6customboard    | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

omap4-panda                 | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                 | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 4/5    =

omap4-panda                 | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                 | arm   | lab-collabora | gcc-8    | multi_v7_d=
efconfig           | 4/5    =

omap4-panda                 | arm   | lab-baylibre  | gcc-8    | omap2plus_=
defconfig          | 0/1    =

omap4-panda                 | arm   | lab-collabora | gcc-8    | omap2plus_=
defconfig          | 0/1    =

rk3399-gru-kevin            | arm64 | lab-collabora | clang-10 | defconfig =
                   | 84/88  =

rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig =
                   | 84/88  =

rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 84/88  =

sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | clang-10 | defconfig =
                   | 0/1    =

sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig =
                   | 0/1    =

sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | sunxi_defc=
onfig              | 0/1    =

sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | sunxi_defc=
onfig              | 0/1    =

sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | sunxi_defc=
onfig              | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...BIG_ENDIAN=3Dy | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200811/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200811
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4c9b89d8981be3b9032f94d0c4dc7eb9c7967a32 =



Test Regressions
---------------- =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained       | arm   | lab-baylibre  | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f32693c1cb1e0ac0052c1ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f32693c1cb1e0ac0052c=
1bb
      failing since 104 days (last pass: next-20200424, first fail: next-20=
200428) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b             | arm64 | lab-baylibre  | clang-10 | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f326ae3ff5a0fd39e52c1be

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f326ae4ff5a0fd3=
9e52c1c1
      new failure (last pass: next-20200810)
      2 lines =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b             | arm   | lab-baylibre  | gcc-8    | bcm2835_de=
fconfig            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f32696b816b4deb7852c1be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f32696b816b4deb7852c=
1bf
      new failure (last pass: next-20200722) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | exynos_def=
config             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326b6b8c55a8c81252c227

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326b6b8c55a8c81252c=
228
      failing since 20 days (last pass: next-20200630, first fail: next-202=
00721) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326debdb8b43b42952c1c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326debdb8b43b42952c=
1c3
      failing since 17 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326f35eaa4d3cacf52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326f35eaa4d3cacf52c=
1a7
      failing since 17 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f327509a9afd29b4e52c1d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f327509a9afd29b4e52c=
1d1
      failing since 17 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
imx6q-var-dt6customboard    | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f32915e873089fba052c1de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f32915e873089fba052c=
1df
      new failure (last pass: next-20200810) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f326bda682a61526452c1e1

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f326bda682a615=
26452c1e5
      failing since 27 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f326c6f61360154c452c1e9

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f326c6f6136015=
4c452c1ed
      failing since 27 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f326bca682a61526452c1a7

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f326bca682a615=
26452c1ab
      failing since 27 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-collabora | gcc-8    | multi_v7_d=
efconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f326c6661360154c452c1c5

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f326c666136015=
4c452c1c9
      failing since 27 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-baylibre  | gcc-8    | omap2plus_=
defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326b2955c4355f3652c31c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326b2955c4355f3652c=
31d
      failing since 20 days (last pass: next-20200706, first fail: next-202=
00721) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-collabora | gcc-8    | omap2plus_=
defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326b1855c4355f3652c30c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326b1855c4355f3652c=
30d
      failing since 20 days (last pass: next-20200706, first fail: next-202=
00721) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
rk3399-gru-kevin            | arm64 | lab-collabora | clang-10 | defconfig =
                   | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f326b0455c4355f3652c2a7

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f326b0555c4355f3652c2e7
      failing since 12 days (last pass: next-20200728, first fail: next-202=
00729) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig =
                   | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f3267bd7b9c671c9c52c1c0

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f3267be7b9c671c9c52c200
      failing since 10 days (last pass: next-20200728, first fail: next-202=
00731) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f32684c419de6c99b52c1ca

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f32684d419de6c99b52c20a
      failing since 12 days (last pass: next-20200728, first fail: next-202=
00729) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | clang-10 | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326e0bdb8b43b42952c207

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326e0bdb8b43b42952c=
208
      failing since 24 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326880d5ec42397352c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326880d5ec42397352c=
1a7
      failing since 24 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326a462333960e4b52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326a462333960e4b52c=
1a7
      failing since 24 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326c59055af845a552c1dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326c59055af845a552c=
1dd
      failing since 24 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326c704c1c861bc952c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326c704c1c861bc952c=
1a7
      failing since 24 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326da7e92be53d7e52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326da7e92be53d7e52c=
1a7
      failing since 24 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326c81bd467a736d52c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326c81bd467a736d52c=
1a8
      failing since 24 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326dcfdb8b43b42952c1b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326dcfdb8b43b42952c=
1b7
      failing since 24 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326879dbc785de9352c1c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326879dbc785de9352c=
1c4
      failing since 21 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3268b5df5805840b52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3268b5df5805840b52c=
1a7
      failing since 21 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326cd9190fda3b8b52c21c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326cd9190fda3b8b52c=
21d
      failing since 24 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326e36e22384af6552c1a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326e36e22384af6552c=
1a9
      failing since 24 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-olinuxino-lime2   | arm   | lab-baylibre  | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326add22cd0233d852c1c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326add22cd0233d852c=
1c3
      failing since 24 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326dbfdb8b43b42952c1b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326dbfdb8b43b42952c=
1b4
      new failure (last pass: next-20200519) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326f0fd7660d23b952c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armeb/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326f0fd7660d23b952c=
1a7
      new failure (last pass: next-20200519) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f327062034f7aa28452c1af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f327062034f7aa28452c=
1b0
      new failure (last pass: next-20200519) =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f326a14c9165c6bb852c1b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200811/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200811/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f326a14c9165c6bb852c=
1b2
      new failure (last pass: next-20200519) =20
