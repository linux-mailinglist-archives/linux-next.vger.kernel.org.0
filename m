Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBA33B8D75
	for <lists+linux-next@lfdr.de>; Thu,  1 Jul 2021 07:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234059AbhGAFnl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Jul 2021 01:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhGAFnk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Jul 2021 01:43:40 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8A0C061756
        for <linux-next@vger.kernel.org>; Wed, 30 Jun 2021 22:41:10 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id x16so4875316pfa.13
        for <linux-next@vger.kernel.org>; Wed, 30 Jun 2021 22:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=158kWU6lrfZFv0TqS8ekKgXdL1f28mCe3xVDazboNVY=;
        b=TKR4lJEQCU/REk38f2WKHq3aQ60HzGVcuWqbGYPa8Xq/DTqk0W70AbdOF4T9or3BTP
         xZB/+Op5I5Aqs3/kF+mPGEGUqcRk/XqQuOzG+NnEw5JP+EatUvM/f7+LBTedwgzc6Dg0
         JYl2grpUjX5YNwRm2AM2EswERaMYlxSaq5cyUA1fhKV76OiDeV0cKv87Xgm0m2qRGnrI
         C9T1//wbrab/gocfK2W67xngbEhzTwxvRSVAn5PZ8gNm55YUhqWUHO2C1lrJ2950/30l
         aIZBczrBahn5svjMDDZ+xX87XlF7xR0k29/7b3/mmAkRQwcNzUy05vpamXgw86eCCfp2
         9ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=158kWU6lrfZFv0TqS8ekKgXdL1f28mCe3xVDazboNVY=;
        b=DIAJdPnP1KSjjGOa3x1GkdcS1nVPQgF9xuwJTTUJFk6i6QEFF7apcPXMeLOwQ3t+0V
         fSqKUuzIBl06VwhBNSsbOep6bNns7K3FOemTCEwCcRMkGNCijjDoMk1TiHduY1EJMnsy
         P2kwcVeiTwgCqKEzxbPI7e/fApgtoF/k7bKhCdbjufjlycf3k/GVCrb2pwKRg3jLYevF
         ETWr5z90BynDRTWO83A2KZ5t8BVEdljIcy8wK9MESUDCrjy9mBAS9eACVdtcQ8ljkcJL
         Qn+/KeCiGh2p1J9nfUA6hdWquOa0gsS8UwsUm/Ps3m0zR6L3YZZX7UlMUB0nJpzGDETp
         zfZA==
X-Gm-Message-State: AOAM530o45UbywIKTM615GPhjR/9tAOs4OVM307A2EnwGaC9uUDi6+Nx
        hmVwxEvA1ygKh05gnqMZRsulDi3eHZVxFe9+
X-Google-Smtp-Source: ABdhPJy1j37jIrwEkd2cPL3NcenJ6XJpirZFXX8thE0AZct/h+EWe3eXmhSJiqWHXJVVzRF04Iu0Vg==
X-Received: by 2002:a63:d612:: with SMTP id q18mr15066122pgg.77.1625118069664;
        Wed, 30 Jun 2021 22:41:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s126sm23758801pfb.164.2021.06.30.22.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 22:41:09 -0700 (PDT)
Message-ID: <60dd5575.1c69fb81.64a0f.733a@mx.google.com>
Date:   Wed, 30 Jun 2021 22:41:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.13-3495-gfbf137d9483a
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 240 runs,
 6 regressions (v5.13-3495-gfbf137d9483a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 240 runs, 6 regressions (v5.13-3495-gfbf137d94=
83a)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
     | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-3495-gfbf137d9483a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-3495-gfbf137d9483a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fbf137d9483a14fb78f83ad2e25ee606d6470892 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60dd18dcdc0b71583723bbf7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dd18dcdc0b71583723b=
bf8
        failing since 248 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/60dd1a94adfbe77d4823bbbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dd1a94adfbe77d4823b=
bbe
        failing since 10 days (last pass: v5.13-rc6-296-g227cd20c3337, firs=
t fail: v5.13-rc7-108-ga39bc0c7697f) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60dd1886f1f9ea7c3b23bbc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dd1886f1f9ea7c3b23b=
bc5
        failing since 226 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60dd2750121400b7a623bbca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dd2750121400b7a623b=
bcb
        failing since 226 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60dd1883f1f9ea7c3b23bbc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dd1883f1f9ea7c3b23b=
bc1
        failing since 226 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60dd376da4ae9b5b5023bbe4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-3495-=
gfbf137d9483a/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60dd376da4ae9b5b5023b=
be5
        failing since 226 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
