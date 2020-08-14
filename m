Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22632444A5
	for <lists+linux-next@lfdr.de>; Fri, 14 Aug 2020 07:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgHNFuG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Aug 2020 01:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgHNFuG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Aug 2020 01:50:06 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE08C061757
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2020 22:50:06 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id c10so5204803pjn.1
        for <linux-next@vger.kernel.org>; Thu, 13 Aug 2020 22:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wXQyzwSH79lTtVUNjvr7+mvLYdiB515CecBG7BDgcwc=;
        b=Z/gtLrh3J/5TgGWqNxtYdplWolVungfqQhXvgKJI2r2CtG7vKeDFym7ngT5+JZ4xEf
         BdXOgVLN2m5plHYKCgJaHsW59OsawiTkGMATxrG57znfzCghekdksjIxSxV81L9x9kiJ
         UkYrQfSs8CFfq7nFlK6lETFEVqdvL++DiPcHMh7c75D7Mml0tBhnTTqQCM244rIVL+7P
         bNF5q3q85DNdmVr/E2PxskmxzklR+ckBAiTFmy1NZS5bfCoUFo/OpdtZLlOX/fIxts4C
         gIyQMaEdDOpOzuVGwSXSMX150qem7TMERMDBG0R5oHXC/doVAljUh4bsgSHtcm/VfuoF
         mQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wXQyzwSH79lTtVUNjvr7+mvLYdiB515CecBG7BDgcwc=;
        b=TWFwnzuh+3ceRjh6jxe7BquWIYXmxbj05IsGS8amqfnUspHSFTSfZt/Aihre0KwQZw
         P/CMqYMYbOZ8rEarNT/t3vzcaa6RVnbcjItQX/5eVsc63UH4HgylUoHMIdi+bywFdQw0
         M/JOyGP4PyQq+Ygnu9SkJNN1WOPM0xkwzBdU1GNtqIFK5cX7Rfc6qbzCbvMd9TMSWj+b
         XiS/hHgzhYJlxMd7hwiv6ya7mG1uDUFfwdwOJxSByfNx0/f85sVEgT/Qyu5n51X+QF4v
         GU8QUqbWN7cNN8ltJKWbcpZ32yS1DFOJIXMkIzcHy1+sfcG22EYeoog6CBfC88Su4C0/
         ca4Q==
X-Gm-Message-State: AOAM531Dq4MCy66waVjXbeqgXlrdDagzmf6n3b0YHWOjKSf2FNiFJ09W
        Q7qplJH1q2xu8lYKC2obGfpAAe6onQ9SSA==
X-Google-Smtp-Source: ABdhPJxrUFw8YR2xDG3c2kfYqCH1WoBVk2jPBHoy7zh0rHbvu9BjicIm4/8o9j3rAlN/8m0OLldoEQ==
X-Received: by 2002:a17:902:e905:: with SMTP id k5mr892773pld.342.1597384204946;
        Thu, 13 Aug 2020 22:50:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a7sm8100030pfd.194.2020.08.13.22.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:50:04 -0700 (PDT)
Message-ID: <5f36260c.1c69fb81.2ebad.4344@mx.google.com>
Date:   Thu, 13 Aug 2020 22:50:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.8-13316-g31a0e28a656f
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 308 runs,
 18 regressions (v5.8-13316-g31a0e28a656f)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 308 runs, 18 regressions (v5.8-13316-g31a0e28a=
656f)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =

bcm2837-rpi-3-b          | arm   | lab-baylibre  | gcc-8    | bcm2835_defco=
nfig            | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 3/5    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

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

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 84/88  =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 84/88  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-13316-g31a0e28a656f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-13316-g31a0e28a656f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      31a0e28a656f19821c927306a045b4a1f0d0c580 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f35eea969add4a9d252c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f35eea969add4a9d252c=
1a7
      failing since 100 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9) =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b          | arm   | lab-baylibre  | gcc-8    | bcm2835_defco=
nfig            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f35efd88e0a872ad052c1c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi=
-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f35efd88e0a872ad052c=
1c8
      new failure (last pass: v5.8-13251-g8d2ac1ce7b76) =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f35eefc4b8f40ca7b52c1ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-=
odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-=
odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f35eefc4b8f40ca7b52c=
1eb
      failing since 8 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f35f18b41facb597f52c1bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f35f18b41facb597f52c=
1bc
      failing since 8 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f35f38fab9740f2dc52c1b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f35f38fab9740f2dc52c=
1b7
      failing since 8 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f35f1be6b677372ef52c1d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f35f1be6b677372ef52c=
1d9
      new failure (last pass: v5.8-13251-g8d2ac1ce7b76) =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f35f22ba62f6b62e852c1bc

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-=
dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-=
dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f35f22ba62f6b6=
2e852c1c0
      new failure (last pass: v5.8-13251-g8d2ac1ce7b76)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f35=
f22ba62f6b62e852c1c1
      new failure (last pass: v5.8-13251-g8d2ac1ce7b76)
      26 lines =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f35f030aae8d3ed3f52c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f35f030aae8d3ed3f52c=
1a8
      failing since 4 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516) =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f35f18141facb597f52c1ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f35f18141facb597f52c=
1ae
      failing since 4 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516) =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f35f18a41facb597f52c1b2

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f35f18a41facb5=
97f52c1b6
      failing since 8 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35)
      60 lines =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f35f27d4c40dd74f852c1d5

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pand=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pand=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f35f27d4c40dd7=
4f852c1d9
      failing since 2 days (last pass: v5.8-rc7-210-gb684091a3d8c, first fa=
il: v5.8-12146-gc063c7b30ed0)
      60 lines =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f35f1257be68188b252c1a9

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f35f1257be6818=
8b252c1ad
      failing since 8 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35)
      60 lines =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f35f1ab6b677372ef52c1b7

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-pan=
da.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-pan=
da.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f35f1ab6b67737=
2ef52c1bb
      failing since 2 days (last pass: v5.8-rc7-210-gb684091a3d8c, first fa=
il: v5.8-12146-gc063c7b30ed0)
      60 lines =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f35f0d35dd42c55ad52c1cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-pan=
da.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-pan=
da.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f35f0d35dd42c55ad52c=
1cc
      failing since 8 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f35f0a6af91ec077a52c1c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f35f0a6af91ec077a52c=
1c8
      failing since 8 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f35ef5a0e4d6546a452c1b9

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f35ef5a0e4d6546a452c1f9
      failing since 4 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516) =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f35f03400232fd8d952c1c3

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-13316-=
g31a0e28a656f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f35f03400232fd8d952c203
      failing since 4 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516) =20
