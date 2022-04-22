Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E6050B7DF
	for <lists+linux-next@lfdr.de>; Fri, 22 Apr 2022 15:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447728AbiDVNIT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Apr 2022 09:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447763AbiDVNIQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Apr 2022 09:08:16 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3AD140EC
        for <linux-next@vger.kernel.org>; Fri, 22 Apr 2022 06:05:19 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id bo5so7962624pfb.4
        for <linux-next@vger.kernel.org>; Fri, 22 Apr 2022 06:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9Im6qPusGxytFANsTM6FHmDTP7IapSsmyqfrGv4Fkco=;
        b=p/Zbyw+vJVdqSgG63WThtRe+ih0X8bXlMZweK2/fnIPt/H0ckKs4o5KKKVHYwmrr+7
         e0XD1Bn4MmVbwCfTR4zCVVOLLAoW9qRYy3uIt8Fs+ZZPkL4tjjDZzha3htDNeiaw0q9C
         E4Dg9Hj9Tt5+llZbZI5YgEqlLa+CfM2ZQt/+rF+OI8p1P0m17TwQZx1fQ3a/G6gPGcIQ
         SDsotFFF68cdzhGuMScK+lNl9Nj2ozNDR+P5yQBvrzXnvbdq+70GwwDJWIzES22aO5/5
         /CDyBeBnjCOv5T+rK+EMCMdtWzCoPQgAAa6ron0ghLIpQQ2bvnhDqbakd42vUBu4WOl1
         +WsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9Im6qPusGxytFANsTM6FHmDTP7IapSsmyqfrGv4Fkco=;
        b=EYlFa1QZQNRY62VWCWtc+RCacvL5EyIh/t1yjX2gGW6j1jtZRf2Xn1trlxfR48NI+S
         icb5SYq1mHgXEyq/c6fNM4HxnhX3Z7GBCUjCEAlBoeAi2tqrI3UnLSQdRH9EeBSy3JpE
         XZ76ArfOlgIli+gj2JsjVW/P6WRQWKUmFBc51MrWn0Imz/huYUZF4RrML4mIhxRXT0qR
         Lw3U5pcbDBUA+V6GRSFD/G8AjkKaKj31e3trMgUn8gmifiOQc9nbLNMW+jxexte01Dk1
         OM22lSSGm13Ugr5kcSbJvjTkdp6yDxUGxWyGrW9hkKabgq248ftRSN5K8lMouJgavdxg
         t5Wg==
X-Gm-Message-State: AOAM532V1c1MlM0+ZDrxhLm4Z9ciTWABicXY+Uj55qbj/5kTop3LctH6
        LzSmLm7DfXyQB25nckfLgVfz1R7mzpZPiMK1jRY=
X-Google-Smtp-Source: ABdhPJxArfMZfmfvJKWo0aLi62Or0/G015xEuamwAZkugcE+0J80h5ZjiwyzuUWmIS/VZSHlVwOK5g==
X-Received: by 2002:a63:8f45:0:b0:398:d78:142f with SMTP id r5-20020a638f45000000b003980d78142fmr3882585pgn.162.1650632717595;
        Fri, 22 Apr 2022 06:05:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u25-20020aa78399000000b00505f75651e7sm2538111pfm.158.2022.04.22.06.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 06:05:17 -0700 (PDT)
Message-ID: <6262a80d.1c69fb81.6a419.61ad@mx.google.com>
Date:   Fri, 22 Apr 2022 06:05:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220422
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 241 runs, 18 regressions (next-20220422)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 241 runs, 18 regressions (next-20220422)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
hifive-unleashed-a00  | riscv | lab-baylibre    | gcc-10   | defconfig     =
               | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | clang-14 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | clang-14 | defconfig     =
               | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
               | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig+ima =
               | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig+debu=
g              | 1          =

qcom-qdf2400          | arm64 | lab-linaro-lkft | gcc-10   | defconfig+debu=
g              | 1          =

