Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A8526A2A9
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 12:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgIOKEL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 06:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgIOKEK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 06:04:10 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1BFC06174A
        for <linux-next@vger.kernel.org>; Tue, 15 Sep 2020 03:04:09 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 34so1686496pgo.13
        for <linux-next@vger.kernel.org>; Tue, 15 Sep 2020 03:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4aqb5tSZMYd9fKU4DJU3veqo3zBPEPQ2ADrhtx23rK4=;
        b=t7pgN6fKcAZpeiPPfRYbyz5b1gPKA2nJoBilgPgO9Pi3IbT2w2IfopJIrwCjUgHKpZ
         I1roOEA806yYp/SGjtec8jm4HZgPDNTAomoGCMvqlBUA3ATbXARVeaw7Zrg+j4j3zJKJ
         QUXc5vNZDfZvRnAlwReTLQOvOObUU9cIoCQiywzBTsx2OeSH9uXlXKJjhkfUcjvgAidi
         XgEsxYWjhfANunUf/epVcUtgaI5sYXQVx/aDPQklBWAnAlyepHWnsu6aroqA8FHjyeyn
         0lsbo5TRfupXMYj084lJ/y0xX/qUaICoq6I8N3AzV6tv6aahkILz12PWR18vTvNPzOjt
         KcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4aqb5tSZMYd9fKU4DJU3veqo3zBPEPQ2ADrhtx23rK4=;
        b=dAD3BANWohHs3lCFOnit0uDJXT+OlChwMO87sHYeaM+zCI6EiRGHbM81Pu7Ovrd3HK
         2IOf5MiAgw/s6V32Ue1kDE1Xs6nTYEU14el5X0yiR7wVwFEUKJQBf51xdRHwFzOxIVB7
         he+JHA1kI61x6aW6CDJ+lcXemuk1ixqQm7INwa2rh1h0fz/fLHTHucdShT4jaoQxHQwg
         UpIBhPRLcQyfqLu2opNQsiTBNTH5P68o7unp5/cArCcdJaCJK0A/1Y0LpBkKaWnlXfFF
         GCvCmF/XhYypcH+cQ5mBUkzaJbZP+1L/I8Ub5nAD7KcoMKJCDm3hZzv/vhFsgzSuaDDU
         lWAw==
X-Gm-Message-State: AOAM530IKEj8Tn6gpzu+aKvNBFmNiUwgFa8xCDIBlb42F/M4avaNTJ9X
        Ma5u3IrDOWl7gq0Ny+Orl/JOnMQT0l37BA==
X-Google-Smtp-Source: ABdhPJyomUYpQNbi58kf94dkCBmpEBRH7ZyQQgROeczRxdjIriy3szs1qFLrBO9o9fBRdIl01kOevg==
X-Received: by 2002:a62:dd01:0:b029:13c:f607:5fff with SMTP id w1-20020a62dd010000b029013cf6075fffmr17051569pff.3.1600164248466;
        Tue, 15 Sep 2020 03:04:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i30sm10904863pgn.49.2020.09.15.03.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 03:04:07 -0700 (PDT)
Message-ID: <5f609197.1c69fb81.73dcf.cf5f@mx.google.com>
Date:   Tue, 15 Sep 2020 03:04:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.9-rc5-238-gd77f530bdc3a
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 323 runs,
 4 regressions (v5.9-rc5-238-gd77f530bdc3a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 323 runs, 4 regressions (v5.9-rc5-238-gd77f530=
bdc3a)

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

panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc5-238-gd77f530bdc3a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc5-238-gd77f530bdc3a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d77f530bdc3a2daaeb17940caf793f4aba5c9087 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f605a60e05d141bfaa60927

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-23=
8-gd77f530bdc3a/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-23=
8-gd77f530bdc3a/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f605a60e05d141bfaa60=
928
      failing since 132 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f605c32b5a1cb7dbba6095f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-23=
8-gd77f530bdc3a/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-23=
8-gd77f530bdc3a/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f605c32b5a1cb7d=
bba60961
      failing since 11 days (last pass: v5.9-rc3-380-g4d386b9bd46d, first f=
ail: v5.9-rc3-474-gc41730a9bddc)
      3 lines

    2020-09-15 06:13:23.012000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-09-15 06:13:23.012000  (user:khilman) is already connected
    2020-09-15 06:13:38.628000  =00
    2020-09-15 06:13:38.628000  =

    2020-09-15 06:13:38.644000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-09-15 06:13:38.644000  =

    2020-09-15 06:13:38.644000  DRAM:  948 MiB
    2020-09-15 06:13:38.676000  RPI 3 Model B (0xa02082)
    2020-09-15 06:13:38.752000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-09-15 06:13:38.784000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (389 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f605bc7d2535fc412a6092e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-23=
8-gd77f530bdc3a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-23=
8-gd77f530bdc3a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f605bc7d2535fc=
412a60932
      failing since 41 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-15 06:14:25.397000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-15 06:14:25.402000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-15 06:14:25.411000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-15 06:14:25.416000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-15 06:14:25.420000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-15 06:14:25.425000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-15 06:14:25.430000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-15 06:14:25.439000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-15 06:14:25.444000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-15 06:14:25.449000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f605d9078f8b63d04a6092e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-23=
8-gd77f530bdc3a/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc5-23=
8-gd77f530bdc3a/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f605d9078f8b63d04a60=
92f
      failing since 41 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
