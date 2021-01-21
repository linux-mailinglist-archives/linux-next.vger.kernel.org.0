Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CB02FE0E2
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 05:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbhAUEjO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 23:39:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbhAUEFB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jan 2021 23:05:01 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55A7C061757
        for <linux-next@vger.kernel.org>; Wed, 20 Jan 2021 20:04:21 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id t6so564657plq.1
        for <linux-next@vger.kernel.org>; Wed, 20 Jan 2021 20:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Rg7DMfkHAfQ2IldsznFw+Uo1kpN7A1Js+kD7cWlyvmU=;
        b=mlotVtMQR+3I5hsplwxcRNMODmrZHlnYl9BWTiKlLXIVNyfTyuV4pA9ZceOGJA92BJ
         LOnjpZcQsNpkEZmL2LSp02VcX3+gVPfL7Cx4/s+hzf8GN/KNtGO/7qS3j5ofI0pTFFre
         nL24FlGANXRX5Bm6NSjtdkA9n8kZH1LDXs9Pz9v7hsZF+vJrhZ7FWmb6bSQtNhNo3IOA
         XMd9rU6uj4/jj3Z+fC0Xtl+P8V6jADllUPRLhQZeOIgzt6r9641Vf2j72NY4Imya5Zlj
         r4YCvC0udDI6uBcog46ZS0vYppeU2i1GoIXpLPaEIu/2dL2+q6S/7lE8oSGMYFdTmwJO
         9eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Rg7DMfkHAfQ2IldsznFw+Uo1kpN7A1Js+kD7cWlyvmU=;
        b=A60LP33cw7f+e0kUvWXY3KPdTmDQT/VVE/iIt0Lcwy2MjmmTwmcNdKcMZxaF8brVwg
         kYzy/9SVwStklIExV0r0MjpH1eChQZQfYHFA5O6eONaCB7z+Nxmk8owT0hfLlMWqDMdU
         Jc2kx8iJ1uf7dQvA+26d5w2hq0aK7XVxd6NZ7sIPbSB65bfT2PaOE5V08sTemtT5kh8t
         EWIibb79x41fXtgRyfTWQby7rncuIqUhMFQG/MerKaaCRNUGu6UeXvzEDmMmAH/lvZAS
         26bijC1x1qa87E1o3OGdmJ0ClVUXOzvfkpabH16fx/xbI6sCjxU04o0Bxe1N+KSIRj2/
         orNg==
X-Gm-Message-State: AOAM531S2Z9qZYLItKZlYEMozuw0zMLXrOMgI5lwPSEfc+IHa0UjQj/n
        0IP84vSls1LjA+MWqeH++4BuKX/LRuGqsg8a
X-Google-Smtp-Source: ABdhPJzL6eFaEdrZW//W+3ZtkqU11awsnosg14LLbvS5QjeaR+YQzgGjmcyzQDrFku9i9Hh2pi7cBQ==
X-Received: by 2002:a17:90a:588d:: with SMTP id j13mr9549833pji.50.1611201860706;
        Wed, 20 Jan 2021 20:04:20 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s18sm3901281pju.36.2021.01.20.20.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 20:04:19 -0800 (PST)
Message-ID: <6008fd43.1c69fb81.6c1a3.a5e0@mx.google.com>
Date:   Wed, 20 Jan 2021 20:04:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.11-rc4-315-gcbe1658e272d
Subject: next/pending-fixes baseline: 285 runs,
 9 regressions (v5.11-rc4-315-gcbe1658e272d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 285 runs, 9 regressions (v5.11-rc4-315-gcbe165=
8e272d)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre    | gcc-8    | bcm2835_def=
config            | 2          =

imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc4-315-gcbe1658e272d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc4-315-gcbe1658e272d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cbe1658e272d11bba8e73f6433f613d0b50c58d3 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre    | gcc-8    | bcm2835_def=
config            | 2          =


  Details:     https://kernelci.org/test/plan/id/6008c409e2078190ecbb5d1d

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6008c409e207819=
0ecbb5d21
        new failure (last pass: v5.11-rc4-275-g31be679b2913)
        16 lines

    2021-01-20 23:59:52.789000+00:00  kern  :alert : Unable to handle kerne=
l paging request at virtual address c075aba0
    2021-01-20 23:59:52.789000+00:00  ke<8>[   15.777391] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2021-01-20 23:59:52.790000+00:00  rn  :alert : pgd =3D 412b86fc   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6008c409e207819=
0ecbb5d22
        new failure (last pass: v5.11-rc4-275-g31be679b2913)
        146 lines

    2021-01-20 23:59:52.795000+00:00  kern  :alert : 8<--- cut here ---
    2021-01-20 23:59:52.796000+00:00  kern  :alert : Unable to handle kerne=
l paging request at virtual address c075aba0
    2021-01-20 23:59:52.797000+00:00  kern  :alert : pgd =3D aafa178b
    2021-01-20 23:59:52.797000+00:00  kern  :alert : [c075aba0] *pgd=3D0060=
840e(bad)
    2021-01-20 23:59:52.831000+00:00  kern  :alert : 8<--- cut here ---
    2021-01-20 23:59:52.832000+00:00  kern  :alert : Unable to handle kerne=
l paging request at virtual address c075aba0
    2021-01-20 23:59:52.833000+00:00  kern  :alert : pgd =3D 6fd2dea1
    2021-01-20 23:59:52.833000+00:00  kern  :alert : [c075aba0] *pgd=3D0060=
840e(bad)
    2021-01-20 23:59:52.834000+00:00  kern  :alert : 8<--- cut here ---
    2021-01-20 23:59:52.834000+00:00  kern  :alert : Unable to handle kerne=
l paging request at virtual address c075aba0 =

    ... (141 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6008c9425a30d087fbbb5d39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6008c9425a30d087fbbb5=
d3a
        new failure (last pass: v5.11-rc4-275-g31be679b2913) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6008c8bb43d697a01cbb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6008c8bb43d697a01cbb5=
d0c
        new failure (last pass: v5.11-rc3-364-g5bd8ecf03410) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6008c2712c43cc2882bb5d0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6008c2712c43cc2882bb5=
d0d
        failing since 65 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6008c27185560d89b2bb5d0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6008c27185560d89b2bb5=
d0d
        failing since 65 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6008c2656104933045bb5d37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6008c2656104933045bb5=
d38
        failing since 65 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6008c22f16f9b31329bb5d3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6008c22f16f9b31329bb5=
d3e
        failing since 65 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6008c23f6104933045bb5d11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc4-3=
15-gcbe1658e272d/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6008c23f6104933045bb5=
d12
        failing since 65 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
