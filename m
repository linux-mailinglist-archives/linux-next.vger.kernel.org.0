Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E08E28FD86
	for <lists+linux-next@lfdr.de>; Fri, 16 Oct 2020 07:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgJPFB0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Oct 2020 01:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgJPFB0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Oct 2020 01:01:26 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B1DC061755
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 22:01:26 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id w11so608650pll.8
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 22:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FVLXVb05Fj8TWkAA89axEoXMEy6BVN0EnBGjEDfHE50=;
        b=hgyy+KeFKP4ZHIbFBMRrhlSa9FtrCSDEcR/RYpCtcUcDwxazoDooS7bRlp/AqHzBGg
         pg6uBLZTxZmRlgJMHDhGdnCfE93buTP9Isg8iXwIcRzK8pKbrNmNPQIo0EZ527MMagsE
         P5KacdREDSy7/PRMDwE1VVo074FTd2a2EYamTF+RX5CCVHNt7SX9JL98lDX2UyhSifnW
         QjNgRVFZZt1PToPyVc8gKoxc0jhEZCTAl4qEAaVOfoHThcBq0IygOtY4LSs7p+OYm3aZ
         AklpVt+3i7Nn0IldmDyym7iBONCqG4/d17rQzEfn4D4a6wnNF/WPZPAo4PnILfcmd5kP
         kuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FVLXVb05Fj8TWkAA89axEoXMEy6BVN0EnBGjEDfHE50=;
        b=N2FK3fzyW+LpFAQgBiOOByuNpD+zH4EsiArDqcGVY5B6kWjsvOVxqDAj5LaFnLjluK
         HDUo/TMnasf+BN6DB1gt1hWUHm9eMu7PhT9Gq307JVs1VDgyqJrE8okEMi7gY8vQ8ls2
         ttWkGJ6OS+/DaL1MjOREYuG23VS6p2iVYZhgnhmoFiVgf+LOESUUbNhAB1oPcAc4TKmM
         7rA4zQ15i0PO9frN3ByMwOKEEHr/AFfLrVayXYmDrQhiY/Z9MlVkMWEQyZ1ji/QoKoZP
         qiG6wa2XmOYmByn30e0hREM8q7fAN53rkiFMpuBZ0e8nlEc6SjudbydPQLNb7Yy9EvOj
         p0tA==
X-Gm-Message-State: AOAM532U+j686BEElP8dze19ea32x7Oo6skV7i7pJWs12eDJBZvZuKe8
        cdjCEclUnQftjTOcsBFeWFnZ8PbcrDtiFA==
X-Google-Smtp-Source: ABdhPJxNftNfD5OF8YcxnVjAdJN4XEHWJFhG4zJwlkmADR1v2eFNUFt7vN3Lh1/ypAT3quSV682qhA==
X-Received: by 2002:a17:902:bf45:b029:d5:b36d:56eb with SMTP id u5-20020a170902bf45b02900d5b36d56ebmr2263201pls.28.1602824484050;
        Thu, 15 Oct 2020 22:01:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q24sm1236591pfn.72.2020.10.15.22.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 22:01:23 -0700 (PDT)
Message-ID: <5f892923.1c69fb81.23d17.3bb5@mx.google.com>
Date:   Thu, 15 Oct 2020 22:01:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-10224-g4054eebdfdd6
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 362 runs,
 4 regressions (v5.9-10224-g4054eebdfdd6)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 362 runs, 4 regressions (v5.9-10224-g4054eebdf=
dd6)

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

panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-10224-g4054eebdfdd6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-10224-g4054eebdfdd6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4054eebdfdd6659984837d69af89cd829bea94fa =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f88f2b817ea01fd664ff3ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-10224-=
g4054eebdfdd6/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-10224-=
g4054eebdfdd6/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f88f2b817ea01fd664ff=
400
      failing since 163 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f88efd4e641e5e7014ff3ea

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-10224-=
g4054eebdfdd6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-10224-=
g4054eebdfdd6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f88efd4e641e5e7=
014ff3ee
      failing since 0 day (last pass: v5.9-3938-gf4dd85cd788b, first fail: =
v5.9-6706-g0a18568236af)
      1 lines

    2020-10-16 00:54:47.723000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-16 00:54:47.723000  (user:khilman) is already connected
    2020-10-16 00:55:03.539000  =00
    2020-10-16 00:55:03.539000  =

    2020-10-16 00:55:03.539000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-16 00:55:03.539000  =

    2020-10-16 00:55:03.539000  DRAM:  948 MiB
    2020-10-16 00:55:03.554000  RPI 3 Model B (0xa02082)
    2020-10-16 00:55:03.641000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-16 00:55:03.673000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f88f1faff6fac34ad4ff42d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-10224-=
g4054eebdfdd6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-10224-=
g4054eebdfdd6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f88f1faff6fac3=
4ad4ff433
      failing since 71 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-16 01:05:52.683000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-16 01:05:52.688000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-16 01:05:52.694000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-16 01:05:52.700000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-16 01:05:52.706000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-16 01:05:52.711000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-16 01:05:52.717000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-16 01:05:52.723000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-16 01:05:52.729000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-16 01:05:52.734000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f88f4f709f72696a04ff3ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-10224-=
g4054eebdfdd6/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-10224-=
g4054eebdfdd6/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f88f4f709f72696a04ff=
3ed
      failing since 71 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
