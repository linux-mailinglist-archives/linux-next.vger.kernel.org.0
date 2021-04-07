Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148A23561C0
	for <lists+linux-next@lfdr.de>; Wed,  7 Apr 2021 05:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242622AbhDGDGj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 23:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbhDGDGj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 23:06:39 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F748C06174A
        for <linux-next@vger.kernel.org>; Tue,  6 Apr 2021 20:06:29 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g35so7171036pgg.9
        for <linux-next@vger.kernel.org>; Tue, 06 Apr 2021 20:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1u2hOxChmncPIIpig41KUg0vVt5q352Ukyg3NQiwwTU=;
        b=JmoKRzUQ17MxGdvDeqdKa3pQMamnxmurFI6GQus/8+7Y17Z7qGJk5tYcBbcZviQDrq
         TfepK3Lpf1ZePOpbS8fmZb9EydUoAmBeYf7F+zDanHHhjmdGjeiob39zRyguAM6YuSS3
         S6mSx6pUeotsK4zighVnOxsPaGPSs7RbeQrbB2yO2XekWp3AdZ66s3FfUMHQCbHJRQI3
         T0w2CeMcuXoduikJ0riVuTjuuEl3bIr14y8UfdHYU5YEztRltHmDJ17xowAwYa2rv8bA
         mTrBmn+8FblofEYsvTzF8G4LB6/eCzTiUcj75A9KdUFwxFdzOawSRzhjcO++j296y2fS
         SnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1u2hOxChmncPIIpig41KUg0vVt5q352Ukyg3NQiwwTU=;
        b=L+1HugpypZIEUb6bL5zjhSgslVc5wJ/v6V1qf1rZJWQ90cn3IXMcaXUTd7erU2XRnl
         qyGwqIp2uX64Cwx871IvX67OCx583YObY2Fyfa2OteK8NLvqkZo25vE/Zo4vzTdj1sTD
         uD6EwMS114HKic/Au2HSZLG1WUyLmNavMx1KwCQl2j31npXTt9J/2cehw3PR7JGyHKsE
         O3cKIzg9JFqzW67pTv7P+ZYN2kK6RgrxGsvYrsFTuDns/33xoMPBR0vtcpkGC4nDiGap
         2nJuJZymjaHtQlu0Z2SBFP8EWGfn288LpS4wSbblSdDzNAbCxdHUSaulHzWhsZjqM+9s
         hBqA==
X-Gm-Message-State: AOAM533G3GoqCXbSD3VSCVlBvrSPMY8J63O4DIZACDk6a+2eWNC/1KVd
        xbPHtzm3pxiFcjHOz8DBJWK6sLp6JbC49g==
X-Google-Smtp-Source: ABdhPJy4nai5+r+p3rBZ19p0wO+0075Xs0eQk+FirP8lB4Wn9xzzdEvs3voMF005xJ+7oIjYG3Q/Kg==
X-Received: by 2002:a62:3706:0:b029:211:3d70:a55a with SMTP id e6-20020a6237060000b02902113d70a55amr1116034pfa.16.1617764788934;
        Tue, 06 Apr 2021 20:06:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t18sm19724008pfh.57.2021.04.06.20.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 20:06:28 -0700 (PDT)
Message-ID: <606d21b4.1c69fb81.1b51d.2e82@mx.google.com>
Date:   Tue, 06 Apr 2021 20:06:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.12-rc6-303-g4ef1bf72d3bd5
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 256 runs,
 6 regressions (v5.12-rc6-303-g4ef1bf72d3bd5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 256 runs, 6 regressions (v5.12-rc6-303-g4ef1bf=
72d3bd5)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
     | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc6-303-g4ef1bf72d3bd5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc6-303-g4ef1bf72d3bd5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4ef1bf72d3bd56bae71cd85e26d778c6025c6a54 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/606cf1e0f69d1d2d42dac6df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606cf1e0f69d1d2d42dac=
6e0
        failing since 13 days (last pass: v5.12-rc4-316-g8d59c115a79a, firs=
t fail: v5.12-rc4-389-ga27dcf51dcf16) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/606ce7c43127cb38aedac6c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606ce7c43127cb38aedac=
6c2
        failing since 141 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/606ce7c9c470bcd7b7dac727

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606ce7c9c470bcd7b7dac=
728
        failing since 141 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/606ce7d4acbaa40162dac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606ce7d4acbaa40162dac=
6b2
        failing since 141 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/606ce777e28834b28adac6bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606ce777e28834b28adac=
6bc
        failing since 141 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/606ce784e28834b28adac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc6-3=
03-g4ef1bf72d3bd5/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606ce784e28834b28adac=
6c1
        failing since 141 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
