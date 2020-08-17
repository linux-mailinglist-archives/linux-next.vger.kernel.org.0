Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA26247691
	for <lists+linux-next@lfdr.de>; Mon, 17 Aug 2020 21:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732303AbgHQTjH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Aug 2020 15:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729846AbgHQP0w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Aug 2020 11:26:52 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8E6C061389
        for <linux-next@vger.kernel.org>; Mon, 17 Aug 2020 08:26:51 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id f5so7682801plr.9
        for <linux-next@vger.kernel.org>; Mon, 17 Aug 2020 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iPRJkOogCeJO+Gekw1IXdRxOR19pjQW51OktjSR1jKw=;
        b=mUn32YC8ROqV6zfPmRv/huHI4BQQjqmAzu32lGXOeQ5YeWmglRjvQRCG8Q8T9cnjHc
         dpt/9K8Dne3vAWlLSlRGEXPmPmQ7M3wZOXdOPY9nqwmNamKru687WK379Ue2ZqvVdylP
         EoHk2HFGykyMdXrcR3+W9zQibPdD2oUmjcIvFEHl1q9+QAnPZsoEcwjYcXq6/Xb4V2sN
         8MHb9L+q+ebBBm2BsisZ0N8m76Ek81Im2lbS2pqo95ihU4bKvRMt8Hf669zWqzvTaX3P
         gVS/Yhs9tW01vxZri3rFx26NP4mP4dpWQ0NAZJhkdsPyE5d5zZbCkQYuAVI+HhciCIRz
         TonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iPRJkOogCeJO+Gekw1IXdRxOR19pjQW51OktjSR1jKw=;
        b=nE99De0KOu6Hnm0lzFLP2dXPpgZqNXXlrp8ad92JyCtrYxtkjpQWAjK+JnzQoBKaFH
         VhlWJeMcJ7uM1s0RSEKBuv7uLF85Xs1uY8dP5fJbOuH8l2bGc3RYq5TG6GaIily3btYn
         y4ElNNvlF2umzFWmKdEtDxBJuo1ULY4tz7G4VywfoTrWi3l43wxf0ZGGDKArQHb0SDKn
         0+QkawohO2wyuu2P35Tr7P2FpkZCMLNgovHOh8Obhb2EJNTBnN3Vp31bCUWJtJo+2xGD
         9EpvW8rn/IjBw9UKgWlHcBvCuxIRldNA1LFeVZqoivRbrIvbap7joDRru7eyt/8Azgyp
         24/w==
X-Gm-Message-State: AOAM5308WeEPXvCydKV/NgUZZ/8Krmp35N6RCDOO2A9nDwYOQ55kwJCU
        NEvy3w7zD3+pmpgTPU+6UTpk306Iu4Gtsg==
X-Google-Smtp-Source: ABdhPJwMrWzq8ALQ8r7abIrRyFwlFbj0g+9W+sOSTD8hagVgvdxkuJDfVrgLS00+zOHdN5FkwaUY0g==
X-Received: by 2002:a17:90a:4fe2:: with SMTP id q89mr13797032pjh.70.1597678009942;
        Mon, 17 Aug 2020 08:26:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n22sm17603055pjq.25.2020.08.17.08.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:26:49 -0700 (PDT)
Message-ID: <5f3aa1b9.1c69fb81.a87a7.764b@mx.google.com>
Date:   Mon, 17 Aug 2020 08:26:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200817
X-Kernelci-Branch: master
Subject: next/master baseline: 454 runs, 34 regressions (next-20200817)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 454 runs, 34 regressions (next-20200817)

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

exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

imx6q-var-dt6customboard    | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

meson-gxl-s905d-p230        | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =

mt8173-elm-hana             | arm64 | lab-collabora | clang-10 | defconfig =
                   | 0/1    =

mt8173-elm-hana             | arm64 | lab-collabora | gcc-8    | defconfig =
                   | 0/1    =

mt8173-elm-hana             | arm64 | lab-collabora | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 0/1    =

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

rk3288-veyron-jaq           | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

rk3399-gru-kevin            | arm64 | lab-collabora | clang-10 | defconfig =
                   | 84/88  =

rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig =
                   | 84/88  =

rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 84/88  =

sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | clang-10 | defconfig =
                   | 0/1    =

sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig =
                   | 0/1    =

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

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...BIG_ENDIAN=3Dy | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200817/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200817
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0f1fa5848ab32d269a2030caac618bd6a99ab3f3 =



