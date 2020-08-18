Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3A2247D25
	for <lists+linux-next@lfdr.de>; Tue, 18 Aug 2020 05:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgHRD5H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Aug 2020 23:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgHRD5G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Aug 2020 23:57:06 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCFDCC061389
        for <linux-next@vger.kernel.org>; Mon, 17 Aug 2020 20:57:06 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id c6so8806789pje.1
        for <linux-next@vger.kernel.org>; Mon, 17 Aug 2020 20:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eOM3PazmD5D4dZNg9B/Oa1oT+zN3rUUKMM6lurh7Qx4=;
        b=zH41ZSRYWAADkunSgXUhnufYOGmlcTFOLmQ4RwlZUwFxK2I083kFgDrw/ayDBLydWT
         kB9XhOjTWEhbSG+5f+FVIjWMZK90KscKTAlFpsDm4oa08tQRLgcquZsN/WSgoDjfOegO
         K7y6Glzl3LBg1upVxd3GrJSOAyV92BaWZj3HPw8rC3HH/1yboNXUsoKx24VDSNDWsTy6
         CdiKfijtoCCFMbUR9L+IAmpbfOx16OnYFmMij3+Q7b7zXgDtSPaNKRumdp+K/r0/aW/r
         AF3U298TB+dOJbLdtCUzOALskOl9k9JRe1p1KDhhbGY7IoIHJAkB4IdVwT+BuFu6yA6R
         GYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eOM3PazmD5D4dZNg9B/Oa1oT+zN3rUUKMM6lurh7Qx4=;
        b=svxe4JccTftqofwLnhxCFRy1y6VMfZG9uespa/1hroYxaej1AGZOBQjxsR5hVt7+jI
         ojHOMD1ZHq0Fm1/SmIegchK084bo1Iy/cBCXNAouWAx0cl+CGGay13FAJ/IqW9TpRtjX
         VjifUfeHE4cJ+Q55U3O3N+ARk/yJsTeXpqycZu5clYa9UkP7sfuA37pgMTbj+oJnLX0B
         L64FhdpX58C54OvmSw2fwdot3u2FaqMCfHSJKmCInbfWqgHnbpbVLLcDM8NjjFSSFMUI
         LsyOGAgJcqhcGShl7KSqG8YR3cQpxzZJ+Ruj8bvA/lhzPRJghQSEXqgn3uvHtN4qVQp5
         39fQ==
X-Gm-Message-State: AOAM5323uDZILNJcXFdbSXX6AM+fN0I+yzMwTC0hea4R4AVuZr/7Xgpf
        VpZe4a/AYsSfGuluxBYAjUGZmoKI7Qx5DA==
X-Google-Smtp-Source: ABdhPJxVqzrRfReIO6m4lWGLrcppJmL1BQSL4xn98ZBXzV9Amm/m6rRoDUuA6IWns/LbF6ufwWLPcw==
X-Received: by 2002:a17:90b:400a:: with SMTP id ie10mr15003265pjb.175.1597723025169;
        Mon, 17 Aug 2020 20:57:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s8sm22880925pfc.122.2020.08.17.20.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 20:57:03 -0700 (PDT)
Message-ID: <5f3b518f.1c69fb81.7ef96.6461@mx.google.com>
Date:   Mon, 17 Aug 2020 20:57:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.9-rc1-207-gddf860520297
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 325 runs,
 26 regressions (v5.9-rc1-207-gddf860520297)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 325 runs, 26 regressions (v5.9-rc1-207-gddf860=
520297)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

meson-gxl-s805x-p241     | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =

omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =

omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 4/5    =

omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =

omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 4/5    =

omap4-panda              | arm   | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 0/1    =

omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 84/88  =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 84/88  =

sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | sunxi_defconf=
ig              | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | sunxi_defconf=
ig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc1-207-gddf860520297/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc1-207-gddf860520297
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ddf860520297338c72f344c293d91954d325ac59 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1fb4cbd6c68f4dd99a74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1fb4cbd6c68f4dd99=
a75
      failing since 104 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1ec5cb772c8d57d99a4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1ec5cb772c8d57d99=
