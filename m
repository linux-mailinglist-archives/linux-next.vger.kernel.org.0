Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669FA281B51
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 21:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgJBTC5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 15:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgJBTC5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 15:02:57 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B27EC0613D0
        for <linux-next@vger.kernel.org>; Fri,  2 Oct 2020 12:02:57 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id h6so718138pgk.4
        for <linux-next@vger.kernel.org>; Fri, 02 Oct 2020 12:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=b/J91Obuu2HsYb3HdFQ5tgTBsPKpPFMk4RVP0Kd6+us=;
        b=KVqC4L5iQMyDgDkVjV/Lj3UbM4LxIrel3OfORgWtdGBQldAYpFQsE560XoETICtFXH
         q6EjPG97gCK15S5BOKjZWIEexU4e0Tm2CXm55sD3oXERiQSgIFgtRFoepVfrTDw7yZer
         cmIdxNj7Hpr2VlfL1Q6vwH9CI2rCnDzz0g1tS/N/+oJpTMFKHNjULa/ZTR95VlhZTDIJ
         BGRwECFzGzvSo2YqU47H5jwz9wgsul/cp7G9X9APmt/6aVL43YZzZIN286YpMks1knF1
         BVDUmGjrzhFo+j3z/li8sYJUn6/yfM9pegO12YtBt/3+Et0GswLnWaDj0r6H8+UhhaEp
         9SoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=b/J91Obuu2HsYb3HdFQ5tgTBsPKpPFMk4RVP0Kd6+us=;
        b=sjkFys5pxT5O8QZn1Kpa8O+Ez9d9E3HZu8rg1qSLjU3rS3Y2cnCFAULmq+4XYT8KE9
         rH1qi4KrPE4JUKG9St6tip2TLD5vhNSuyqdSohtrrUf211IE0bCqhoG2A1LkBkH25BAq
         lTS59QEi0EsZCYMX5hu8x/8qmnEsIEPeCpkdGM+uKryn7dXMLINw0WL/Anm9LhgQrclR
         hHTlxcphPeFC+7dHk7QpmntyvedA7GQEQ/FphF8JohId9HqTHSmBnjbKQNWHVbfVQKQX
         Zk/GHDVxdQfwO65HyrEJm3fxrZih8iWVbBbVncvYmV63WPKx0ohXnEmGUDb9r9GXxeQ4
         3Jug==
X-Gm-Message-State: AOAM5320xxmsEsVH4AEFsnfKxe7fCFpDYj4FGFQ0q1z8DV+demrCRnVc
        GPHc+rz7xjDYsFUZFwRs6Mc7aDEsdQ3p5w==
X-Google-Smtp-Source: ABdhPJwwmKKGICPvWCP5B6R0xlY16JGmsR06hkxP8bKTEpqNwpmkPFHB3+0IoxgwZkupp7Ne1piIqQ==
X-Received: by 2002:a63:6746:: with SMTP id b67mr3161727pgc.301.1601665376485;
        Fri, 02 Oct 2020 12:02:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n7sm2742438pfq.114.2020.10.02.12.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 12:02:55 -0700 (PDT)
Message-ID: <5f77795f.1c69fb81.96527.52a5@mx.google.com>
Date:   Fri, 02 Oct 2020 12:02:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201002
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 419 runs, 7 regressions (next-20201002)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 419 runs, 7 regressions (next-20201002)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =

rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 0/1    =

rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201002/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201002
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2172e358cd1713c5b7c31361ac465edfe55e455c =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f773f5bf3cfb0e18b4ff3eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201002/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201002/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f773f5bf3cfb0e18b4ff=
3ec
      failing since 157 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f773f90a75df271894ff3e6

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201002/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201002/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f773f90a75df271=
894ff3ea
      new failure (last pass: next-20201001)
      1 lines

    2020-10-02 14:53:31.037000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-02 14:53:31.037000  (user:khilman) is already connected
    2020-10-02 14:53:45.960000  =00
    2020-10-02 14:53:45.961000  =

    2020-10-02 14:53:45.977000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-02 14:53:45.977000  =

    2020-10-02 14:53:45.978000  DRAM:  948 MiB
    2020-10-02 14:53:45.993000  RPI 3 Model B (0xa02082)
    2020-10-02 14:53:46.081000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-02 14:53:46.113000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (385 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7740c936ee2d32ec4ff488

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201002/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201002/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7740c936ee2d32=
ec4ff48c
      failing since 1 day (last pass: next-20200930, first fail: next-20201=
001)
      2 lines

    2020-10-02 14:58:47.149000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-02 14:58:47.149000  (user:khilman) is already connected
    2020-10-02 14:59:03.455000  =00
    2020-10-02 14:59:03.455000  =

    2020-10-02 14:59:03.455000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-02 14:59:03.456000  =

    2020-10-02 14:59:03.456000  DRAM:  948 MiB
    2020-10-02 14:59:03.471000  RPI 3 Model B (0xa02082)
    2020-10-02 14:59:03.558000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-02 14:59:03.591000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (387 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f773e9d66cdd4dbcd4ff3e0

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201002/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201002/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f773e9d66cdd4db=
cd4ff3e4
      new failure (last pass: next-20201001)
      2 lines

    2020-10-02 14:49:55.301000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-02 14:49:55.302000  (user:khilman) is already connected
    2020-10-02 14:50:11.734000  =00
    2020-10-02 14:50:11.734000  =

    2020-10-02 14:50:11.735000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-02 14:50:11.735000  =

    2020-10-02 14:50:11.735000  DRAM:  948 MiB
    2020-10-02 14:50:11.751000  RPI 3 Model B (0xa02082)
    2020-10-02 14:50:11.837000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-02 14:50:11.870000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (383 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f77427cf7242d01c04ff3ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201002/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201002/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f77427cf7242d01c04ff=
3ed
      failing since 72 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f774024622c1971994ff3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201002/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201002/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f774024622c1971994ff=
3f2
      new failure (last pass: next-20201001)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7742525b7d77bcea4ff3f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201002/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201002/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7742525b7d77bcea4ff=
3f9
      new failure (last pass: next-20201001)  =20
