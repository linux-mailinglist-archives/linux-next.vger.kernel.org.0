Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5675348E849
	for <lists+linux-next@lfdr.de>; Fri, 14 Jan 2022 11:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237568AbiANKW2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Jan 2022 05:22:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237477AbiANKW1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Jan 2022 05:22:27 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AB2C061574
        for <linux-next@vger.kernel.org>; Fri, 14 Jan 2022 02:22:26 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id 78so2365992pfu.10
        for <linux-next@vger.kernel.org>; Fri, 14 Jan 2022 02:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XgUgphYoRiSYQ+u6Nno1hgxXpYFY8WTQuWsDkpc0l7w=;
        b=syNLTvdCH8zFwMc8Udsoy2eE2+u/5Hzjg5Y4bXj9XesEEJcfDOuh1nu8GCHE3JBBh0
         UaLhfxjrSnS69B1TGzqNnXc5hZy7ahP7BzqjV4Iv6nizzCtmnqXTUB9vtA6KEtzCsbIG
         zk+NRaXpkm+jpXIV/4YOTfPArI3OPjp/FRODLcLhXcGq/7SHWenKkuTwWNDEK5TKIg+J
         5HaIF/30H0ohuzgSoENkFECxSX3sQcVQ6C8MEu3wqNPqGD6Nx6iPI9g5HfEtz7cQQcoL
         gNLrxCxO58l+BBj4rlJrskolqBT0Zud/W1AuxNqdgkujRLGQC/naafD3Ap6AK0737sSY
         AWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XgUgphYoRiSYQ+u6Nno1hgxXpYFY8WTQuWsDkpc0l7w=;
        b=dDCnVdu7+lAyAxkdlhkaVxcoH8UmhoapFeIWQE7oxnrHjFMEA2Jrwo28Uc/0KAur9V
         4kSmgfiIQIRoqwH3vPB/psbUhWBqVzwZkt3httuPH5nRT5vfbobGZSTV7+dHBXsVwsgu
         gxHV7Z7g9GKWHigAb8vP54f9LfTsHVb/IPEg3VthdNYVIwMenVrOOtMy4p6loV9jPO2e
         0DiIlnPCQaY6cX0lrKw6x5tVxFUkz5l6SieLzUK0JaJiNElKrX8gzrRhVcS6mvJQ6AL/
         B5fgmhkh0oPzBtYKDMt2bjui3TvKUlAnkOm/9Xs7B1RThmWcFbdH2SC8JOZOO7QdV7dC
         kKuQ==
X-Gm-Message-State: AOAM5318pS/R9S/j2fBv+Dl3KZ9MOgYhV+jRHK+xKjzeli428jeY+Kyr
        zHbUE+G8DfZWh3+hgLy7RlLGSWzWkPyz6ApZ1RE=
X-Google-Smtp-Source: ABdhPJyWxhZbBeDn95P9UrK7rhIQRCC+gGv/vYw+0XzPHHTU+guYrbwT/V0qsEDgcOL1ZvU9p56Cjw==
X-Received: by 2002:a63:1046:: with SMTP id 6mr7496760pgq.602.1642155745385;
        Fri, 14 Jan 2022 02:22:25 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y7sm4458298pja.2.2022.01.14.02.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 02:22:25 -0800 (PST)
Message-ID: <61e14ee1.1c69fb81.7c62d.c31f@mx.google.com>
Date:   Fri, 14 Jan 2022 02:22:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-8869-ge7a3a88568d5
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 487 runs,
 26 regressions (v5.16-8869-ge7a3a88568d5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 487 runs, 26 regressions (v5.16-8869-ge7a3a885=
68d5)

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

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 2          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-8869-ge7a3a88568d5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-8869-ge7a3a88568d5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e7a3a88568d5ac68f7f8a3eb78ca627fc54c4edc =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e122106753b6deeeef679b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e122106753b6deeeef6=
79c
        failing since 65 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
da850-lcdk             | arm   | lab-baylibre  | gcc-10   | davinci_all_def=
config        | 1          =


  Details:     https://kernelci.org/test/plan/id/61e11a3238b91b0095ef674e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e11a3238b91b0095ef6=
74f
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e1160d058107b0a4ef6753

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e1160d058107b0a4ef6798
        failing since 3 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-14T06:19:25.255015  /lava-78148/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
1160d058107b0a4ef6799
        failing since 3 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-14T06:19:25.258197  <8>[   18.241405] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-14T06:19:26.304710  /lava-78148/1/../bin/lava-test-case
    2022-01-14T06:19:26.305116  <8>[   19.260279] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-14T06:19:26.305354  /lava-78148/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e11814717e81a8d6ef6749

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e11814717e81a8d6ef678e
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-6651-gc14f8df2f281)

    2022-01-14T06:28:17.612196  /lava-78155/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
