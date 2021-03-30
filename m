Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37ACB34E0EE
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 07:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbhC3F6a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 01:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbhC3F6O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 01:58:14 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14328C061762
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 22:58:14 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id v186so10929285pgv.7
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 22:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EmRMnqgBh/mrVO5PA1hLAli09xp6neBEMmE5cO7tOMU=;
        b=BpsSR37FtYh/3a9CyfSin9VXpKVFmgOxEZlAA3VmmA8Nb2nja9UnIXJWg+Jcp+nKIV
         l+HHsM2YNFI9WbA0TNz1iz+xr1msPBZs1ymn/a7MtyRDKDFty5WQT39klpBF5jylKoI9
         JtRL+GZF3R4gB1nmZngBQIZz2IZL4UeB/IyqWOoiGJayMd7+549MQBcvtKh3Y+6BCLRn
         8QbuWkkNs172TvgUEzmfQKpDgAtwXwX+ewy4A3NXZjpbQjQzTYQGlTF3U2FeZOH8rAg4
         HpJei149O+CN4n2WJ2fK40/UyF0ceWzBEhODXvi/yr6xy1ruJRm1NFzg2QlebufPdWOb
         REdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EmRMnqgBh/mrVO5PA1hLAli09xp6neBEMmE5cO7tOMU=;
        b=Tm2zUxMXo8T+vmTadF9lIhUeg6khvuk7vS0vs7pEQWD8grNKEauoCb3h5lZ0hKA48H
         e/BWZiJcfrEp7isByF5Qxsf+7n697yCwzQVcc7Ho9AcRBisWIyCtIIW2wlqNGv0Qx3bO
         BXiQVjIWDeti2GkHAP0Bs2kZxC+bW9BtIjuSz44323T3d1m69/TQ/W0AwYicZEwe84t+
         suLT0Fod/5zibnBouHhhhq3C1Gi1ZmF4vbvpyuBxK1wX6OfD93dwuFyeHdH2RkPr+PPq
         ZuOgSKx63xOxY8/5HcTw1hoBgcaaJiihz4SjOck/8FVAnn+UZ75nt5kNo+0ved9paF0F
         rRUQ==
X-Gm-Message-State: AOAM530zKrgBMZhaGXLUInl20RJF7f8KFO7QHbI8J9qSmWDX2lMh61kf
        hQsGRjjZOvHwp9u8+0MOPy1DD0DUggwK2Ml/
X-Google-Smtp-Source: ABdhPJzY0YIFCCuCqdLHJt47Up2we5zCbvaflKVDfNm6fLJyWATGDSrsYVZzTLZecIjCPGVcU1Bu9g==
X-Received: by 2002:a05:6a00:8d2:b029:224:f17:afc2 with SMTP id s18-20020a056a0008d2b02902240f17afc2mr18288428pfu.50.1617083893411;
        Mon, 29 Mar 2021 22:58:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m7sm1507129pjc.54.2021.03.29.22.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 22:58:12 -0700 (PDT)
Message-ID: <6062bdf4.1c69fb81.4dd1c.3f08@mx.google.com>
Date:   Mon, 29 Mar 2021 22:58:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.12-rc5-216-ga7d2b547a0237
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 344 runs,
 7 regressions (v5.12-rc5-216-ga7d2b547a0237)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 344 runs, 7 regressions (v5.12-rc5-216-ga7d2b5=
47a0237)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc5-216-ga7d2b547a0237/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc5-216-ga7d2b547a0237
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a7d2b547a0237a6ae791a40168613a9536f9d773 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/606286fb2170b6906baf02bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606286fb2170b6906baf0=
2bc
        failing since 6 days (last pass: v5.12-rc4-316-g8d59c115a79a, first=
 fail: v5.12-rc4-389-ga27dcf51dcf16) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606283d1d5cd2a541faf02e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606283d1d5cd2a541faf0=
2e1
        failing since 133 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606283d9329fbb9840af02ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606283d9329fbb9840af0=
2af
        failing since 133 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606283d3ee46c3ecf8af031b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606283d3ee46c3ecf8af0=
31c
        failing since 133 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-collabora   | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/606297574d3e1843c7af02b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606297574d3e1843c7af0=
2ba
        failing since 133 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6062838b0e13166f6eaf02e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6062838b0e13166f6eaf0=
2e7
        failing since 133 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/606288aa96bb7be01faf02fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
16-ga7d2b547a0237/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606288aa96bb7be01faf0=
2fc
        new failure (last pass: v5.12-rc4-610-g9320f904087da) =

 =20
