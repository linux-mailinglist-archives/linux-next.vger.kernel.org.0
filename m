Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAB22947B3
	for <lists+linux-next@lfdr.de>; Wed, 21 Oct 2020 07:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440367AbgJUFJ5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 01:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440357AbgJUFJ5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2020 01:09:57 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19104C0613CE
        for <linux-next@vger.kernel.org>; Tue, 20 Oct 2020 22:09:57 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id n16so742080pgv.13
        for <linux-next@vger.kernel.org>; Tue, 20 Oct 2020 22:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rzwddJzTFSm/rSSplK13N8WTkQHLYjPk318QVP8gcb8=;
        b=UQ44qLkaS/SjlH8QwuBGDriCuXuCCKXIVXjuX9uLlcTnXH27EJaiD2ndwTwRnkeCWh
         jbbbqAqbmucpQQtPepbMvUsDC54X5f4jmIHZMJhTPb5OKoyenwnqINE5EQo8lkrhDUU6
         ffy/awP3ig29XQrnNgYsjej39neTFWu2+SlFXEXsM40wiPH4Ueiabx0V0z2KL8blyM0W
         i1f9v7h3U65/WEzr86EbZo5qgqzQP+dWdH3XBWz7+fTMlDWOeJBmZOQizwxv3Mut2G4D
         lB0sxQGYhOImeTSl4MgifCvDWSnO2dZCxjlFXxu/DoFRMNM7kWuptHWMasEZNS9B0FdK
         g14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rzwddJzTFSm/rSSplK13N8WTkQHLYjPk318QVP8gcb8=;
        b=TCxm5sjoUt40JsjyC9YuchjK2tOWfuHTDgvdLiC13Y7NEJgfSGGQQNfY+f8DFPulKy
         Jz52B2yBnrkrLioe7iSBDvCw8M9KicEVVtW3uuqw1iEtY/T15VXjFnRve1sxTfb5dn9o
         4VIvVthewP9sCBUmgzD+bc5YEbnnOcShLZrj/eBXbrmkG2pSMBQeyfB2OQyxEeN5syHD
         ZZgv6kcgUYE8x3vzjgbwL5QiiGFzWd1/wW3Qc7oCZ/uKelFQhOGQtTwREJPVAnZG/Mo8
         S5j0/3TJOovzCcmYz4U3uUDYgxddYh6enbd/gIkVo5/YAG/Qwn4mHVbddDmEHGeSyeHz
         Y4mA==
X-Gm-Message-State: AOAM5311sQRbvUEY3bU4pW63xCbcVcDbib6we03i7Hpyo6C7v+mW3fhH
        Xwg8t8LXWrWPzGgZqw/PG411dJoWTj/8Yw==
X-Google-Smtp-Source: ABdhPJxScabZGGodQgsy0pw3bsnDIj0R8wz4FsY7JTfvgKpZ696x/x2hcfsICoOIwbYrHi2kNHdaow==
X-Received: by 2002:a63:7549:: with SMTP id f9mr1714176pgn.47.1603256996057;
        Tue, 20 Oct 2020 22:09:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id kb15sm625640pjb.17.2020.10.20.22.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 22:09:55 -0700 (PDT)
Message-ID: <5f8fc2a3.1c69fb81.c2572.271a@mx.google.com>
Date:   Tue, 20 Oct 2020 22:09:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-12353-gd3f7f27bb8d1
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 252 runs,
 4 regressions (v5.9-12353-gd3f7f27bb8d1)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 252 runs, 4 regressions (v5.9-12353-gd3f7f27bb=
8d1)

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

panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-12353-gd3f7f27bb8d1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-12353-gd3f7f27bb8d1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d3f7f27bb8d10d29731bcdcb9ec4cb4d39a9407d =



Test Regressions
---------------- =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig             =
       | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f8f8ce1fed74b7c794ff41f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-12353-=
gd3f7f27bb8d1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-12353-=
gd3f7f27bb8d1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f8f8ce1fed74b7c=
794ff423
      new failure (last pass: v5.9-10224-g4054eebdfdd6)
      2 lines

    2020-10-21 01:18:20.171000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-21 01:18:20.172000  (user:khilman) is already connected
    2020-10-21 01:18:36.139000  =00
    2020-10-21 01:18:36.139000  =

    2020-10-21 01:18:36.154000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-21 01:18:36.154000  =

    2020-10-21 01:18:36.154000  DRAM:  948 MiB
    2020-10-21 01:18:36.170000  RPI 3 Model B (0xa02082)
    2020-10-21 01:18:36.259000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-21 01:18:36.290000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (383 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
bcm2837-rpi-3-b | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OMIZE_=
BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f8f8fd3c72926670b4ff3f5

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-12353-=
gd3f7f27bb8d1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-12353-=
gd3f7f27bb8d1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f8f8fd3c7292667=
0b4ff3f9
      failing since 5 days (last pass: v5.9-3938-gf4dd85cd788b, first fail:=
 v5.9-6706-g0a18568236af)
      2 lines

    2020-10-21 01:30:23.832000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-21 01:30:23.832000  (user:khilman) is already connected
    2020-10-21 01:30:39.739000  =00
    2020-10-21 01:30:39.740000  =

    2020-10-21 01:30:39.740000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-21 01:30:39.740000  =

    2020-10-21 01:30:39.740000  DRAM:  948 MiB
    2020-10-21 01:30:39.756000  RPI 3 Model B (0xa02082)
    2020-10-21 01:30:39.842000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-21 01:30:39.874000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (388 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG=
_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f8f93f800db5df9034ff3f6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-12353-=
gd3f7f27bb8d1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-12353-=
gd3f7f27bb8d1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f8f93f800db5df=
9034ff3fc
      failing since 76 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-10-21 01:50:43.042000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-10-21 01:50:43.047000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-10-21 01:50:43.053000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-10-21 01:50:43.059000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-10-21 01:50:43.065000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-10-21 01:50:43.070000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-10-21 01:50:43.076000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-10-21 01:50:43.082000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-10-21 01:50:43.088000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-10-21 01:50:43.094000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform        | arch  | lab           | compiler | defconfig             =
       | results
----------------+-------+---------------+----------+-----------------------=
-------+--------
panda           | arm   | lab-collabora | gcc-8    | omap2plus_defconfig   =
       | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f8f95d3ce20b03fa24ff3ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-12353-=
gd3f7f27bb8d1/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-12353-=
gd3f7f27bb8d1/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f8f95d3ce20b03fa24ff=
3eb
      failing since 76 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
