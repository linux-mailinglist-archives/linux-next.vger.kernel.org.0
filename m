Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0EFB263B78
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 05:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbgIJDa2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 23:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgIJDaZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 23:30:25 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260D9C061573
        for <linux-next@vger.kernel.org>; Wed,  9 Sep 2020 20:30:24 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id bd2so229186plb.7
        for <linux-next@vger.kernel.org>; Wed, 09 Sep 2020 20:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HCxgVneQJ9imDhhKE671gWGRU2GPxG0SIJRYLNdvVLY=;
        b=Cj3LZzYS5V2xbGO86Lv+HsufBQcVQGgYeqT0qaPN+O9oTIsZgx4BkYEBjuP6Oi7zO8
         CdHZLutgL4yqWNMd3uWva929BFdl5aaMwUuKmvTA5na1IobbLapIpt3Y48pdN3cMtVqS
         iKvKyhU8r9kTVhdswofFla2r3fhzscZBE4Ru9ltB2tYbaWmxbKy7sj8eDvVyZNERdrBu
         J4Uw5EJxp2eWn+Olu7kK/V3J0HmrXfVPT0byAvYMPjpcQlGO7SwVa1pWjoIbHG7V/GpI
         lNsOFacd44p1XmEwRaXEAIdNzJCeK+FqTNSoldz2MRepmMZwAV9g8gFgli1/MAE0sA8/
         wh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HCxgVneQJ9imDhhKE671gWGRU2GPxG0SIJRYLNdvVLY=;
        b=IDAjTDl4vDHWWklcsfks1Y1fV8PGg0BreozHkaUIsHqRx1wMWladOIqJo4tIZNMeFJ
         p37Dw58DbGWo9CXKeoIDaLdMyn/D2ehNcNdcpK3aO9dDZv4giar5fWo/kjRt54Q+BBmb
         bl0H+1+Le5GNiD4k77rFulT9MFVmjhMVemX6f3mlsBtYHhsgBynTi60WGlsBvsCkEA39
         5/X6U41ez4fpOyPBaI3LHlo9nqVKcHqZ77+kvWuhPcs82C/DDQwQ8r1UtjPWZNtEJAgo
         U5z1l0pnKhd1e/lWV4mBApwGMvb3s3fXG5yEaAcyyePTNYrcf6VM8QScWW8Y2g996atE
         ubIA==
X-Gm-Message-State: AOAM531yt/2ecepvu+k2pjMzkUd5AodoYDccsj2h1AN41d0x73vJ4GA1
        WXPNwY8jP48jz3tJnj4ASAIoFC3Mm2Qq/Q==
X-Google-Smtp-Source: ABdhPJzgHketUnKHpv1CCG/N7w+PJda0dOdGYqXC28/eD+2/pc4fB9Wp5DMI2A1ejNU9o6eDL1T+5A==
X-Received: by 2002:a17:90a:4803:: with SMTP id a3mr3394498pjh.192.1599708622237;
        Wed, 09 Sep 2020 20:30:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n2sm4030083pfe.208.2020.09.09.20.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 20:30:21 -0700 (PDT)
Message-ID: <5f599dcd.1c69fb81.90d7e.cbde@mx.google.com>
Date:   Wed, 09 Sep 2020 20:30:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc4-363-g1dfc67596dbb
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 324 runs,
 3 regressions (v5.9-rc4-363-g1dfc67596dbb)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 324 runs, 3 regressions (v5.9-rc4-363-g1dfc675=
96dbb)

Regressions Summary
-------------------

platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig             =
       | 3/4    =

panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 4/5    =

panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc4-363-g1dfc67596dbb/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc4-363-g1dfc67596dbb
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1dfc67596dbbc7bab78376ebb1afdce355f3fdca =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig             =
       | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f5961661922e5436ed353b1

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-36=
3-g1dfc67596dbb/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-36=
3-g1dfc67596dbb/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f5961661922e543=
6ed353b3
      failing since 5 days (last pass: v5.9-rc3-380-g4d386b9bd46d, first fa=
il: v5.9-rc3-474-gc41730a9bddc)
      2 lines

    2020-09-09 23:10:26.975000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-09-09 23:10:26.975000  (user:khilman) is already connected
    2020-09-09 23:10:42.696000  =00
    2020-09-09 23:10:42.697000  =

    2020-09-09 23:10:42.697000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-09-09 23:10:42.697000  =

    2020-09-09 23:10:42.697000  DRAM:  948 MiB
    2020-09-09 23:10:42.713000  RPI 3 Model B (0xa02082)
    2020-09-09 23:10:42.800000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-09-09 23:10:42.831000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (381 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f596543513b347ed5d35395

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-36=
3-g1dfc67596dbb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-36=
3-g1dfc67596dbb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f596543513b347=
ed5d35399
      failing since 35 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-09 23:29:00.587000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-09 23:29:00.593000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-09 23:29:00.598000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-09 23:29:00.604000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-09 23:29:00.610000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-09 23:29:00.616000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-09 23:29:00.627000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-09 23:29:00.628000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-09 23:29:00.633000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-09 23:29:00.639000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f596437832520d2c2d35384

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-36=
3-g1dfc67596dbb/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-36=
3-g1dfc67596dbb/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f596437832520d2c2d35=
385
      failing since 35 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
