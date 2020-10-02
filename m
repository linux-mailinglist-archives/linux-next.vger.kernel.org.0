Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2BC280D43
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 08:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgJBGBq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 02:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgJBGBq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 02:01:46 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A906C0613D0
        for <linux-next@vger.kernel.org>; Thu,  1 Oct 2020 23:01:46 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id i3so199888pjz.4
        for <linux-next@vger.kernel.org>; Thu, 01 Oct 2020 23:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=abG7bsVnmpxlODVWsnyXbRf0KufyNBFjixJeP4RowHw=;
        b=W85XvqO63YRPdxLr/ZUxk6tfQ9Fk/y4jLYJG5m7/B27J+oEQBbJr9vi6Jmqz3EVh/f
         pX3pw9jZuYko4CldxbtLYynou8TXRpON1e1eOeG8trO6I2qqTZ235yucrcGk9BSuWbLu
         ZhRBs3CP/OsHGtQ/3hJiO+TM/96hrfzFu0uZWEkLHoYGU/9nzJBNflhIVc+J1JXPUZkM
         QjM87Y0r5vvEIMRUl+ImEJUskP8u076oUeZft920CxG4o/C5/c+GqIrdyPN510uLwuO3
         WWUOMu/7uepajABs/RBxppdbnkVujwydwwvxUS0j7+NEzyQiIfHUlWCSAqEuFKQdbLJR
         ETZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=abG7bsVnmpxlODVWsnyXbRf0KufyNBFjixJeP4RowHw=;
        b=p+4klS8ObD9jPypt6ysAVYLT3CkhflL66qksdDEldVv0vLJWvzOjWmqNJ31w8lTVX1
         kvmQrOb/xwaQdoTWZfLMWMk/yVTjOT9UcYBFhAAF2E3V8prjbxHtqvx4us8yjXMsFgWi
         szeuMB74/gYGTs9zh/yTnruockLpPeUJrWw+dEBNy+K1Uh7iuab+T18TJth4ZaRZTF1M
         x2WsZ0TQoGigXEPGT8fGfBjICB1YJjh2n6Te4nB873zZZlLpvtJ2G98TF0m0PI3zOLih
         fnKRnEgJrNyV/48tm2RAt5ORlFeS0oEnvZ44pDAIiCXPXCNuXq3e2w5Y0DIzyKDdsN7i
         vGWA==
X-Gm-Message-State: AOAM531X/K9QE1iZR3DQSn67XkErqaGm0dL9jZ/daFuRDPWl3ghIVYH1
        XqAFyjFYWQQ12KUJXxXOKJ0GsMwfxes2LQ==
X-Google-Smtp-Source: ABdhPJyCNewBkJ/TmoS5B12j0CRCKB0m43oXvsJFxnXZhCwJWkYtktNJIJQ8htbmv6Ikz+btrxyPXQ==
X-Received: by 2002:a17:90b:20a:: with SMTP id fy10mr1022280pjb.209.1601618505065;
        Thu, 01 Oct 2020 23:01:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 1sm490410pgm.4.2020.10.01.23.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 23:01:44 -0700 (PDT)
Message-ID: <5f76c248.1c69fb81.e7c7f.124c@mx.google.com>
Date:   Thu, 01 Oct 2020 23:01:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc7-326-g64809246f17a
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 272 runs,
 6 regressions (v5.9-rc7-326-g64809246f17a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 272 runs, 6 regressions (v5.9-rc7-326-g6480924=
6f17a)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =

bcm2837-rpi-3-b-32    | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfi=
g            | 3/4    =

panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc7-326-g64809246f17a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc7-326-g64809246f17a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      64809246f17a1f95a92cc27612b3dedc8a719df2 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f768ef2ec97b17ce5877173

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f768ef2ec97b17ce5877=
174
      failing since 149 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f768db73b94f9af218771ff

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f768db73b94f9af=
21877203
      new failure (last pass: v5.9-rc7-297-gd069a655f589)
      3 lines

    2020-10-02 02:14:37.623000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-02 02:14:37.623000  (user:khilman) is already connected
    2020-10-02 02:14:53.019000  =00
    2020-10-02 02:14:53.020000  =

    2020-10-02 02:14:53.020000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-02 02:14:53.020000  =

    2020-10-02 02:14:53.020000  DRAM:  948 MiB
    2020-10-02 02:14:53.034000  RPI 3 Model B (0xa02082)
    2020-10-02 02:14:53.122000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-02 02:14:53.152000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (389 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f768e8a0962c4c17e87717c

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f768e8a0962c4c1=
7e877180
      new failure (last pass: v5.9-rc7-297-gd069a655f589)
      1 lines

    2020-10-02 02:18:52.521000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-02 02:18:52.522000  (user:khilman) is already connected
    2020-10-02 02:19:08.104000  =00
    2020-10-02 02:19:08.105000  =

    2020-10-02 02:19:08.105000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-02 02:19:08.105000  =

    2020-10-02 02:19:08.105000  DRAM:  948 MiB
    2020-10-02 02:19:08.121000  RPI 3 Model B (0xa02082)
    2020-10-02 02:19:08.208000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-02 02:19:08.240000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (378 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b-32    | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfi=
g            | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f768dd6960f8f786a877169

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f768dd6960f8f7=
86a87716e
      new failure (last pass: v5.9-rc7-297-gd069a655f589)
      1 lines  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f768f4c6e19496ad9877189

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f768f4c6e19496=
ad987718f
      failing since 58 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-02 02:24:00.754000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-02 02:24:00.759000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-02 02:24:00.763000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-02 02:24:00.768000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-02 02:24:00.778000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-02 02:24:00.783000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-02 02:24:00.788000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-02 02:24:00.792000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-02 02:24:00.800000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-02 02:24:00.805000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f76909f04cc9ce54d87716a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc7-32=
6-g64809246f17a/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f76909f04cc9ce54d877=
16b
      failing since 58 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
