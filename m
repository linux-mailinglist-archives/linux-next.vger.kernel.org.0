Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E2B296AEC
	for <lists+linux-next@lfdr.de>; Fri, 23 Oct 2020 10:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372248AbgJWIKD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Oct 2020 04:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S460442AbgJWIGH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Oct 2020 04:06:07 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA6AC0613CE
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 01:06:07 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id x13so604233pgp.7
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 01:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=URE7S/t7Tcof7319LJMXd8quvWh5DBl95acsQkZq4Tk=;
        b=IyEIaZjeksnvLMMsf+ZW9ZSdMFxD5vkJp2WHwC6qA1O1G4Sq7wdTt3qhYP/QWoezOa
         akuhsaJA7DJ2EqmE/kwkhH8gyUG4BsNEE47aQT6gQkPDg2tdo2miu8iyWtwcBr+IB+D7
         DFNnsV6k1NjDyWuzaRK2xvlcp/8EHAQbSzNh45a2zNQ6HfuqO9/84S/i0BBiUc0qZnsv
         k1+devzEiT6tNL+kYAJEZZVssKc08qOBNc0/iC5UpahJ/hc1wvrkOuITnBnVwWx7YzTd
         fma7kzytIkquu4oZrpxXAQhAGKVK0nSWzFh3oCrnzor8KGFODvihWY9VqSfU9v3KiMvc
         CorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=URE7S/t7Tcof7319LJMXd8quvWh5DBl95acsQkZq4Tk=;
        b=K7kPZZ+vImP8YU1/lnYRlIv6nH6ylYGufYSnx8H1pc0rUl72VGZS96Lx7HxJq+rQgA
         Nskr8SxIHGmzmeA5u4ELODS2Uj7EjjFywV58fF30zgvkWqV3IGpaJ8lxAPmtAKYGS6SD
         McbkFp5sYDnO0otlgFd05F/Ml9e2AnZD68VAyhFI6fUWx+U3f74iKX2OnSey+3M3idkW
         Yc4cNYi7bNQcOUwZ+tGjFXtIU0tEvazoeWNNA3nEHnpSPGSaOUUZdqxUDKJ1xWJkLmI9
         BUnwu9nuQcbvrmJ3nSLoTSdG7V7iQL73yXrFqlBX9EBT8GqX+1a/o2uZGjOHF3ohbfti
         xlIw==
X-Gm-Message-State: AOAM5326hkRMRZA7cW+kHu9XW1Oi/DUAcz0vaTJQAgMwTNW3++EqteLL
        JTdw7GjvpqVZdXECS8ny7L97uG46GurYLw==
X-Google-Smtp-Source: ABdhPJwCGCgOOznoPUjSaY/AH5vmVYueutLZxkAHU1OW21+Yql5SDGFnNib05ZQkUAfa2UOBDE/G9Q==
X-Received: by 2002:a63:ed01:: with SMTP id d1mr1130111pgi.58.1603440365806;
        Fri, 23 Oct 2020 01:06:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q8sm1151695pff.18.2020.10.23.01.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 01:06:04 -0700 (PDT)
Message-ID: <5f928eec.1c69fb81.9a63.2349@mx.google.com>
Date:   Fri, 23 Oct 2020 01:06:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201023
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 649 runs, 8 regressions (next-20201023)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 649 runs, 8 regressions (next-20201023)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre  | clang-10 | defconfig        =
            | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre  | clang-10 | defconfig+CON..._=
64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32   | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfig=
            | 2          =

hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =

panda                | arm   | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201023/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201023
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9695c4ff26459ff5bfe25c7d6179e4c9c00e1363 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9253cbb7509efeb0e0dd94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201023/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201023/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9253cbb7509efeb0e0d=
d95
        failing since 22 days (last pass: next-20200929, first fail: next-2=
0200930) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | clang-10 | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/5f92553408d668b9ece0dd8d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201023/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201023/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f92553408d668b9=
ece0dd90
        failing since 7 days (last pass: next-20201013, first fail: next-20=
201015)
        2 lines

    2020-10-23 03:57:21.558000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-10-23 03:57:21.559000+00:00  (user:khilman) is already connected
    2020-10-23 03:57:37.246000+00:00  =00
    2020-10-23 03:57:37.246000+00:00  =

    2020-10-23 03:57:37.246000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-10-23 03:57:37.247000+00:00  =

    2020-10-23 03:57:37.247000+00:00  DRAM:  948 MiB
    2020-10-23 03:57:37.262000+00:00  RPI 3 Model B (0xa02082)
    2020-10-23 03:57:37.350000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-10-23 03:57:37.381000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (384 line(s) more)  =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | clang-10 | defconfig+CON..._=
