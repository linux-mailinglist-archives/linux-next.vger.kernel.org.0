Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDC293FC206
	for <lists+linux-next@lfdr.de>; Tue, 31 Aug 2021 06:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbhHaEtA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Aug 2021 00:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhHaEs7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Aug 2021 00:48:59 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734D3C061575
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 21:48:05 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id q3so9861082plx.4
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 21:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ihZ4Lt/n7doJ9CVUWMEt9BIGGyk5+0IRjKb+rje2KKY=;
        b=YDX2seVBbdUgPzFrfjrXhM0QVOkBgZLwN5MUb9EIrsNT4vw8AQ35xOKwIZELk2mKWv
         amM+QNChoV7mWmEDrGQ78Len5JYQGx3BNJJEo20rdqr4aQV+XZ6SFGOm0EsU6s63nGSs
         Zlh876HJ1i3BD179pV1ZVHdAQJIkYR4uwSC4FcUGbJXVPcukCI6zeCV2z6ouTO25WAex
         l1m9FGTtywYHoFNB7JM81Q+V7pcE29fa9ebIb3rn3OouI3gnwO0AWmKjGiGJfP8IhSIZ
         1YsT7n1u9Ui4v0RglyLqXT/FydDsYx/RKWQxd6HBDc5mU05DBczukBQQgqfnNSCIK1pC
         tOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ihZ4Lt/n7doJ9CVUWMEt9BIGGyk5+0IRjKb+rje2KKY=;
        b=HVg3N/DrIPAmJG8KgE2vmGwaWtfL5MlBdKJCpG8eOpNenp3qTvRMBDjyfzvgMcsqyL
         nYmmC5az/qUkN5xQi4LFDqA/78dgP5L78vwDrV14eU9uEwzE7qbM4SxMryZ6rS80wqNN
         dmPlFqLT+kJx+8grU/hycYahOwXXSLvUPbxnq8jbIxA/UrH3+GoVofNL2H7F6DNC5K5b
         5qUfxtQO5FV2A/76N+wyvQkaFBBpIrnM9bsjWDO0Kj9YEeZUZ79j/HQiVhXWmyLyiqsb
         m24qz/194jKqbwgYnQyUrTwA9gJvjFSz63xIP2v69uYu/BP7go7ykKuXF0ZYcQH5QzOK
         kvQQ==
X-Gm-Message-State: AOAM533PGSXwWS3QBJKPzTATRQft9sk+NsKwithbBSsVjeggv1Cgs58r
        8cDR7aTASG++56ylzqc0v0UYOEFsBVyAECc/
X-Google-Smtp-Source: ABdhPJxJavOJWQdtgfwlV2/d12i5kh4ChZnr6/LrBL/Mkmy1oskva6FGiKKeC0Br1RWIbpY3PicziA==
X-Received: by 2002:a17:90a:f8e:: with SMTP id 14mr2995128pjz.85.1630385284684;
        Mon, 30 Aug 2021 21:48:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a11sm18381126pgj.75.2021.08.30.21.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 21:48:04 -0700 (PDT)
Message-ID: <612db484.1c69fb81.a372f.02b2@mx.google.com>
Date:   Mon, 30 Aug 2021 21:48:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.14-1642-g50a532577e29
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 462 runs,
 14 regressions (v5.14-1642-g50a532577e29)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 462 runs, 14 regressions (v5.14-1642-g50a53257=
7e29)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
              | 1          =

beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 1          =

beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig+crypto    | 1          =

beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm   | lab-baylibre | gcc-8    | omap2plus_defco=
nfig          | 1          =

imx6q-sabresd           | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx6ull-14x14-evk       | arm   | lab-nxp      | gcc-8    | multi_v7_defcon=
fig+crypto    | 1          =

imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig+crypt=
o             | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie  | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip      | gcc-8    | versatile_defco=
nfig          | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-1642-g50a532577e29/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-1642-g50a532577e29
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      50a532577e292c229d2cf33bcc38967c5acd4c22 =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612d78bdc263de53a28e2caa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d78bdc263de53a28e2=
cab
        failing since 55 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612d7e0e855a18c3768e2c8e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d7e0e855a18c3768e2=
c8f
        failing since 55 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/612d797c7e768207968e2c90

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d797c7e768207968e2=
c91
        failing since 7 days (last pass: v5.14-rc6-152-g898ee1d3a2b1, first=
 fail: v5.14-rc7-72-geeb46b4d4bd9) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/612d7b989c15c68e928e2c85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d7b989c15c68e928e2=
c86
        failing since 0 day (last pass: v5.14-rc7-142-gd92736edf498, first =
fail: v5.14-619-gacb79da497df) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/612d7d51b8a0ec56f88e2c85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d7d51b8a0ec56f88e2=
c86
        failing since 49 days (last pass: v5.10-rc7-201-gc9b6935dc4f4, firs=
t fail: v5.14-rc1-225-g25a1eba130d1) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | gcc-8    | omap2plus_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612d78b4c263de53a28e2c89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d78b4c263de53a28e2=
c8a
        failing since 7 days (last pass: v5.14-rc6-152-g898ee1d3a2b1, first=
 fail: v5.14-rc7-72-geeb46b4d4bd9) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx6q-sabresd           | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612d7b105b10ebb51d8e2c84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d7b105b10ebb51d8e2=
c85
        failing since 309 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx6ull-14x14-evk       | arm   | lab-nxp      | gcc-8    | multi_v7_defcon=
fig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/612d8e005da8dfa14b8e2c8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/multi_v7_defconfig+crypto/gcc-8/lab-nxp/baseline-imx6ull-=
14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/multi_v7_defconfig+crypto/gcc-8/lab-nxp/baseline-imx6ull-=
14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d8e005da8dfa14b8e2=
c8b
        new failure (last pass: v5.14-rc7-72-geeb46b4d4bd9) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612d7a241d996207c18e2c9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/basel=
ine-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/basel=
ine-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d7a241d996207c18e2=
c9b
        new failure (last pass: v5.14-rc7-142-gd92736edf498) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/612d88814919dd7e058e2c78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d88814919dd7e058e2=
c79
        failing since 12 days (last pass: v5.14-rc5-288-gf8275649b86e, firs=
t fail: v5.14-rc6-152-g898ee1d3a2b1) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612d74d57adccf2add8e2c82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d74d57adccf2add8e2=
c83
        failing since 287 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie  | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612d7583b9c526dc038e2cfd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d7583b9c526dc038e2=
cfe
        failing since 287 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb    | arm   | lab-cip      | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612d74c591db1289728e2ca2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d74c591db1289728e2=
ca3
        failing since 287 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612d7dd08c7d12eea38e2cac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi=
-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-1642-=
g50a532577e29/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi=
-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612d7dd08c7d12eea38e2=
cad
        new failure (last pass: v5.14-rc7-142-gd92736edf498) =

 =20
