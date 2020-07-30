Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C8D232FF3
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 11:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgG3J4x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 05:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbgG3J4x (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 05:56:53 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEF8C061794
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 02:56:51 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id p1so13596336pls.4
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 02:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=b4MV/IHoUAdFk55xPCfjVSGIarqrOQsy1srlwjDpRck=;
        b=N7EZYhZ8BqDG4zVWOIACBCMc6dCchXvwrCqNHk8MJzsyufGFInzUEqTpFOl0RX5MYP
         +pQb8sHPAUNS2oMotE6KFcrp0QIGfw0YZiuWYK/4xTqkI/SJHWYrPG51Y3BISEwSS1sy
         nbar9pTXhBMipGwRjt9oITp3XDosIYJbZJropk+P+ZSxUQTfIQx6PVePacLdZQhhT4UA
         IneWk/JDVHjzORd5s+CARS/9ghsHQLQXIcYhvrpIZSVtaM5UHf8il8aySanSIgLEwDpA
         l1fM/bQ61BvdLbfjiiQP4WecfPbkRBE9XCTMfQVCxL1lU8L4RmYpCCLaAJeTyf+gJS/H
         HTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=b4MV/IHoUAdFk55xPCfjVSGIarqrOQsy1srlwjDpRck=;
        b=YJ6F3iROeuKs/cZBjSMXZ++sZ6D2uZA3hADl0QYQp43dtsm+ptCUa6875KNjDlZDuv
         7da9MIanwVgbj4HC+ErDaC019qbAwZ+CHqLiEvOnGuMVp4aPKeJiJ+ngxC5WHNOy5Uz/
         mJbEoc1ID6u/eXliJ/m8ek+ZvJuNL+ermGVNs8gY5aq8uUGYDtKlzj4ziOwKgonzI49l
         S+/VyYaZ1iA6/hEzJtvpYFBCD+TiKmrHu7bqIwAyHRd3MSjNfAwFn0u3WkN+aLutm2Nf
         Ttw5LPUtQ2zWB5cQSboZwFpxtGOCsC6HWoQN32vMr5rTp0RGjI/Z6qSMVJ7ebDfwqL+j
         j9Nw==
X-Gm-Message-State: AOAM531FZd8qPtr1LPg1ogtUkEMj+0jUNKaJnjKnKCYuBJi0Nzx53HS4
        1+/9dfJjFOqTK9NF01LF7NiJv4+ZSCg=
X-Google-Smtp-Source: ABdhPJwdbDuUfPnafmVeZ1cvr5GCsJCZ9IXEoJoZfZvVdSvl1V6ROIc5X4SSP+Ovf6pC5CbP32Sgwg==
X-Received: by 2002:a17:90b:19cc:: with SMTP id nm12mr14206454pjb.144.1596103010951;
        Thu, 30 Jul 2020 02:56:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g6sm5546775pfr.129.2020.07.30.02.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 02:56:50 -0700 (PDT)
Message-ID: <5f229962.1c69fb81.96352.01a2@mx.google.com>
Date:   Thu, 30 Jul 2020 02:56:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.8-rc7-165-ga7813a12c4b9
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 333 runs,
 9 regressions (v5.8-rc7-165-ga7813a12c4b9)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 333 runs, 9 regressions (v5.8-rc7-165-ga7813a1=
2c4b9)

Regressions Summary
-------------------

platform                | arch   | lab           | compiler | defconfig    =
                | results
------------------------+--------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained   | arm    | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =

bcm2837-rpi-3-b         | arm64  | lab-baylibre  | gcc-8    | defconfig    =
                | 4/5    =

meson-sm1-khadas-vim3l  | arm64  | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =

qemu_i386-uefi          | i386   | lab-baylibre  | gcc-8    | i386_defconfi=
g               | 0/1    =

qemu_x86_64             | x86_64 | lab-baylibre  | gcc-8    | x86_64_defcon=
fig             | 0/1    =

qemu_x86_64-uefi        | x86_64 | lab-baylibre  | gcc-8    | x86_64_defcon=
fig             | 0/1    =

qemu_x86_64-uefi-mixed  | x86_64 | lab-baylibre  | gcc-8    | x86_64_defcon=
fig             | 0/1    =

rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

sun50i-a64-bananapi-m64 | arm64  | lab-clabbe    | gcc-8    | defconfig    =
                | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc7-165-ga7813a12c4b9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc7-165-ga7813a12c4b9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a7813a12c4b9b8be833b2859d4d62813919afc32 =



Test Regressions
---------------- =



platform                | arch   | lab           | compiler | defconfig    =
                | results
------------------------+--------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained   | arm    | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2261cb4f31be567c52c1b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2261cb4f31be567c52c=
1b3
      failing since 85 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                | arch   | lab           | compiler | defconfig    =
                | results
------------------------+--------+---------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b         | arm64  | lab-baylibre  | gcc-8    | defconfig    =
                | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f226263811d7c008d52c216

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f226263811d7c00=
8d52c219
      failing since 3 days (last pass: v5.8-rc6-327-gb1263ee340f7, first fa=
il: v5.8-rc7-70-g8e4b9e8d6624)
      2 lines =



platform                | arch   | lab           | compiler | defconfig    =
                | results
------------------------+--------+---------------+----------+--------------=
----------------+--------
meson-sm1-khadas-vim3l  | arm64  | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f22630ff1371cfaf352c1ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f22630ff1371cfaf352c=
1ac
      new failure (last pass: v5.8-rc7-93-g49ee2b4bc7d6) =



platform                | arch   | lab           | compiler | defconfig    =
                | results
------------------------+--------+---------------+----------+--------------=
----------------+--------
qemu_i386-uefi          | i386   | lab-baylibre  | gcc-8    | i386_defconfi=
g               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f22627219876e588152c1c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/i386/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/i386/i386_defconfig/gcc-8/lab-baylibre/baseline-qemu_i386-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f22627219876e588152c=
1c7
      new failure (last pass: v5.8-rc7-93-g49ee2b4bc7d6) =



platform                | arch   | lab           | compiler | defconfig    =
                | results
------------------------+--------+---------------+----------+--------------=
----------------+--------
qemu_x86_64             | x86_64 | lab-baylibre  | gcc-8    | x86_64_defcon=
fig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f22618118ac520bfd52c1dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x8=
6_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x8=
6_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f22618118ac520bfd52c=
1dd
      new failure (last pass: v5.8-rc7-93-g49ee2b4bc7d6) =



platform                | arch   | lab           | compiler | defconfig    =
                | results
------------------------+--------+---------------+----------+--------------=
----------------+--------
qemu_x86_64-uefi        | x86_64 | lab-baylibre  | gcc-8    | x86_64_defcon=
fig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f226180bf4b3da3be52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x8=
6_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x8=
6_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f226180bf4b3da3be52c=
1a7
      new failure (last pass: v5.8-rc7-93-g49ee2b4bc7d6) =



platform                | arch   | lab           | compiler | defconfig    =
                | results
------------------------+--------+---------------+----------+--------------=
----------------+--------
qemu_x86_64-uefi-mixed  | x86_64 | lab-baylibre  | gcc-8    | x86_64_defcon=
fig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f226183bf4b3da3be52c1ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x8=
6_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x8=
6_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f226183bf4b3da3be52c=
1ac
      new failure (last pass: v5.8-rc7-93-g49ee2b4bc7d6) =



platform                | arch   | lab           | compiler | defconfig    =
                | results
------------------------+--------+---------------+----------+--------------=
----------------+--------
rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2269930de6f98d2a52c1b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2269930de6f98d2a52c=
1b1
      new failure (last pass: v5.8-rc7-93-g49ee2b4bc7d6) =



platform                | arch   | lab           | compiler | defconfig    =
                | results
------------------------+--------+---------------+----------+--------------=
----------------+--------
sun50i-a64-bananapi-m64 | arm64  | lab-clabbe    | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f22630bf1371cfaf352c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc7-16=
5-ga7813a12c4b9/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banana=
pi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f22630bf1371cfaf352c=
1a7
      failing since 9 days (last pass: v5.8-rc5-432-g6ded1a48da25, first fa=
il: v5.8-rc6-163-g19ae985ddbc8) =20
