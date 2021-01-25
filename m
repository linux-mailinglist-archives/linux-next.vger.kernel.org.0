Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944B5302E91
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 23:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733039AbhAYWBD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 17:01:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733014AbhAYWAw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 17:00:52 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509B0C0613D6
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 14:00:12 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id o20so9225600pfu.0
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 14:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GY20zwPNwH0+sXow2NrQoA8afRDCcrdsk+kDiUsSBCU=;
        b=zI8uliUtZ8p+H74x857gVg6VM6Ead+Qu/R/hXM8QnD6xQpEj8Vj4gufiZ9kndVqnb4
         MFhh6f8yrE2Y+pKXtoq5eGAiwh7VeNmrQs8ZX3BcUMZXyJsjZbkceNrvoznuDNiP42wZ
         qDjrnIZmnLGKld1RzZA97AqXhNnT9G3r5kfFsLgwIT1LQkcDJSmvbJC9FPevEmcdmBuN
         E/w+n0KG781OseBY15lWd2Gj7rq7jFl7fICkU+vHx0Qshnjwdv/ijGXRhe89eMqg2mN3
         zpcm3gigSB7qfthCmYv13bhbo9FBXLv2hKarXYZb+Ri1TJnEv3j0+Kzjp8xpAbJqNY/P
         Z7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GY20zwPNwH0+sXow2NrQoA8afRDCcrdsk+kDiUsSBCU=;
        b=eiATbKmvPEq5zShZJA5Fb6oLaYs7YQD2rjvcFChIGaDj9TRzxS8j4KlbrS8KL4+RuF
         dZBzXoF24+eEn6dkdJVbc7T00O5lI00FmPMoc3elb1ueZA1wAstqNSsbyhCLQ5275TRe
         1wvxVVGVJcv5evcVrJMc+GzzOKkUG4iGIY79iJy5pgYKrtNH0MTiq8uaV2b18Swo41rH
         d02YcRyqrS3/tJj0Tf/yy2feVWaDzccr6efx10NFg0ZGvXxtYBxgbUn6tCzDm0fiDxBo
         VtTEmr+s//SpKDzgsXqBHEG8aW84Rmw4JTi3Yt0USQmf6Dt3Pg0cO+9ij0EYyChhiGVZ
         VbmQ==
X-Gm-Message-State: AOAM532y0L/Dhxk/1B3HnW1ggSW3acDpYuILITxQJCxxaliFkcwHEwwo
        RLiITFdedFsxxH3BpkLbvFOBMQFAQut2mGvn
X-Google-Smtp-Source: ABdhPJweVu6/aa0YiVFM6MdVXqET6grq1o4fsFANcTPSkwOXU1WMOA+F5Krpq4BHDW7tafFEYIApLQ==
X-Received: by 2002:a63:e058:: with SMTP id n24mr2540459pgj.345.1611612011540;
        Mon, 25 Jan 2021 14:00:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b26sm13822473pfo.202.2021.01.25.14.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 14:00:10 -0800 (PST)
Message-ID: <600f3f6a.1c69fb81.f887c.085c@mx.google.com>
Date:   Mon, 25 Jan 2021 14:00:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-rc4-510-gb26032ee8758
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 215 runs,
 7 regressions (v5.11-rc4-510-gb26032ee8758)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 215 runs, 7 regressions (v5.11-rc4-510-gb26032=
ee8758)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-sabresd            | arm    | lab-nxp       | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =

imx6q-var-dt6customboard | arm    | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

qemu_arm-versatilepb     | arm    | lab-baylibre  | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-broonie   | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-cip       | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-collabora | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_x86_64              | x86_64 | lab-broonie   | gcc-8    | x86_64_defco=
nfig             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc4-510-gb26032ee8758/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc4-510-gb26032ee8758
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b26032ee875808981e9330cf5b28e5b49416690f =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-sabresd            | arm    | lab-nxp       | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600f0d59d462b91debd3e029

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f0d59d462b91debd3e=
02a
        failing since 91 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-var-dt6customboard | arm    | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/600f09c460d34ecd44d3dfd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f09c460d34ecd44d3d=
fd4
        failing since 4 days (last pass: v5.11-rc4-275-g31be679b2913, first=
 fail: v5.11-rc4-315-gcbe1658e272d) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm    | lab-baylibre  | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600f06cd6d58cf801cd3dfec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f06cd6d58cf801cd3d=
fed
        failing since 70 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm    | lab-broonie   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600f06e9465b3af5e4d3dfe5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f06e9465b3af5e4d3d=
fe6
        failing since 70 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm    | lab-cip       | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600f06c3cb746db2cfd3dfd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f06c3cb746db2cfd3d=
fd1
        failing since 70 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm    | lab-collabora | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600f068a0968111e15d3dfe6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f068a0968111e15d3d=
fe7
        failing since 70 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64              | x86_64 | lab-broonie   | gcc-8    | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/600f04f2ab2b6ed84fd3e01d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/x86_64/x86_64_defconfig/gcc-8/lab-broonie/baseline-qemu_x8=
6_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-5=
10-gb26032ee8758/x86_64/x86_64_defconfig/gcc-8/lab-broonie/baseline-qemu_x8=
6_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600f04f2ab2b6ed84fd3e=
01e
        new failure (last pass: v5.11-rc4-379-gdd9d91177430) =

 =20
