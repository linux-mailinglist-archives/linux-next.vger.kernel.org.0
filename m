Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F020F33AA22
	for <lists+linux-next@lfdr.de>; Mon, 15 Mar 2021 04:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhCODtc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Mar 2021 23:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhCODtP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Mar 2021 23:49:15 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7C7C061574
        for <linux-next@vger.kernel.org>; Sun, 14 Mar 2021 20:49:15 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id j6so14610163plx.6
        for <linux-next@vger.kernel.org>; Sun, 14 Mar 2021 20:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cJ8yr0YkAdopAOWyPh9Xw/vlQRmRwHKf2bykCEpytCA=;
        b=fsPWk117csKfTtzLXyTYEUMppUlL8lacVkpJV+G6JWG06ABOSx3wmlO9bWXDV1I5mz
         /HiKYTE8LWAn1AdmhG1lsfB6RoCtYGH2Xw/Es0n65qXpbgdWWKKfitdM9EBsGHoe6IMM
         dGwK9j/SKGXDrDipynT9UBrz0eh3XpBKWBTgfnhNgEZybBeMyGcgRG1R95RCpCV0xz+3
         +bQiPBk1GMDF4NZZILm/aa5kcSEstZV8WBLi/Vs6dHMSvvgAKADn48r74o8k8b373OaX
         ZajlyIsqCe9uPhnJpXE5FpTGgRFibofx9tArXZPuNPahKhrQuIl0dqV5N3kOIQId3yRH
         NRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cJ8yr0YkAdopAOWyPh9Xw/vlQRmRwHKf2bykCEpytCA=;
        b=QzLSE1LJ+kSkTP8ABwPNAq3ekp4ugoO5DlY28l8J/FP5uv7SXFRuMw31BomnMlRpuJ
         eC7wCGXj5qQhvDzsDcP4+1rioLOUlxE5nA43xOsoYELWTPcOqq45/Vg8zDs3WOqQzikA
         1STr+uWxNpA2KsQHj7kwMO0SGSjIC3SkT42wheEMXFqUC2P2znyyiDXR1B7rL9990prs
         Pk19S3nhSsFCcseP5EADLRGdO1z4a4b/AfeENek5Z6snueAopxRtJu9vKuoPY8WdQBJz
         BoHn2uts2j+KufjEm98NxMc2jiMMLBGkk/fcOWgwlGiz5sx8pZouJqbAput99Xqrm1yf
         /Thw==
X-Gm-Message-State: AOAM533YKtc8trqS7Q87a0a9pwb//Yl+crqiNzd60aMvqpdJbnhfLYLH
        qXBMcGPui3B20oTEDYe1W2vrpwGZjUj5VQ==
X-Google-Smtp-Source: ABdhPJxNiI/r3Myw2jEIpEHXJWrt51RZpyvNEuLYwWeIJppbMOz1GQphTjxy+bJMmyb8pta35EkKZg==
X-Received: by 2002:a17:902:d508:b029:e5:fedb:9f39 with SMTP id b8-20020a170902d508b02900e5fedb9f39mr9274909plg.23.1615780154311;
        Sun, 14 Mar 2021 20:49:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c128sm10833066pfc.76.2021.03.14.20.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 20:49:13 -0700 (PDT)
Message-ID: <604ed93a.1c69fb81.f413.ac52@mx.google.com>
Date:   Sun, 14 Mar 2021 20:49:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc2-870-g3b7fc5bf0ea25
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 345 runs,
 5 regressions (v5.12-rc2-870-g3b7fc5bf0ea25)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 345 runs, 5 regressions (v5.12-rc2-870-g3b7fc5=
bf0ea25)

Regressions Summary
-------------------

platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
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


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc2-870-g3b7fc5bf0ea25/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc2-870-g3b7fc5bf0ea25
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3b7fc5bf0ea25f2f9811136b3aeb3fa285496297 =



Test Regressions
---------------- =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/604ea045bd289fcf1caddcb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-8=
70-g3b7fc5bf0ea25/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-8=
70-g3b7fc5bf0ea25/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604ea045bd289fcf1cadd=
cb9
        failing since 118 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/604ea04d47b1e7c6ddaddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-8=
70-g3b7fc5bf0ea25/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-8=
70-g3b7fc5bf0ea25/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604ea04d47b1e7c6ddadd=
cb2
        failing since 118 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/604ea034c56a0fe7d8addce2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-8=
70-g3b7fc5bf0ea25/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-8=
70-g3b7fc5bf0ea25/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604ea034c56a0fe7d8add=
ce3
        failing since 118 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/604e9fdee633812df0addce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-8=
70-g3b7fc5bf0ea25/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-8=
70-g3b7fc5bf0ea25/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604e9fdee633812df0add=
ce6
        failing since 118 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab             | compiler | defconfig       =
    | regressions
---------------------+------+-----------------+----------+-----------------=
----+------------
qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig | 1          =


  Details:     https://kernelci.org/test/plan/id/604e9fefbabc198a59addcc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-8=
70-g3b7fc5bf0ea25/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc2-8=
70-g3b7fc5bf0ea25/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/604e9fefbabc198a59add=
cc1
        failing since 118 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