a50
      new failure (last pass: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1ff2444b1ec987d99a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1ff2444b1ec987d99=
a52
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b200ce8a4c83ddbd99a4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b200ce8a4c83ddbd99=
a4e
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b261dfa3f47d8bdd99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b261dfa3f47d8bdd99=
a3a
      new failure (last pass: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1fc3ce2e37e84ad99a3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1fc3ce2e37e84ad99=
a3b
      new failure (last pass: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
meson-gxl-s805x-p241     | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1dc0116c87afafd99a3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1dc0116c87afafd99=
a3d
      new failure (last pass: v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1a09b1317af063d99a61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1a09b1317af063d99=
a62
      failing since 7 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1cb6b1ee259bd2d99a3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1cb6b1ee259bd2d99=
a3b
      failing since 7 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3b238c85e0b10712d99a4e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3b238c85e0b10=
712d99a52
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-18 00:40:34.785000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c801
    2020-08-18 00:40:34.791000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-18 00:40:34.794000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-18 00:40:34.800000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-18 00:40:34.805000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-18 00:40:34.811000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-18 00:40:34.814000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-18 00:40:34.825000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-18 00:40:34.831000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-18 00:40:34.834000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3b253d401d466f71d99a3e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3b253d401d466=
f71d99a42
      failing since 6 days (last pass: v5.8-rc7-210-gb684091a3d8c, first fa=
il: v5.8-12146-gc063c7b30ed0)
      60 lines

    2020-08-18 00:47:47.919000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c801
    2020-08-18 00:47:47.924000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-18 00:47:47.928000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-18 00:47:47.933000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-18 00:47:47.939000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-18 00:47:47.945000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-18 00:47:47.954000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-18 00:47:47.959000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-18 00:47:47.965000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-18 00:47:47.968000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3b1f4c9906e5d03fd99a56

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3b1f4c9906e5d=
03fd99a5a
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-18 00:22:31.112000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c801
    2020-08-18 00:22:31.118000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-18 00:22:31.123000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-18 00:22:31.129000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-18 00:22:31.135000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-18 00:22:31.141000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-18 00:22:31.146000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-18 00:22:31.152000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-18 00:22:31.158000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-18 00:22:31.164000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3b2063d76407b02bd99a43

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-p=
anda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-p=
anda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3b2063d76407b=
02bd99a47
      failing since 6 days (last pass: v5.8-rc7-210-gb684091a3d8c, first fa=
il: v5.8-12146-gc063c7b30ed0)
      60 lines

    2020-08-18 00:27:09.813000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c801
    2020-08-18 00:27:09.819000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-18 00:27:09.825000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-18 00:27:09.831000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-18 00:27:09.837000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-18 00:27:09.843000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-18 00:27:09.849000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-18 00:27:09.855000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-18 00:27:09.861000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-18 00:27:09.867000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b2100c45ab3bb74d99a4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-p=
anda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-p=
anda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b2100c45ab3bb74d99=
a4e
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1ec82ffb340e57d99a54

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1ec82ffb340e57d99=
a55
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f3b18cd69c0a068f8d99a80

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f3b18cd69c0a068f8d99ac0
      failing since 7 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)

    2020-08-17 23:54:48.584000  <8>[   52.468845] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-driver-present RESULT=3Dpass>
    2020-08-17 23:54:49.607000  /lava-2550691/1/../bin/lava-test-case
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f3b1adc4ceecd309fd99a5a

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f3b1adc4ceecd309fd99a9a
      failing since 7 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)

    2020-08-18 00:03:36.533000  /lava-2550741/1/../bin/lava-test-case
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b2464c479042220d99a3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b2464c479042220d99=
a3b
      failing since 0 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b2876eee2f04e3bd99a3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b2876eee2f04e3bd99=
a3f
      failing since 0 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b29f8cdf766108bd99a3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b29f8cdf766108bd99=
a3f
      failing since 0 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1f6e7c5b814baed99a4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1f6e7c5b814baed99=
a4d
      failing since 0 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b21f28ad03da5d1d99a58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b21f28ad03da5d1d99=
a59
      failing since 0 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1f7c7c5b814baed99a54

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/base=
line-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/base=
line-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1f7c7c5b814baed99=
a55
      failing since 0 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b21b3bf253cee68d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b21b3bf253cee68d99=
a3a
      failing since 0 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | sunxi_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1c06c60ee4a1f5d99a72

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1c06c60ee4a1f5d99=
a73
      failing since 0 day (last pass: v5.8-13251-g8d2ac1ce7b76, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-clabbe    | gcc-8    | sunxi_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3b1b6f46868152bcd99a61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-20=
7-gddf860520297/arm/sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3b1b6f46868152bcd99=
a62
      failing since 0 day (last pass: v5.8-13251-g8d2ac1ce7b76, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =20
