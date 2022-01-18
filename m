Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C22F491FAE
	for <lists+linux-next@lfdr.de>; Tue, 18 Jan 2022 08:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244565AbiARHEt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Jan 2022 02:04:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbiARHEs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Jan 2022 02:04:48 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6CF0C061574
        for <linux-next@vger.kernel.org>; Mon, 17 Jan 2022 23:04:48 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id p125so1910668pga.2
        for <linux-next@vger.kernel.org>; Mon, 17 Jan 2022 23:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iOtKYxYFX30DFFnvm/GNoOnqz/vuN63coU3F5LHyL1E=;
        b=vvtFkkZS86/JVca9hjvqBd8EjaxoR/uIiDEKskeHskyOA5uhddhrSdCkhPtSAlB12v
         LTy/kAX/MTRZnbiuDjokxRCuCoMNUA5LvsIoBnUTSTJxLmVIUYYDMkFS/CFbWsrvZXpw
         0Wq4wx+LW7kv4DVvJ62D9E0+49J3FhHAiywa0d5DPZAuBWN0LJYItsN8XJvYQRdr3WzF
         mAitjrv/2Or4IB7LwQasDMf6Al/p8ENMop1JRae1zBUDiJMWDWuIxUajwo3yYy2iA8zR
         4S1gaLZHh0Pv5D2z2q0MxrK+soixI5g2Pc7/KsoQIz9x1oExbx0d8UpvE4mvGdYWHlzF
         a/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iOtKYxYFX30DFFnvm/GNoOnqz/vuN63coU3F5LHyL1E=;
        b=Lr2cbw1NIKwN4qZc8wxas8CcalEQobWbnj3T0tCeXkK0twtDIkmPFzjc8ZfrNU6uHk
         d7hECFq8maXc4p/Ajk59EpItQFQWHyul75hb4JT+2ikzZ3NskkIzMSkQ7CPDgI4kuJIr
         rITxeadmm4fjBQehtry5t9zliAHbhL6xLsb2N6SQn8sR8+MPKwc3hXtyyuD2B/vl0T3L
         lnxhlqHiltiYUunB04X8uo4HxsPHvB+9JILitRWJetSATqS7YFZyfnIPjjEXYo/Bb0Ah
         qK77RSe1OObbUe9zwC4jyvkqt0XNeObbjyrqVt+rFtetu9bnEO0Cmz/LHAbdBh8oHuLg
         BOVw==
X-Gm-Message-State: AOAM532MAbobYYhnn37s9itKKPQFQkCyRpiOjd90Y+E6bsBudzLkpYx7
        R8bO4EkHDQR4JY2S+SijEy8VuT6/ICrBw7ch
X-Google-Smtp-Source: ABdhPJxOC0aNVPJ0fJifL6m2yTDIULp1q3gLgTQCPDCuME749rlqMobh17WwIfpmWFmri5BluaIO/Q==
X-Received: by 2002:a05:6a00:2182:b0:4a7:ec46:29da with SMTP id h2-20020a056a00218200b004a7ec4629damr24672423pfi.68.1642489487762;
        Mon, 17 Jan 2022 23:04:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d7sm1495113pjs.3.2022.01.17.23.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 23:04:47 -0800 (PST)
