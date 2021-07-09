Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170D03C2176
	for <lists+linux-next@lfdr.de>; Fri,  9 Jul 2021 11:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhGIJZJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Jul 2021 05:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbhGIJZI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Jul 2021 05:25:08 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A8BC0613DD
        for <linux-next@vger.kernel.org>; Fri,  9 Jul 2021 02:22:25 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id l11so5430864pji.5
        for <linux-next@vger.kernel.org>; Fri, 09 Jul 2021 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8SnFxfoaCovD0rbfiuPHWYyvVOAFXWXrrHRUwmTZGUk=;
        b=HddPU9MuxiSiyBVAlwS9bQ+ziMi3x1tQ40k5hEZh3pOEkMYRm4ETXfcHtLtDfOOUEF
         SvkT16qHj5ALsyq5Sj0DapyJ1kUm3X22zJ2fA+yLJVlbvB6veXwSYXgSbPvZcoR62/Xp
         wNkDSHwdBIdZqiJQg51qLFQRvImsi2aVz30mra+cxt4ZtfuyLgiwdwt1efg02gNwLkRz
         S0xEO3jrvySNHetK86BfIc3LI4qt4qEscDuy/UD3g/EUZjntiiCHCM/PbBWZZdl/ZPeX
         tkhfwqQNM9NF7r45cRarxZKA94udyrje3Cbb/uF6m7jtSUNQBwhc9T6TKJxPkpB9AGHH
         vCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8SnFxfoaCovD0rbfiuPHWYyvVOAFXWXrrHRUwmTZGUk=;
        b=pEQLjlKjMKzXihnErYxLTScZUjFljU592MeCnVNV6dwKUpHIgijEUtcaA6pKterBLV
         RZVhEty0qaU8DCsWW4aUZTmfszVLNYfyUW86OPJRV1mwT0Hi2ZTSaL8JCVJrnAGOVJ/b
         oicjMXKWT+TQTi6Tb7gLXNUg6tDR1eoyvxPXX9N9AVnru3HiT8kapQyIKD+NPnYGhru+
         bK2DFqxxjBpFjgO3//99Bekud7IdBSimhvZWncMyTCdkPcKVsvu1v2x07l53oU9X74FP
         l9VUdvcFFkn85lRqfNxeoctixEp/5g1ypnk6+fQ7mzW35KLwdJDj2HhzrGvH1uG54bhb
         R1kg==
X-Gm-Message-State: AOAM531irJD+Z0G+wJz//eoNFFdjXPMTGMCFmkNYuskZlWs0oVeS/wWX
        a/nMB8xcnUSXHXwxZ1ebJ7qmwOgHSmEXZodb
X-Google-Smtp-Source: ABdhPJzk2YbzB2vi/9A+s4lKB6V3oYvfC1IWiOFBLgM91w6RLEtGcJz82+slNF92BYxTmsAoVRJwYw==
X-Received: by 2002:a17:90b:30c2:: with SMTP id hi2mr9520094pjb.130.1625822544264;
        Fri, 09 Jul 2021 02:22:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v4sm6085042pgr.65.2021.07.09.02.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 02:22:23 -0700 (PDT)
Message-ID: <60e8154f.1c69fb81.124c3.26aa@mx.google.com>
Date:   Fri, 09 Jul 2021 02:22:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.13-12625-g5f5e6a60f828
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 327 runs,
 17 regressions (v5.13-12625-g5f5e6a60f828)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 327 runs, 17 regressions (v5.13-12625-g5f5e6a6=
0f828)

Regressions Summary
-------------------

platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b         | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =

bcm2837-rpi-3-b-32      | arm    | lab-baylibre  | gcc-8    | bcm2835_defco=
nfig            | 1          =

d2500cc                 | x86_64 | lab-clabbe    | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =

d2500cc                 | x86_64 | lab-clabbe    | gcc-8    | x86_64_defcon=
...86_kvm_guest | 1          =

d2500cc                 | x86_64 | lab-clabbe    | gcc-8    | x86_64_defcon=
fig             | 1          =

hip07-d05               | arm64  | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

hip07-d05               | arm64  | lab-collabora | gcc-8    | defconfig    =
                | 1          =

