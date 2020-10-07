Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F352860EE
	for <lists+linux-next@lfdr.de>; Wed,  7 Oct 2020 16:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgJGOIg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Oct 2020 10:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbgJGOIg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2020 10:08:36 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B02C061755
        for <linux-next@vger.kernel.org>; Wed,  7 Oct 2020 07:08:36 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d6so1389136pfn.9
        for <linux-next@vger.kernel.org>; Wed, 07 Oct 2020 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mdy7/V0Ns9rJ2pounw04w07C54U2Ao4CI+idCGwpuF8=;
        b=J4jbYxqSKEh2UBHWpHlLdXTvBxNBV6QnzKEBCnM0604fnrcih56DvZV69MqPBbVaN7
         ehr6GgY5DxwNpJMOph4NbnelcFPcl7e7kHoz+6LYllAxTIgKyHnVTfdciFslMRPifeyZ
         rEaw0aixeOYk+GPqsNLz9aKY3J8iv2fO2llhPOJspmmMQn1fRHe7TtD8aoeGZ0ou35BW
         j/n/HrccLNY71beWKcAftPRStwNpi4YtPQZ4WyiGzic+LsQ2z4FmkPNdJG5MRDcOwQlC
         4ERukFndhJqmyvj75kKoWv/q8qak66CGkAOI/Ka3ufEOym6JMDKpgT1ZT16p6eGqM4aO
         OqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mdy7/V0Ns9rJ2pounw04w07C54U2Ao4CI+idCGwpuF8=;
        b=cwDNgXcKwuwFqOuVhx6bMbRPmJQc/VtQCXqOvsvOQ0T4xQbxmJvbuVHDQ3mU3T+TYH
         BSO2eNAu3GZi09F+r0NWUYJtu9YZ9M4pDIacI+HeEAclgy0EoSXsS8MQef5au7+d4u8j
         gBLZtdUnFllBfcV6u7qFZHTbvs/LtjDb0WMRywKGESw8dS9cKsrYgCN+EdBs33q5cy2Z
         HlgYvbuhkpfALcSCl2Xv91/SJzqEgW84eHT73UdaCRZgW8oScZJL3SNCUppotTo/T3vu
         SYs/gtfqNxlj3QwiWB+B3poYnwMelAKyMS+c/5qWG83ZF0sCb3vHQpe1moouURibRK5x
         /oDA==
X-Gm-Message-State: AOAM530NMcjEzyISwU5IwSSidKHNiO/+4QuL4H3XfWAPTHY5nLRxunzN
        u5sXhg//rBkjkEUFzndoAnCIjFyWzlQJ2A==
X-Google-Smtp-Source: ABdhPJzDCTqrawrjsiNaTcnu6fc0HobvquKPA7YwjsJ1Nk66TdD1ldmbPDtd4dSRZn7cZIP4f47DXQ==
X-Received: by 2002:a62:7cd4:0:b029:152:5198:3f19 with SMTP id x203-20020a627cd40000b029015251983f19mr3111481pfc.31.1602079714964;
        Wed, 07 Oct 2020 07:08:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x16sm3320820pff.14.2020.10.07.07.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 07:08:34 -0700 (PDT)
Message-ID: <5f7dcbe2.1c69fb81.ccbe7.617d@mx.google.com>
Date:   Wed, 07 Oct 2020 07:08:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201007
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 431 runs, 8 regressions (next-20201007)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 431 runs, 8 regressions (next-20201007)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =

hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201007/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201007
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8b787da7ba8cd2383988480d282ec1abc3917892 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7d925d933a48c8d64ff42d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201007/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201007/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7d925d933a48c8d64ff=
42e
      failing since 161 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7d945e3b8e355e5b4ff3e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201007/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7d945e3b8e355e5b4ff=
3e1
      failing since 6 days (last pass: next-20200929, first fail: next-2020=
0930)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7d938d62c9cefb184ff3e0

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7d938d62c9cefb=
184ff3e4
      failing since 5 days (last pass: next-20200930, first fail: next-2020=
1001)
      1 lines

    2020-10-07 10:06:12.183000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-07 10:06:12.183000  (user:khilman) is already connected
    2020-10-07 10:06:26.920000  =00
    2020-10-07 10:06:26.921000  =

    2020-10-07 10:06:26.921000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-07 10:06:26.921000  =

    2020-10-07 10:06:26.921000  DRAM:  948 MiB
    2020-10-07 10:06:26.936000  RPI 3 Model B (0xa02082)
    2020-10-07 10:06:27.024000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-07 10:06:27.056000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7d8fd5976c8fc6a04ff3ee

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201007/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7d8fd5976c8fc6=
a04ff3f2
      new failure (last pass: next-20201006)
      1 lines

    2020-10-07 09:50:14.676000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-07 09:50:14.676000  (user:khilman) is already connected
    2020-10-07 09:50:30.423000  =00
    2020-10-07 09:50:30.423000  =

    2020-10-07 09:50:30.438000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-07 09:50:30.439000  =

    2020-10-07 09:50:30.439000  DRAM:  948 MiB
    2020-10-07 09:50:30.455000  RPI 3 Model B (0xa02082)
    2020-10-07 09:50:30.544000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-07 09:50:30.576000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7d9073458ecf91ed4ff3e2

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201007/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7d9073458ecf91=
ed4ff3e6
      failing since 0 day (last pass: next-20201002, first fail: next-20201=
006)
      1 lines

    2020-10-07 09:52:54.727000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-07 09:52:54.727000  (user:khilman) is already connected
    2020-10-07 09:53:10.313000  =00
    2020-10-07 09:53:10.313000  =

    2020-10-07 09:53:10.313000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-07 09:53:10.314000  =

    2020-10-07 09:53:10.332000  DRAM:  948 MiB
    2020-10-07 09:53:10.344000  RPI 3 Model B (0xa02082)
    2020-10-07 09:53:10.432000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-07 09:53:10.463000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7d911190f53826ac4ff3fc

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201007/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201007/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7d911190f53826=
ac4ff400
      new failure (last pass: next-20201006)
      1 lines

    2020-10-07 09:55:31.226000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-07 09:55:31.227000  (user:khilman) is already connected
    2020-10-07 09:55:47.686000  =00
    2020-10-07 09:55:47.686000  =

    2020-10-07 09:55:47.686000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-07 09:55:47.686000  =

    2020-10-07 09:55:47.701000  DRAM:  948 MiB
    2020-10-07 09:55:47.718000  RPI 3 Model B (0xa02082)
    2020-10-07 09:55:47.806000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-07 09:55:47.839000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (380 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7d95ffe1b64e77084ff3ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201007/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201007/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7d95ffe1b64e77084ff=
3ef
      failing since 27 days (last pass: next-20200818, first fail: next-202=
00909)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7d96840f205f25194ff407

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201007/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201007/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7d96840f205f25194ff=
408
      failing since 77 days (last pass: next-20200706, first fail: next-202=
00721)  =20
