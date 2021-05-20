Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAC9389AAC
	for <lists+linux-next@lfdr.de>; Thu, 20 May 2021 02:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhETAzG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 May 2021 20:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhETAzG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 May 2021 20:55:06 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642EDC061574
        for <linux-next@vger.kernel.org>; Wed, 19 May 2021 17:53:46 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so4497243pjb.2
        for <linux-next@vger.kernel.org>; Wed, 19 May 2021 17:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bbvWkvJB6dbuKHBmoH7o8LvHVMJAG4tpBFegKwz/LT8=;
        b=Iqt7Hnyq5Z6QnpBJThdKjOelM9W1aYZlNIggHpnK+g9nYR5998/32ToTr8oNr9VvZJ
         Y66x9/GerrO+PwU/0K63lxOK8LwzH/wmacmIqJ1oB+EtPLIFwLCC23AnR0YrSfFQsDFe
         XMazjektFCE+SjYY2dsGgxS5dUtaKWryMeyXD3kNW7syXnXK2lTqmW1e1yANbXPKMUv4
         wsFDcGZIZE6nut6SR0v0fAD6LwLjblt1SOknKyKiP766bvQN7jccuGl9tif84zoNrA4v
         slPGnG3qGFEEs8JfBjNOBOZsmY/VDhQuSaWX3RTkAK1REc6uRDB9TZBSvA8reJNdFxfz
         uZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bbvWkvJB6dbuKHBmoH7o8LvHVMJAG4tpBFegKwz/LT8=;
        b=kVL1nJGHz1KmQz/rcNy1qAlBUAu5IXy8+7KbxVikcGzuFW8tttiZIIEdeJ/XTsYkC4
         P6Bcm2g0RQNKWmKyxhkBb0FbntuGskjJC3joWkV5jGwfUUxDHmXeXUHzbPe+ltjRd7KE
         TXkEcCIePzUmMLm1Bet2gzxN4LPj0YNO31QslaBOHbBdR2Scv2s8IV8xbdP+RiTdvKg+
         LkZm9KA4Yyl8ORQWwZpbAU8gkT6rk3lj4vyUcF/PlT+GVfo9abHabC+VBk3wJkf01iYU
         IJqf7UZuvgTw8RsKrKEjucyPJ7cna5slrOi2/Nz5tF6sBeRUM0AFXPsfAigwuoO48+4p
         fIHg==
X-Gm-Message-State: AOAM531oU23AEa4El0hLUENue1yI1UxcEDz0gEIyRQXKaUUQVziwxV/a
        e4P6vgFDy2ZlatQAsbeUSbYZ2xlv3YlNOrgb
X-Google-Smtp-Source: ABdhPJx4dfs2zJz60ReCI9DGbEQ5cVdilPvBJiqqHXhqC/bM1R/3bRGEkpfucFd7uFGow/aA4BXkoA==
X-Received: by 2002:a17:902:b713:b029:ef:b031:2a9c with SMTP id d19-20020a170902b713b02900efb0312a9cmr2691153pls.22.1621472025698;
        Wed, 19 May 2021 17:53:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e24sm441362pgi.17.2021.05.19.17.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 17:53:45 -0700 (PDT)
Message-ID: <60a5b319.1c69fb81.fa99a.2af9@mx.google.com>
Date:   Wed, 19 May 2021 17:53:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210519
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: next/master baseline: 526 runs, 11 regressions (next-20210519)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 526 runs, 11 regressions (next-20210519)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =

imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =

imx8mp-evk           | arm64 | lab-nxp       | clang-10 | defconfig        =
            | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre  | clang-12 | defconfig        =
            | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =

qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre  | clang-12 | defconfig        =
            | 1          =

tegra124-nyan-big    | arm   | lab-collabora | gcc-8    | tegra_defconfig  =
            | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210519/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210519
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9f24705effef8c3b9eca00d70594ef7e0364a6da =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
bcm2836-rpi-2-b      | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60a584796113820664b3afaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210519/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210519/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a584796113820664b3a=
fab
        failing since 84 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/60a579bd0bc8583ac4b3afb0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210519/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210519/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a579bd0bc8583ac4b3a=
fb1
        failing since 19 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx6q-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a577d343222a0223b3afa6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210519/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210519/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a577d343222a0223b3a=
fa7
        failing since 205 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
imx8mp-evk           | arm64 | lab-nxp       | clang-10 | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/60a57a3ec63751571bb3afbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210519/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210519/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a57a3ec63751571bb3a=
fc0
        new failure (last pass: next-20210514) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre  | clang-12 | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/60a587fa7516a9bb3cb3afb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210508012545+a1a19=
7b54ec6-1~exp1~20210507233254.88)
  Plain log:   https://storage.kernelci.org//next/master/next-20210519/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210519/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a587fa7516a9bb3cb3a=
fb2
        new failure (last pass: next-20210512) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre  | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a57434c448cd0afcb3afd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210519/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210519/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a57434c448cd0afcb3a=
fd5
        failing since 182 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-broonie   | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a57430110419b52db3afc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210519/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210519/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a57430110419b52db3a=
fca
        failing since 182 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-cip       | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a5742ff6892245dcb3afa5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210519/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210519/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a5742ff6892245dcb3a=
fa6
        failing since 182 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
qemu_arm-versatilepb | arm   | lab-collabora | gcc-8    | versatile_defconf=
ig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60a573e885f26a8301b3aff5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210519/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210519/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a573e885f26a8301b3a=
ff6
        failing since 182 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre  | clang-12 | defconfig        =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/60a57ee539637e370cb3afa6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210508012545+a1a19=
7b54ec6-1~exp1~20210507233254.88)
  Plain log:   https://storage.kernelci.org//next/master/next-20210519/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210519/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a57ee539637e370cb3a=
fa7
        new failure (last pass: next-20210514) =

 =



platform             | arch  | lab           | compiler | defconfig        =
            | regressions
---------------------+-------+---------------+----------+------------------=
------------+------------
tegra124-nyan-big    | arm   | lab-collabora | gcc-8    | tegra_defconfig  =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/60a587aaf4ad39401eb3afb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210519/arm/=
tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210519/arm/=
tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60a587aaf4ad39401eb3a=
fb2
        failing since 8 days (last pass: next-20210510, first fail: next-20=
210511) =

 =20
