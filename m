Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC891FAF5C
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 13:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgFPLft (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Jun 2020 07:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgFPLft (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Jun 2020 07:35:49 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E140C08C5C2
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2020 04:35:48 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id y17so8262698plb.8
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2020 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bLDEEIPxhQxiDOprMgadzfkhBQEAnJQeWRBEBDcpzNk=;
        b=G37YvhpR2GDygi1nc2kRULgjMmNMDFjI91fmmriXFvmsV/YKWkNDZ8Jj82TLKK6YHE
         b3Dm/zkRggM7jVIhphAuX7jZhtUD/87FiedR3YYdyqwIgIGMw5a+q4GAagtYl9TUIOK3
         OSu/wZxyH9VIfuVEWABzjaN+KE/v2QDbLiHjXNeKjwJ06AXjXAWzQ3jrcXcnAmbGn8fB
         l4CgbH6+G1suBfhjyiWJ8xeVx1HVfX3S8IcqQVSpeIS9bn+f+3AL+aCcxzDjuSU1q1Mb
         lX/vnjjZjHJKrHd4JV61d1NH7aybbvkEHvwJHhgkE4a8CYPjjM01Wk2CEoRLSRqJsdGy
         B5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bLDEEIPxhQxiDOprMgadzfkhBQEAnJQeWRBEBDcpzNk=;
        b=aOxDkCcEGuksk3sMwEyQ4jHHf3dTDTCPx8bqpa7VT7kj9RlS/Fv0bK8NMGf4Dphtcn
         4z5FVXXCSE8qX8NtXj11jNoco4iYSlQe8mp63aqHQXnp2DdBllNqpRz2/nwK0SwnnX6X
         mjXGyDKF6MKiwebriYd0VcYhNi+Xnaiu7r9SesQbi0zWifdGrjvKL7jRyR4+ebnQwqoC
         5r4zzC1Q2a5S/2SeTjnwQdi3kKMAn3Wv5T4pU/7iAzI8rYT7PkUolccCRZvBPVMJ0RvT
         3YjA2rflZnho9Jc97u0KN7rXkad4d6uKzt/B6pWE8uL9WKDUJzl9+6uQxJTF/3UsQTe/
         zk4g==
X-Gm-Message-State: AOAM530b0giCO0YiBi3hpLVv+7TGGsciyVZH2QtrJ+I5N6FvJrgnANTf
        aA+rxq9CJ4KhxoM2FcMRaHC8E0hOJT0=
X-Google-Smtp-Source: ABdhPJz7QPllRrBYzQu4DMZKss+6//PeMyEZtN02yzhNrTSx0AbPf6DYZCQSy2eM2FxxjV4nycGydQ==
X-Received: by 2002:a17:902:9882:: with SMTP id s2mr1734158plp.112.1592307346147;
        Tue, 16 Jun 2020 04:35:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b5sm17034943pfg.191.2020.06.16.04.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 04:35:45 -0700 (PDT)
Message-ID: <5ee8ae91.1c69fb81.1e431.66bb@mx.google.com>
Date:   Tue, 16 Jun 2020 04:35:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.8-rc1-168-gd1a574997c4e
Subject: next/pending-fixes baseline: 175 runs,
 9 regressions (v5.8-rc1-168-gd1a574997c4e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 175 runs, 9 regressions (v5.8-rc1-168-gd1a5749=
97c4e)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =

bcm2837-rpi-3-b              | arm   | lab-baylibre | gcc-8    | bcm2835_de=
fconfig            | 3/5    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

meson-gxbb-p200              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

meson-gxl-s905d-p230         | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc1-168-gd1a574997c4e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc1-168-gd1a574997c4e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d1a574997c4e461b39d3c8162b5fcf1a402888b7 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee877a9341c9f49c897bf28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee877a9341c9f49c897b=
f29
      failing since 42 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm   | lab-baylibre | gcc-8    | bcm2835_de=
fconfig            | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ee8747b03acf4f10197bf09

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee8747b03acf4f1=
0197bf0c
      new failure (last pass: v5.7-15164-g875d8f7462d6)
      1 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee8=
747b03acf4f10197bf0e
      new failure (last pass: v5.7-15164-g875d8f7462d6)
      38 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee87643ed07b5537397bf14

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee87643ed07b553=
7397bf17
      new failure (last pass: v5.8-rc1-88-ga69361f43850)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee877bf7dad11d0fc97bf31

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee877bf7dad11d0=
fc97bf34
      failing since 3 days (last pass: v5.7-14413-gf19136b39e47, first fail=
: v5.7-14706-g24b012885d29)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxbb-p200              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee8795d90ad82962197bf28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee8795d90ad82962197b=
f29
      new failure (last pass: v5.8-rc1-88-ga69361f43850) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
                   | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee876c9a903e191c597bf1d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x=
-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x=
-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee876c9a903e19=
1c597bf22
      new failure (last pass: v5.8-rc1-88-ga69361f43850)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee877ffe07dae9e1897bf55

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee877ffe07dae9=
e1897bf5a
      failing since 1 day (last pass: v5.7-15164-g875d8f7462d6, first fail:=
 v5.8-rc1-88-ga69361f43850)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s905d-p230         | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee8794590ad82962197bf1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-16=
8-gd1a574997c4e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee8794590ad82962197b=
f1d
      new failure (last pass: v5.8-rc1-88-ga69361f43850) =20
