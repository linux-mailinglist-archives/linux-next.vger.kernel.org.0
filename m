Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5022E9AD6
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 17:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbhADQSO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 11:18:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbhADQSN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2021 11:18:13 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3290EC061793
        for <linux-next@vger.kernel.org>; Mon,  4 Jan 2021 08:17:33 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id be12so14796246plb.4
        for <linux-next@vger.kernel.org>; Mon, 04 Jan 2021 08:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MUlaXZ8L5tPkrM0+Be+6s0RwRzi0LDVcpnf9xr6C8jM=;
        b=OVFdALEeJMGC+ztejVWBYb5b/jpKNz2FQ+NLatnFrpbpghVwxvNEVILV9+drlboeoE
         ABdszKzs6v5TccAMETGG6yxnk3vpktjaMUaRWXY5XUZOO0uSXOnH/lbuUYX2cg6CqQsx
         bm7vFMBRZ69R8dgjv3Pi1uwW9JZ9p7qadjC86vR0D9pEivRHfeD65kY7bSQTByqJGqLE
         KjG7y5ogWANRvENlTCYXLKZxsrl7zZGZ+8+FLLZaJzcTliemCK+pRwlutFYzYORYq6zO
         qsJDV89z0oH7d9q1W+AnPKH3CsA3W6Ob6/JOyZLxpbyCH5sIJx71SXTRilrMMNHIMoSK
         VsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MUlaXZ8L5tPkrM0+Be+6s0RwRzi0LDVcpnf9xr6C8jM=;
        b=kloph8pG1s7lFy+WaukCCX2smimcG4PjvCZKGGN+oaJI3IgQpRudftfILBIzHqh71E
         w/Y66xMVIIX+L5v5Qc5URo3JUeDRm6svHwnnE56NVYUoI7+BNlapJHHHSvAOj0VsAZ/L
         KxRMtU5idmlB0Ssxt0KZJbiax+f/VjHcgv58X6w+GZC1faDrsSh6q0tcXr+LtSiEH4XI
         xnqa29hDWOA1/oBWa/TlcAG4IVSvTfHf4DaUdlYkJFZzpQujd0R2sG3oN8v1ipLKdIWr
         EE97W9Rr7XR/RJn3+1DgqSjwruXnd2Fq4KYq9t19HHcDVp3MToy0QMIMWLykA80fyMRy
         awaQ==
X-Gm-Message-State: AOAM5333iGayD1lwZ+KdV5jwWQ6RhJ0h8lGAYK0IjpqInmdlEc4WAN36
        b0fkaydcIR9ZYheLbAhUsLWLOgCykRXRKQ==
X-Google-Smtp-Source: ABdhPJwlaFxeD6QhBsRchuPVzdf0axrcJtm9jbxxTsfNIQf3UJlP0gem0dSixlZuRzbJd2SGJSgCwQ==
X-Received: by 2002:a17:90a:193:: with SMTP id 19mr30348032pjc.45.1609777052338;
        Mon, 04 Jan 2021 08:17:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u15sm22148460pju.7.2021.01.04.08.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 08:17:31 -0800 (PST)
Message-ID: <5ff33f9b.1c69fb81.e0866.fd2d@mx.google.com>
Date:   Mon, 04 Jan 2021 08:17:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.11-rc1-371-g2162e9061eba
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 287 runs,
 10 regressions (v5.11-rc1-371-g2162e9061eba)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 287 runs, 10 regressions (v5.11-rc1-371-g2162e=
9061eba)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
hsdk                       | arc   | lab-baylibre  | gcc-8    | hsdk_defcon=
fig               | 1          =

imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =

sun8i-h3-orangepi-pc       | arm   | lab-clabbe    | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc1-371-g2162e9061eba/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc1-371-g2162e9061eba
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2162e9061eba35e734894e686059e2ea32aa0f33 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
hsdk                       | arc   | lab-baylibre  | gcc-8    | hsdk_defcon=
fig               | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff308b977d6b59722c94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: hsdk_defconfig
  Compiler:    gcc-8 (arc-elf32-gcc (ARCompact/ARCv2 ISA elf32 toolchain 20=
19.03-rc1) 8.3.1 20190225)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arc/hsdk_defconfig/gcc-8/lab-baylibre/baseline-hsdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arc/hsdk_defconfig/gcc-8/lab-baylibre/baseline-hsdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arc/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff308b977d6b59722c94=
cc3
        failing since 18 days (last pass: v5.10-3862-g077e992aebce4, first =
fail: v5.10-9016-g31c318f75dc4) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff308d622b5a8d01bc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff308d622b5a8d01bc94=
cba
        failing since 70 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff30c6c962f09cceac94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff30c6c962f09cceac94=
cc6
        failing since 17 days (last pass: v5.10-9016-g31c318f75dc4, first f=
ail: v5.10-11328-gc41c506b38eb) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff30ed12aa856cfbac94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff30ed12aa856cfbac94=
ccf
        new failure (last pass: v5.10-12915-g8aac4d597bbbb) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff30897c9f7b189cbc94cd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff30897c9f7b189cbc94=
cd3
        failing since 17 days (last pass: v5.10-3862-g077e992aebce4, first =
fail: v5.10-11328-gc41c506b38eb) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre  | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff303e48202a735fdc94ce0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff303e48202a735fdc94=
ce1
        failing since 49 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff303ed3f80d50918c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff303ed3f80d50918c94=
cba
        failing since 49 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip       | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff303eb75b0b3bf04c94cbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff303eb75b0b3bf04c94=
cbd
        failing since 49 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff3039f9613954a0cc94ce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff3039f9613954a0cc94=
ce6
        failing since 49 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun8i-h3-orangepi-pc       | arm   | lab-clabbe    | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff30a05f72a64341dc94ce6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-h3-=
orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc1-3=
71-g2162e9061eba/arm/multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-h3-=
orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff30a05f72a64341dc94=
ce7
        new failure (last pass: v5.10-12915-g8aac4d597bbbb) =

 =20
