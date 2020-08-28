Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A8F25536D
	for <lists+linux-next@lfdr.de>; Fri, 28 Aug 2020 05:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgH1Dwe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 23:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgH1Dwe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 23:52:34 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6855C061264
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 20:52:33 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id g6so3663987pjl.0
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 20:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uIIutpHdhhnGviOHkQ6EV7Fkaj47OeONhzI/a2af/+A=;
        b=BGIFOqtOBa81Dc3A44rplLFRKdncdUylBHAlp066HWgz5PeeNq/xNmiWJGkSUUqonF
         ZYMpSb4MXyWksHO+lk+2LU1dVj3VIsgyGkXo1dIX+LZOWz6YT7Ma4haJb1W/8UQYs/7G
         64pX/V/aNAwXGKYccq6pRxfLIX3mjrhSS2a3nDs6CSkuGu/FXUyhvLAkhPBWGSONpppn
         QxRh0O8PulPxNh5OROShJofyFnh3oxZYBhRFEhr9YSZUlYdiHbABpaPAtQlqkW33413D
         oHiotXNWmXGwu56nmhiIXkAQ6RlO/udcWsNZUHR99RvguGv+pzMKitGZfKWU8mfMrFcl
         o9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uIIutpHdhhnGviOHkQ6EV7Fkaj47OeONhzI/a2af/+A=;
        b=qgH1A2foJyIUOWIkPXrcvRQOnvK4im40WHvNEwwWKPvXgyVudFelmibMEqI7E8T1f7
         KKr/nSJh4cPlx88moT197AOQTeq+FDhD4LpuBU38am/0KwCtn27Nc1S4Tb5hWl8gYYpz
         uszSkqMxDYb9ZWbhlwe2cTktpPXALN/8xB46W0XAcuqUpdpowDBBYGKb0IAriWtuluDb
         LuQJ70K85dLyBzCC4vF/P4j05gdwdAOT6jJUNpe1RYBIgaOmWB+4APKU/HDtNZc3R2CK
         yGY/oXr4fFM7iWmZt+FpiAJmgxJEWyq9mj1nc4VkJVa5kXb4Ic61mPn2XrHtyP+fCwcz
         j0NA==
X-Gm-Message-State: AOAM533LQlrKBMi7Ds2b93wH8i+ad0P8pdZOVyyaBTnv1JqbK4pGoHVA
        F7HxiQnwtqgF3ScsnavAjKRI0Fo5wKxE+Q==
X-Google-Smtp-Source: ABdhPJyejZ8M7ekzNBQGR4fuCBsAL2qUjk1sGr9dCiHfekkBMlwUHiDS8Wmz3+BFam8GTQ0XizuteA==
X-Received: by 2002:a17:902:8a85:: with SMTP id p5mr19181635plo.193.1598586752195;
        Thu, 27 Aug 2020 20:52:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e7sm3846986pgn.64.2020.08.27.20.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 20:52:31 -0700 (PDT)
Message-ID: <5f487f7f.1c69fb81.abc30.bd94@mx.google.com>
Date:   Thu, 27 Aug 2020 20:52:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc2-452-g3b025a0ae05d
Subject: next/pending-fixes baseline: 325 runs,
 13 regressions (v5.9-rc2-452-g3b025a0ae05d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 325 runs, 13 regressions (v5.9-rc2-452-g3b025a=
0ae05d)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 3/4    =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 3/4    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =

omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc2-452-g3b025a0ae05d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc2-452-g3b025a0ae05d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3b025a0ae05da80a5adaec455105eb0c0891947e =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f484b1462193d684d9fb432

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f484b1462193d684d9fb=
433
      failing since 114 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f4848320bc5acbb839fb439

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f4848330bc5acbb=
839fb43d
      new failure (last pass: v5.9-rc2-374-g260e8bbb71b0)
      2 lines

    2020-08-27 23:54:16.195000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-08-27 23:54:16.195000  (user:khilman) is already connected
    2020-08-27 23:54:32.448000  =00
    2020-08-27 23:54:32.448000  =

    2020-08-27 23:54:32.448000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-08-27 23:54:32.449000  =

    2020-08-27 23:54:32.449000  DRAM:  948 MiB
    2020-08-27 23:54:32.465000  RPI 3 Model B (0xa02082)
    2020-08-27 23:54:32.552000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-08-27 23:54:32.583000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (383 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f484a6328cdd118799fb460

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f484a6328cdd118=
799fb464
      new failure (last pass: v5.9-rc2-374-g260e8bbb71b0)
      1 lines

    2020-08-28 00:03:48.638000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-08-28 00:03:48.639000  (user:khilman) is already connected
    2020-08-28 00:04:04.789000  =00
    2020-08-28 00:04:04.810000  =

    2020-08-28 00:04:04.811000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-08-28 00:04:04.811000  =

    2020-08-28 00:04:04.812000  DRAM:  948 MiB
    2020-08-28 00:04:04.826000  RPI 3 Model B (0xa02082)
    2020-08-28 00:04:04.913000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-08-28 00:04:04.945000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f48500e8f1cbfee559fb4d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f48500e8f1cbfee559fb=
4d3
      failing since 3 days (last pass: v5.9-rc1-419-gdb8c0d8e5d3c, first fa=
il: v5.9-rc2-193-g42693eb57618)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4856b9b5c52b9bf39fb477

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4856b9b5c52b9bf39fb=
478
      failing since 10 days (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first f=
ail: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4859551cd57c58b09fb454

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4859551cd57c58b09fb=
455
      failing since 22 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f485ac2fd4a131abe9fb439

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f485ac2fd4a131abe9fb=
43a
      failing since 22 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f48504084cb786c399fb430

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f48504084cb786c399fb=
431
      failing since 10 days (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first f=
ail: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f484909dd3b9b25ea9fb44a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f484909dd3b9b25ea9fb=
44b
      failing since 17 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f484b1b62193d684d9fb437

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f484b1b62193d684d9fb=
438
      failing since 17 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f484ead43ab53e5c69fb42c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f484ead43ab53e=
5c69fb432
      failing since 22 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-28 00:24:07.549000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-28 00:24:07.554000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-28 00:24:07.559000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-28 00:24:07.564000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-28 00:24:07.568000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-28 00:24:07.578000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-28 00:24:07.583000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-28 00:24:07.588000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-28 00:24:07.593000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-08-28 00:24:07.597000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f484e2162280ee0189fb43e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f484e2162280ee0189fb=
43f
      failing since 22 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f484b1a049f1196709fb448

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-45=
2-g3b025a0ae05d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f484b1a049f1196709fb=
449
      new failure (last pass: v5.9-rc2-374-g260e8bbb71b0)  =20
