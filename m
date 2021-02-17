Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39C731D3DB
	for <lists+linux-next@lfdr.de>; Wed, 17 Feb 2021 02:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbhBQBxn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Feb 2021 20:53:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhBQBxk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Feb 2021 20:53:40 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A1EC061574
        for <linux-next@vger.kernel.org>; Tue, 16 Feb 2021 17:53:00 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id m2so7499495pgq.5
        for <linux-next@vger.kernel.org>; Tue, 16 Feb 2021 17:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MDLztJedM6JwBifHkzCYYtEQxsPj3JtWNRX7sml6XB4=;
        b=RBtiKzc/EkGxmt/JT95ouy5Tu3OYrdClv9ZVPjNGNJdyBEepdsubbZDHZIYOS1o2U7
         BA6baXz/LGoWsjdv8skQY20QXsKU8Ne7hpFRLhqy4XAX7dh0nrZmMt8Sn9HI7tRhNCEY
         mKb9ejg2fSjtgk5h7fTDDJacHXbyw6PCgy3rW3Txctz6HX06TuNPjW50NBdJzDPliAU2
         w0hQKPpS0d0pKbKDgCrc1F8UpIJ43vcTHqbkEddFK0OEIgNI7OECE5V8xhJCzIoguTCY
         vJS0rMWKnXmlX/ogvMPnQBWKmg1zJBv0qPxUgP5WoxDa/48gZoPqs+sgKkaP/yhePb17
         +rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MDLztJedM6JwBifHkzCYYtEQxsPj3JtWNRX7sml6XB4=;
        b=MVKRPTcxyg5oIm/LqFOqqegPwQj3aujhLyPgcn6uOOBLr8dL8tHvGgWhqxILbSbD3i
         3fib31ZJCvb7WsSgp90nUR8NGW8CSf3/7hntESMT5DaibU+76hYbM2E391H4ypuiPydR
         VEMVLH2/2fkqR97VWG/KmFTRq1ACKjyUh1VDwiKWti/RIxTwPbCmpAuRhse3rXjpNo4b
         aVowgLjbdgEGvC/dt/XXBKzmBXK8XpRmJodOwGgc5RNrdJPn52Lh09yKuJqZ7hD1ROtB
         MSvsI1LxHk2R0baKfFm1gMWdqfFotRsfZ0+2gm0SY3AXY4kAONQOPrM9NIFtVTJ6wthO
         gzBg==
X-Gm-Message-State: AOAM532Mg5WGXfPq5nYgobPxHCfY0Pq8zlrFXEokk10zukKY0FpL7wUb
        w+esf0dLBaL0z6EfGp7G+QBB6sCZE0styg==
X-Google-Smtp-Source: ABdhPJwSLAWq3PmINhqoMbTMj7MuecVmk9I6qDadB/TXhWfo7cMakBvVPdJM3Z0j072xM4TrhGkifA==
X-Received: by 2002:a63:5f11:: with SMTP id t17mr22021140pgb.391.1613526779071;
        Tue, 16 Feb 2021 17:52:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g6sm238142pfi.15.2021.02.16.17.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 17:52:58 -0800 (PST)
Message-ID: <602c76fa.1c69fb81.558d9.13e0@mx.google.com>
Date:   Tue, 16 Feb 2021 17:52:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-629-gdcd372394d935
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 164 runs,
 7 regressions (v5.11-629-gdcd372394d935)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 164 runs, 7 regressions (v5.11-629-gdcd372394d=
935)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_de=
fconfig           | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

meson-gxl-s805x-p241     | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-629-gdcd372394d935/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-629-gdcd372394d935
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dcd372394d935b8dc4e15cfb84bc45aec536a77d =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
am57xx-beagle-x15        | arm   | lab-linaro-lkft | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/602c4165b2829b3d6baddcb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-=
beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm/multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-am57xx-=
beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602c4165b2829b3d6badd=
cb3
        failing since 3 days (last pass: v5.11-rc7-121-gdfed2943da0a, first=
 fail: v5.11-rc7-192-g055e690de1b2) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602c43a481334de4ebaddcc9

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/602c43a481334de4=
ebaddccc
        new failure (last pass: v5.11-619-gde196b2f354e)
        1 lines

    2021-02-16 22:11:33.641000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2021-02-16 22:11:33.642000+00:00  (user:khilman) is already connected
    2021-02-16 22:11:48.996000+00:00  =00
    2021-02-16 22:11:48.996000+00:00  =

    2021-02-16 22:11:48.997000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2021-02-16 22:11:48.997000+00:00  =

    2021-02-16 22:11:48.997000+00:00  DRAM:  948 MiB
    2021-02-16 22:11:49.012000+00:00  RPI 3 Model B (0xa02082)
    2021-02-16 22:11:49.100000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2021-02-16 22:11:49.132000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (389 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/602c4298c9eedab82caddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602c4298c9eedab82cadd=
cb2
        failing since 2 days (last pass: v5.11-rc7-192-g055e690de1b2, first=
 fail: v5.11-rc7-273-g095727507311) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxl-s805x-p241     | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602c4395b9d051ace8addcb4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602c4395b9d051ace8add=
cb5
        new failure (last pass: v5.11-619-gde196b2f354e) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602c417472a5a6158daddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602c417472a5a6158dadd=
cb2
        new failure (last pass: v5.11-619-gde196b2f354e) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/602c439081334de4ebaddcb7

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-629-g=
dcd372394d935/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/602c439081334de=
4ebaddcbb
        new failure (last pass: v5.11-619-gde196b2f354e)
        11 lines

    2021-02-16 22:13:18.476000+00:00  kern  :alert : Mem abort in<8>[   45.=
793683] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dli=
nes MEASUREMENT=3D11>
    2021-02-16 22:13:18.476000+00:00  fo:
    2021-02-16 22:13:18.476000+00:00  kern  :alert :   ESR =3D 0x9600004e
    2021-02-16 22:13:18.477000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-02-16 22:13:18.477000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-02-16 22:13:18.477000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-02-16 22:13:18.477000+00:00  kern  :alert : Data abort info:
    2021-02-16 22:13:18.477000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x0000004e   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/602c439081334de=
4ebaddcbc
        new failure (last pass: v5.11-619-gde196b2f354e)
        2 lines

    2021-02-16 22:13:18.519000+00:00  kern  <8>[   45.826518] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-02-16 22:13:18.519000+00:00  :alert : swapper pgta<8>[   45.836398=
] <LAVA_SIGNAL_ENDRUN 0_dmesg 732351_1.5.2.4.1>
    2021-02-16 22:13:18.519000+00:00  ble: 4k pages, 48-bit VAs, pgdp=3D000=
00000025f1000
    2021-02-16 22:13:18.519000+00:00  kern  :alert : [ffff8000110c1178] pgd=
=3D000000007ffff003, p4d=3D000000007ffff003, pud=3D000000007fffe003, pmd=3D=
0060000002000f81
    2021-02-16 22:13:18.520000+00:00  kern  :emerg : Internal error: Oops: =
9600004e [#1] PREEMPT SMP   =

 =20
