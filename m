Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC4694900B4
	for <lists+linux-next@lfdr.de>; Mon, 17 Jan 2022 05:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbiAQELD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Jan 2022 23:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234170AbiAQELC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 16 Jan 2022 23:11:02 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6CFC061574
        for <linux-next@vger.kernel.org>; Sun, 16 Jan 2022 20:11:02 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id q25so3376810pfl.8
        for <linux-next@vger.kernel.org>; Sun, 16 Jan 2022 20:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fIUeov6yrETsLXfCo397bvLg85nNc5FSLYwbAQcR5XU=;
        b=FZ6fJ26vOQhN6ZipLua11cCs7J2RD8Wm/2z/qGIrpqUnCIUeg1P6Hf1cbHZcT9bDMs
         roRIAjHZxAqngoNQRV6jF/jTwPCuxH0c84Z17Ged5HHUfErF5ndJmwqFCnFrknR3O70m
         +VgvXa74zaS2r52iiXC5cBJHR3j3DA/a4S/HK74N/O6OxybIl19RO+Oza5z1RNYJLvne
         v8XGSWCYgce1Tmbafu3xbVrIISOtUVsr8MMbGucfxXjdsIC43k9seBHT2NHyJYF7kK1M
         laubqmXO4UHrw8q88JDBQquKLYEipsdhcLcCbUZDoeV/ZWzA1Nff0XT0oaSVqRJBYT4G
         OqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fIUeov6yrETsLXfCo397bvLg85nNc5FSLYwbAQcR5XU=;
        b=w+4z3eB1SgLpCdNkLswya+eaIxvkcHxdVflH5A/8j6pyQs/62oRnb+T9AfzlyE4bmH
         lTJLjtPWgfFEPrPtrdAuS/TEp/nZTP3D8Ek+GEUquvIebDbiLoK1dQwH7M719NzcxHj+
         Pc84xWFOibc9dafGDZKSKjBz6Ceb8FxBmGEQMu3bhacGkL/ElnDcVTe15BJ7cdmHCDGY
         8a6OW3UTme+w/jlY9TAXa/Wq4z4iSr6jU2AQe/9SnwHquTdq1cnqIjL+e/lshucnho+D
         YQYeCy8HC/HxqTXiqf0daHiAt/bQxxNkxZye4OpPLTKu1SPvpp1s+svg6801Es02+D5H
         0Y/w==
X-Gm-Message-State: AOAM53361HMLtD7+UBY1RpPbE13uXw7M8s8uk0nP7Wr+cqQL2bR1JKWr
        C/DcRqxrrXKF2H0ul3OanH0Z7dEa8yEG9QHY
X-Google-Smtp-Source: ABdhPJzkBicakOeBg/TAFi5v94yjipkjHfzEQ6VNbTk6ixDXcpVm2ikfbw1gEEcL6ozlpws8+hH/nQ==
X-Received: by 2002:aa7:96bd:0:b0:4c1:232c:818a with SMTP id g29-20020aa796bd000000b004c1232c818amr19734487pfk.35.1642392661286;
        Sun, 16 Jan 2022 20:11:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u2sm9286376pfk.11.2022.01.16.20.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 20:11:00 -0800 (PST)