64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9255cfb121fef984e0dd8c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f9255cfb121fef9=
84e0dd8f
        failing since 0 day (last pass: next-20201016, first fail: next-202=
01022)
        1 lines

    2020-10-23 04:00:19.155000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-10-23 04:00:19.155000+00:00  (user:khilman) is already connected
    2020-10-23 04:00:35.042000+00:00  =00
    2020-10-23 04:00:35.043000+00:00  =

    2020-10-23 04:00:35.043000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-10-23 04:00:35.043000+00:00  =

    2020-10-23 04:00:35.043000+00:00  DRAM:  948 MiB
    2020-10-23 04:00:35.058000+00:00  RPI 3 Model B (0xa02082)
    2020-10-23 04:00:35.146000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-10-23 04:00:35.177000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (379 line(s) more)  =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5f925674bc1eabe37fe0ddd0

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201023/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201023/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f925674bc1eabe3=
7fe0ddd3
        new failure (last pass: next-20201022)
        1 lines

    2020-10-23 04:02:53.821000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-10-23 04:02:53.821000+00:00  (user:khilman) is already connected
    2020-10-23 04:03:09.450000+00:00  =00
    2020-10-23 04:03:09.451000+00:00  =

    2020-10-23 04:03:09.451000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-10-23 04:03:09.451000+00:00  =

    2020-10-23 04:03:09.451000+00:00  DRAM:  948 MiB
    2020-10-23 04:03:09.466000+00:00  RPI 3 Model B (0xa02082)
    2020-10-23 04:03:09.553000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-10-23 04:03:09.585000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (379 line(s) more)  =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfig=
            | 2          =


  Details:     https://kernelci.org/test/plan/id/5f925306fa0e730c54e0dda0

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201023/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201023/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f925306fa0e730=
c54e0dda4
        new failure (last pass: next-20201022)
        4 lines

    2020-10-23 03:50:17.400000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 00000000
    2020-10-23 03:50:17.401000+00:00  kern  :alert : pgd =3D 9a95637b
    2020-10-23 03:50:17.401000+00:00  kern  :alert : [00000000] *pgd=3D0422=
8835, *pte=3D00000000, *ppte=3D00000000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f925306fa0e730=
c54e0dda5
        new failure (last pass: next-20201022)
        81 lines

    2020-10-23 03:50:17.443000+00:00  kern  :emerg : Process udevd (pid: 10=
3, stack limit =3D 0xe87fa816)
    2020-10-23 03:50:17.444000+00:00  kern  :emerg : Stack: (0xc4245b4c to =
0xc4246000)
    2020-10-23 03:50:17.445000+00:00  kern  :emerg : 5b40:                 =
           c4245b78 c4245b5c c013e15c c013e110 c0f04248
    2020-10-23 03:50:17.446000+00:00  kern  :emerg : 5b60: ffffe000 c4241a0=
0 000000a5 c4245c10 c4245b7c c018d0ec c013e138 00000000
    2020-10-23 03:50:17.447000+00:00  kern  :emerg : 5b80: c14c5500 c4245bf=
0 ffffffff c4245b98 c010c938 c0670bb8 c4245bbc c0151848
    2020-10-23 03:50:17.486000+00:00  kern  :emerg : 5ba0: 00000000 0000000=
3 c1025f80 ffffe000 60000013 c4245d1c 00000003 00000000
    2020-10-23 03:50:17.487000+00:00  kern  :emerg : 5bc0: 00000000 c4245be=
8 c4245c2c c4245bd8 c0151848 c0151694 00000000 c4245be8
    2020-10-23 03:50:17.488000+00:00  kern  :emerg : 5be0: 89f3e472 bec6355=
8 bec6352c bec63558 c4241a00 000000a5 000000a5 c4245ec4
    2020-10-23 03:50:17.489000+00:00  kern  :emerg : 5c00: 00000000 c4245c2=
8 c4245c14 c018d458 c018d0a0 4955555f 00000051 c4245c54
    2020-10-23 03:50:17.490000+00:00  kern  :emerg : 5c20: c4245c2c c043fb0=
0 c018d438 bec63488 000000a5 00000000 00000000 c040a46c =

    ... (70 line(s) more)  =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/5f92550a83b1981abbe0dd89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201023/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201023/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f92550a83b1981abbe0d=
d8a
        failing since 43 days (last pass: next-20200818, first fail: next-2=
0200909) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
panda                | arm   | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f92588499c5ee8b72e0dd93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201023/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201023/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f92588499c5ee8b72e0d=
d94
        failing since 93 days (last pass: next-20200706, first fail: next-2=
0200721) =

 =20
