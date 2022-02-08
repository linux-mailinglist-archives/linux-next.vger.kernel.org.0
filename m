Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74E384AD068
	for <lists+linux-next@lfdr.de>; Tue,  8 Feb 2022 05:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346954AbiBHEgm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Feb 2022 23:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346949AbiBHEgl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Feb 2022 23:36:41 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67E9C0401DC
        for <linux-next@vger.kernel.org>; Mon,  7 Feb 2022 20:36:39 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id r19so1021004pfh.6
        for <linux-next@vger.kernel.org>; Mon, 07 Feb 2022 20:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Y8oyeF1LEPJiYO5qndY/e/UjGVEoKUyX/Z0c7LRWNOU=;
        b=JVXdrkTwIzA1kHTZjRkFzpRYjZudUNTTVJkjKoUroWy8CpL9DCSD4VxnaUbhDrWB1C
         cqw8LfDoe0rr6nAHQ7vhl8pOcXedpPQiroXJtL1OH/FnhsydNIpdKPqXQZ3lVHir7+a2
         GDFkJFTpROdW3rSHMEpbLIOx5KPsxlbBPApCbSky0BdKuGplME8kFAhH4X9PcutB6kg2
         Br5dHCQ0r+2uUFQWxYHKZEWRLro4aMnNiZ24Dr6GA2YNqtcFMhlHXIh+G4DPEVw8+nfZ
         Keo1pwgRrt6/505/Z7L6YRIKO/7Rb6w8PVoQwlDRJsG5S9OwcB3nU9CfzNIKWyw7eyfZ
         wvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Y8oyeF1LEPJiYO5qndY/e/UjGVEoKUyX/Z0c7LRWNOU=;
        b=7ZBhc7+noMTZzxNvktuUanCv6zQlSnMO2DeC9eDcTIl6oTasfMGVOkX7DPspBJtaRz
         QGgBJz5V6b7VFeFl+a3eeuz5eCSDi69Xtup0jA4b9yU4Mzd6A96N6TQnwNGgQe38F7EL
         FrAVnaYAX3fRpswFINCLXwOcbDLbTB0SXvqik3uazN5Z9bAEpWHHfhDnAUqrjbh9Nrou
         HuBV/Wjai2BcRdxqjj7JW65pzmlxFkPTp03DChbolbj2NKVJmvDKfm1EjxFF2IS518Sd
         LFsXa4qrEZuY16++rKcHEm3oP7I1OX6ewOzR/KNCMBn0DsmkIJXricvsLd3J6QZXYynY
         ow3Q==
X-Gm-Message-State: AOAM530Xx/oO9xWHtSThhXD0Y4FYmZkkVHQ+JmqOzKZGXHzfxEXYxEqB
        5qaTblvwpdiFyEmA1c1nYw+RlugLj8WsEPzF
X-Google-Smtp-Source: ABdhPJzxpufPTtt5KZjFb1GPtao+B6cejDmcmAQzjICBH/E06Wy3g45ZC8zKziX17rkD23aPMzT+gw==
X-Received: by 2002:a63:90c9:: with SMTP id a192mr2099725pge.278.1644294998759;
        Mon, 07 Feb 2022 20:36:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c20sm2037631pfl.46.2022.02.07.20.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 20:36:38 -0800 (PST)