Message-ID: <61e4ec54.1c69fb81.98262.9f23@mx.google.com>
Date:   Sun, 16 Jan 2022 20:11:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-10644-g36cca0cb5eb5
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 518 runs,
 25 regressions (v5.16-10644-g36cca0cb5eb5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 518 runs, 25 regressions (v5.16-10644-g36cca0c=
b5eb5)

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

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

kontron-pitx-imx8m     | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 1          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =

meson-gxbb-p200        | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-10644-g36cca0cb5eb5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-10644-g36cca0cb5eb5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      36cca0cb5eb5f16d2f5a2300c5c9597f617ca3d4 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e4ba90daccd49fedef6747

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e4ba90daccd49fedef6=
748
        failing since 67 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
da850-lcdk             | arm   | lab-baylibre  | gcc-10   | davinci_all_def=
config        | 1          =


  Details:     https://kernelci.org/test/plan/id/61e4b7d2b0b9a6f9fbef6744

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850=
-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850=
-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e4b7d2b0b9a6f9fbef6=
745
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e4b20c52bec0fb5bef6751

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox=
-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e4b20d52bec0fb5bef6796
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:01:44.252197  /lava-79291/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
4b20d52bec0fb5bef6797
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:01:44.255770  <8>[   18.390913] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-17T00:01:45.302423  /lava-79291/1/../bin/lava-test-case
    2022-01-17T00:01:45.302827  <8>[   19.409686] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-17T00:01:45.303101  /lava-79291/1/../bin/lava-test-case
    2022-01-17T00:01:45.303335  <8>[   19.425696] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e4b722b789e92e65ef6765

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron=
/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron=
/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e4b722b789e92e65ef67aa
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-17T00:23:40.805575  /lava-79306/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
4b722b789e92e65ef67ab
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-17T00:23:40.808752  <8>[   16.849750] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-17T00:23:41.854430  /lava-79306/1/../bin/lava-test-case
    2022-01-17T00:23:41.854831  <8>[   17.868428] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e4b7eab0b9a6f9fbef676f

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e4b7eab0b9a6f9fbef67b4
        failing since 5 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:27:06.563446  /lava-79309/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
4b7eab0b9a6f9fbef67b5
        failing since 5 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:27:06.566496  <8>[   18.046991] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-17T00:27:07.613019  /lava-79309/1/../bin/lava-test-case
    2022-01-17T00:27:07.613338  <8>[   19.065826] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-17T00:27:07.613523  /lava-79309/1/../bin/lava-test-case
    2022-01-17T00:27:07.613694  <8>[   19.081301] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-17T00:27:07.613866  /lava-79309/1/../bin/lava-test-case
    2022-01-17T00:27:07.614033  <8>[   19.097349] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-17T00:27:07.614202  /lava-79309/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e4ba7e2a253f397aef675c

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-2=
30-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e4ba7f2a253f397aef67a1
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:37:58.184150  /lava-79316/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
4ba7f2a253f397aef67a2
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:37:58.187287  <8>[   16.381012] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-17T00:37:59.234202  /lava-79316/1/../bin/lava-test-case
    2022-01-17T00:37:59.234619  <8>[   17.399827] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-17T00:37:59.234861  /lava-79316/1/../bin/lava-test-case
    2022-01-17T00:37:59.235109  <8>[   17.416108] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-pitx-imx8m     | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e4b3b08281de054fef674c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx=
-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e4b3b08281de054fef6=
74d
        new failure (last pass: v5.16-9826-g830809423594) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+ima  =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e4b2993a1cdc802bef6751

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28=
-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e4b2993a1cdc802bef679d
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:04:33.478155  /lava-79294/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
4b2993a1cdc802bef679e
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:04:33.484654  <8>[   13.555042] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-17T00:04:34.530678  /lava-79294/1/../bin/lava-test-case
    2022-01-17T00:04:34.531064  <8>[   14.573773] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-17T00:04:34.531311  /lava-79294/1/../bin/lava-test-case
    2022-01-17T00:04:34.531541  <8>[   14.590964] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e4b70eddf26d0befef676b

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron=
/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron=
/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e4b70eddf26d0befef67b7
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-17T00:23:18.487456  /lava-79302/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
4b70eddf26d0befef67b8
        failing since 4 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-17T00:23:18.490271  <8>[   13.487707] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-17T00:23:19.538775  /lava-79302/1/../bin/lava-test-case
    2022-01-17T00:23:19.539096  <8>[   14.506524] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-17T00:23:19.539261  /lava-79302/1/../bin/lava-test-case
    2022-01-17T00:23:19.539429  <8>[   14.522495] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-17T00:23:19.539586  /lava-79302/1/../bin/lava-test-case
    2022-01-17T00:23:19.539737  <8>[   14.539646] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-17T00:23:19.539899  /lava-79302/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e4b82634d61781d7ef6802

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e4b82634d61781d7ef684e
        failing since 5 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:27:59.897071  /lava-79312/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
4b82634d61781d7ef684f
        failing since 5 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:27:59.900288  <8>[   13.484115] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-17T00:28:00.947135  /lava-79312/1/../bin/lava-test-case
    2022-01-17T00:28:00.947686  <8>[   14.503282] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-17T00:28:00.947924  /lava-79312/1/../bin/lava-test-case
    2022-01-17T00:28:00.948123  <8>[   14.519294] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-17T00:28:00.948322  /lava-79312/1/../bin/lava-test-case
    2022-01-17T00:28:00.948513  <8>[   14.535329] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-17T00:28:00.948705  /lava-79312/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig      =
              | 2          =


  Details:     https://kernelci.org/test/plan/id/61e4b88a67959d2497ef67bf

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var=
3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e4b88a67959d2497ef680b
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:29:42.021924  /lava-79315/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
4b88a67959d2497ef680c
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-17T00:29:42.025158  <8>[   13.522248] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-17T00:29:43.073163  /lava-79315/1/../bin/lava-test-case
    2022-01-17T00:29:43.073526  <8>[   14.540929] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-17T00:29:43.073744  /lava-79315/1/../bin/lava-test-case
    2022-01-17T00:29:43.073947  <8>[   14.557997] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-17T00:29:43.074151  /lava-79315/1/../bin/lava-test-case
    2022-01-17T00:29:43.074345  <8>[   14.573961] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-17T00:29:43.074542  /lava-79315/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
meson-gxbb-p200        | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e4bef0e0188a1315ef673f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibr=
e/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibr=
e/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e4bef0e0188a1315ef6=
740
        new failure (last pass: v5.16-9826-g830809423594) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+ima  =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e4b2df142b321b11ef6742

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e4b2df142b321b11ef6=
743
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e4b753d2c9fa4637ef675d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/bas=
eline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/bas=
eline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e4b753d2c9fa4637ef6=
75e
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/61e4b7683bd4e2f2cfef676d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e4b7683bd4e2f2cfef6=
76e
        failing since 3 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61e4b8bcb51befab82ef6751

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zyn=
qmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zyn=
qmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e4b8bcb51befab82ef6=
752
        failing since 4 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e4ba2479487ca769ef6765

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10644=
-g36cca0cb5eb5/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e4ba2479487ca769ef6=
766
        failing since 4 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =20
