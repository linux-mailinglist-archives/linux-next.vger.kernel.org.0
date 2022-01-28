Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654B649F752
	for <lists+linux-next@lfdr.de>; Fri, 28 Jan 2022 11:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347877AbiA1Kc1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Jan 2022 05:32:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347799AbiA1Kc0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Jan 2022 05:32:26 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D4AC061714
        for <linux-next@vger.kernel.org>; Fri, 28 Jan 2022 02:32:26 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id 128so5706515pfe.12
        for <linux-next@vger.kernel.org>; Fri, 28 Jan 2022 02:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=586AH2c5TQc98mhFzzwBwxK7DFUSi96xmhqpBf5rZbU=;
        b=20EFnzOBq/fq8rZKNUtZ43crAYLQBBKQceaETh9DTazR2f5xMxsPeValAINt/Miqis
         uTs4s/Z9P2PnbdhYxvhtjIx3hMchaX2NEcazWI35tDgzRyMFR50On1SF1sEwgMOQY/Fd
         FHN+ieC4W7GX7DjAlsYJtKnxUz3veMPJvxGMLLYgmMusJBRV3ls/hHwg/xhI9D150+20
         4+LZnAZMbmcmeWp3yuGgmSL4OQ3u2wOV7OxSzClEe/FsvLPtbtUs3dArpsi4jy3kKJzQ
         MtUAD64FLJKS8GFUIxpntP/0s4pt6K6sKm8jc9AA6w6hX1VGqh4Nf964ldhP78wQO9OF
         LibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=586AH2c5TQc98mhFzzwBwxK7DFUSi96xmhqpBf5rZbU=;
        b=1KLlG8OptnC0O0JOsfMctqE/yFgAKD6HTvTvfIgL0+yKg9YpdY7nQUY8lSI94/fZLP
         fcAQh/DZ5XyxPpVPetWq1ygl0EjCtI0+E8JY6rhCgBY9BJ9QAvnv5XJHduDudUtp6ph7
         oPtCkWxXwEBHWbjiVtCTwbCL9ohucU7YlhgRtrWcz0rkLA33lV+Psr1lRInLl6Z6fBvy
         ZDzgSDUWXB4HZRLUo8n8ZOBePRgGNlH0kwhTAqP2qGvUfj7nmbKMSwJvaL0VCnXbFy+P
         3JRO4oHUpum5pkWI7lOCSeR5B+rQnLY0ev29M8TbUQeINfJ0kxD57ip77WL017vD/r72
         HIpg==
X-Gm-Message-State: AOAM53063RsacsPGd91y5VNWdmjB7snkkvh9ogSVbQyX0/YJJdVDDYV/
        +73Op68hQdMthEKAX/+3gOxJECiJCHdpO+t1
X-Google-Smtp-Source: ABdhPJx9citJ1BxUf1bGqDwdkfUiEx5WaBITxvnDP/oSw/qsLenGm4Sh4kBwQrvnX3fqsAFYrW5kIw==
X-Received: by 2002:a63:2045:: with SMTP id r5mr6216507pgm.11.1643365944323;
        Fri, 28 Jan 2022 02:32:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u12sm9736032pfk.220.2022.01.28.02.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 02:32:23 -0800 (PST)
Message-ID: <61f3c637.1c69fb81.f6a45.999d@mx.google.com>
Date:   Fri, 28 Jan 2022 02:32:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220128
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 584 runs, 29 regressions (next-20220128)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 584 runs, 29 regressions (next-20220128)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
._64K_PAGES=3Dy | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 4          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

