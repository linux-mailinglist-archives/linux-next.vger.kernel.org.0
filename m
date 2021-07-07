Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4507F3BE259
	for <lists+linux-next@lfdr.de>; Wed,  7 Jul 2021 07:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhGGFJh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Jul 2021 01:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbhGGFJg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Jul 2021 01:09:36 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E332C061574
        for <linux-next@vger.kernel.org>; Tue,  6 Jul 2021 22:06:56 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c15so383673pls.13
        for <linux-next@vger.kernel.org>; Tue, 06 Jul 2021 22:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=09lY0q4pKtJJJ4FPahoga+KM47CUoXqTQuVmslfTa0k=;
        b=tm+WLB4g1MwpF4Bd4z551jOJ/esIPo26cix/EoB/XueJOv72magym7H5GmXqm+yEPP
         axMmY7RSubYMQovBV5EukqyMezUHSpMT48tlBy+A5lBRlzdGQWJmBhW6P5doVxYOi/j8
         p/kExqQKXn794u9b/RqSBTeIiQMfgyBhFAwDNYwjk7uZ+BYoIL0JkcynLR+9rA3Frc3Y
         50OEzCIsHNQzWytT+Ohe2jaeUbaM+tmzUweSIgACF1OWGto/L7vqsJ3ulzWAa01at3/d
         n5tHxu4qytkSsUNLi8HMYxANPpiaZoDusnBAlPTFg4lkzMTuQrJb91AH3OUm41KMlG5Q
         qD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=09lY0q4pKtJJJ4FPahoga+KM47CUoXqTQuVmslfTa0k=;
        b=o7h0QGWCx/d4NYoVw/Toh+YSxQ/dJeyj0iUeXUc0IByMqTs41SyT+AFtTu8ug2gjf0
         e+NsC2QId3P2oND4o5fe90jVfoOxnNwA9vr1od6wKQkwoB+4c/E0FyqTrQgpACRgWrfK
         PLngq5pi07AZsN30J3PafDQcjOUIjcuqdhkhTnimlY/mKYRAELeN6CEOVsKkI+O/c/iA
         bFIxJjqJofe8NiyRHq4xhgFcmzJUKaEO2dY503YLaxHLiFE7CNti5+mcMsXhG6BvlI36
         yLOaYt297g5YTSVnoIswX4fEMht5t2E38Jv7qeTNmNPnpoQNd0aY1e7zbJkW7eTEvOJB
         Lvjg==
X-Gm-Message-State: AOAM530nOz8BaAiwq119jk59Nznzbbm7c92+fcxnEpTzVg2ab2BO9IGE
        OcUDnWPcWPWcrXaDBK/4p5F1m4Z7GoObhiA3
X-Google-Smtp-Source: ABdhPJxF4ASGXYTWfM3PjUDRRhubucrs/7T/cc0WZYYdrcwPEfxn0rr/NynufNTti8BHrcy7d1e8Bw==
X-Received: by 2002:a17:90a:c288:: with SMTP id f8mr8199178pjt.194.1625634415462;
        Tue, 06 Jul 2021 22:06:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d9sm17595482pfd.91.2021.07.06.22.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 22:06:54 -0700 (PDT)