11814717e81a8d6ef678f
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-6651-gc14f8df2f281)

    2022-01-14T06:28:17.615255  <8>[   17.815139] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-14T06:28:18.662150  /lava-78155/1/../bin/lava-test-case
    2022-01-14T06:28:18.662566  <8>[   18.834301] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-14T06:28:18.662808  /lava-78155/1/../bin/lava-test-case
    2022-01-14T06:28:18.663035  <8>[   18.850229] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e11d794566df8f7def675e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e11d794566df8f7def67a3
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-14T06:51:16.117367  /lava-78165/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
11d794566df8f7def67a4
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-14T06:51:16.120406  <8>[   16.854116] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-14T06:51:17.171127  /lava-78165/1/../bin/lava-test-case
    2022-01-14T06:51:17.171459  <8>[   17.873575] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-14T06:51:17.171655  /lava-78165/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e11620bca25ec15bef673d

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e11620bca25ec15bef6789
        failing since 3 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-14T06:19:16.753771  /lava-78147/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
11620bca25ec15bef678a
        failing since 3 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-14T06:19:16.756858  <8>[   13.458810] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-14T06:19:17.802614  /lava-78147/1/../bin/lava-test-case
    2022-01-14T06:19:17.803259  <8>[   14.477486] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-14T06:19:17.803508  /lava-78147/1/../bin/lava-test-case
    2022-01-14T06:19:17.803733  <8>[   14.492887] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-14T06:19:17.803975  /lava-78147/1/../bin/lava-test-case
    2022-01-14T06:19:17.804190  <8>[   14.508921] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-14T06:19:17.804405  /lava-78147/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e11816c48fa32e59ef6747

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/=
baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e11816c48fa32e59ef6793
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-6651-gc14f8df2f281)

    2022-01-14T06:28:11.045660  <8>[   12.461625] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drcpm-probed RESULT=3Dpass>
    2022-01-14T06:28:12.059198  /lava-78158/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
11816c48fa32e59ef6794
        failing since 1 day (last pass: v5.16-rc8-185-gf94a706f394a, first =
fail: v5.16-6651-gc14f8df2f281)

    2022-01-14T06:28:12.063948  <8>[   13.477876] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-14T06:28:13.113248  /lava-78158/1/../bin/lava-test-case
    2022-01-14T06:28:13.113893  <8>[   14.497593] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-14T06:28:13.114145  /lava-78158/1/../bin/lava-test-case
    2022-01-14T06:28:13.114372  <8>[   14.513537] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-14T06:28:13.114595  /lava-78158/1/../bin/lava-test-case
    2022-01-14T06:28:13.114811  <8>[   14.532311] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-14T06:28:13.115027  /lava-78158/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e11d7bda18cabd33ef673f

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3=
-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e11d7bda18cabd33ef678b
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-14T06:51:31.396480  /lava-78167/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
11d7bda18cabd33ef678c
        failing since 3 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-14T06:51:31.399743  <8>[   13.424817] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-14T06:51:32.447261  /lava-78167/1/../bin/lava-test-case
    2022-01-14T06:51:32.447672  <8>[   14.444767] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-14T06:51:32.447910  /lava-78167/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e117b6ba26784cb4ef67a3

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e117b6ba26784=
cb4ef67a6
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-14T06:26:38.138847  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-14T06:26:38.138939  kern  :alert : Data abort info:
    2022-01-14T06:26:38.180832  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-14T06:26:38.180954  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-14T06:26:38.181066  kern  :alert : user pgtable: 4k pages<8>[  =
 16.505494] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-14T06:26:38.181183  , 48-bit VAs, pgdp=3D000000007f821000
    2022-01-14T06:26:38.181289  ker<8>[   16.517895] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 598843_1.5.2.4.1>
    2022-01-14T06:26:38.181372  n  :alert : [0000000000000000] pgd=3D080000=
