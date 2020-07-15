Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354E32206AC
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 10:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729577AbgGOICo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 04:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729001AbgGOICm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2020 04:02:42 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E517C061755
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 01:02:42 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id u185so1762099pfu.1
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 01:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=n5gOwohstoPRVp+FkY1l/ivOBo74EAjCdOWiObUMEBk=;
        b=alrRzM8FPIo/ZYy4iE/S+6HUrZh7oTGL8d7MrCRTYJAYOVE3spgH7YSUzwY4UmLmW4
         a5RCQnanPpB7hRpAS5VSx1ENt8VrfMqzFEfI4pbMUtXIjT5Cv/za2jVFCwCRNUsn3mOQ
         cFPkA1okSunnipjwwjQuI9MTUIBJuPGrmlnlDjB7nsCUVOKMnrYCHTmRnX2/UjlybFU1
         ZwjQ2Ta5wI+yghb3HXwoabqhyzHBc7psD+zxwg7jO8NwJBgoy9hWZXIA7xbbMb7dPMeZ
         skTKSKhhaeXjourREHhkP6TErBIribAPRtRAyqbSaRjNXweqsQXlWyE2PTmRHfxR0Fps
         0g3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=n5gOwohstoPRVp+FkY1l/ivOBo74EAjCdOWiObUMEBk=;
        b=hAkQfFFm3hTRtPthTOqG0qmL3fixr5pCLDPsdtiM0ZMprCGaR72YGx88Axk7FmiPoU
         dB556Ecc8GdsbazuE23hav/4ewCTvkviBw9PDGrslpC1Wd/UeoNi70P5R3daH4esu/Po
         5zBSw2qsIzL8offT4eWMoYWkRTUCzMuMZjl58eKqlFpzsGlM9o0EzxqsdBouF5UY+Lx7
         nb+0A1rDbjdmaYCCGH17/oNQE4xoehumoNSuVgSQWU/h3hmh26n/OLrXWYGyBGG7q1d+
         xMQZe/0neEllgl1sBJFTo4y+HD08qtEL2wpGMOLNmYxpI2RxvAq9N5u7BseM24cLiliH
         wQKw==
X-Gm-Message-State: AOAM532vD1KcGH2fM0ITphiSqujnIT6NKVPirJGTpYpcYjIklhE9p55S
        HuHvwf1D6eJBYCVR5DyjbBvG8toTdEs=
X-Google-Smtp-Source: ABdhPJxSjLpiuC92P+yKevmPqmUsr2dKZjmbJgyJ/KGaqM5z4Q7eQ0EHHaJrx/bYoXYhi6GgzX8kUg==
X-Received: by 2002:a63:6447:: with SMTP id y68mr7022877pgb.428.1594800161145;
        Wed, 15 Jul 2020 01:02:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d190sm1292558pfd.199.2020.07.15.01.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 01:02:40 -0700 (PDT)
Message-ID: <5f0eb820.1c69fb81.f8748.3fec@mx.google.com>
Date:   Wed, 15 Jul 2020 01:02:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc5-248-g9259f7ab5c13
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 184 runs,
 6 regressions (v5.8-rc5-248-g9259f7ab5c13)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 184 runs, 6 regressions (v5.8-rc5-248-g9259f7a=
b5c13)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained   | arm   | lab-baylibre  | gcc-8    | sama5_defconfi=
g              | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 0/1    =

vexpress-v2p-ca15-tc1   | arm   | lab-baylibre  | gcc-8    | vexpress_defco=
nfig           | 3/5    =

vexpress-v2p-ca15-tc1   | arm   | lab-cip       | gcc-8    | vexpress_defco=
nfig           | 3/5    =

vexpress-v2p-ca15-tc1   | arm   | lab-collabora | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc5-248-g9259f7ab5c13/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc5-248-g9259f7ab5c13
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9259f7ab5c133c5c70de297c0abf11b651894606 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained   | arm   | lab-baylibre  | gcc-8    | sama5_defconfi=
g              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0e82b33bbf924c1b85bb22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0e82b33bbf924c1b85b=
b23
      failing since 70 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0e844db766c5e7ed85bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0e844db766c5e7ed85b=
b20
      new failure (last pass: v5.8-rc4-597-gb8976598d3c1) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0e87fc35a0c7db9e85bb2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0e87fc35a0c7db9e85b=
b2e
      new failure (last pass: v5.8-rc4-597-gb8976598d3c1) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-baylibre  | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0e7a9df5e09b17f785bb40

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0e7a9df5e09b17=
f785bb43
      failing since 14 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-210-g0a3929819868)
      2 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-cip       | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0e7a90f5e09b17f785bb34

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0e7a90f5e09b17=
f785bb37
      failing since 14 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-210-g0a3929819868)
      2 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-collabora | gcc-8    | vexpress_defco=
nfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0e7a8e50c923b8f985bb32

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc5-24=
8-g9259f7ab5c13/arm/vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpres=
s-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0e7a8e50c923b8=
f985bb35
      failing since 14 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-210-g0a3929819868)
      2 lines =20
