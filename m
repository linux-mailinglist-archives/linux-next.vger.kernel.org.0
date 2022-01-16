Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEEE448FAB1
	for <lists+linux-next@lfdr.de>; Sun, 16 Jan 2022 06:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiAPFEW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Jan 2022 00:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiAPFEW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 16 Jan 2022 00:04:22 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8DDC061574
        for <linux-next@vger.kernel.org>; Sat, 15 Jan 2022 21:04:21 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id t18so16846529plg.9
        for <linux-next@vger.kernel.org>; Sat, 15 Jan 2022 21:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NG1nmD++Y8OY4JLK29fAACy9x2Zvh+gCiS5PXUnAlec=;
        b=pDOKDYWTQwagbfXyhoewiUhrs1J62Rom+1c1RT8g/a3fHh0217hOxMbZrvIpgXRFDv
         xiha9vTMDzN33YQkiHHLyjdvSzX872v1MOqc8+BH3zinm8hGFOdMrN0sIffrO8e4Cbzo
         zerMs8KAWlhdii2xMHI0mBCkb3GH1DdtzqF6tkz7BzLmW1h1InlKiuaaewySCfvI5dBY
         1IgnquvlndrMQjppjMmF4EBzHq7v9DbOFWaldWKQO6iiOCMKcN4Q1UKo0XThb7mhCdRF
         5x89KlZBAqC2wnAtl/VDBMTEhazoWOWWVyqAKuHsFIuDNKWtqGVT54OwAD9nqZ8//r+n
         tYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NG1nmD++Y8OY4JLK29fAACy9x2Zvh+gCiS5PXUnAlec=;
        b=XKSluD+2WtBnGsNuidFWr/kBK8s0xNhqIf1zYqQHMbx9K2cv8ap+Hflq+Ucz0hpe6l
         f8Yg3R/Xx3ox0rFiJxlLCqnsLMXp6BljmrTpMEol165exn0srYPEDKJ3rGQ1EZMRvCt1
         +nqpc1h+VBwA5/12JOyhTzoASzCyiWzCQEVj8Yrqbc+w1/vkpKH9NuNgMBM3k9/fdJ04
         +/VZLF6Xr4YsMivDq9M3WYfPMX6C39ovx8QFaW3pJgKsNUGNPOYMeM1wZAFbAQpXNVaR
         nduZ/joKnkx2JS6JHZ2+3h6qNlI6A6HaFAvbcNfZE6ywCcQvf1px1bUs/rLlDetbd0M/
         nIBQ==
X-Gm-Message-State: AOAM533R1MyUxOMXU/1a6z0gkIc5tNqFzgTNkPocoWkLQL76B0lIw1g9
        e+fXqt1KUjnfjE8jJCKOK3xbYac782gvVplR
X-Google-Smtp-Source: ABdhPJzXGPbbxVhy4l6QUSNgUu9OAsUylhOsi6Gg62JKpsrsg2pqX1YoMPEjNRzJIpYdd6k9ydAthg==
X-Received: by 2002:a17:902:da81:b0:14a:8fda:e321 with SMTP id j1-20020a170902da8100b0014a8fdae321mr9129927plx.96.1642309459634;
        Sat, 15 Jan 2022 21:04:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p37sm10882488pfh.97.2022.01.15.21.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 21:04:19 -0800 (PST)
Message-ID: <61e3a753.1c69fb81.ca502.ee3d@mx.google.com>
Date:   Sat, 15 Jan 2022 21:04:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-9826-g830809423594
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 554 runs,
 30 regressions (v5.16-9826-g830809423594)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 554 runs, 30 regressions (v5.16-9826-g83080942=
3594)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

da850-lcdk             | arm   | lab-baylibre  | gcc-10   | davinci_all_def=
config        | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

meson-gxl-s905d-p230   | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x    | arm64 | lab-baylibre  | gcc-10   | defconfig      =
              | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig           | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+crypto    | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | tegra_defconfig=
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-9826-g830809423594/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-9826-g830809423594
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8308094235943c982963aac3d27d36bd1a14b15a =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e376a33239771a0def6744

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e376a33239771a0def6=
745
        failing since 67 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
da850-lcdk             | arm   | lab-baylibre  | gcc-10   | davinci_all_def=
config        | 1          =


  Details:     https://kernelci.org/test/plan/id/61e36f67e72a14806fef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e36f67e72a14806fef6=
73e
        failing since 2 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e36dacc4f2b23b6fef6778

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e36dacc4f2b23b6fef67bd
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T00:58:08.330000  /lava-78915/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
36dacc4f2b23b6fef67be
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T00:58:08.333412  <8>[   17.170901] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-16T00:58:09.382513  /lava-78915/1/../bin/lava-test-case
    2022-01-16T00:58:09.382853  <8>[   18.190114] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-16T00:58:09.383068  /lava-78915/1/../bin/lava-test-case
    2022-01-16T00:58:09.383251  <8>[   18.207163] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-16T00:58:09.383432  /lava-78915/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e370567018af29a4ef674a

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e370567018af29a4ef678f
        failing since 4 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T01:09:20.538688  /lava-78925/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
