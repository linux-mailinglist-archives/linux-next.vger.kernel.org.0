Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66F62986B7
	for <lists+linux-next@lfdr.de>; Mon, 26 Oct 2020 07:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1770234AbgJZGF4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 02:05:56 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:35287 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1770233AbgJZGF4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Oct 2020 02:05:56 -0400
Received: by mail-pl1-f174.google.com with SMTP id 1so4238533ple.2
        for <linux-next@vger.kernel.org>; Sun, 25 Oct 2020 23:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=am7ueW/RfyjoDcq3WE3xwzXcIidYg+A0b+jrnh/HJGQ=;
        b=0aS52OnRvtzCLGJKRbdVJddiX36/BwJfPBUOj41sOUL+MCcg6xnixM44IsxHmJVNi9
         Bb2xVDVBB26x4wsAExqy/YnaKf44tw3Zpg0ck/D2oQg7KH+Aadl7GtF0ECD0L5FQr9Og
         Q/iTBN0PaEa/+0LonaB3KkNAJYRGLZb0280qFIeHLah0qImjjU5XOTrHmgunBiZDsH3Y
         1Q3jDZ6bVSVdERLLMQVrGO0PDSs7NxoGn8QkLvHUygJxhfJoHHgalij84lCPs+F3XImT
         +QhdEEwW7ygvM/kc1ojz2j9ONz4ohAhen0/3IHyq/hn8x6SNQH0noH6MHf2HGyttIQaJ
         x2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=am7ueW/RfyjoDcq3WE3xwzXcIidYg+A0b+jrnh/HJGQ=;
        b=hcaHtif+2NUy2cVXC7WoMWwsF1/Je4YndrW2yNuVdifxYYNte1VmwBHGPq0oZyBv/1
         nMrrvAn4I18tjztGVp8Rs1IyXon1xDyOr49/XZfILefAhA3LC/hlqyMPieNb1za5m2UQ
         cv/4yRTMkVA6Gg2YjkpAgsRLDfOeXKEcg5xPDvcxOVX4kq26/32DInD0noMZrsqkWUmj
         F4GQzdzbcvhkBeMPwvdR7P2cVLPfDOWNzrZfSQ0bIPFsAWbyD6sHXuqM4QArKpBAVF1W
         vlP0vQyK0Ge7IlhxKGXjMa6Gy6vKHZ0pB1TdqA2rqAuFfh8mfoEEuYOEqU64Ln4Q6Qfo
         CSUg==
X-Gm-Message-State: AOAM533VNOeHKGZVXDexliTZufHw4kTCFO7w+dcHetAKZ8LqAFZ5U4Ng
        mO6xeYjjLINCdtqm1GGqI5QMIDMEs1I79A==
X-Google-Smtp-Source: ABdhPJxyXUacIVwNdSigHEtRCgXz3DHvlxty/FLPf4jHO+UmCDjA3gJJwMm4QMqVinsVfAViSbILNg==
X-Received: by 2002:a17:90b:4d0d:: with SMTP id mw13mr15025418pjb.192.1603692354547;
        Sun, 25 Oct 2020 23:05:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r201sm11161358pfc.98.2020.10.25.23.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 23:05:53 -0700 (PDT)
Message-ID: <5f966741.1c69fb81.f1993.7f1f@mx.google.com>
Date:   Sun, 25 Oct 2020 23:05:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20201026
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 744 runs, 9 regressions (next-20201026)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 744 runs, 9 regressions (next-20201026)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 1          =

bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =

imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =

imx6qp-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =

imx8mp-evk            | arm64 | lab-nxp       | clang-10 | defconfig       =
             | 1          =

imx8mp-evk            | arm64 | lab-nxp       | clang-11 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

imx8mp-evk            | arm64 | lab-nxp       | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201026/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201026
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2ef991b5fdbe828dc8fb8af473dab160729570ed =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/5f962e33f28579d51f38102c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201026/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201026/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f962e33f28579d51f381=
02d
        failing since 180 days (last pass: next-20200424, first fail: next-=
20200428) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9632147feb89acc6381142

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201026/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201026/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9632147feb89acc6381=
143
        failing since 25 days (last pass: next-20200929, first fail: next-2=
0200930) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/5f962ead1e3dada10638103d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201026/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201026/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f962ead1e3dada1=
06381042
        new failure (last pass: next-20201023)
        1 lines

    2020-10-26 02:02:23.775000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-10-26 02:02:23.775000+00:00  (user:khilman) is already connected
    2020-10-26 02:02:39.298000+00:00  =00
    2020-10-26 02:02:39.298000+00:00  =

    2020-10-26 02:02:39.298000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-10-26 02:02:39.298000+00:00  =

    2020-10-26 02:02:39.298000+00:00  DRAM:  948 MiB
    2020-10-26 02:02:39.312000+00:00  RPI 3 Model B (0xa02082)
    2020-10-26 02:02:39.399000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-10-26 02:02:39.431000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (380 line(s) more)  =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f96307356401c61ef381021

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201026/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201026/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f96307356401c61ef381=
022
        new failure (last pass: next-20201023) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx6qp-sabresd        | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f963087cb82e7092f38101e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201026/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201026/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f963087cb82e7092f381=
01f
        new failure (last pass: next-20201023) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx8mp-evk            | arm64 | lab-nxp       | clang-10 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/5f963583e6b04ec04238101a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201026/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201026/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f963583e6b04ec042381=
01b
        new failure (last pass: next-20201023) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx8mp-evk            | arm64 | lab-nxp       | clang-11 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9633dfe84b95ffbb38107b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.0-++20200928062115+eb83b=
551d3e-1~exp1~20200928162728.105)
  Plain log:   https://storage.kernelci.org//next/master/next-20201026/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201026/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9633dfe84b95ffbb381=
07c
        new failure (last pass: next-20201023) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx8mp-evk            | arm64 | lab-nxp       | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9630fb73593c210c38115a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201026/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201026/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9630fb73593c210c381=
15b
        new failure (last pass: next-20201023) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f962dccb3f3d7284f381013

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201026/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201026/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f962dccb3f3d7284f381=
014
        failing since 96 days (last pass: next-20200706, first fail: next-2=
0200721) =

 =20
