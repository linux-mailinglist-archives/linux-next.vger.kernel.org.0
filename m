Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99B3210D41
	for <lists+linux-next@lfdr.de>; Wed,  1 Jul 2020 16:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731280AbgGAOL6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Jul 2020 10:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731153AbgGAOL5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2020 10:11:57 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C56C08C5C1
        for <linux-next@vger.kernel.org>; Wed,  1 Jul 2020 07:11:57 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id bf7so642267plb.2
        for <linux-next@vger.kernel.org>; Wed, 01 Jul 2020 07:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dmnIiJYfIbE/7StdrUrsJsPPmK1H7hs8Cupooox8LCs=;
        b=xxdpbrcl0LKbzyOZoA4/T948LzBz4BVX7NQFxoqHcTTJCLB8swTDDjoYIsEFpO4g4u
         VVOkGcuSob+4fkTFxzXPuN4Ci3SboMZ/vr06dYrypkJugxiWNuS80jGL43rssD2ShPnO
         +Tk0Q3PAEowmzRLKliInJhioMA6CSAsUZwTudGQ6p8v7DWVm7U7dA1PqiGqvlDjqHFxc
         NOIQPuVwM9gDKSd3t4jju1jmtNITAowpi9lhFubFTp3GUmO9MwJ2NHABj7zz1OfNvL+S
         QHr0/z/ZTJ6hu8ceAGEEaGwKe9kecpZlTz68UF/w4ghoJ8cq8WLiNvyidBQ5U3KnKIwV
         zgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dmnIiJYfIbE/7StdrUrsJsPPmK1H7hs8Cupooox8LCs=;
        b=ntCq/pe8aQ6FiAZG1xgnXH+BqTwT0Pkbm3UuwOEzEcWjyy9mnuWRtM0Q75VDHukNUC
         UfmRd/FE9aVwndGYIw5HvU9bfjH8Jel9OCj3Uvc3/CYLPushLx2znQI0aq1QIe1Hwre9
         VB7bU9kQvwjOhlFZM42WjrC9Nb+vI9nXXlCrKMC14ph2vq+UNoEja64+WaDCW3q0yepb
         +m/lywZ4UMQE7SJUEfnjNo2Zku9nFKMKbNM+A5oF7SQQuSOlztf2jmGdIslkx7BNwzfN
         agjFa91s4k5eBFwdRtSCPFdrPkx2c9bjBMWzHpP5Qr61npWEQeA+W5SsR/GmpPubfVXa
         omwg==
X-Gm-Message-State: AOAM532T4DK803ZQX6BJBaFQnTNv3S+UVwwTAw84lCVvk5ojdgQwG6Ww
        oenIOxlU2Dw6nzGhLsFMj/H/N2ton5s=
X-Google-Smtp-Source: ABdhPJw3zDsAT7ACWlGP0JjpJ8YuIus2scaZzdNqn+pJRaaKT7i6FiU2XKiNHhcFS68IkD56jGUi7w==
X-Received: by 2002:a17:90a:2dcb:: with SMTP id q11mr21219444pjm.135.1593612716280;
        Wed, 01 Jul 2020 07:11:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w17sm450794pge.10.2020.07.01.07.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 07:11:55 -0700 (PDT)
Message-ID: <5efc99ab.1c69fb81.968d4.0d36@mx.google.com>
Date:   Wed, 01 Jul 2020 07:11:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200701
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 153 runs, 8 regressions (next-20200701)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 153 runs, 8 regressions (next-20200701)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig           | 3/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 4/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200701/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200701
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aab2003999e78bbf2058dae1e661c44ede1d9766 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efc5b3a55255a848b85bb20

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200701/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200701/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efc5b3a55255a84=
8b85bb23
      failing since 0 day (last pass: next-20200629, first fail: next-20200=
630)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5efc656642b3bed6bb85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200701/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200701/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5efc656642b3bed6bb85b=
b19
      new failure (last pass: next-20200630) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
imx6q-var-dt6customboard     | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efc66f3f2945ce5bd85bb3b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200701/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200701/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5efc66f3f2945ce=
5bd85bb3f
      new failure (last pass: next-20200629)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5efc=
66f3f2945ce5bd85bb40
      new failure (last pass: next-20200629)
      26 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efc5b6c293d71311185bb22

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200701/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200701/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5efc5b6c293d713=
11185bb27
      new failure (last pass: next-20200630)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efc693c8fd9cbff9585bb18

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200701/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200701/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5efc693c8fd9cbf=
f9585bb1d
      new failure (last pass: next-20200630)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efc5296ae865b6fb085bb2b

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200701/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200701/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efc5296ae865b6f=
b085bb2e
      failing since 25 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efc52a90ef46f648385bb18

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200701/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200701/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efc52a90ef46f64=
8385bb1b
      failing since 25 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