r8a77950-salvator-x    | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin       | arm64 | lab-collabora | gcc-10   | defconfig+arm64=
-chromebook   | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
._64K_PAGES=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220128/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220128
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b605fdc54c2b28c30ef06d9db99282d8a32ae4be =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f38b6d60a61388f6abbe0b

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f38b6d60a61388f6abbe4c
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-28T06:21:07.558705  /lava-84585/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
38b6d60a61388f6abbe4d
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-28T06:21:07.561843  <8>[   18.365073] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T06:21:08.608761  /lava-84585/1/../bin/lava-test-case
    2022-01-28T06:21:08.609059  <8>[   19.384310] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-28T06:21:08.609209  /lava-84585/1/../bin/lava-test-case
    2022-01-28T06:21:08.609348  <8>[   19.400253] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-28T06:21:08.609488  /lava-84585/1/../bin/lava-test-case
    2022-01-28T06:21:08.609623  <8>[   19.416302] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-28T06:21:08.609758  /lava-84585/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f38be18b010ba3c5abbd1b

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f38be28b010ba3c5abbd5c
        failing since 38 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-28T06:23:06.085738  /lava-84592/1/../bin/lava-test-case
    2022-01-28T06:23:06.086031  <8>[   17.670068] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
38be28b010ba3c5abbd5d
        failing since 38 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-28T06:23:07.135911  /lava-84592/1/../bin/lava-test-case
    2022-01-28T06:23:07.136195  <8>[   18.689931] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-28T06:23:07.136350  /lava-84592/1/../bin/lava-test-case
    2022-01-28T06:23:07.136497  <8>[   18.706429] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-28T06:23:07.136641  /lava-84592/1/../bin/lava-test-case
    2022-01-28T06:23:07.136778  <8>[   18.722797] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-28T06:23:07.136915  /lava-84592/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61f38dc0d857823a46abbd40

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f38dc1d857823a46abbd81
        failing since 41 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-28T06:31:12.329509  /lava-84595/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