imx6q-sabresd           | arm    | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx8mp-evk              | arm64  | lab-nxp       | gcc-8    | defconfig    =
                | 1          =

qemu_arm-versatilepb    | arm    | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb    | arm    | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb    | arm    | lab-cip       | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb    | arm    | lab-collabora | gcc-8    | versatile_def=
config          | 1          =

r8a77960-ulcb           | arm64  | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64  | lab-clabbe    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-12625-g5f5e6a60f828/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-12625-g5f5e6a60f828
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5f5e6a60f828f5bc609bb40133ad6171a3d466b2 =



Test Regressions
---------------- =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b         | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7e2c17c3e4e4bd91179a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ba=
seline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ba=
seline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7e2c17c3e4e4bd9117=
9a5
        failing since 154 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7e266703974c3bf117992

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7e266703974c3bf117=
993
        failing since 2 days (last pass: v5.13-3495-gfbf137d9483a, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7e3bab3215f501d1179f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7e3bab3215f501d117=
9f5
        failing since 2 days (last pass: v5.13-3495-gfbf137d9483a, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b-32      | arm    | lab-baylibre  | gcc-8    | bcm2835_defco=
nfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7de55732c93d889117978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7de55732c93d889117=
979
        failing since 2 days (last pass: v5.13-3495-gfbf137d9483a, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
d2500cc                 | x86_64 | lab-clabbe    | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7de9945e34374cd117975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/base=
line-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/base=
line-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7de9945e34374cd117=
976
        failing since 2 days (last pass: v5.13-rc4-286-g6bd26f0b60ab, first=
 fail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
d2500cc                 | x86_64 | lab-clabbe    | gcc-8    | x86_64_defcon=
...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7dfed0d49ec16661179ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/basel=
ine-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/basel=
ine-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7dfed0d49ec1666117=
9ad
        failing since 2 days (last pass: v5.13-rc4-286-g6bd26f0b60ab, first=
 fail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
d2500cc                 | x86_64 | lab-clabbe    | gcc-8    | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7e143428ffa6400117970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/x86_64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/x86_64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7e143428ffa6400117=
971
        failing since 2 days (last pass: v5.13-rc4-286-g6bd26f0b60ab, first=
 fail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
hip07-d05               | arm64  | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7e56155c0b0e4af11796b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7e56155c0b0e4af117=
96c
        failing since 2 days (last pass: v5.13-1843-g646572bd9313, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
hip07-d05               | arm64  | lab-collabora | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7eb3e80d181131811796e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7eb3e80d1811318117=
96f
        failing since 7 days (last pass: v5.13-rc7-277-gfd6ae26c403a, first=
 fail: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd           | arm    | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7e0af94d051d87911796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7e0af94d051d879117=
96b
        failing since 256 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
imx8mp-evk              | arm64  | lab-nxp       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7e4ac97a11ffe4611796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7e4ac97a11ffe46117=
96b
        failing since 1 day (last pass: v5.13-11972-g079b16c442fd, first fa=
il: v5.13-12392-g47fac7b4f4b23) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb    | arm    | lab-baylibre  | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7dcfb04fe0b30e7117976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7dcfb04fe0b30e7117=
977
        failing since 234 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb    | arm    | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7dd02b70266666111796d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7dd02b702666661117=
96e
        failing since 234 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb    | arm    | lab-cip       | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7dd01b70266666111796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7dd01b702666661117=
96b
        failing since 234 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb    | arm    | lab-collabora | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7f1ec21f7f6bac7117985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7f1ec21f7f6bac7117=
986
        failing since 234 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
r8a77960-ulcb           | arm64  | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7e1b2045f9d3ebd117988

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7e1b2045f9d3ebd117=
989
        new failure (last pass: v5.13-12392-g47fac7b4f4b23) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
sun50i-a64-bananapi-m64 | arm64  | lab-clabbe    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e7e27c381549bb61117a1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/b=
aseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12625=
-g5f5e6a60f828/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/b=
aseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e7e27c381549bb61117=
a1f
        failing since 2 days (last pass: v5.13-11972-g079b16c442fd, first f=
ail: v5.13-12051-g62c20406acf9b) =

 =20
