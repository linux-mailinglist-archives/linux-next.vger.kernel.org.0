Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29AD93502EE
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 17:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236101AbhCaPG3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 11:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbhCaPGC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 11:06:02 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F92C061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 08:06:02 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id t18so9660550pjs.3
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 08:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zz1hfcSBwhvywDjOn5CYOTQkGjVcy9+m/WqF/UcAmLY=;
        b=sO6MnqUppQxH8FicfE/5HsLSRUkpFLFgkxddgTsd0VYpU5AOgppt9Sd9Mqq536p0d8
         QMdZ6U2Af3nTkeZ70Jf6x+Hs9pTYErs9kWeYejyTHspjxFl1hLOpnTFlwUvTpO2oRCFh
         FGKNI7/GxVnepwFlxQMOA++wrLQ3oK2dWSmf9+hcfWyiN9yWBYOri18/PqXWcmUn+/To
         PwjrJknobxtar6o6CH6Rj7+VS1gv5kJTPSOkpviVCWWLAmuFtrK03s72CLdoABb6CmRm
         +TUBnzh3sHz1RHdZ7mGkvcoqyPTvdmcKuX4kv4z2+q4EXhnc2jvKXDx9bt+TMGtx/nW4
         ZGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zz1hfcSBwhvywDjOn5CYOTQkGjVcy9+m/WqF/UcAmLY=;
        b=BJ1Hpcgbbp2mdZcH7yoitoCRyWHy187oMbaBBUITh+ao7hU4jQBATx7KGYg32EDfO0
         OativALKWxOeM4yyDaGWC6IoJnfmeu67D7/8Gh8Xw5/zz54S9rk5N42qmNC/RksYcBmH
         mqKSyDvLuVI+n1t1R1hpjm0a9WzyRxIbRe8eYBxT6BgM4qBH/pENySVPn8hawCMH/sfW
         DzM4P8fII/JTonA8pmFDPGLHxkvqT7Usv4MgA22c4mcx50CU/nKr/uiygxn7ETUsZT6f
         CihEEcrjAdSGAYI4/pEneRr0BfSLjwKXVLS76MRNgfSAtAEZJWa4Rthh6dH3cLa9c3Ac
         +Qkg==
X-Gm-Message-State: AOAM532sVcn21zkT501XXLPn9FDIQDN1NlghfO1/koQHRSDWW2/klH4t
        CD8sFYUkJR61mvtcY5bjbZmjXhxPeKqO9A==
X-Google-Smtp-Source: ABdhPJyD2asM+w6+r9zo4qpdd8En5oZUYX6eRqfcxH15bnZZDQWA97z3ro1XuzOPZZs3gg1DefLZFQ==
X-Received: by 2002:a17:902:6b43:b029:e6:3d73:e9fb with SMTP id g3-20020a1709026b43b02900e63d73e9fbmr3419025plt.37.1617203161090;
        Wed, 31 Mar 2021 08:06:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q15sm3021485pje.28.2021.03.31.08.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 08:06:00 -0700 (PDT)
Message-ID: <60648fd8.1c69fb81.8c457.70a6@mx.google.com>
Date:   Wed, 31 Mar 2021 08:06:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210331
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 303 runs, 6 regressions (next-20210331)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 303 runs, 6 regressions (next-20210331)

Regressions Summary
-------------------

platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
bcm2837-rpi-3-b-32   | arm  | lab-baylibre    | gcc-8    | bcm2835_defconfi=
g   | 1          =

qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig | 1          =

qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig | 1          =

qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig | 1          =

qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig | 1          =

qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210331/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210331
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7a43c78d0573e0bbbb0456b033e2b9a895b89464 =



Test Regressions
---------------- =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
bcm2837-rpi-3-b-32   | arm  | lab-baylibre    | gcc-8    | bcm2835_defconfi=
g   | 1          =


  Details:     https://kernelci.org/test/plan/id/606457c995a3001cb6dac769

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210331/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210331/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606457c995a3001cb6dac=
76a
        failing since 6 days (last pass: next-20210324, first fail: next-20=
210325) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/6064566309ae4ab4e5dac6d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210331/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210331/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6064566309ae4ab4e5dac=
6d8
        failing since 133 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/606456488b00ea040bdac6bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210331/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210331/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606456488b00ea040bdac=
6be
        failing since 133 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/6064564f8b00ea040bdac6c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210331/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210331/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6064564f8b00ea040bdac=
6c4
        failing since 133 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/606474d7132ebd1340dac724

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210331/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210331/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606474d7132ebd1340dac=
725
        failing since 133 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/6064560725dd3831bddac6bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210331/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210331/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6064560725dd3831bddac=
6bd
        failing since 133 days (last pass: next-20201113, first fail: next-=
20201117) =

 =20