38dc1d857823a46abbd82
        failing since 41 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-28T06:31:12.332645  <8>[   18.484003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T06:31:13.379780  /lava-84595/1/../bin/lava-test-case
    2022-01-28T06:31:13.380198  <8>[   19.502868] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-28T06:31:13.380442  /lava-84595/1/../bin/lava-test-case
    2022-01-28T06:31:13.380672  <8>[   19.518844] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61f3978dbf2c598c2babbd1c

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f3978dbf2c598c2babbd5d
        failing since 41 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-28T07:12:28.120454  /lava-84619/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
3978dbf2c598c2babbd5e
        failing since 41 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-28T07:12:28.124423  <8>[   16.499921] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T07:12:29.170121  /lava-84619/1/../bin/lava-test-case
    2022-01-28T07:12:29.170442  <8>[   17.518647] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-28T07:12:29.170602  /lava-84619/1/../bin/lava-test-case
    2022-01-28T07:12:29.170745  <8>[   17.534474] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-28T07:12:29.170885  /lava-84619/1/../bin/lava-test-case
    2022-01-28T07:12:29.171021  <8>[   17.550363] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-28T07:12:29.171158  /lava-84619/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61f3995c0eec405bd9abbd12

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f3995c0eec405bd9abbd58
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-28T07:20:39.349791  /lava-84633/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
3995c0eec405bd9abbd59
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-28T07:20:39.352960  <8>[   13.754635] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T07:20:40.400381  /lava-84633/1/../bin/lava-test-case
    2022-01-28T07:20:40.400776  <8>[   14.773994] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f38b1c077d0142beabbd24

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f38b1d077d0142beabbd6c
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-28T06:20:02.408878  /lava-84587/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
38b1d077d0142beabbd6d
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-28T06:20:02.412033  <8>[   13.486715] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T06:20:03.461792  /lava-84587/1/../bin/lava-test-case
    2022-01-28T06:20:03.462200  <8>[   14.506047] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-28T06:20:03.462440  /lava-84587/1/../bin/lava-test-case
    2022-01-28T06:20:03.462663  <8>[   14.522043] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61f38b92557e077de7abbdab

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f38b92557e077de7abbdf3
        failing since 38 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-28T06:21:53.495596  /lava-84590/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
38b92557e077de7abbdf4
        failing since 38 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-28T06:21:53.498806  <8>[   13.515228] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T06:21:54.548119  /lava-84590/1/../bin/lava-test-case
    2022-01-28T06:21:54.548532  <8>[   14.534336] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-28T06:21:54.548774  /lava-84590/1/../bin/lava-test-case
    2022-01-28T06:21:54.549001  <8>[   14.551044] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 4          =


  Details:     https://kernelci.org/test/plan/id/61f38d0c30e663c2dbabbd17

  Results:     97 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/61f38d0c30e663c2dbabbd1f
        new failure (last pass: next-20220127)

    2022-01-28T06:28:04.523523  /lava-84597/1/../bin/lava-test-case
    2022-01-28T06:28:04.524108  <8>[   13.598352] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-probed: https://kernelci.org/test/case=
/id/61f38d0c30e663c2dbabbd1f
        new failure (last pass: next-20220127)

    2022-01-28T06:28:04.523523  /lava-84597/1/../bin/lava-test-case
    2022-01-28T06:28:04.524108  <8>[   13.598352] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f38d0c30e663c2dbabbd5f
        failing since 41 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-28T06:28:06.524623  /lava-84597/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
38d0c30e663c2dbabbd60
        failing since 41 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-28T06:28:06.527818  <8>[   15.630752] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T06:28:07.575579  /lava-84597/1/../bin/lava-test-case
    2022-01-28T06:28:07.575893  <8>[   16.649654] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-28T06:28:07.576274  /lava-84597/1/../bin/lava-test-case
    2022-01-28T06:28:07.576460  <8>[   16.665033] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-28T06:28:07.576633  /lava-84597/1/../bin/lava-test-case
    2022-01-28T06:28:07.576800  <8>[   16.680988] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-28T06:28:07.576965  /lava-84597/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61f394dedbafbc14a5abbd1c

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f394dfdbafbc14a5abbd64
        failing since 41 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-28T07:01:44.941018  /lava-84623/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
394dfdbafbc14a5abbd65
        failing since 41 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-28T07:01:44.944315  <8>[   13.468177] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T07:01:45.992964  /lava-84623/1/../bin/lava-test-case
    2022-01-28T07:01:45.993376  <8>[   14.486432] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-28T07:01:45.993616  /lava-84623/1/../bin/lava-test-case
    2022-01-28T07:01:45.993841  <8>[   14.503484] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61f39738e21f95e560abbd1c

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f39738e21f95e560abbd64
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-28T07:11:37.173569  /lava-84635/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
39738e21f95e560abbd65
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-28T07:11:37.176748  <8>[   13.507494] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T07:11:38.223581  /lava-84635/1/../bin/lava-test-case
    2022-01-28T07:11:38.223961  <8>[   14.526602] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-28T07:11:38.224201  /lava-84635/1/../bin/lava-test-case
    2022-01-28T07:11:38.224425  <8>[   14.542557] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-28T07:11:38.224648  /lava-84635/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a77950-salvator-x    | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f38ce5b9bd848277abbd79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f38ce5b9bd848277abb=
d7a
        new failure (last pass: next-20220127) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-10   | defconfig+arm64=
-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61f38c03374467002eabbd3a

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/61f38c03374467002eabbd5c
        failing since 4 days (last pass: next-20220121, first fail: next-20=
220124)

    2022-01-28T06:23:38.330120  <4>[   22.925232] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-01-28T06:23:38.796702  /lava-5551395/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f38b14077d0142beabbd1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f38b14077d0142beabb=
d20
        failing since 65 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61f38b144170de2e31abbd58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f38b144170de2e31abb=
d59
        failing since 65 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f38de4c6f5de7cdbabbd39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f38de4c6f5de7cdbabb=
d3a
        failing since 65 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61f390dc83fe38943babbd3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f390dc83fe38943babb=
d3d
        failing since 65 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/61f3929454ab6cf29dabbd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220128/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f3929454ab6cf29dabb=
d17
        failing since 65 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
