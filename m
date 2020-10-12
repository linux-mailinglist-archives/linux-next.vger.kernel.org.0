Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B0328AE4B
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 08:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgJLGqA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 02:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgJLGpg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2020 02:45:36 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81128C0613CE
        for <linux-next@vger.kernel.org>; Sun, 11 Oct 2020 23:45:36 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id b26so12642669pff.3
        for <linux-next@vger.kernel.org>; Sun, 11 Oct 2020 23:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=f8bVmsLpgB9wFHP7O1uYkO03ct9+r4Dt+c3b5vbdyTE=;
        b=1d78Ec7PDZTJAlXNh59pOt/I//SlGBezhNRnoNl5hFNBwnecBW5+c8s2gIdyZbhX3s
         8yHBIu+WD8KC5ajbppzC/UiTxGkpyndkq/6hcyflhFm0nXWVva+1l05XMW61BIuHwMZ2
         I8oed7N16hHrPbugGZMZ3AQBQyF8UP3iEQsUAL1DnaXBG0fkdlNGxYSI0f+VAZIBWdqd
         QUZ6s9ol+lDvesOHj8riwwyYC4QlZ1QU0+mpID0vOWXBHDxmm3g3lce1qYKAjrVtBi3b
         pWD7Thsv0vgYa0aaPL3k7vKLAT32m9t/+IOrwNrJIuXa50nT6F2Ti2D9CpuZoc0qeB48
         FujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=f8bVmsLpgB9wFHP7O1uYkO03ct9+r4Dt+c3b5vbdyTE=;
        b=U/dc1/zjEMOw32+yYOGGWFyIVtfu7y3hVUWsoaUPKen/Oqtv80W3C+7ia0G6npcXWP
         Bi+7wanMoRxwQ2rc+DVIJhgsaOvCUby9DhdDhHbJ2E/aJvo0s9svhZhMbhurC/MRnoUe
         82RReJuo6eeSPjnhiRNsmPtwFL8oeo16JZcuFbUSLozB09M/9qNxmxInibGJ+yrYOker
         6Tto0lzM9QgC265yw4+l1+XvErRRqdfucIo/gtQqSAKzy7y0Cu240DGO+oLStg54Xagq
         yDgGH0nLRbK6bXVNkX4Bt2q+yqjJsDeyhJTqwk/SAMJWIWwMNwv1qHTKgHm+VlrpD685
         EGEQ==
X-Gm-Message-State: AOAM5305ww8zr2v2Ur35/QOuVj4FL/bufXY02KyTzW+GcCJ5OWkW1g6J
        h0NIn583fLK4LpxjS6ZrScTlDgX12yTMJQ==
X-Google-Smtp-Source: ABdhPJyZyRxJgupHsjieQMzRmnFNSGSPIxUehLvrA/qoSeuScDVXSnOTO3k3yQKY/x0xsx/eTLX+kQ==
X-Received: by 2002:a63:2051:: with SMTP id r17mr9886317pgm.191.1602485135628;
        Sun, 11 Oct 2020 23:45:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q23sm19922510pfl.162.2020.10.11.23.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 23:45:35 -0700 (PDT)
Message-ID: <5f83fb8f.1c69fb81.a3c59.75c6@mx.google.com>
Date:   Sun, 11 Oct 2020 23:45:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-162-g560c51a7f3d5
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 264 runs,
 4 regressions (v5.9-162-g560c51a7f3d5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 264 runs, 4 regressions (v5.9-162-g560c51a7f3d=
5)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =

hip07-d05             | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 0/1    =

panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-162-g560c51a7f3d5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-162-g560c51a7f3d5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      560c51a7f3d5047303a5e9ce0aea0409f5c4fa3a =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f83bd2ea9952e53864ff3eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-162-g5=
60c51a7f3d5/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xp=
lained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-162-g5=
60c51a7f3d5/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xp=
lained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f83bd2ea9952e53864ff=
3ec
      failing since 159 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f83958192a655afbe4ff3ec

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-162-g5=
60c51a7f3d5/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-162-g5=
60c51a7f3d5/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f83958192a655af=
be4ff3f0
      new failure (last pass: v5.9-rc8-340-g65849916deb5)
      1 lines

    2020-10-11 23:28:06.240000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-11 23:28:06.240000  (user:khilman) is already connected
    2020-10-11 23:28:22.763000  =00
    2020-10-11 23:28:22.763000  =

    2020-10-11 23:28:22.763000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-11 23:28:22.763000  =

    2020-10-11 23:28:22.764000  DRAM:  948 MiB
    2020-10-11 23:28:22.779000  RPI 3 Model B (0xa02082)
    2020-10-11 23:28:22.866000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-11 23:28:22.898000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (378 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
hip07-d05             | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f83a79622244ae5ab4ff3e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-162-g5=
60c51a7f3d5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/b=
aseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-162-g5=
60c51a7f3d5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/b=
aseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f83a79622244ae5ab4ff=
3e1
      new failure (last pass: v5.9-rc8-340-g65849916deb5)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f83bd8bb3f5ca17db4ff3f7

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-162-g5=
60c51a7f3d5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/basel=
ine-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-162-g5=
60c51a7f3d5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/basel=
ine-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f83bd8bb3f5ca1=
7db4ff3fd
      failing since 67 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-12 02:20:54.098000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-12 02:20:54.103000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-12 02:20:54.109000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-12 02:20:54.115000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-12 02:20:54.120000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-12 02:20:54.126000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-12 02:20:54.132000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-12 02:20:54.138000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-12 02:20:54.144000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-12 02:20:54.150000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =20
