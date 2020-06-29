Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9C820E0FD
	for <lists+linux-next@lfdr.de>; Mon, 29 Jun 2020 23:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730871AbgF2Uvb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 16:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731395AbgF2TN2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2020 15:13:28 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4030BC08C5DE
        for <linux-next@vger.kernel.org>; Sun, 28 Jun 2020 21:06:24 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id l63so7681318pge.12
        for <linux-next@vger.kernel.org>; Sun, 28 Jun 2020 21:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6gd2HdyPBHO72RsHYRYzMwAbLO2ejuHKnye5qmnNW78=;
        b=wbNvX3u+nmIrUitgvQ1V8fJNmdwSAYBeNfQpLyAmMjVX2bCRGyx7pxWTohKvXlNJZm
         GnoEfF7eNVa69c0AmKxyjgFQRzTc8MedK60Amxwgww3QsG+gmdmOLZ6fxGmSAk5IgBP/
         qhIxtWB7Sfy0KsqvZsWHHIrt79CTkAiba7TxuEKh+82PMcd0pZ3d2/ezBVCAK08SSdBn
         P6bX0zxuV2GFYj0i2jWGDKCxWulGX5LD/NZmbwS1FuLfX7Sh2HhKwhMFfZuw0B/mi/Hm
         9v/k9tVcvw9TySODbKaQo9ubldcvhmEXREY0kMaNYLeowfDxpZbbVIzkKsbxIm3n5HdM
         YQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6gd2HdyPBHO72RsHYRYzMwAbLO2ejuHKnye5qmnNW78=;
        b=dahi1JngPOrrO++oi6idgyhYUYK/3Z7hT9vWZJHWyZd5sJqqSVbWFhZpQNpDXKkDOf
         2SSjNzFncrvJ3aL7aEgn7XX240pG0xNHAXvI/ooc618z62hjQPgnaCAuqty0UHVCUhMu
         2/CkQRK6fAm2noUW3cwT18logSyCGBQ5I6+Xa1bTcOzab+IMvDr6ecp1sSlqXSdtIPQ5
         uH8Av649SVLdG6JhjoMhIis/qg02CYrvIY9pTFSnGQuUB7b4m8csSKvwkexfHAw/BzJw
         3AFq2GHhxFP0mDsUL9ruq6auOAnfSR4I0XfBSkET8rUxGf5K2GYXI/sGA2c8Cquw9GZP
         UYUA==
X-Gm-Message-State: AOAM532LzJOfzoFJQnGudOQ5L31VUgOyr+WxXOciH7f0Axi18Jw2qapz
        W8ti4Hagx3jeD18r4Bq4bAc4YF5BS3Y=
X-Google-Smtp-Source: ABdhPJwXpQLgv0yg2uP6Z3gkTsUdeuKqKe1M66wKgE3gUPgHgDwhw7Eda+3gbBaV6bOeUbXL4JpRPw==
X-Received: by 2002:a63:1c65:: with SMTP id c37mr8629191pgm.118.1593403582853;
        Sun, 28 Jun 2020 21:06:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d16sm500277pfo.156.2020.06.28.21.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 21:06:22 -0700 (PDT)
Message-ID: <5ef968be.1c69fb81.cc481.22e3@mx.google.com>
Date:   Sun, 28 Jun 2020 21:06:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc3-164-g155c91ddae03
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 185 runs,
 5 regressions (v5.8-rc3-164-g155c91ddae03)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 185 runs, 5 regressions (v5.8-rc3-164-g155c91d=
dae03)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | gcc-8    | defconfig =
         | 0/1    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc3-164-g155c91ddae03/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc3-164-g155c91ddae03
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      155c91ddae0336dc69226ccf78e46fba0fa19cc3 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ef936f476bf03099085bb4a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-16=
4-g155c91ddae03/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-16=
4-g155c91ddae03/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef936f476bf0309=
9085bb4d
      failing since 4 days (last pass: v5.8-rc2-295-g0780e0d6abd0, first fa=
il: v5.8-rc2-376-g1c7e639860a8)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ef9378165014b67ed85bb55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-16=
4-g155c91ddae03/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-a311=
d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-16=
4-g155c91ddae03/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-a311=
d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ef9378165014b67ed85b=
b56
      new failure (last pass: v5.8-rc2-535-g3ea20606a997) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | gcc-8    | defconfig =
         | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ef9379e482434bef985bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-16=
4-g155c91ddae03/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-16=
4-g155c91ddae03/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ef9379e482434bef985b=
b19
      new failure (last pass: v5.8-rc1-339-g3b15f0074015) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef92dac379a46b7c485bb2a

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-16=
4-g155c91ddae03/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-16=
4-g155c91ddae03/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef92dac379a46b7=
c485bb2d
      new failure (last pass: v5.8-rc2-453-gf59148f15013)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ef92d96379a46b7c485bb19

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-16=
4-g155c91ddae03/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-16=
4-g155c91ddae03/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ef92d96379a46b7=
c485bb1c
      new failure (last pass: v5.8-rc2-453-gf59148f15013)
      2 lines =20
