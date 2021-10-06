Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B10B424798
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 21:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbhJFT7h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 15:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbhJFT7h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 15:59:37 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAD0C061746
        for <linux-next@vger.kernel.org>; Wed,  6 Oct 2021 12:57:44 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id m21so3409520pgu.13
        for <linux-next@vger.kernel.org>; Wed, 06 Oct 2021 12:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=itOpzvawebKV8I8UCWk9LX68hogiBeu+xcvvsOKzF50=;
        b=49VlQYAFnYBeAFeo/tKWDNNepTexIouS3HgQ+uJulzUi4U9ZbuYDaMMst/AqESQIps
         G9ONir4ngeM+7OIVP/CtN5f+5Q3rDkuM8b7k311kuWRL5N7BFknUgOcG9v8QYEOy+H99
         AR4bxQXu3ZMFOvxdbiiNuEPwDmIpJM6wmoaC5oIDUsaC1vDWM9uAEM698vILkGQZVBDY
         AjfBInDlM8T1hISsppQQkGkvsJAvq4n0N4hTCdRJOYlMJBxRmn0a9sZr0F3v652q/Ps3
         hVE6ker1qLStrXoz/QBk23KuyE87RX6RSBF0xp6+NFswsZpIa5Y54PAJ2o5DfXqMrnWZ
         lmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=itOpzvawebKV8I8UCWk9LX68hogiBeu+xcvvsOKzF50=;
        b=RvQBkFvfe1msaR1avWBxMy/DZXkvQhwbOLNHcDdMDgVjqAmBQg204sc7dj/rlEkQLH
         39VbwkXHmURdA4fWxLS4o8DsuUD5AS1Ho0o0CQipDvqXTCMud5SJ6KpAZQiiVGNVw4uc
         XIASlkPxNLZnR9EGaJWuWxK2FciTyHNkFs9zmGwiXemnwKcgzSswHIu39zJ5msVax2aX
         NvJN+I5Tlm3eWFNRR83qHjXP6QK874YjnnAPKfcdmeOdX9t3/V8Q/J0+TKTmnagIzmjr
         awp60OxbA3ZoXX+PL2gMq66hyyykJWO15O/lIPGtbthE/zp6ehM3u2RhJqub1dpAhN9O
         8pNQ==
X-Gm-Message-State: AOAM530Yzm+CD3PoXtg1qTbJdbwjXRAJy/ckrTUaUadm1zw8r5WoJysQ
        vHc2PanloYSk4GSUo2BMxBHgAMyVLmuI8MiS
X-Google-Smtp-Source: ABdhPJzR5zWAh5XfpLDTFmonlfTGuUvufAkEdaqIG2Me6fYBbYczEgs8DYZCgY/Gw+qAhmb6FcPrzQ==
X-Received: by 2002:a63:1d53:: with SMTP id d19mr455pgm.85.1633550263740;
        Wed, 06 Oct 2021 12:57:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b13sm6353506pjl.15.2021.10.06.12.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:57:43 -0700 (PDT)
Message-ID: <615dffb7.1c69fb81.2b6ee.24d1@mx.google.com>
Date:   Wed, 06 Oct 2021 12:57:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211006
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 389 runs, 11 regressions (next-20211006)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 389 runs, 11 regressions (next-20211006)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
beagle-xm            | arm   | lab-baylibre    | gcc-8    | omap2plus_defco=
nfig          | 1          =

beaglebone-black     | arm   | lab-cip         | gcc-8    | omap2plus_defco=
nfig          | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

hip07-d05            | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

hip07-d05            | arm64 | lab-collabora   | gcc-8    | defconfig      =
              | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =

rk3328-rock64        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

rk3328-rock64        | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211006/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211006
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0dda5ee37364eb58a960d7a031aebd7fa3e26384 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
beagle-xm            | arm   | lab-baylibre    | gcc-8    | omap2plus_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615dbcaf29101a349399a31c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211006/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211006/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615dbcaf29101a349399a=
31d
        new failure (last pass: next-20211005) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
beaglebone-black     | arm   | lab-cip         | gcc-8    | omap2plus_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615dbd6e5baaad4fe499a2ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211006/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211006/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615dbd6e5baaad4fe499a=
2ef
        new failure (last pass: next-20211005) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/615db7268cfde3389699a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211006/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211006/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615db7268cfde3389699a=
2f4
        failing since 159 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
hip07-d05            | arm64 | lab-collabora   | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615dbef5cd3721c1e299a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211006/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211006/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615dbef5cd3721c1e299a=
2db
        failing since 98 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
hip07-d05            | arm64 | lab-collabora   | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/615dc574ffc0e5c28e99a2fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211006/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211006/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615dc574ffc0e5c28e99a=
2fc
        failing since 97 days (last pass: next-20210624, first fail: next-2=
0210629) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615db5efb01202ceea99a301

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211006/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211006/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615db5efb01202ceea99a=
302
        failing since 322 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615db5ddb01202ceea99a2f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211006/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211006/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615db5ddb01202ceea99a=
2f7
        failing since 322 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615db600a7ec308d6a99a2f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211006/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211006/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615db600a7ec308d6a99a=
2f2
        failing since 322 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615db58b817169807999a2e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211006/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211006/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615db58b817169807999a=
2e3
        failing since 322 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3328-rock64        | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615dbc27df31881d9299a2f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211006/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211006/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615dbc27df31881d9299a=
2fa
        failing since 113 days (last pass: next-20210611, first fail: next-=
20210615) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
rk3328-rock64        | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/615dbecf90897830de99a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211006/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211006/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615dbecf90897830de99a=
2e6
        failing since 15 days (last pass: next-20210915, first fail: next-2=
0210920) =

 =20
