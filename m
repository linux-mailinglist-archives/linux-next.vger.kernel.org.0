Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A5049D994
	for <lists+linux-next@lfdr.de>; Thu, 27 Jan 2022 05:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbiA0EVM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Jan 2022 23:21:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbiA0EVL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Jan 2022 23:21:11 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C110CC06161C
        for <linux-next@vger.kernel.org>; Wed, 26 Jan 2022 20:21:11 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id g9-20020a17090a67c900b001b4f1d71e4fso1663385pjm.4
        for <linux-next@vger.kernel.org>; Wed, 26 Jan 2022 20:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8ZlroFw5Aexo4meDT+63QRoso8GyRPnbm+3S07TAhwo=;
        b=7i59Yw0RLglyOy9zi5eHURDGLGcjYboOoC7MNz0+HoV2k/UmLDN0uxvBsZCRAHfGyt
         gU08WejZV3FBPcq85+Ki74uGcnQ5sa5Yag6KZK5WUWo0Qfux0ZGEsjc/AAMRg0RD7tCV
         +77zoNpiDFUAXAtIW92OYj4ZlkyYFJfTwm97pfN7ALnsREV8bJsbzAvcabXyI8N1iD8M
         ljsMjVajGNycScfl15XQJ77vhhDifxPmmlPl9U9sS//YHBIW6gJIIvjyebIaJQGivpJn
         HhnSnyLOXrrKfWB1xrfhNyiBuW5AmEthEZMkst0LuVtx1nFvEv+Em8CjagaNB7a2Nm+0
         Krgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8ZlroFw5Aexo4meDT+63QRoso8GyRPnbm+3S07TAhwo=;
        b=IUk0iH8B286tX9zRH7izbDuEkaI6hm7DR3YwfEZDamXGNCtAVXyyZZ+P/JSBpyALZ6
         SqXT30ddG3FUXaHOunn1L46rgJlitDIn42tvV1+AadRQ1zQFQjaTCFmFNsUrbaeby1BM
         6iRVqtYBMiykLy5dlV7V/G57w+KXk4wYbqwz9zixpTSwYsarl5tnT+fog2Caw81wPgTH
         55SOCNhLTXjqUw+rJLCSBCu/a65s0KV3hHC0JesoxBMjmC2g3creo0DZwYE49adPXmh4
         BwNjtyq/HVr4lGdkMVB2yn9X/ECoC0xJ/i88ac6OqtgB7UfJtYv0gEbehNCBpfmv++1e
         Fb0A==
X-Gm-Message-State: AOAM531UQb0jCQT8WVqQEW+Ma6Cuo/Wv+rVWD51Z8/uj7vL11e+5ZZGr
        fgqVF39zwWPrk/OoRjrxAo7mSMz3L7ANunBKmNY=
X-Google-Smtp-Source: ABdhPJxHWZOZWFeVlTK13V3CrLVG6RB++rkQRsXFE36eklzCW1nYvS3RHLUvu0wC7YD6+8fAsRI3FQ==
X-Received: by 2002:a17:902:a404:: with SMTP id p4mr1905127plq.144.1643257270818;
        Wed, 26 Jan 2022 20:21:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p21sm3656071pfh.89.2022.01.26.20.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 20:21:10 -0800 (PST)
Message-ID: <61f21db6.1c69fb81.911bf.bc40@mx.google.com>
Date:   Wed, 26 Jan 2022 20:21:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-rc1-385-g87ced262c135
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 668 runs,
 23 regressions (v5.17-rc1-385-g87ced262c135)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 668 runs, 23 regressions (v5.17-rc1-385-g87ced=
262c135)

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

imx6ul-14x14-evk       | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc1-385-g87ced262c135/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc1-385-g87ced262c135
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      87ced262c135b7835b4e8d94f7580f01fa19b654 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f1e50904eb98ba97abbd4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f1e50904eb98ba97abb=
d4c
        failing since 77 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
da850-lcdk             | arm   | lab-baylibre  | gcc-10   | davinci_all_def=
config        | 1          =


  Details:     https://kernelci.org/test/plan/id/61f1e3b6d1c57e2f4eabbddc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61f1e3b6d1c57e2=
