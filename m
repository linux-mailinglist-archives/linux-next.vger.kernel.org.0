Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1339335DE85
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 14:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239707AbhDMMRh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 08:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhDMMRh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Apr 2021 08:17:37 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9202EC061574
        for <linux-next@vger.kernel.org>; Tue, 13 Apr 2021 05:17:15 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id h20so8113766plr.4
        for <linux-next@vger.kernel.org>; Tue, 13 Apr 2021 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NiA7kupim3AqRPJ7aNp2YZaxyjK4HCLeciIUEXOiOBo=;
        b=MJxPhfhWJH5rzygsoGt4VX5MFbYDMFu4g4KFy3HVFdITp1b1AxSalLTBPUmMrETIzf
         rZjpL1rlCkNHgNhB2htcVTRrKtiDY+BhnJT9zQmB0/Exyc/nHOqtj/ZKJLEyBAGh/qqU
         Y7SIkzpn/CMCdLYt0PF1k3i70jqSXV+dpErVuQBF/80BEvBG4I/0r0wEpSAYpneApzus
         qH5kj9IOgLc94xKI8STBjttM4AwhE63ekUTHCdOkH1um2fEJPWsLlP1qJhevaJ6xHv1w
         HPmS/6nnMAkdM2rSFASispsLTCy8PCMUKH//2Gu63s5yh9YOXL8bC+FtBA5avy2v/vMP
         ka1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NiA7kupim3AqRPJ7aNp2YZaxyjK4HCLeciIUEXOiOBo=;
        b=ZVwLrBGlvlgoVsithsQxkwOvq2cdZ0cosIp8PP0dKTgk45DZmwRTHLT4S7eFbKADSR
         5rs5Du2ChmrpQyGuNMxxRBNx4RnineINmBoU7fKzOVjiMdqlyQgsTdkOeW370DJ9JDVz
         j2O/V3B1bp6EPdIZWUC62KJhliQRasBl6vBzgwgmPxGMFIoZpiEOq8XiteLq5qbncPiq
         aBFa85+0jvZdeZUAptkpfJgQkVmODHEQjbdq8+KUofwuWVZRk/SWBuaFj9dKEL7zWwm4
         mSpmM80+nd+VqWoGSIlUOfvhGlLREdcmkooMSN4orby+U3BMh4yWoF+xFbOfM5rqyC3G
         b+5A==
X-Gm-Message-State: AOAM533lWWxUhnMxtbnXjoYei88ovxu8R2MusqIj/zpnKBk9P7DWhteK
        D58aWu94OUW8v6qO29CVbt5/vZh0KK3d+IqX
X-Google-Smtp-Source: ABdhPJwdEPuH5kG0Iru3PrDJc6/NhKip0OvsXPFgRTsfoC+JNYKmYOPcifWZD5IrMF/AeBB/Jvvbhg==
X-Received: by 2002:a17:90a:d311:: with SMTP id p17mr4567713pju.43.1618316234905;
        Tue, 13 Apr 2021 05:17:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g15sm11078052pfv.216.2021.04.13.05.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 05:17:14 -0700 (PDT)
Message-ID: <60758bca.1c69fb81.ec52f.b472@mx.google.com>
Date:   Tue, 13 Apr 2021 05:17:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.12-rc7-139-gf9237fc6807e8
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 242 runs,
 7 regressions (v5.12-rc7-139-gf9237fc6807e8)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 242 runs, 7 regressions (v5.12-rc7-139-gf9237f=
c6807e8)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

beaglebone-black     | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc7-139-gf9237fc6807e8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc7-139-gf9237fc6807e8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f9237fc6807e8fefa5fec6146c2cb3ed4b0181d8 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607558c1b1551b210fdac6cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora=
/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora=
/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607558c1b1551b210fdac=
6ce
        failing since 67 days (last pass: v5.11-rc6-256-gf889022827dc, firs=
t fail: v5.11-rc6-298-g490f4659faae) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
beaglebone-black     | arm   | lab-collabora   | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60755b866685817db6dac6dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora=
/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora=
/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60755b866685817db6dac=
6dd
        new failure (last pass: v5.12-rc6-423-gde1080234c7ce) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60755a05c648a64037dac6b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60755a05c648a64037dac=
6b8
        failing since 4 days (last pass: v5.12-rc6-303-g4ef1bf72d3bd5, firs=
t fail: v5.12-rc6-423-gde1080234c7ce) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6075529588bc48b74bdac6b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075529588bc48b74bdac=
6b4
        failing since 148 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607552a496a8f1c40fdac6c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607552a496a8f1c40fdac=
6c1
        failing since 148 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60755236d72d9955c7dac6b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60755236d72d9955c7dac=
6ba
        failing since 148 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6075524ed72d9955c7dac6ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc7-1=
39-gf9237fc6807e8/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6075524ed72d9955c7dac=
6cb
        failing since 148 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
