Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 996E0347D8F
	for <lists+linux-next@lfdr.de>; Wed, 24 Mar 2021 17:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbhCXQVG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Mar 2021 12:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234750AbhCXQUn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Mar 2021 12:20:43 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C277C061763
        for <linux-next@vger.kernel.org>; Wed, 24 Mar 2021 09:20:43 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id l1so14941000pgb.5
        for <linux-next@vger.kernel.org>; Wed, 24 Mar 2021 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TsjkJre8FoSHTWXQRRc/lYLYDatuCPsdrQJ4VUYaNMg=;
        b=2FppFUK6OHQ99f4fG3Db+yM005Qt2HzPySUWpKXFT9zt++sNYu1t/1fTudtmzVVgZW
         UhtJxMQRuZNK0sI7SRHFrnMgGbvkZ9UYzIH/y9p7ct+kVc49nVFwu2LZANzOrf5Cl5tk
         xY6AXd54XVSI42wKiIl5p8FyKYGLiF30gNmwbQhFFvHDUbtg8VaQ4LA51+fCXnE1o/kn
         BjtHKrrRk3ws+xRmwNtu1hXZ83tIGmQap+RYLQpGsoGbhvTR0y4IwzbuSaC0dJACnsxR
         FZzV4YQyXGxz1SYtySOOMOZXNE9KjCv0i9PtAt5QR0OPw0zSl0xkX8vkyjT86AO/sr40
         FfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TsjkJre8FoSHTWXQRRc/lYLYDatuCPsdrQJ4VUYaNMg=;
        b=trEyJttW5Q1eeI0X31nVRZQy4dod1W2a9wP8wEYTMKUMI7kqqPxuaIxnxiEzGCQBxQ
         qXghj4cS4Zgu1u/cKEFQKuiMFMmxploc1S4dqxfFte95Vc7pZ0hChVX71oDgqMqH54SS
         kOgwqRsrOE4p8ybumANr1Jg1y78tzsfYKilPhjNjEsuu9V68/NXsR8hdXxwEDpAzAIba
         RR+sg5XUEF/dkHu8d6Glng5ivTyv3ykcZw3q4DbuOLYsxnnp0OQs7GWQo8lqTrQp8LjG
         MrvMZddojTjNAkfSfm92MVVb1/wnGdqYTCF8rEw1AuEYnYVhkTNDlMwjm/FIVd2cETWc
         kq5Q==
X-Gm-Message-State: AOAM532xqimlybr9Pya6ZBwUvB5OGUh/ax2rP0o4aZ2lL99uTWKov4GA
        li4trfcfnukABNu5g28/wfaB62CZJCR+SA==
X-Google-Smtp-Source: ABdhPJx2XYuVT1TK8epC3hBgT6LnbQ0KMsOfrMdgdI8wEjqRUh4cpK1GCxpvwF2uiewId2oo+kkIPw==
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr3822561pgm.186.1616602842540;
        Wed, 24 Mar 2021 09:20:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b19sm2991190pfo.7.2021.03.24.09.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:20:42 -0700 (PDT)
Message-ID: <605b66da.1c69fb81.c0fd4.7396@mx.google.com>
Date:   Wed, 24 Mar 2021 09:20:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210324
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 291 runs, 6 regressions (next-20210324)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 291 runs, 6 regressions (next-20210324)

Regressions Summary
-------------------

platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
beaglebone-black     | arm  | lab-cip         | gcc-8    | multi_v7_defconf=
ig  | 1          =

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
210324/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210324
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      20f1b5f9c07ca3a49e869327d4705b4254258756 =



Test Regressions
---------------- =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
beaglebone-black     | arm  | lab-cip         | gcc-8    | multi_v7_defconf=
ig  | 1          =


  Details:     https://kernelci.org/test/plan/id/605b2ace688f3243dfaf030d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210324/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210324/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605b2ace688f3243dfaf0=
30e
        new failure (last pass: next-20210323) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/605b29924cef0be42faf02b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210324/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210324/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605b29924cef0be42faf0=
2b8
        failing since 126 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/605b29886280ca3423af0356

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210324/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210324/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605b29886280ca3423af0=
357
        failing since 126 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/605b2bf6989f472947af02f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210324/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210324/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605b2bf6989f472947af0=
2f6
        failing since 126 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/605b292736224022fdaf02ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210324/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210324/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605b292736224022fdaf0=
2bb
        failing since 126 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/605b29d6fe753b1bacaf02af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210324/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210324/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/605b29d6fe753b1bacaf0=
2b0
        failing since 126 days (last pass: next-20201113, first fail: next-=
20201117) =

 =20
