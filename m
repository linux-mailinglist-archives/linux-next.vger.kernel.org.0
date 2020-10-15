Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB9428EFC9
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 12:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgJOKCH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 06:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbgJOKCG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 06:02:06 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875BCC061755
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 03:02:06 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id 144so1727203pfb.4
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qOihfVom24GDQPnUqf25ijPMzDDn3NPJoSt/bJJ3nhc=;
        b=ZuKANKGctk2Tf005Tc9eAQHghZrlP2GMDTr9s/IVIPls9LBe/FVIKQaZeGHH6IPeuf
         C41i7nCmIKLDjUw+AQwrVWGZ4oVSYyxrku7xUJ4YqYXe8aXfEyCgR+AFJW1E2TjbiFuq
         EvWWgMkQBo3nv0uMGHaK9IGDe6gbs/hqG2v1iaMjddYgVBMfFCj1AwZrRbncRMWUIbAO
         rS2RwiCmoSEf6g+R18f0VvrtVNG+RwfLGhKMQu34KeNsssKZ5PBVyMM3RVV3g73Yt44r
         DguErvZ2PbcmnuU+uzEZP9wdHzCkXIQwPIR8eczqYqnHmdh9nydBF010f2Ems2wzHkl/
         jwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qOihfVom24GDQPnUqf25ijPMzDDn3NPJoSt/bJJ3nhc=;
        b=JqWDYKjhSFkvrkz3yu/Xm3HfK+njRkxNWaXAlD6HLzZ9skA4/U+DORC3G8b0nGJ/Bp
         bbbuyltX/8Ziog93iwacHVvGk4tr62jO2p2H/kdjiiTZyP933kGecCcGCFo8S+FW02O0
         RPDlwR3rmGlsvi5/cGnfHdBBbgnWW57sLLNqcFCduWTYdS2RKLZj5hv95VjufNjkJKxt
         KOv6pT6CEfnfRCCVARltp8UYa5XzdrGs9BJxPVd1qnqqGSvpLpIs5elj6lMb0FJqCyWS
         P9GFNuA0dXLmJmX2dNw6a+46PN6lvcerl73QN2m4Cpw72zwkyXHSDI2l0GB2VukUWRZF
         Nvgg==
X-Gm-Message-State: AOAM5310ImVlvDzhLma+vzjRdAzu32lWUh+M2qcZwXS4wQ5MQUVJOjj0
        BlUSPjcyKN1twTMCTMX0T9QrRCnCDBQ7aQ==
X-Google-Smtp-Source: ABdhPJzFciaKXLZmaf5P8yntGos1l9ZWG1yQaIFzA8TDZb1SFxIICn7MlzMLEi//PvE5v5xHU6de7w==
X-Received: by 2002:a63:1e0b:: with SMTP id e11mr2686112pge.72.1602756125405;
        Thu, 15 Oct 2020 03:02:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t6sm2527306pgn.26.2020.10.15.03.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 03:02:04 -0700 (PDT)
Message-ID: <5f881e1c.1c69fb81.ff3fe.5153@mx.google.com>
Date:   Thu, 15 Oct 2020 03:02:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-6706-g0a18568236af
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 290 runs,
 5 regressions (v5.9-6706-g0a18568236af)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 290 runs, 5 regressions (v5.9-6706-g0a18568236=
af)

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

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =

panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-6706-g0a18568236af/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-6706-g0a18568236af
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0a18568236af1b27cbd4cdd4113e68ec65ffa9fb =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f87e33ac16a03b9854ff3f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-6706-g=
0a18568236af/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-6706-g=
0a18568236af/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f87e33ac16a03b9854ff=
3f4
      failing since 162 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f87e2a8bad03b3b864ff3fb

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-6706-g=
0a18568236af/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-6706-g=
0a18568236af/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f87e2a8bad03b3b=
864ff3ff
      failing since 3 days (last pass: v5.9-rc8-340-g65849916deb5, first fa=
il: v5.9-162-g560c51a7f3d5)
      1 lines

    2020-10-15 05:46:21.951000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-15 05:46:21.951000  (user:khilman) is already connected
    2020-10-15 05:46:36.803000  =00
    2020-10-15 05:46:36.803000  =

    2020-10-15 05:46:36.803000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-15 05:46:36.803000  =

    2020-10-15 05:46:36.803000  DRAM:  948 MiB
    2020-10-15 05:46:36.818000  RPI 3 Model B (0xa02082)
    2020-10-15 05:46:36.905000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-15 05:46:36.937000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f87e583d8b0ac88704ff3e8

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-6706-g=
0a18568236af/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/b=
aseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-6706-g=
0a18568236af/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/b=
aseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f87e583d8b0ac88=
704ff3ec
      new failure (last pass: v5.9-3938-gf4dd85cd788b)
      2 lines

    2020-10-15 05:58:20.670000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-15 05:58:20.670000  (user:khilman) is already connected
    2020-10-15 05:58:36.049000  =00
    2020-10-15 05:58:36.049000  =

    2020-10-15 05:58:36.049000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-15 05:58:36.049000  =

    2020-10-15 05:58:36.050000  DRAM:  948 MiB
    2020-10-15 05:58:36.065000  RPI 3 Model B (0xa02082)
    2020-10-15 05:58:36.153000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-15 05:58:36.185000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (383 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f87e557ee81f0b0914ff457

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-6706-g=
0a18568236af/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-6706-g=
0a18568236af/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f87e557ee81f0b=
0914ff45d
      failing since 71 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-15 05:59:45.518000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-15 05:59:45.524000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-15 05:59:45.530000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-15 05:59:45.536000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-15 05:59:45.543000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-15 05:59:45.547000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-15 05:59:45.553000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-15 05:59:45.559000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-15 05:59:45.564000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-15 05:59:45.580000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f87e6a78a9d0648444ff3e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-6706-g=
0a18568236af/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-6706-g=
0a18568236af/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f87e6a78a9d0648444ff=
3e8
      failing since 71 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