Test Regressions
---------------- =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained       | arm   | lab-baylibre  | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a68daf5f020087dd99a7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a68daf5f020087dd99=
a7c
      failing since 111 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b             | arm64 | lab-baylibre  | clang-10 | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3a67926b457c50f4d99a42

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f3a67926b457c50=
f4d99a45
      new failure (last pass: next-20200814)
      4 lines

    2020-08-17 11:18:26.325000  / # =

    2020-08-17 11:18:26.335000  =

    2020-08-17 11:18:26.440000  / # #
    2020-08-17 11:18:26.447000  #
    2020-08-17 11:18:27.706000  / # export SHELL=3D/bin/sh
    2020-08-17 11:18:27.716000  export SHELL=3D/bin/sh
    2020-08-17 11:18:29.339000  / # . /lava-284814/environment
    2020-08-17 11:18:29.355000  . /lava-284814/environment
    2020-08-17 11:18:32.322000  / # /lava-284814/bin/lava-test-runner /lava=
-284814/0
    2020-08-17 11:18:32.334000  /[   60.196406] hwmon hwmon1: Undervoltage =
detected!
    ... (12 line(s) more)
      =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a706b4829d2d1a4d99a5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a706b4829d2d1a4d99=
a5e
      failing since 23 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a7101b0484138d5d99a97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a7101b0484138d5d99=
a98
      failing since 23 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
exynos5422-odroidxu3        | arm   | lab-collabora | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a737a76423a6529d99a76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a737a76423a6529d99=
a77
      failing since 23 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
imx6q-var-dt6customboard    | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6cb5f82b737921d99a3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6cb5f82b737921d99=
a3e
      failing since 5 days (last pass: next-20200810, first fail: next-2020=
0811)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
meson-gxl-s905d-p230        | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a671962be045a74d99a6b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a671962be045a74d99=
a6c
      new failure (last pass: next-20200814)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
mt8173-elm-hana             | arm64 | lab-collabora | clang-10 | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6a8172bd33dcddd99a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6a8172bd33dcddd99=
a45
      new failure (last pass: next-20200814)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
mt8173-elm-hana             | arm64 | lab-collabora | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a67ac3d7cd0b5d6d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a67ac3d7cd0b5d6d99=
a3a
      new failure (last pass: next-20200814)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
mt8173-elm-hana             | arm64 | lab-collabora | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6b6dae2584ca92d99a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6b6dae2584ca92d99=
a44
      new failure (last pass: next-20200814)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3a6b7886eb669209d99a46

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3a6b7886eb669=
209d99a4a
      failing since 33 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-17 11:35:11.020000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c801
    2020-08-17 11:35:11.026000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-17 11:35:11.029000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-17 11:35:11.035000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-17 11:35:11.040000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-17 11:35:11.046000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-17 11:35:11.049000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-17 11:35:11.060000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-17 11:35:11.066000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-17 11:35:11.070000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    ... (50 line(s) more)
      =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3a6e6bdc15dde2a6d99a4d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3a6e6bdc15dde=
2a6d99a51
      failing since 33 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-17 11:47:46.058000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c801
    2020-08-17 11:47:46.064000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-17 11:47:46.066000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-17 11:47:46.072000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-17 11:47:46.077000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-17 11:47:46.083000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-17 11:47:46.092000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-17 11:47:46.098000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-17 11:47:46.103000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-17 11:47:46.107000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    ... (50 line(s) more)
      =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3a6af8e809189a90d99a53

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3a6af8e809189=
a90d99a57
      failing since 33 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-17 11:33:07.094000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c801
    2020-08-17 11:33:07.100000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-17 11:33:07.106000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-17 11:33:07.111000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-17 11:33:07.117000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-17 11:33:07.123000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-17 11:33:07.128000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-17 11:33:07.134000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-17 11:33:07.140000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-17 11:33:07.146000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    ... (50 line(s) more)
      =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-collabora | gcc-8    | multi_v7_d=
efconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3a6dc39d9e0d6bcdd99a51

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3a6dc39d9e0d6=
bcdd99a55
      failing since 33 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-08-17 11:45:01.911000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c801
    2020-08-17 11:45:01.917000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-17 11:45:01.923000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-17 11:45:01.929000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-17 11:45:01.937000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-17 11:45:01.941000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-17 11:45:01.947000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-17 11:45:01.953000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-17 11:45:01.959000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-17 11:45:01.965000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    ... (50 line(s) more)
      =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-baylibre  | gcc-8    | omap2plus_=
defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6d15a0ac792a22d99a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6d15a0ac792a22d99=
a48
      failing since 26 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