Message-ID: <61e6668f.1c69fb81.2c418.4a30@mx.google.com>
Date:   Mon, 17 Jan 2022 23:04:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-10813-g0e10d8ba146c
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 500 runs,
 24 regressions (v5.16-10813-g0e10d8ba146c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 500 runs, 24 regressions (v5.16-10813-g0e10d8b=
a146c)

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

kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =

r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 2          =

r8a77950-salvator-x    | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+ima       | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig           | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+crypto    | 1          =

tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | tegra_defconfig=
              | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-10813-g0e10d8ba146c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-10813-g0e10d8ba146c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0e10d8ba146c4c12183f391691cbc6f17e1df1c7 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
bcm2836-rpi-2-b        | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e6307fd70d4dfdacef6748

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-c=
ollabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e6307fd70d4dfdacef6=
749
        failing since 69 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
da850-lcdk             | arm   | lab-baylibre  | gcc-10   | davinci_all_def=
config        | 1          =


  Details:     https://kernelci.org/test/plan/id/61e62e14dc65516316ef674f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850=
-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850=
-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e62e14dc65516316ef6=
750
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e6309b79c245ba76ef67b8

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron=
/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron=
/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e6309b79c245ba76ef67fd
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-18T03:14:12.903902  /lava-79769/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
6309b79c245ba76ef67fe
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-18T03:14:12.907018  <8>[   17.740432] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-18T03:14:13.960286  /lava-79769/1/../bin/lava-test-case
    2022-01-18T03:14:13.960549  <8>[   18.758634] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-18T03:14:13.960692  /lava-79769/1/../bin/lava-test-case
    2022-01-18T03:14:13.960826  <8>[   18.775597] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-18T03:14:13.960962  /lava-79769/1/../bin/lava-test-case
    2022-01-18T03:14:13.961091  <8>[   18.792623] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-18T03:14:13.961221  /lava-79769/1/../bin/lava-test-case   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e6319f04c47543ceef6743

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron=
/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron=
/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e631a004c47543ceef678f
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-18T03:18:32.751020  /lava-79773/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
631a004c47543ceef6790
        failing since 5 days (last pass: v5.16-rc8-185-gf94a706f394a, first=
 fail: v5.16-6651-gc14f8df2f281)

    2022-01-18T03:18:32.754259  <8>[   13.407369] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-18T03:18:33.804006  /lava-79773/1/../bin/lava-test-case
    2022-01-18T03:18:33.804404  <8>[   14.426598] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron   | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e634fd7d17a792a9ef673d

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e634fd7d17a792a9ef6789
        failing since 6 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-18T03:32:59.942235  /lava-79778/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
634fd7d17a792a9ef678a
        failing since 6 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first =
fail: v5.16-1778-g6927daa7c4fb)

    2022-01-18T03:32:59.945542  <8>[   13.442490] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-18T03:33:00.991641  /lava-79778/1/../bin/lava-test-case
    2022-01-18T03:33:00.992053  <8>[   14.461095] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-18T03:33:00.992293  /lava-79778/1/../bin/lava-test-case
    2022-01-18T03:33:00.992517  <8>[   14.476578] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61e62f81672323aefaef6761

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a=
774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a=
774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e62f81672323a=
efaef6764
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-18T03:09:22.537327  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-18T03:09:22.537529  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-18T03:09:22.537627  kern  :alert : user pgtable: 4k pages<8>[  =
 16.435696] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-18T03:09:22.537718  , 48-bit VAs, pgdp=3D000000007f99f000
    2022-01-18T03:09:22.537805  ker<8>[   16.447584] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 603610_1.5.2.4.1>
    2022-01-18T03:09:22.537888  n  :alert : [0000000000000000] pgd=3D080000=
007f9a0003, p4d=3D080000007f9a0003, pud=3D080000007f9a1003, pmd=3D000000000=
0000000
    2022-01-18T03:09:22.537973  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e62f81672323a=
efaef6765
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-18T03:09:22.446348  <8>[   16.356239] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-01-18T03:09:22.493899  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-18T03:09:22.494066  kern  :alert : Mem abort info:
    2022-01-18T03:09:22.494162  ker<8>[   16.394714] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-18T03:09:22.494251  n  :alert :   ESR =3D 0x96000006
    2022-01-18T03:09:22.494338  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-18T03:09:22.494423  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-18T03:09:22.494505  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-18T03:09:22.494586  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-18T03:09:22.494666  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e6319d8da6ea744def6751

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/bas=
eline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/bas=
eline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e6319d8da6ea7=
44def6754
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-18T03:18:29.925441  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-18T03:18:29.925564  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-18T03:18:29.925676  kern  :alert : user pgtable: <8>[   15.6748=
12] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D2>
    2022-01-18T03:18:29.925783  4k pages, 48-bit VAs, pgdp=3D000000007f87f<=
8>[   15.686514] <LAVA_SIGNAL_ENDRUN 0_dmesg 603659_1.5.2.4.1>
    2022-01-18T03:18:29.925890  000
    2022-01-18T03:18:29.925993  kern  :alert : [0000000000000000] pgd=3D080=
000007f880003
    2022-01-18T03:18:29.926077  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e6319d8da6ea7=