sun50i-h6-pine-h64    | arm64 | lab-baylibre    | clang-14 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64    | arm64 | lab-baylibre    | clang-14 | defconfig     =
               | 1          =

sun50i-h6-pine-h64    | arm64 | lab-collabora   | clang-14 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64    | arm64 | lab-collabora   | clang-14 | defconfig     =
               | 1          =

sun50i-h6-pine-h64    | arm64 | lab-baylibre    | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64    | arm64 | lab-baylibre    | gcc-10   | defconfig     =
               | 1          =

sun50i-h6-pine-h64    | arm64 | lab-baylibre    | gcc-10   | defconfig+ima =
               | 1          =

sun50i-h6-pine-h64    | arm64 | lab-collabora   | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64    | arm64 | lab-collabora   | gcc-10   | defconfig     =
               | 1          =

sun50i-h6-pine-h64    | arm64 | lab-collabora   | gcc-10   | defconfig+ima =
               | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220422/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220422
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e7d6987e09a328d4a949701db40ef63fbb970670 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
hifive-unleashed-a00  | riscv | lab-baylibre    | gcc-10   | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a22a5c681d15a5ff9468

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6262a22a5c681d15a5ff9=
469
        failing since 176 days (last pass: next-20211026, first fail: next-=
20211027) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | clang-14 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a2756b36e11afbff9461

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220415063012+3400d=
0293a14-1~exp1~20220415063056.119)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
62a2756b36e11afbff946e
        failing since 8 days (last pass: next-20220408, first fail: next-20=
220413)

    2022-04-22T12:41:09.644015  /lava-111105/1/../bin/lava-test-case
    2022-04-22T12:41:09.644346  <8>[   17.270626] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-22T12:41:09.644539  /lava-111105/1/../bin/lava-test-case   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | clang-14 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a33ed4b7849372ff9475

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220415063012+3400d=
0293a14-1~exp1~20220415063056.119)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/clang-14/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/clang-14/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
62a33ed4b7849372ff9482
        failing since 8 days (last pass: next-20220411, first fail: next-20=
220414)

    2022-04-22T12:44:33.472383  /lava-111111/1/../bin/lava-test-case
    2022-04-22T12:44:33.472678  <8>[   17.831489] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-22T12:44:33.472844  /lava-111111/1/../bin/lava-test-case
    2022-04-22T12:44:33.472997  <8>[   17.848716] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-22T12:44:33.473151  /lava-111111/1/../bin/lava-test-case
    2022-04-22T12:44:33.473300  <8>[   17.864296] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-04-22T12:44:33.473454  /lava-111111/1/../bin/lava-test-case   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62629ddaaa400d5429ff94f5

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
629ddaaa400d5429ff9502
        failing since 8 days (last pass: next-20220411, first fail: next-20=
220413)

    2022-04-22T12:21:22.484694  /lava-111070/1/../bin/lava-test-case
    2022-04-22T12:21:22.485059  <8>[   19.662401] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/62629ea05f6a76d7deff945d

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
629ea05f6a76d7deff946a
        failing since 8 days (last pass: next-20220411, first fail: next-20=
220413)

    2022-04-22T12:24:51.035462  /lava-111074/1/../bin/lava-test-case
    2022-04-22T12:24:51.035796  <8>[   19.302643] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-22T12:24:51.035994  /lava-111074/1/../bin/lava-test-case
    2022-04-22T12:24:51.036182  <8>[   19.318693] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-22T12:24:51.036391  /lava-111074/1/../bin/lava-test-case
    2022-04-22T12:24:51.036567  <8>[   19.334340] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-04-22T12:24:51.036746  /lava-111074/1/../bin/lava-test-case   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a1c1decd32c5d7ff9471

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
62a1c1decd32c5d7ff947e
        failing since 9 days (last pass: next-20220411, first fail: next-20=
220413)

    2022-04-22T12:38:17.058653  /lava-111100/1/../bin/lava-test-case
    2022-04-22T12:38:17.058939  <8>[   14.630565] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-22T12:38:17.059088  /lava-111100/1/../bin/lava-test-case
    2022-04-22T12:38:17.059228  <8>[   14.647750] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-22T12:38:17.059366  /lava-111100/1/../bin/lava-test-case
    2022-04-22T12:38:17.059501  <8>[   14.663458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-04-22T12:38:17.059636  /lava-111100/1/../bin/lava-test-case   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-10   | defconfig+debu=
g              | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a4432dfdfab06bff94a4

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
62a4432dfdfab06bff94b1
        failing since 8 days (last pass: next-20220411, first fail: next-20=
220414)

    2022-04-22T12:48:39.051489  /lava-111114/1/../bin/lava-test-case
    2022-04-22T12:48:39.122593  <8>[   41.755932][  T310] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qcom-qdf2400          | arm64 | lab-linaro-lkft | gcc-10   | defconfig+debu=
g              | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a54d5585988211ff9475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6262a54d5585988211ff9=
476
        failing since 96 days (last pass: next-20220114, first fail: next-2=
0220115) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
sun50i-h6-pine-h64    | arm64 | lab-baylibre    | clang-14 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a4312dfdfab06bff945e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220415063012+3400d=
0293a14-1~exp1~20220415063056.119)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-sun50=
i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-sun50=
i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6262a4312dfdfab06bff9=
45f
        failing since 1 day (last pass: next-20220414, first fail: next-202=
20420) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
sun50i-h6-pine-h64    | arm64 | lab-baylibre    | clang-14 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a58532a84023d3ff94ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220415063012+3400d=
0293a14-1~exp1~20220415063056.119)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6262a58532a84023d3ff9=
4cb
        failing since 1 day (last pass: next-20220414, first fail: next-202=
20420) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
sun50i-h6-pine-h64    | arm64 | lab-collabora   | clang-14 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a18d14266ab60aff9459

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220415063012+3400d=
0293a14-1~exp1~20220415063056.119)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6262a18d14266ab60aff9=
45a
        failing since 1 day (last pass: next-20220414, first fail: next-202=
20420) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
sun50i-h6-pine-h64    | arm64 | lab-collabora   | clang-14 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a2d7796ccfd2a8ff9467

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220415063012+3400d=
0293a14-1~exp1~20220415063056.119)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/clang-14/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/clang-14/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6262a2d7796ccfd2a8ff9=
468
        failing since 1 day (last pass: next-20220414, first fail: next-202=
20420) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
sun50i-h6-pine-h64    | arm64 | lab-baylibre    | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62629e5452bc3947edff948b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62629e5452bc3947edff9=
48c
        failing since 1 day (last pass: next-20220414, first fail: next-202=
20420) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
sun50i-h6-pine-h64    | arm64 | lab-baylibre    | gcc-10   | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/62629fae5942246236ff947a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62629fae5942246236ff9=
47b
        failing since 3 days (last pass: next-20220414, first fail: next-20=
220419) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
sun50i-h6-pine-h64    | arm64 | lab-baylibre    | gcc-10   | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a2df796ccfd2a8ff9479

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6262a2df796ccfd2a8ff9=
47a
        failing since 3 days (last pass: next-20220413, first fail: next-20=
220419) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
sun50i-h6-pine-h64    | arm64 | lab-collabora   | gcc-10   | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62629e5e52bc3947edff94b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62629e5e52bc3947edff9=
4b3
        failing since 1 day (last pass: next-20220414, first fail: next-202=
20420) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
sun50i-h6-pine-h64    | arm64 | lab-collabora   | gcc-10   | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/62629e869c8c769db0ff945c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62629e869c8c769db0ff9=
45d
        failing since 3 days (last pass: next-20220414, first fail: next-20=
220419) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
sun50i-h6-pine-h64    | arm64 | lab-collabora   | gcc-10   | defconfig+ima =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/6262a147706f461622ff9467

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220422/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220411.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6262a147706f461622ff9=
468
        failing since 3 days (last pass: next-20220413, first fail: next-20=
220419) =

 =20