f4eabbde3
        failing since 3 days (last pass: v5.16-11577-gffd79fec234d, first f=
ail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-01-27T00:13:12.049373  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-01-27T00:13:12.049626  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-01-27T00:13:12.049771  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-01-27T00:13:12.091312  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
imx6ul-14x14-evk       | arm   | lab-nxp       | gcc-10   | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61f1e55c9da85e2d38abbd27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x=
14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f1e55c9da85e2d38abb=
d28
        failing since 6 days (last pass: v5.16-7998-gbeebf0a29205, first fa=
il: v5.16-11408-ga51e80162547) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61f1e3aae436e1c21aabbd1d

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f1e3aae436e1c21aabbd5e
        failing since 15 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:13:12.295889  /lava-84058/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
1e3aae436e1c21aabbd5f
        failing since 15 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:13:12.298974  <8>[   18.567672] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-27T00:13:13.347853  /lava-84058/1/../bin/lava-test-case
    2022-01-27T00:13:13.348265  <8>[   19.586016] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-27T00:13:13.348511  /lava-84058/1/../bin/lava-test-case
    2022-01-27T00:13:13.348755  <8>[   19.603117] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61f1e5a2279efc5335abbd12

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f1e5a3279efc5335abbd53
        failing since 15 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:21:38.797988  /lava-84066/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
1e5a3279efc5335abbd54
        failing since 15 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:21:38.801106  <8>[   18.601551] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-27T00:21:39.847659  /lava-84066/1/../bin/lava-test-case
    2022-01-27T00:21:39.847957  <8>[   19.621395] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-27T00:21:39.848106  /lava-84066/1/../bin/lava-test-case
    2022-01-27T00:21:39.848244  <8>[   19.636680] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f1e6f312b4d7e591abbd20

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f1e6f412b4d7e591abbd65
        failing since 14 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-27T00:27:15.315360  /lava-84072/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
1e6f412b4d7e591abbd66
        failing since 14 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-27T00:27:15.318304  <8>[   19.262305] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-27T00:27:16.365234  /lava-84072/1/../bin/lava-test-case
    2022-01-27T00:27:16.365629  <8>[   20.281685] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61f1e85a94ebb393bbabbd2e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f1e85b94ebb393bbabbd6f
        failing since 15 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:33:09.959117  /lava-84079/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
1e85b94ebb393bbabbd70
        failing since 15 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:33:09.962748  <8>[   16.481017] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-27T00:33:11.009794  /lava-84079/1/../bin/lava-test-case
    2022-01-27T00:33:11.010187  <8>[   17.500115] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-27T00:33:11.010430  /lava-84079/1/../bin/lava-test-case
    2022-01-27T00:33:11.010658  <8>[   17.516422] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61f1e3a8d1c57e2f4eabbd11

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f1e3a8d1c57e2f4eabbd59
        failing since 15 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:13:04.146072  /lava-84056/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
1e3a8d1c57e2f4eabbd5a
        failing since 15 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:13:04.149289  <8>[   13.502352] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-27T00:13:05.199639  /lava-84056/1/../bin/lava-test-case
    2022-01-27T00:13:05.200034  <8>[   14.521796] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-27T00:13:05.200272  /lava-84056/1/../bin/lava-test-case
    2022-01-27T00:13:05.200499  <8>[   14.537709] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61f1e505d5e44534aeabbd23

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f1e505d5e44534aeabbd6b
        failing since 15 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:18:16.664282  /lava-84062/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
1e505d5e44534aeabbd6c
        failing since 15 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:18:16.667352  <8>[   13.450597] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-27T00:18:17.713552  /lava-84062/1/../bin/lava-test-case
    2022-01-27T00:18:17.713950  <8>[   14.469301] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-27T00:18:17.714186  /lava-84062/1/../bin/lava-test-case
    2022-01-27T00:18:17.714413  <8>[   14.484828] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f1e6f22e0ee45604abbd22

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f1e6f22e0ee45604abbd6a
        failing since 14 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-27T00:27:11.111297  /lava-84069/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
1e6f22e0ee45604abbd6b
        failing since 14 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-6651-gc14f8df2f281)

    2022-01-27T00:27:11.114727  <8>[   13.459809] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-27T00:27:12.161262  /lava-84069/1/../bin/lava-test-case
    2022-01-27T00:27:12.161600  <8>[   14.478586] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-27T00:27:12.161791  /lava-84069/1/../bin/lava-test-case
    2022-01-27T00:27:12.161970  <8>[   14.494534] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-27T00:27:12.162148  /lava-84069/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61f1e75abdf35bcb73abbd29

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f1e75abdf35bcb73abbd71
        failing since 15 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:28:49.170123  /lava-84075/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
1e75abdf35bcb73abbd72
        failing since 15 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-27T00:28:49.173188  <8>[   13.482438] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-27T00:28:50.219902  /lava-84075/1/../bin/lava-test-case
    2022-01-27T00:28:50.220196  <8>[   14.501325] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-27T00:28:50.220343  /lava-84075/1/../bin/lava-test-case
    2022-01-27T00:28:50.220481  <8>[   14.516766] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-27T00:28:50.220619  /lava-84075/1/../bin/lava-test-case
    2022-01-27T00:28:50.220752  <8>[   14.532745] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-27T00:28:50.220887  /lava-84075/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f1e4b607f0b6fee4abbd52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f1e4b607f0b6fee4abb=
d53
        failing since 14 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/61f1e61e46f7c13d82abbd2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu1=
02.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu1=
02.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f1e61e46f7c13d82abb=
d2f
        failing since 13 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f1e70d42f825781aabbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/b=
aseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f1e70d42f825781aabb=
d12
        failing since 14 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f1e7d66ac3391a55abbd1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-3=
85-g87ced262c135/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f1e7d66ac3391a55abb=
d1e
        failing since 14 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =20
