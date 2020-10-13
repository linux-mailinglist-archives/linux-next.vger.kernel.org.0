Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C774928DD1E
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 11:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbgJNJW1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 05:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731138AbgJNJVv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 05:21:51 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64777C08EC70
        for <linux-next@vger.kernel.org>; Tue, 13 Oct 2020 16:59:17 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id j8so479793pjy.5
        for <linux-next@vger.kernel.org>; Tue, 13 Oct 2020 16:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9P/TMr16Dm58cS82Z+yl1d28qKeY+wAM0H6Y4gS85Hw=;
        b=x0BZm7aCyDfDtYI/p2YvQv0tOzbvB7W/IAUL+ItRdKbakg+5OXvUEbc/0ecYMbBbnE
         79rNIPVF8Q1LzEpoEPU3K5o7+74knsDFzRzAsBMDtwONq52K/OowOTaZTmTeUnETiU+Y
         V/49WznKyBBefz4tu8ldyx7w7XjRDBXeF/YsgWqPFvVIDZJu8za7I9LbZOhYxnspXiPS
         fFy5luY1eKIzT2sngLxgkQKcIekbltOfAYbRwihcPS+35sYBMECFHLHZAVFzBnw+NHKs
         rNSGR4L1f8ZKZHlQAJkn6EUEnS60ddWHIS+/+6BIBoMLbeGvJilWTJYmJIKe0LPGtDB4
         sMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9P/TMr16Dm58cS82Z+yl1d28qKeY+wAM0H6Y4gS85Hw=;
        b=IEQQErv+lthKeocZDopV2mRccA4Y9KzhIqZ2t+J/DHeazVyd3xxbK/oa0Ry41nX/ig
         HNOwAlbMaxem7zonPsJogArS5dqMH4K5kDIuZ4qM/Qm/HzDGc+S9jwdvA7DcYaxobXO6
         VihjpQqgdIqaS5cHRWcFnPvFzDiuicoGI7DFZxcS2SkVd6I4aA19yE36GiSgfoJ1zoUj
         3Lpm+D3RGmxPVrj/WI+6G8rqSpixkLXmyLxSgMuvwQTOaQuvPd3xxWATn2Gw8HQZJbuk
         CTix9nVg0+rlBl1/UFsRWT27tv9AOE/tTqnWxTLRaAygZm4P4ZVTT2/a+gyQFGJ1U+ff
         mUFQ==
X-Gm-Message-State: AOAM530Pj3dNGQU3yhJLChDgPYQhMs2pg28BVMcOSS0DIOT4pLrGba1F
        QlQX+nf1W5KjFaPGQMgDZlwOQ/dpv+88DQ==
X-Google-Smtp-Source: ABdhPJzAdXZoXv6Ffls3mZ8vNzJt/GpRudQ/L5K6t/sQ+mu5bikh8+ibv+6owpfYWXZ0Z8ICbjrVlA==
X-Received: by 2002:a17:90a:a389:: with SMTP id x9mr729057pjp.99.1602633556108;
        Tue, 13 Oct 2020 16:59:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 189sm850533pfw.123.2020.10.13.16.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 16:59:15 -0700 (PDT)
Message-ID: <5f863f53.1c69fb81.9e269.250d@mx.google.com>
Date:   Tue, 13 Oct 2020 16:59:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-3938-gf4dd85cd788b
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 354 runs,
 5 regressions (v5.9-3938-gf4dd85cd788b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 354 runs, 5 regressions (v5.9-3938-gf4dd85cd78=
8b)

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

rk3288-veyron-jaq     | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-3938-gf4dd85cd788b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-3938-gf4dd85cd788b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f4dd85cd788b42bad73ffd0ae6d3f954fb746ed6 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f860385ebc40084544ff3e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-3938-g=
f4dd85cd788b/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-3938-g=
f4dd85cd788b/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f860385ebc40084544ff=
3e5
      failing since 161 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f860500c5428220dc4ff3ec

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-3938-g=
f4dd85cd788b/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-3938-g=
f4dd85cd788b/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f860500c5428220=
dc4ff3f0
      failing since 1 day (last pass: v5.9-rc8-340-g65849916deb5, first fai=
l: v5.9-162-g560c51a7f3d5)
      2 lines

    2020-10-13 19:48:06.766000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-13 19:48:06.767000  (user:khilman) is already connected
    2020-10-13 19:48:23.375000  =00
    2020-10-13 19:48:23.376000  =

    2020-10-13 19:48:23.376000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-13 19:48:23.376000  =

    2020-10-13 19:48:23.376000  DRAM:  948 MiB
    2020-10-13 19:48:23.392000  RPI 3 Model B (0xa02082)
    2020-10-13 19:48:23.477000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-13 19:48:23.509000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (383 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f860637d1e1b4a6e74ff3ee

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-3938-g=
f4dd85cd788b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-3938-g=
f4dd85cd788b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f860637d1e1b4a=
6e74ff3f4
      failing since 69 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-13 19:55:28.196000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-13 19:55:28.201000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-13 19:55:28.207000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-13 19:55:28.213000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-13 19:55:28.218000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-13 19:55:28.224000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-13 19:55:28.230000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-13 19:55:28.236000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-13 19:55:28.242000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-13 19:55:28.247000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f860791f06652fe084ff3e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-3938-g=
f4dd85cd788b/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-3938-g=
f4dd85cd788b/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f860791f06652fe084ff=
3e1
      failing since 69 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3288-veyron-jaq     | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f86106960a90017a94ff3f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-3938-g=
f4dd85cd788b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-3938-g=
f4dd85cd788b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f86106960a90017a94ff=
3f5
      new failure (last pass: v5.9-162-g560c51a7f3d5)  =20
