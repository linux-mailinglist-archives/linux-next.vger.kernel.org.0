Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A1D36584A
	for <lists+linux-next@lfdr.de>; Tue, 20 Apr 2021 14:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbhDTMDo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Apr 2021 08:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbhDTMDo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Apr 2021 08:03:44 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D974C06174A
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 05:03:11 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id a12so25393537pfc.7
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 05:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NmDz0G8crQoRWLMyKt6OBFbAEHkcv9SfdS96+4Ockvs=;
        b=Csb6h+jAdK+iifndjzANE0EKE5aGCYJ53opndes+XIrVkgvNgbObptfCNdQfcFLvYm
         QojSU5wLANrVbZytltf24NYcUm4htyY1o9mWrBzdq3SvVuw2wbMixQRPVamzfMI8MISE
         Wb8gLYbN1GzZDx0Wi9JUw+CZn9JtX4w77G8ewWZakbi9ZMd3wEVLEtNRwHfS/ILHMlmo
         +7uM9ITsflhmfhWiE/ClL+NYNYeDzF2Gv/DE1H1y3XI7g3ztwwnhQnEuSWdtRK73Za00
         0TQXFyTm+YqIAgoPZdmGv4urN9AXbeO7bwsr4WpGNzBEj42YpJfeWdNiBL/tgp64w2hr
         LJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NmDz0G8crQoRWLMyKt6OBFbAEHkcv9SfdS96+4Ockvs=;
        b=Fd4Ud05D5o+NFTiZRSJu9UGCWnR+zFacmD52UvQvpxwuHGOUBe0tiL9/W9Ug11xjw1
         aL39TTcPQz676kps0vOjRyN5ATyKnMqJ+A6dlS4zFKavJ55Lqo7A8eAib844ZbRrZGRJ
         iJv/mTJmfWisP7bRRkWfMgJ3NGj2d+B5meUkKs4d7aFXobp16Mcw5IcBdIBptficivD/
         XIqUdOrSamcTccVw+l+kGNGZKjIweIXR4Reyd0uaTZxyICji3/a+0Lq81n6GdQS6W7ze
         DxVH5oVSNnQEnpfz0WwAcOTXq4D+iB8hvSKROFW7BP3DQ0aXCnl2Hp2jEyxKAKuK+yGU
         D5uw==
X-Gm-Message-State: AOAM530CFYr7dZ93N59o8crGig05ad48lglGrBTonaPbEqEUB5ilg+C1
        jxfsGUlAgqJaVzOPHekE+YH5UkiUI+9U96LG
X-Google-Smtp-Source: ABdhPJy7i6zi5kpO4Zp61tKOBsmi80hMgHWaS5OdGzgSCQMAiQjuc0ThFgGUkUNKioOcQCC5vYjhUQ==
X-Received: by 2002:a65:4cc5:: with SMTP id n5mr16439670pgt.80.1618920190904;
        Tue, 20 Apr 2021 05:03:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f18sm14425337pfk.144.2021.04.20.05.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 05:03:10 -0700 (PDT)
Message-ID: <607ec2fe.1c69fb81.5a167.450f@mx.google.com>
Date:   Tue, 20 Apr 2021 05:03:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc8-84-g9cb58cd2220c
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 278 runs,
 6 regressions (v5.12-rc8-84-g9cb58cd2220c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 278 runs, 6 regressions (v5.12-rc8-84-g9cb58cd=
2220c)

Regressions Summary
-------------------

platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora   | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc8-84-g9cb58cd2220c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc8-84-g9cb58cd2220c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9cb58cd2220c30d3488ac1eb37327d0825d45028 =



Test Regressions
---------------- =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora   | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/607ebf94da5304e88a9b77f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607ebf94da5304e88a9b7=
7f4
        failing since 74 days (last pass: v5.11-rc6-256-gf889022827dc, firs=
t fail: v5.11-rc6-298-g490f4659faae) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607e8ac3f67714ed4d9b77b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607e8ac3f67714ed4d9b7=
7b2
        failing since 155 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607e8ac3f67714ed4d9b77ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607e8ac3f67714ed4d9b7=
7af
        failing since 155 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607e8ac7f67714ed4d9b77b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607e8ac7f67714ed4d9b7=
7b6
        failing since 155 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607e8a65b08037dde19b77a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607e8a65b08037dde19b7=
7a2
        failing since 155 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/607e8a7712d4e55e159b77b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc8-8=
4-g9cb58cd2220c/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/607e8a7712d4e55e159b7=
7b9
        failing since 155 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
