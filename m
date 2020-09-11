Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B5326585B
	for <lists+linux-next@lfdr.de>; Fri, 11 Sep 2020 06:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgIKEb0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Sep 2020 00:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgIKEbZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Sep 2020 00:31:25 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9A8C061573
        for <linux-next@vger.kernel.org>; Thu, 10 Sep 2020 21:31:25 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id v15so5712514pgh.6
        for <linux-next@vger.kernel.org>; Thu, 10 Sep 2020 21:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=q3+EF7ZKWV7yQl5Br36dXN3pMDO+I6KUO56KWgFG10g=;
        b=n9txHpRdamNGvC+P4aDCFswkQZjVDF/u6uWiaMQrh/n19nDYshX1CsrVJ391vwu2gs
         RenrXjNB/8PmvqDbchQJP9gA/b7hqn8YdY7kuxKs6CyQHbvQOFFwongeBl89PIm82uPL
         A18TeDEHc+/12cScaInFJcHZws7jYUgI1CqY/MhWJtYwOr4QxphEiyabCdiXcoxFP4lU
         nfVpFfCpDyi6RvtXn2//JJfu0IiojFlB2/qzgjSg4qNsOCPS22DzoyzAIdSRyjWszKbi
         /NDsaG6CtLS/F2BEUm8ZnZJeeqfXaUldTGLzxmaocww8SOzeZsr5kUZoNk6ZEp8vvyvx
         wx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=q3+EF7ZKWV7yQl5Br36dXN3pMDO+I6KUO56KWgFG10g=;
        b=dggQnVDHLk0LbjbgeiVziFJDBG4kQ5lyd2MGjVfFoYo9MZjZ300j2UZuDygOSQlNze
         bMrzjicny9ISRBI3plSRvtbP7UInlDqTwHRcr4EC+I9Wjy3fmfz81aJREP2ifqou0etR
         vI+18mCKcuZzGeDFqU3hBQAtQaBRvvV7OQUjlessrvs36bthkwbkrX83OfRuDFgN5nMJ
         lFR4ftj+lrhQHRYIFLxi8BsE6g7MKZ0PL5hM2zMXBdG+VakzTEo2YKOZk8b3/Gtm74/G
         zOxq8a/QpGbW3TVne+s2lJ5i/LpTSIW+CO5DuM+n+KO9NROaJP/S4FOIRo7o3uq52f+P
         GyvQ==
X-Gm-Message-State: AOAM533mP78LiPUOB4L3ykGU8w3MLmJ3ORTwFwUmF6tU/e+w+Fd49d6G
        OzUR3juEBiJghbdUGSeNl1n6HDhjjxy4Ag==
X-Google-Smtp-Source: ABdhPJwO7pcDPGzMFQNCavNtwCgA+oT4HtNHlvB5Yd+Dw95pHlk2I5KYdNV3L73vth21lK9bLlpgPQ==
X-Received: by 2002:a63:7d5a:: with SMTP id m26mr327988pgn.373.1599798684264;
        Thu, 10 Sep 2020 21:31:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x20sm671162pfr.190.2020.09.10.21.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 21:31:23 -0700 (PDT)
Message-ID: <5f5afd9b.1c69fb81.21619.28af@mx.google.com>
Date:   Thu, 10 Sep 2020 21:31:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc4-402-gc7fa2d821136
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 288 runs,
 5 regressions (v5.9-rc4-402-gc7fa2d821136)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 288 runs, 5 regressions (v5.9-rc4-402-gc7fa2d8=
21136)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig             =
       | 3/4    =

bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 3/4    =

panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 4/5    =

panda           | arm   | lab-baylibre  | gcc-8    | omap2plus_defconfig   =
       | 0/1    =

panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc4-402-gc7fa2d821136/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc4-402-gc7fa2d821136
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c7fa2d821136a8951cfe7ddd0f6521e241dce597 =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig             =
       | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f5abdc1daaa425c74d3538c

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-40=
2-gc7fa2d821136/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-40=
2-gc7fa2d821136/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f5abdc1daaa425c=
74d3538e
      failing since 7 days (last pass: v5.9-rc3-380-g4d386b9bd46d, first fa=
il: v5.9-rc3-474-gc41730a9bddc)
      5 lines  =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f5abe8c6787704c32d3537f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-40=
2-gc7fa2d821136/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-40=
2-gc7fa2d821136/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f5abe8c6787704c=
32d35381
      new failure (last pass: v5.9-rc4-363-g1dfc67596dbb)
      1 lines

    2020-09-11 00:00:10.852000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-09-11 00:00:10.852000  (user:khilman) is already connected
    2020-09-11 00:00:26.404000  =00
    2020-09-11 00:00:26.404000  =

    2020-09-11 00:00:26.420000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-09-11 00:00:26.420000  =

    2020-09-11 00:00:26.420000  DRAM:  948 MiB
    2020-09-11 00:00:26.436000  RPI 3 Model B (0xa02082)
    2020-09-11 00:00:26.525000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-09-11 00:00:26.557000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (378 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f5ac22879b458e4c3d3537b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-40=
2-gc7fa2d821136/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-40=
2-gc7fa2d821136/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5ac22879b458e=
4c3d3537f
      failing since 36 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-11 00:17:38.276000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-11 00:17:38.282000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-11 00:17:38.287000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-11 00:17:38.293000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-11 00:17:38.299000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-11 00:17:38.305000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-11 00:17:38.311000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-11 00:17:38.316000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-11 00:17:38.322000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-11 00:17:38.328000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-baylibre  | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5ac9cd4c86b2c73bd35370

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-40=
2-gc7fa2d821136/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-40=
2-gc7fa2d821136/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5ac9cd4c86b2c73bd35=
371
      failing since 36 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5ac65f179bbf60d9d35382

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-40=
2-gc7fa2d821136/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-40=
2-gc7fa2d821136/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5ac65f179bbf60d9d35=
383
      failing since 36 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
