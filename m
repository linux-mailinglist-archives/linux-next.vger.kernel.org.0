Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2579E28DD50
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 11:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbgJNJXm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 05:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731203AbgJNJWl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 05:22:41 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7DFC08EC8C
        for <linux-next@vger.kernel.org>; Tue, 13 Oct 2020 17:26:42 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id b19so852066pld.0
        for <linux-next@vger.kernel.org>; Tue, 13 Oct 2020 17:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dmUlljDlzBiLMyTdKwwJg2P4zcrKZ90wZVO01E/uabY=;
        b=Ks+Yieoiu6LzwexWstU7HRQx5U7+ZfekE9c9N5cy/kvU0qktyFwXiigNS260WGOvZH
         VZbCg6OnOoE+vZ5Gccg7/6fK9F66k/nIr2HnXSCJsI6eKkLDKXy6rbf4G7YKIU5QVpBJ
         GCyjbNxF/r8LVHV4Hvn0QvlcTSpjW6bYgLHzRR/mGYTQ6tsmw5OwRfRgHKnXl6u02rJX
         WkRYYQwihnQ1pryN0ztHt3gaXHUC+PV1wyIAt9VeNXOT7VQgezLgWBw5rnMWKVIpe0gD
         bgur/LEPfF4Y3r9wH6Wzt3KDX3C0FsFiCOOxiQmepJDYEbpNbcpTl8XQKYvw4KDN3JFK
         Sl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dmUlljDlzBiLMyTdKwwJg2P4zcrKZ90wZVO01E/uabY=;
        b=N2o/n3Gkm5nRhM2dGXjr0OkaQ3WXi48tGrtelgUcFAwIiWuBIxZ4SklwRRCmlZEbRd
         AtxEpsSi4RQmpSrUH+K9fA+G0sLmPeAVYAvZMsD2yQrp4gPKrFK9MhDgGo4EaS1sek2+
         qxuhbc+6tR8tDfGSgx0vlRixrIRrFB3vUNZrByswSVK1bxGOaDlLIF/O/Esav9Zf/Nvy
         DjI7MrPRvXGQxJMY8Oq5BOEWZyPP3RtNQgVwyRefjEnEwTZ5LSrtqO1+bKQCyQ7qJ4YU
         ZJb9+xFC2VVa+Guw0uOr8Gv+yMTQwjXqqzWZpwHgHt762O3GHPJ1UdGTnHRkMM8dNW+I
         zqPg==
X-Gm-Message-State: AOAM533C6nZnEP9IEx1OPp6V5tJBeaHSL218l2oGT6CRmRdHeFjyvWyQ
        7t6qkcPUpQ2HqQ91/nzs4zSNngqw9r9kUA==
X-Google-Smtp-Source: ABdhPJwET/f5fdVe1DSraCc7zlQMPQKQqPCIfY4lK0rQUE3zGVZuRkrhac1mGQ+Gqq+9GK1ol1mSMQ==
X-Received: by 2002:a17:90a:6d8f:: with SMTP id a15mr843792pjk.186.1602635201250;
        Tue, 13 Oct 2020 17:26:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d128sm920880pfc.8.2020.10.13.17.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 17:26:40 -0700 (PDT)
Message-ID: <5f8645c0.1c69fb81.e3cc6.271c@mx.google.com>
Date:   Tue, 13 Oct 2020 17:26:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201013
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 623 runs, 7 regressions (next-20201013)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 623 runs, 7 regressions (next-20201013)

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
OMIZE_BASE=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =

hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201013/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201013
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f2fb1afc57304f9dd68c20a08270e287470af2eb =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f860a1e4290468fcd4ff3ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201013/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201013/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f860a1e4290468fcd4ff=
3ed
      failing since 168 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f8608f8093156d0b74ff3f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201013/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201013/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f8608f8093156d0b74ff=
3f6
      failing since 13 days (last pass: next-20200929, first fail: next-202=
00930)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f86098d619ae859fd4ff417

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201013/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201013/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f86098d619ae859=
fd4ff41b
      failing since 12 days (last pass: next-20200930, first fail: next-202=
01001)
      1 lines

    2020-10-13 20:07:48.817000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-13 20:07:48.817000  (user:khilman) is already connected
    2020-10-13 20:08:05.543000  =00
    2020-10-13 20:08:05.544000  =

    2020-10-13 20:08:05.544000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-13 20:08:05.544000  =

    2020-10-13 20:08:05.544000  DRAM:  948 MiB
    2020-10-13 20:08:05.560000  RPI 3 Model B (0xa02082)
    2020-10-13 20:08:05.646000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-13 20:08:05.678000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f8607333e9cd0ce994ff40f

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201013/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201013/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f8607333e9cd0ce=
994ff413
      new failure (last pass: next-20201009)
      1 lines

    2020-10-13 19:57:43.068000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-13 19:57:43.068000  (user:khilman) is already connected
    2020-10-13 19:57:58.373000  =00
    2020-10-13 19:57:58.374000  =

    2020-10-13 19:57:58.374000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-13 19:57:58.374000  =

    2020-10-13 19:57:58.374000  DRAM:  948 MiB
    2020-10-13 19:57:58.390000  RPI 3 Model B (0xa02082)
    2020-10-13 19:57:58.477000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-13 19:57:58.508000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f860cffac39e72a174ff3e1

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201013/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201013/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f860cffac39e72a=
174ff3e5
      new failure (last pass: next-20201009)
      2 lines

    2020-10-13 20:21:46.231000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-13 20:21:46.232000  (user:khilman) is already connected
    2020-10-13 20:22:02.643000  =00
    2020-10-13 20:22:02.643000  =

    2020-10-13 20:22:02.644000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-13 20:22:02.644000  =

    2020-10-13 20:22:02.644000  DRAM:  948 MiB
    2020-10-13 20:22:02.659000  RPI 3 Model B (0xa02082)
    2020-10-13 20:22:02.746000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-13 20:22:02.778000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (388 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f860934896e5c79194ff415

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201013/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201013/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f860934896e5c79194ff=
416
      failing since 34 days (last pass: next-20200818, first fail: next-202=
00909)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f861131340d137c4f4ff3f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201013/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201013/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f861131340d137c4f4ff=
3f2
      failing since 83 days (last pass: next-20200706, first fail: next-202=
00721)  =20