370567018af29a4ef6790
        failing since 4 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T01:09:20.541953  <8>[   17.288424] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-16T01:09:21.588430  /lava-78925/1/../bin/lava-test-case
    2022-01-16T01:09:21.588817  <8>[   18.307057] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-16T01:09:21.589054  /lava-78925/1/../bin/lava-test-case
    2022-01-16T01:09:21.589276  <8>[   18.322870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-16T01:09:21.589498  /lava-78925/1/../bin/lava-test-case
    2022-01-16T01:09:21.589712  <8>[   18.338785] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-16T01:09:21.589924  /lava-78925/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e371d0cd18e0a7f5ef6744

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e371d1cd18e0a7f5ef6789
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T01:15:51.167797  <8>[   17.225118] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drcpm-probed RESULT=3Dpass>
    2022-01-16T01:15:52.182837  /lava-78932/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
371d1cd18e0a7f5ef678a
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T01:15:52.186035  <8>[   18.241465] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-16T01:15:53.233733  /lava-78932/1/../bin/lava-test-case
    2022-01-16T01:15:53.234102  <8>[   19.261265] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-16T01:15:53.234347  /lava-78932/1/../bin/lava-test-case
    2022-01-16T01:15:53.234574  <8>[   19.277176] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-16T01:15:53.234803  /lava-78932/1/../bin/lava-test-case
    2022-01-16T01:15:53.235022  <8>[   19.293260] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-16T01:15:53.235268  /lava-78932/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e372c259863b5c7def6757

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e372c359863b5c7def679c
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-16T01:19:47.979285  /lava-78937/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
372c359863b5c7def679d
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-16T01:19:47.981588  <8>[   16.347583] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-16T01:19:49.029775  /lava-78937/1/../bin/lava-test-case
    2022-01-16T01:19:49.030142  <8>[   17.366623] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-16T01:19:49.030385  /lava-78937/1/../bin/lava-test-case
    2022-01-16T01:19:49.030615  <8>[   17.382465] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e36e4c1108d92f4cef6756

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-=
var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-=
var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e36e4c1108d92f4cef67a2
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T01:00:29.035790  /lava-78918/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
36e4c1108d92f4cef67a3
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T01:00:29.038857  <8>[   13.426323] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-16T01:00:30.085120  /lava-78918/1/../bin/lava-test-case
    2022-01-16T01:00:30.085516  <8>[   14.444943] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-16T01:00:30.085753  /lava-78918/1/../bin/lava-test-case
    2022-01-16T01:00:30.085974  <8>[   14.460795] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e37058caaa0eb405ef6749

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e37058caaa0eb405ef6795
        failing since 4 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T01:09:18.487191  <8>[   12.458679] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drcpm-probed RESULT=3Dpass>
    2022-01-16T01:09:19.501318  /lava-78927/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
37058caaa0eb405ef6796
        failing since 4 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T01:09:19.507153  <8>[   13.475030] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-16T01:09:20.554553  /lava-78927/1/../bin/lava-test-case
    2022-01-16T01:09:20.554943  <8>[   14.493722] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e37121a0fbb96ef7ef6740

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e37121a0fbb96ef7ef678c
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T01:12:37.017436  /lava-78928/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
37121a0fbb96ef7ef678d
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-16T01:12:37.020598  <8>[   13.430576] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-16T01:12:38.071091  /lava-78928/1/../bin/lava-test-case
    2022-01-16T01:12:38.071517  <8>[   14.450001] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-16T01:12:38.071765  /lava-78928/1/../bin/lava-test-case
    2022-01-16T01:12:38.071994  <8>[   14.465881] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-16T01:12:38.072228  /lava-78928/1/../bin/lava-test-case
    2022-01-16T01:12:38.072450  <8>[   14.483394] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-16T01:12:38.072670  /lava-78928/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e3722270c17f9dccef6752

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e3722270c17f9dccef679e
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-16T01:17:12.316187  /lava-78936/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
3722270c17f9dccef679f
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-16T01:17:12.319377  <8>[   13.432274] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-16T01:17:13.365639  /lava-78936/1/../bin/lava-test-case
    2022-01-16T01:17:13.365926  <8>[   14.450915] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-16T01:17:13.366074  /lava-78936/1/../bin/lava-test-case
    2022-01-16T01:17:13.366210  <8>[   14.466739] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-16T01:17:13.366347  /lava-78936/1/../bin/lava-test-case
    2022-01-16T01:17:13.366478  <8>[   14.482748] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-16T01:17:13.366610  /lava-78936/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
meson-gxl-s905d-p230   | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e37b1ab9a6613586ef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e37b1ab9a6613586ef6=
73e
        new failure (last pass: v5.16-9796-g01303ef9c816) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a77950-salvator-x    | arm64 | lab-baylibre  | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e371f06e04a92713ef6740

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvato=
r-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvato=
r-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e371f06e04a92713ef6=
741
        new failure (last pass: v5.16-9796-g01303ef9c816) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61e371adc33e4be552ef6754

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124=
-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e371adc33e4be552ef6=
755
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/61e374a6052db84a1def6741

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e374a6052db84a1def6=
742
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e3762edbc2871f31ef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-co=
llabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-co=
llabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e3762edbc2871f31ef6=
73e
        failing since 1 day (last pass: v5.16-1778-g6927daa7c4fb, first fai=
l: v5.16-8869-ge7a3a88568d5) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e376f33272fdf1b2ef676d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gcc=
-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gcc=
-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e376f33272fdf1b2ef6=
76e
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | tegra_defconfig=
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e37573be93f84e78ef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-ny=
an-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-ny=
an-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e37573be93f84e78ef6=
73e
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61e36e8f68253a5918ef6751

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynq=
mp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynq=
mp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e36e8f68253a5918ef6=
752
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e36fe3b62fd71e8aef6764

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e36fe3b62fd71e8aef6=
765
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/61e3706f1b89b1c190ef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e3706f1b89b1c190ef6=
73e
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e371fe67a4310bfdef676a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e371fe67a4310bfdef6=
76b
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e3736639bb7363caef675f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-9826-=
g830809423594/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e3736639bb7363caef6=
760
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =20