omap4-panda                 | arm   | lab-collabora | gcc-8    | omap2plus_=
defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6c3627c8666de4d99a58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6c3627c8666de4d99=
a59
      failing since 26 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
rk3288-veyron-jaq           | arm   | lab-collabora | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a83fcc43db1826bd99a3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a83fcc43db1826bd99=
a3d
      new failure (last pass: next-20200814)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
rk3399-gru-kevin            | arm64 | lab-collabora | clang-10 | defconfig =
                   | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f3a69e71388e68d11d99a51

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f3a69e81388e68d11d99a91
      failing since 18 days (last pass: next-20200728, first fail: next-202=
00729)

    2020-08-17 11:28:34.898000  <8>[   52.394264] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-driver-present RESULT=3Dpass>
    2020-08-17 11:28:35.923000  /lava-2548460/1/../bin/lava-test-case
    2020-08-17 11:28:35.934000  <8>[   53.431605] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>
      =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig =
                   | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f3a67a117ffca7faad99a41

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f3a67a117ffca7faad99a81
      failing since 16 days (last pass: next-20200728, first fail: next-202=
00731)

    2020-08-17 11:18:50.124000  <8>[   52.475356] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-driver-present RESULT=3Dpass>
    2020-08-17 11:18:51.147000  /lava-2548437/1/../bin/lava-test-case
      =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
rk3399-gru-kevin            | arm64 | lab-collabora | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f3a69fa73d8235c40d99a64

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f3a69fa73d8235c40d99aa4
      failing since 18 days (last pass: next-20200728, first fail: next-202=
00729)

    2020-08-17 11:28:53.501000  <8>[   52.473865] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-driver-present RESULT=3Dpass>
    2020-08-17 11:28:54.529000  /lava-2548470/1/../bin/lava-test-case
      =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | clang-10 | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a83e9c43db1826bd99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a83e9c43db1826bd99=
a3a
      failing since 30 days (last pass: next-20200716, first fail: next-202=
00717)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a7fb8b51e13fc2dd99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a7fb8b51e13fc2dd99=
a3a
      failing since 30 days (last pass: next-20200716, first fail: next-202=
00717)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a81dd33ab4009fed99a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a81dd33ab4009fed99=
a44
      failing since 30 days (last pass: next-20200716, first fail: next-202=
00717)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun50i-a64-pine64-plus      | arm64 | lab-baylibre  | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a8565f1dbd62084d99a83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a8565f1dbd62084d99=
a84
      failing since 30 days (last pass: next-20200716, first fail: next-202=
00717)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6bd1ef13b40e3dd99a69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6bd1ef13b40e3dd99=
a6a
      failing since 30 days (last pass: next-20200715, first fail: next-202=
00717)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6e78834a11ed52d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6e78834a11ed52d99=
a3a
      failing since 30 days (last pass: next-20200716, first fail: next-202=
00717)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6bd2ef13b40e3dd99a6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6bd2ef13b40e3dd99=
a6d
      failing since 30 days (last pass: next-20200715, first fail: next-202=
00717)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6e6fd5fc475e66d99a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6e6fd5fc475e66d99=
a52
      failing since 30 days (last pass: next-20200716, first fail: next-202=
00717)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-baylibre  | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a69ac702dfcfdd9d99a80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a69ac702dfcfdd9d99=
a81
      failing since 27 days (last pass: next-20200717, first fail: next-202=
00720)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun7i-a20-cubieboard2       | arm   | lab-clabbe    | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6a52beca923989d99a94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6a52beca923989d99=
a95
      failing since 27 days (last pass: next-20200717, first fail: next-202=
00720)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a7542e16c89664ad99a68

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a7542e16c89664ad99=
a69
      failing since 6 days (last pass: next-20200519, first fail: next-2020=
0811)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efc...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a769ad926e600e4d99a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armeb/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a769ad926e600e4d99=
a43
      failing since 6 days (last pass: next-20200519, first fail: next-2020=
0811)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a77d92ff0fa0b94d99a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a77d92ff0fa0b94d99=
a45
      failing since 6 days (last pass: next-20200519, first fail: next-2020=
0811)  =



platform                    | arch  | lab           | compiler | defconfig =
                   | results
----------------------------+-------+---------------+----------+-----------=
-------------------+--------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe    | gcc-8    | sunxi_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a73ff3d10284deed99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200817/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200817/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a73ff3d10284deed99=
a3a
      failing since 6 days (last pass: next-20200519, first fail: next-2020=
0811)  =20
