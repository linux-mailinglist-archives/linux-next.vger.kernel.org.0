Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651FA31B3FB
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 02:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhBOBih (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 20:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbhBOBig (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 20:38:36 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CD3C061574
        for <linux-next@vger.kernel.org>; Sun, 14 Feb 2021 17:37:56 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id q20so3243842pfu.8
        for <linux-next@vger.kernel.org>; Sun, 14 Feb 2021 17:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NZKTx8GXwZX3Sjogje5Br5FczwXLhdcWg0p5NfsKr8Q=;
        b=Gn91tnXxgJkMNDBb0Cuwl2wkartFcvYF6H3cS/wcuyR7+0urJHa8S4gRpGjTyMYdc7
         nEndVNGDTsum7E0YCjUmUN0XOvVTXmTNQBE3ua0VdNKh64W+uAsaHmUrb2f/7yHn7+DA
         d6WtciceDrR1Dyb1aILbTf7e3vWQzBQQGQZGHZmYqilsGvX/HRmwf74Sk/rYmefI4pNi
         deq+PohezPFZw5ovYCYIZ/sDuxZnXvg3LjKZhrhcfen3bRLPUSYwgLIxu2uz/c8HFJCd
         zREwP2o3mDeP0TMUB6KtRKNVmaJnOWChlAc2rEnZj8wl2cI9qA0f9HXgGK9FOQmPlnbM
         iEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NZKTx8GXwZX3Sjogje5Br5FczwXLhdcWg0p5NfsKr8Q=;
        b=FpJkv41u0WrTg9XySVmG+RsZHT9cPOXGZB5E0GDlFGGU7yXRTr+CBjqAohzSqf1QHz
         xnhLs6WT5oa0JKg7Mc9TpsYvCtBSjollvYGk0aPlyLS/BUURSTjJGx1vUIH/jNbyqj5u
         /ciXxs1+Qi3xDH4tlDp20xvRZWZw+zJURjGsl61IOlsJztp9iCrTIJsSRprxowhDON0Z
         oQoGuBvPiD3AIRoAUX045WeQLMUxpV5GLAhut4s5GYtCqyYUuIuxnrOyCWLk4/o7U/SO
         oi7RLjL3eFrsk96r+N8PJOkxSPVzUIMWiIuKmNnNQ4Y8uo4Xa/RwHGteQhHh4M6GSSUf
         qJWg==
X-Gm-Message-State: AOAM531i7Jw80WWOyPM13fNoON9qAbGZ19KO0X5R37HjE+HTOJfmMBr6
        F+dpkCh2pPKPye7eDA8ak/nHU9jxVIGB5A==
X-Google-Smtp-Source: ABdhPJwqNiOdrJTRbA3qJQ3qfugeTF+GfCRRdXumo3P3BTWOc/IaBryhTAjyhWdQwKo4op2LkpiILA==
X-Received: by 2002:a63:e10b:: with SMTP id z11mr12911830pgh.40.1613353075632;
        Sun, 14 Feb 2021 17:37:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id lr7sm14508224pjb.56.2021.02.14.17.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:37:55 -0800 (PST)
Message-ID: <6029d073.1c69fb81.d3e0c.eeed@mx.google.com>
Date:   Sun, 14 Feb 2021 17:37:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.11-rc7-273-g095727507311
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 150 runs,
 4 regressions (v5.11-rc7-273-g095727507311)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 150 runs, 4 regressions (v5.11-rc7-273-g095727=
507311)

Regressions Summary
-------------------

platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15        | arm  | lab-linaro-lkft | gcc-8    | multi_v7_def=
config           | 1          =

imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
config           | 2          =

imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc7-273-g095727507311/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc7-273-g095727507311
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      09572750731107d9ddfd868ce1bcab227b926825 =



Test Regressions
---------------- =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15        | arm  | lab-linaro-lkft | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/60299d755b2c5040ed3abe62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-2=
73-g095727507311/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57=
xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-2=
73-g095727507311/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57=
xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60299d755b2c5040ed3ab=
e63
        failing since 1 day (last pass: v5.11-rc7-121-gdfed2943da0a, first =
fail: v5.11-rc7-192-g055e690de1b2) =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
config           | 2          =


  Details:     https://kernelci.org/test/plan/id/60299d4cd3641e84733abe66

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-2=
73-g095727507311/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-v=
ar-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-2=
73-g095727507311/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-v=
ar-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60299d4cd3641e8=
4733abe6c
        new failure (last pass: v5.11-rc7-192-g055e690de1b2)
        4 lines

    2021-02-14 21:59:03.601000+00:00  kern  :alert : Unhandled fault: align=
ment exception (0x001) at 0xcec60217
    2021-02-14 21:59:03.602000+00:00  kern  :alert : pgd =3D (ptrval)
    2021-02-14 21:59:03.602000+00:00  kern  :alert : [<8>[   38.992700] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D4>
    2021-02-14 21:59:03.603000+00:00  cec60217] *pgd=3D1ec1141e(bad)   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60299d4cd3641e8=
4733abe6d
        new failure (last pass: v5.11-rc7-192-g055e690de1b2)
        26 lines

    2021-02-14 21:59:03.660000+00:00  kern  :emerg : Process kworker/1:1 (p=
id: 59, stack limit =3D 0x(ptrval))
    2021-02-14 21:59:03.661000+00:00  kern  :emerg : Stack: (0xc258beb0 to<=
8>[   39.040222] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail U=
NITS=3Dlines MEASUREMENT=3D26>
    2021-02-14 21:59:03.661000+00:00   0xc258c000)
    2021-02-14 21:59:03.661000+00:00  kern  :emerg : bea0<8>[   39.051143] =
<LAVA_SIGNAL_ENDRUN 0_dmesg 724548_1.5.2.4.1>
    2021-02-14 21:59:03.662000+00:00  :                                    =
 1e9b10fe 21d3de7a c32b2600 cec60217   =

 =



platform                 | arch | lab             | compiler | defconfig   =
                 | regressions
-------------------------+------+-----------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm  | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60299edce5d9d043dd3abeea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-2=
73-g095727507311/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-2=
73-g095727507311/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60299edce5d9d043dd3ab=
eeb
        new failure (last pass: v5.11-rc7-192-g055e690de1b2) =

 =20