Message-ID: <60e5366e.1c69fb81.b9fec.2a13@mx.google.com>
Date:   Tue, 06 Jul 2021 22:06:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.13-12051-g62c20406acf9b
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 293 runs,
 20 regressions (v5.13-12051-g62c20406acf9b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 293 runs, 20 regressions (v5.13-12051-g62c2040=
6acf9b)

Regressions Summary
-------------------

platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | multi_v7_de=
fconfig           | 1          =

am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | omap2plus_d=
efconfig          | 1          =

bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b         | arm64  | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32      | arm    | lab-baylibre    | gcc-8    | bcm2835_def=
config            | 1          =

beaglebone-black        | arm    | lab-cip         | gcc-8    | multi_v7_de=
fconfig           | 1          =

beaglebone-black        | arm    | lab-cip         | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

beaglebone-black        | arm    | lab-cip         | gcc-8    | omap2plus_d=
efconfig          | 1          =

d2500cc                 | x86_64 | lab-clabbe      | gcc-8    | x86_64_defc=
on...6-chromebook | 1          =

d2500cc                 | x86_64 | lab-clabbe      | gcc-8    | x86_64_defc=
onfig             | 1          =

d2500cc                 | x86_64 | lab-clabbe      | gcc-8    | x86_64_defc=
on...86_kvm_guest | 1          =

hip07-d05               | arm64  | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk              | arm64  | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb    | arm    | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb    | arm    | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb    | arm    | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb    | arm    | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb    | arm    | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =

sun50i-a64-bananapi-m64 | arm64  | lab-clabbe      | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-12051-g62c20406acf9b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-12051-g62c20406acf9b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      62c20406acf9b53aaff58b484c67acb8fead3370 =



Test Regressions
---------------- =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e50de24982f8f58111796c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e50de24982f8f581117=
96d
        new failure (last pass: v5.13-3495-gfbf137d9483a) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e50fab9f34b9da4811796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft=
/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft=
/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e50fab9f34b9da48117=
96b
        new failure (last pass: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15       | arm    | lab-linaro-lkft | gcc-8    | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e5100fb97b3caed111796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57=
xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57=
xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e5100fb97b3caed1117=
96b
        failing since 0 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b         | arm    | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e501a3e205440beb11796c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e501a3e205440beb117=
96d
        failing since 152 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b         | arm64  | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fb4106ce103011117999

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fb4106ce103011117=
99a
        failing since 0 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b-32      | arm    | lab-baylibre    | gcc-8    | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fc8152d2f144ab117984

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fc8152d2f144ab117=
985
        failing since 0 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beaglebone-black        | arm    | lab-cip         | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fd456ea45102ee11799d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fd456ea45102ee117=
99e
        failing since 0 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beaglebone-black        | arm    | lab-cip         | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fdcf18d920a569117977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baselin=
e-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baselin=
e-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fdcf18d920a569117=
978
        failing since 0 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
beaglebone-black        | arm    | lab-cip         | gcc-8    | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e5013f04162ed3d211796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-b=
lack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-b=
lack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e5013f04162ed3d2117=
96b
        failing since 0 day (last pass: v5.13-3495-gfbf137d9483a, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
d2500cc                 | x86_64 | lab-clabbe      | gcc-8    | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fc92f15ec45f14117980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/bas=
eline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/bas=
eline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fc92f15ec45f14117=
981
        failing since 0 day (last pass: v5.13-rc4-286-g6bd26f0b60ab, first =
fail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
d2500cc                 | x86_64 | lab-clabbe      | gcc-8    | x86_64_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fde744884d5f94117982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/x86_64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/x86_64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fde744884d5f94117=
983
        failing since 0 day (last pass: v5.13-rc4-286-g6bd26f0b60ab, first =
fail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
d2500cc                 | x86_64 | lab-clabbe      | gcc-8    | x86_64_defc=
on...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4ffc79f4243f2c8117983

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/base=
line-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/base=
line-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4ffc79f4243f2c8117=
984
        failing since 0 day (last pass: v5.13-rc4-286-g6bd26f0b60ab, first =
fail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
hip07-d05               | arm64  | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fb4906ce10301111799f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fb4906ce103011117=
9a0
        failing since 0 day (last pass: v5.13-1843-g646572bd9313, first fai=
l: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
imx8mp-evk              | arm64  | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fb746b60a1b9541179a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/bas=
eline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fb746b60a1b954117=
9aa
        new failure (last pass: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb    | arm    | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fa0758f80ee20b117977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fa0758f80ee20b117=
978
        failing since 232 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb    | arm    | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fa00205e295c8e117976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fa00205e295c8e117=
977
        failing since 232 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb    | arm    | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fa23f97a02df3111796d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ver=
satilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fa23f97a02df31117=
96e
        failing since 232 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb    | arm    | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4f99a1ae93f654111797a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4f99a1ae93f6541117=
97b
        failing since 232 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb    | arm    | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e50dc5deb9e0376211796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e50dc5deb9e03762117=
96b
        failing since 232 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch   | lab             | compiler | defconfig  =
                  | regressions
------------------------+--------+-----------------+----------+------------=
------------------+------------
sun50i-a64-bananapi-m64 | arm64  | lab-clabbe      | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4fb49bd03caf5ca117979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-12051=
-g62c20406acf9b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/=
baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4fb49bd03caf5ca117=
97a
        new failure (last pass: v5.13-11972-g079b16c442fd) =

 =20