44def6755
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-18T03:18:29.882236  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-18T03:18:29.882395  kern  :alert : Mem abort info:
    2022-01-18T03:18:29.882485  ker<8>[   15.634204] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-18T03:18:29.882569  n  :alert :   ESR =3D 0x96000006
    2022-01-18T03:18:29.882651  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-18T03:18:29.882732  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-18T03:18:29.882809  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-18T03:18:29.882886  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-18T03:18:29.882962  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a774c0-ek874         | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 2          =


  Details:     https://kernelci.org/test/plan/id/61e6346f02e0604efbef6751

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e6346f02e0604=
efbef6754
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        2 lines

    2022-01-18T03:30:29.159582  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-18T03:30:29.159794  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-18T03:30:29.159893  kern  :alert : user pgtable: 4k pages, 48-b=
it<8>[   16.048546] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D2>
    2022-01-18T03:30:29.159983   VAs, pgdp=3D000000007f941000
    2022-01-18T03:30:29.160069  kern  :aler<8>[   16.060809] <LAVA_SIGNAL_E=
NDRUN 0_dmesg 603748_1.5.2.4.1>
    2022-01-18T03:30:29.160152  t : [0000000000000000] pgd=3D080000007f9420=
03, p4d=3D080000007f942003, pud=3D080000007f943003, pmd=3D0000000000000000
    2022-01-18T03:30:29.160234  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e6346f02e0604=
efbef6755
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205)
        12 lines

    2022-01-18T03:30:29.116558  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-18T03:30:29.116769  kern  :alert : Mem abort info:
    2022-01-18T03:30:29.116867  ker<8>[   16.007249] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-18T03:30:29.116955  n  :alert :   ESR =3D 0x96000006
    2022-01-18T03:30:29.117040  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-18T03:30:29.117123  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-18T03:30:29.117219  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-18T03:30:29.117300  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-18T03:30:29.117379  kern  :alert : Data abort info:   =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
r8a77950-salvator-x    | arm64 | lab-baylibre  | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e6319242985d8408ef674a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-baylibr=
e/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-baylibr=
e/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e6319242985d8408ef6=
74b
        new failure (last pass: v5.16-10644-g36cca0cb5eb5) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e62f9fb5ee15bd45ef673e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-c=
ollabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-c=
ollabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e62f9fb5ee15bd45ef6=
73f
        failing since 3 days (last pass: v5.16-1778-g6927daa7c4fb, first fa=
il: v5.16-8869-ge7a3a88568d5) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/61e6303240a5054ceeef6790

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-teg=
ra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig+ima/gcc-10/lab-collabora/baseline-teg=
ra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e6303240a5054ceeef6=
791
        failing since 5 days (last pass: v5.16-1778-g6927daa7c4fb, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61e633dd1c9fba9010ef674b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra12=
4-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra12=
4-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e633dd1c9fba9010ef6=
74c
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e63647b0fe0ec6f3ef6763

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gc=
c-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gc=
c-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e63647b0fe0ec6f3ef6=
764
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | multi_v7_defcon=
fig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/61e637b0f3b4f3eae4ef67f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-=
tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-=
tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e637b0f3b4f3eae4ef6=
7f6
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
tegra124-nyan-big      | arm   | lab-collabora | gcc-10   | tegra_defconfig=
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e636fbdaf55fe31aef674d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-n=
yan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-n=
yan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e636fbdaf55fe31aef6=
74e
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+arm64=
-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61e6301298f218bec1ef67ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zyn=
qmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zyn=
qmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e6301298f218bec1ef6=
7bb
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e6317acf17eafe6cef6755

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/bas=
eline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/bas=
eline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e6317acf17eafe6cef6=
756
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab           | compiler | defconfig      =
              | regressions
-----------------------+-------+---------------+----------+----------------=
--------------+------------
zynqmp-zcu102          | arm64 | lab-cip       | gcc-10   | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/61e63527fe91297867ef6745

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-10813=
-g0e10d8ba146c/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e63527fe91297867ef6=
746
        failing since 5 days (last pass: v5.16-6651-gc14f8df2f281, first fa=
il: v5.16-7998-gbeebf0a29205) =

 =20