Message-ID: <6201f356.1c69fb81.3b014.6846@mx.google.com>
Date:   Mon, 07 Feb 2022 20:36:38 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.17-rc3-225-g8b6f2853101d
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 476 runs,
 15 regressions (v5.17-rc3-225-g8b6f2853101d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 476 runs, 15 regressions (v5.17-rc3-225-g8b6f2=
853101d)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig        | 1          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =

kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug       | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc3-225-g8b6f2853101d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc3-225-g8b6f2853101d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8b6f2853101de7543e0baf31011e787df5e1c381 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6201c77406c15bb1a95d6ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6201c77406c15bb1a95d6=
ee9
        failing since 90 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
da850-lcdk               | arm    | lab-baylibre  | gcc-10   | davinci_all_=
defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6201dc578d08d696045d6f08

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6201dc578d08d69=
6045d6f0f
        failing since 15 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-08T02:58:01.877052  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-08T02:58:01.877425  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-08T02:58:01.877680  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-02-08T02:58:01.920110  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/6201b6b3798001e70b5d6f1c

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6201b6b3798001e70b5d6f5d
        failing since 27 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-02-08T00:17:48.465107  /lava-84822/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
1b6b3798001e70b5d6f5e
        failing since 27 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-02-08T00:17:48.468284  <8>[   18.067783] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T00:17:49.515281  /lava-84822/1/../bin/lava-test-case
    2022-02-08T00:17:49.515671  <8>[   19.086500] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-08T00:17:49.515908  /lava-84822/1/../bin/lava-test-case
    2022-02-08T00:17:49.516129  <8>[   19.102437] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-08T00:17:49.516396  /lava-84822/1/../bin/lava-test-case
    2022-02-08T00:17:49.516671  <8>[   19.118448] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-08T00:17:49.516949  /lava-84822/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/6201b806977bd60fdf5d6ef9

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a=
-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6201b806977bd60fdf5d6f3a
        failing since 27 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-02-08T00:23:00.859278  /lava-84828/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
1b806977bd60fdf5d6f3b
        failing since 27 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-02-08T00:23:00.862428  <8>[   13.827011] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T00:23:01.910859  /lava-84828/1/../bin/lava-test-case
    2022-02-08T00:23:01.911269  <8>[   14.845838] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =


  Details:     https://kernelci.org/test/plan/id/6201bc26e142d32da45d6ee9

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6201bc26e142d32da45d6f2a
        failing since 27 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb) =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
1bc26e142d32da45d6f2b
        failing since 27 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/6201b69eed93722c085d6f0c

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6201b69eed93722c085d6f54
        failing since 27 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-02-08T00:17:21.622524  /lava-84825/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
1b69eed93722c085d6f55
        failing since 27 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-02-08T00:17:21.625779  <8>[   13.507435] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T00:17:22.672754  /lava-84825/1/../bin/lava-test-case
    2022-02-08T00:17:22.673139  <8>[   14.526710] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/6201b8083b8df6dedb5d6f09

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6201b8083b8df6dedb5d6f51
        failing since 27 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-02-08T00:23:04.385002  /lava-84831/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
1b8083b8df6dedb5d6f52
        failing since 27 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-02-08T00:23:04.388196  <8>[   13.510185] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T00:23:05.434504  /lava-84831/1/../bin/lava-test-case
    2022-02-08T00:23:05.434900  <8>[   14.528870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-08T00:23:05.435139  /lava-84831/1/../bin/lava-test-case
    2022-02-08T00:23:05.435403  <8>[   14.544449] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-sl28-var3-ads2   | arm64  | lab-kontron   | gcc-10   | defconfig+im=
a                | 2          =


  Details:     https://kernelci.org/test/plan/id/6201bb2861e1389c6f5d6eff

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/6201bb2961e1389c6f5d6f47
        failing since 27 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-02-08T00:36:29.890012  /lava-84844/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/620=
1bb2961e1389c6f5d6f48
        failing since 27 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-02-08T00:36:29.892807  <8>[   13.512089] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-02-08T00:36:30.941186  /lava-84844/1/../bin/lava-test-case
    2022-02-08T00:36:30.941565  <8>[   14.530431] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-02-08T00:36:30.941745  /lava-84844/1/../bin/lava-test-case
    2022-02-08T00:36:30.941932  <8>[   14.547537] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-02-08T00:36:30.942109  /lava-84844/1/../bin/lava-test-case
    2022-02-08T00:36:30.942332  <8>[   14.564374] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-02-08T00:36:30.942497  /lava-84844/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
nfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6201e8177515f472635d6f0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc3-2=
25-g8b6f2853101d/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6201e8177515f472635d6=
f0e
        new failure (last pass: v5.17-rc3-197-g418dccbc3ba5) =

 =20