007f827003, p4d=3D080000007f827003, pud=3D080000004f773003, pmd=3D000000000=
0000000
    2022-01-14T06:26:38.181457  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e117b6ba26784=
cb4ef67a7
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-14T06:26:38.137659  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-14T06:26:38.137781  kern  :alert : Mem abort info:
    2022-01-14T06:26:38.137918  ker<8>[   16.464987] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-14T06:26:38.138003  n  :alert :   ESR =3D 0x96000006
    2022-01-14T06:26:38.138085  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-14T06:26:38.138165  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-14T06:26:38.138242  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61e11858ac08e73029ef6749

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a7=
74c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a7=
74c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e11858ac08e73=
029ef674c
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-14T06:29:17.337367  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-14T06:29:17.337489  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-14T06:29:17.337578  kern  :alert : user pgtable: 4k pages<8>[  =
 15.839743] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-14T06:29:17.337665  , 48-bit VAs, pgdp=3D000000007f949000
    2022-01-14T06:29:17.337766  ker<8>[   15.851283] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 598883_1.5.2.4.1>
    2022-01-14T06:29:17.337846  n  :alert : [0000000000000000] pgd=3D080000=
007f94b003, p4d=3D080000007f94b003, pud=3D080000007f94c003, pmd=3D000000000=
0000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e11858ac08e73=
029ef674d
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-14T06:29:17.294013  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-14T06:29:17.294126  kern  :alert : Mem abort info:
    2022-01-14T06:29:17.294216  ker<8>[   15.798648] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-14T06:29:17.294302  n  :alert :   ESR =3D 0x96000006
    2022-01-14T06:29:17.294395  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-14T06:29:17.294485  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-14T06:29:17.294582  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-14T06:29:17.294661  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-14T06:29:17.294737  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e11b75391adc38c7ef6742

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e11b75391adc3=
8c7ef6745
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-14T06:42:35.223889  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-14T06:42:35.224017  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-14T06:42:35.224117  kern  :alert : user pgtable: 4k pages<8>[  =
 15.753300] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-14T06:42:35.224212  , 48-bit VAs, pgdp=3D000000007f8ab000
    2022-01-14T06:42:35.224397  ker<8>[   15.765624] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 598919_1.5.2.4.1>
    2022-01-14T06:42:35.224489  n  :alert : [0000000000000000] pgd=3D080000=
007f8ac003, p4d=3D080000007f8ac003, pud=3D080000004f784003, pmd=3D000000000=
0000000
    2022-01-14T06:42:35.224580  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e11b75391adc3=
8c7ef6746
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-14T06:42:35.180681  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-14T06:42:35.180801  kern  :alert : Mem abort info:
    2022-01-14T06:42:35.180898  ker<8>[   15.712418] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-14T06:42:35.180988  n  :alert :   ESR =3D 0x96000006
    2022-01-14T06:42:35.181076  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-14T06:42:35.181168  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-14T06:42:35.181253  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-14T06:42:35.181336  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-14T06:42:35.181417  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e11e32173b017cabef67bd

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e11e32173b017=
cabef67c0
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-14T06:54:22.878723  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-14T06:54:22.878876  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-14T06:54:22.878989  kern  :alert : user pgtable: 4k pages, 48-b=
it<8>[   16.138089] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e11e32173b017=
cabef67c1
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-14T06:54:22.835609  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-14T06:54:22.835818  kern  :alert : Mem abort info:
    2022-01-14T06:54:22.835909  ker<8>[   16.096978] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-14T06:54:22.835994  n  :alert :   ESR =3D 0x96000006
    2022-01-14T06:54:22.836075  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-14T06:54:22.836155  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-14T06:54:22.836231  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-14T06:54:22.836306  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-14T06:54:22.836381  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/61e11711c94a39503cef674f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e11711c94a39503cef6=
750
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61e1190583c56c1f93ef677b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynq=
mp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynq=
mp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e1190583c56c1f93ef6=
77c
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e11a6eb3c4fe2c40ef6752

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/base=
line-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e11a6eb3c4fe2c40ef6=
753
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e11db50a727d7143ef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-8869-=
ge7a3a88568d5/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e11db50a727d7143ef6=
73e
        failing since 1 day (last pass: v5.16-6651-gc14f8df2f281, first fai=
l: v5.16-7998-gbeebf0a29205) =

 =20
