Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EFA2124C1
	for <lists+linux-next@lfdr.de>; Thu,  2 Jul 2020 15:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgGBNdb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Jul 2020 09:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729115AbgGBNdb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Jul 2020 09:33:31 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D52C08C5C1
        for <linux-next@vger.kernel.org>; Thu,  2 Jul 2020 06:33:31 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id m9so2294896pfh.0
        for <linux-next@vger.kernel.org>; Thu, 02 Jul 2020 06:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BFXn01d/CiH7S6dc5zUKalvq6hpuKlrNJRM2o9v6vHc=;
        b=gmUECSGFUhUxZ/4SF1QkTHXZuoQqtNZg6xTa+wDLLbCR0JgkBJo93T5kTa3pxBG6Cr
         VqZhjKVSC8ygyAmUt/VeVO9lVmCwnWjDGDb4sEDLxvNbAbO4+UkAdycfph4/Vad5kKxw
         vJKdOBxse3ButfyQwtImVIXbHlK8WI2ekIh3BC+Fmbu/JtTo2wpDi6BbWMb9y1z0nDjN
         i0Zgzo12CRWarMO9WYMVZiFQDm4pTzN/2oGqgWeVYmo1JzPWJTgWZhXF/H1TTldMSElE
         DW7LH4cIT562Zg77M7YTpg02YGgKpgKoZIQTqfnUInw8r8yHP0vXsXuaahoYH+e7sQen
         rvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BFXn01d/CiH7S6dc5zUKalvq6hpuKlrNJRM2o9v6vHc=;
        b=geFO5wF0oHxmjiJJ8ajWo55qi6B9MeDUsZ6kVlazf62aDwdtuC53EP8mBxtqKGzJTh
         YV5S457DcHnC7/MQBSudtK4VbgLjKs5Vcm94bv/JKchFfB3qlyncr+CjBIlOuwCW4daq
         h9C0qsjS2tXp99aZFPHBnigTKwk4nhN18F0w5V4zjk0LpxVuhfEM5Ocmn8QHWabl0siH
         98JpGYwqH8j0STajULNDZgkq3hiG/HFLdGe7hdJT67eX4EixZq0aWYo2Tzw4ttCGWKrz
         tvH+yN6yXm0A8nkv30S6mGP3AIePMoGotcnb8vpluHqz5kQ0ck02EfZ9j//dAcJsIQrj
         sDHQ==
X-Gm-Message-State: AOAM530wNASXOj2VEdsiQ8iPe4uudfbWb3XD30KWaQNOk8/63FpaMtKP
        FVt1R58JeDcCPiR1lDbzx36OR7FpJ0M=
X-Google-Smtp-Source: ABdhPJwe+yB/VojpXH/Fk15HmIuUFaToH7SsTLNaa1H6+iONHjjOQt8wu82t+NghEnEkK/JXNbhcIQ==
X-Received: by 2002:a65:4488:: with SMTP id l8mr10354318pgq.443.1593696809657;
        Thu, 02 Jul 2020 06:33:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o1sm9768633pfu.70.2020.07.02.06.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 06:33:29 -0700 (PDT)
Message-ID: <5efde229.1c69fb81.ebb1.8af0@mx.google.com>
Date:   Thu, 02 Jul 2020 06:33:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200702
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 181 runs, 7 regressions (next-20200702)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 181 runs, 7 regressions (next-20200702)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm   | lab-baylibre | gcc-8    | bcm2835_de=
fconfig            | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | gcc-8    | defconfig =
                   | 0/1    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200702/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200702
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d37d57041350dff35dd17cbdf9aef4011acada38 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm   | lab-baylibre | gcc-8    | bcm2835_de=
fconfig            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5efda85fe4d5aff43985bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200702/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200702/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5efda85fe4d5aff43985b=
b19
      new failure (last pass: next-20200624) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efdac34fb12e8f95985bb37

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200702/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200702/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efdac34fb12e8f9=
5985bb3a
      failing since 1 day (last pass: next-20200629, first fail: next-20200=
630)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efdac72bb3b3e76e685bb2d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200702/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200702/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5efdac72bb3b3e7=
6e685bb32
      failing since 0 day (last pass: next-20200630, first fail: next-20200=
701)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5efdacdca1ef2b375685bb2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200702/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200702/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5efdacdca1ef2b375685b=
b2d
      new failure (last pass: next-20200618) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5efdb2209983fab68e85bb31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200702/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200702/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5efdb2209983fab68e85b=
b32
      new failure (last pass: next-20200618) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efdaa468b1d5ebd0a85bb22

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200702/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200702/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efdaa468b1d5ebd=
0a85bb25
      failing since 26 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efdaa335fd4457f4085bb20

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200702/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200702/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efdaa335fd4457f=
4085bb23
      failing since 26 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
