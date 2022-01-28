Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C383549F440
	for <lists+linux-next@lfdr.de>; Fri, 28 Jan 2022 08:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346736AbiA1HUG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Jan 2022 02:20:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346735AbiA1HUF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Jan 2022 02:20:05 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E67C061714
        for <linux-next@vger.kernel.org>; Thu, 27 Jan 2022 23:20:05 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id z131so4450071pgz.12
        for <linux-next@vger.kernel.org>; Thu, 27 Jan 2022 23:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=I0jeOoIIq+XAH2iR/oxJzLSklXxazzcmhfSrHFJOeK4=;
        b=z//NJgLjH2Pa379IqwBJ4aVBK2whZTk4JqbN1s/jzrjwZARdouiYfnXVk+tyalxOX6
         QJBnEsV8qMLDmP/ce9s4NeUtBhy39lblzICRDQTy9tjPrnpjbkS0YkUbs/ed1M5ZBkLY
         pBqaaHGNN5ACaANYayg6f4ozS1xhkpFXFLHQjxDrreocs++4suUu36XFlozbymtHtHBI
         WLF3TyFWQTO9uTBVzD8Nsgb3AW/aiBRjdf2HMs4CjkvtLU0PAXXqOjs7wF4vZRVqNJia
         WTd9fL0AoAvKhucP7F2ropldxjKJuAQQ2qlPblw/ToHsSN22V92JRPLKl3BTEptTsZee
         p+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=I0jeOoIIq+XAH2iR/oxJzLSklXxazzcmhfSrHFJOeK4=;
        b=dR+U51p9RWRQ3QlQ/vT1JUlJGkCtntboSbJGV/ZFqshYA8q3J1DN1MSlmFMnyNtBix
         baWJ06/jmJevx6bt/YXS2nmHR98X7oPIJsRhSoGTdonkmU1QghmQiNsR5RBozxzw0F7w
         hCdQ7TlWYTNU6Z1E1RfPJNTabdZWI+nOEHlmzqw8t6KeCRoMVstmotpP08XvVapTkY+O
         PdoFtdo+/Uz+OdSahRJIki0TOHDyMe5EYmD6aO3jP/nbvPjYsDhIP+KWNEnciyLBVKC1
         +VH1eKQ5LAVg+0dUS2iU2pQQTJxZ46S74F8GXZ2+GFNVNGRvp1ACc8h7N3NPexkovPWT
         dA3g==
X-Gm-Message-State: AOAM531KaZgz/gJnlnODvAUdIRaO28F5Esrh7gUEaca1NsdXE3GED2fA
        Q8MEZC6EMKX8+C0FIqtS/T0FD0OREvoB8vhn
X-Google-Smtp-Source: ABdhPJyRat62r8jIGyy4KeSvrRVnnIncWd5uE/XkF/lrV4JpgFaX6T73+6qgK5HzAily0oh4VZPhiA==
X-Received: by 2002:a62:7a0b:: with SMTP id v11mr7146204pfc.22.1643354404169;
        Thu, 27 Jan 2022 23:20:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s6sm21354391pgk.44.2022.01.27.23.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 23:20:03 -0800 (PST)
Message-ID: <61f39923.1c69fb81.c5843.b617@mx.google.com>
Date:   Thu, 27 Jan 2022 23:20:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-rc1-438-g4db37f24284ff
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 358 runs,
 11 regressions (v5.17-rc1-438-g4db37f24284ff)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 358 runs, 11 regressions (v5.17-rc1-438-g4db37=
f24284ff)

Regressions Summary
-------------------

platform               | arch  | lab         | compiler | defconfig        =
   | regressions
-----------------------+-------+-------------+----------+------------------=
---+------------
imx6ul-14x14-evk       | arm   | lab-nxp     | gcc-10   | imx_v6_v7_defconf=
ig | 1          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig+crypto =
   | 2          =

kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig+ima    =
   | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig+crypto =
   | 2          =

kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig+ima    =
   | 2          =

zynqmp-zcu102          | arm64 | lab-cip     | gcc-10   | defconfig+crypto =
   | 1          =

zynqmp-zcu102          | arm64 | lab-cip     | gcc-10   | defconfig+ima    =
   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc1-438-g4db37f24284ff/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc1-438-g4db37f24284ff
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4db37f24284ff1fe9e32aab9eb2199fd9ab4c592 =



Test Regressions
---------------- =



platform               | arch  | lab         | compiler | defconfig        =
   | regressions
-----------------------+-------+-------------+----------+------------------=
---+------------
imx6ul-14x14-evk       | arm   | lab-nxp     | gcc-10   | imx_v6_v7_defconf=
ig | 1          =


  Details:     https://kernelci.org/test/plan/id/61f35ea64a2574eb73abbd23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14=
x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14=
x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f35ea64a2574eb73abb=
d24
        failing since 7 days (last pass: v5.16-7998-gbeebf0a29205, first fa=
il: v5.16-11408-ga51e80162547) =

 =



platform               | arch  | lab         | compiler | defconfig        =
   | regressions
-----------------------+-------+-------------+----------+------------------=
---+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig+crypto =
   | 2          =


  Details:     https://kernelci.org/test/plan/id/61f35fcff649b496e1abbd11

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f35fd0f649b496e1abbd52
        failing since 16 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-28T03:15:22.399457  /lava-84501/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
35fd0f649b496e1abbd53
        failing since 16 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-28T03:15:22.402685  <8>[   14.802286] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T03:15:23.449758  /lava-84501/1/../bin/lava-test-case
    2022-01-28T03:15:23.450185  <8>[   15.821779] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-28T03:15:23.450430  /lava-84501/1/../bin/lava-test-case
    2022-01-28T03:15:23.450657  <8>[   15.837695] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-28T03:15:23.450884  /lava-84501/1/../bin/lava-test-case
    2022-01-28T03:15:23.451101  <8>[   15.853541] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-28T03:15:23.451358  /lava-84501/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig        =
   | regressions
-----------------------+-------+-------------+----------+------------------=
---+------------
kontron-kbox-a-230-ls  | arm64 | lab-kontron | gcc-10   | defconfig+ima    =
   | 2          =


  Details:     https://kernelci.org/test/plan/id/61f3619c3a93d7b78aabbd14

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f3619c3a93d7b78aabbd55
        failing since 16 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-28T03:22:49.953856  /lava-84507/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
3619c3a93d7b78aabbd56
        failing since 16 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-28T03:22:49.956982  <8>[   17.183157] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T03:22:51.004960  /lava-84507/1/../bin/lava-test-case
    2022-01-28T03:22:51.005340  <8>[   18.201855] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-28T03:22:51.005580  /lava-84507/1/../bin/lava-test-case
    2022-01-28T03:22:51.005805  <8>[   18.219006] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-28T03:22:51.006031  /lava-84507/1/../bin/lava-test-case
    2022-01-28T03:22:51.006247  <8>[   18.234976] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-28T03:22:51.006466  /lava-84507/1/../bin/lava-test-case   =

 =



platform               | arch  | lab         | compiler | defconfig        =
   | regressions
-----------------------+-------+-------------+----------+------------------=
---+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig+crypto =
   | 2          =


  Details:     https://kernelci.org/test/plan/id/61f35eba69cba38254abbd20

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f35eba69cba38254abbd68
        failing since 16 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-28T03:10:40.678487  /lava-84499/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
35eba69cba38254abbd69
        failing since 16 days (last pass: v5.16-rc8-76-gf3c3fc1577d6, first=
 fail: v5.16-1778-g6927daa7c4fb)

    2022-01-28T03:10:40.681653  <8>[   13.599191] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T03:10:41.728489  /lava-84499/1/../bin/lava-test-case
    2022-01-28T03:10:41.728899  <8>[   14.618373] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig        =
   | regressions
-----------------------+-------+-------------+----------+------------------=
---+------------
kontron-sl28-var3-ads2 | arm64 | lab-kontron | gcc-10   | defconfig+ima    =
   | 2          =


  Details:     https://kernelci.org/test/plan/id/61f361c487c708edb7abbd13

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61f361c487c708edb7abbd5b
        failing since 16 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-28T03:23:33.840080  /lava-84506/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61f=
361c487c708edb7abbd5c
        failing since 16 days (last pass: v5.16-rc8-185-gf94a706f394a, firs=
t fail: v5.16-1778-g6927daa7c4fb)

    2022-01-28T03:23:33.843423  <8>[   13.986727] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-28T03:23:34.892124  /lava-84506/1/../bin/lava-test-case
    2022-01-28T03:23:34.892532  <8>[   15.006153] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform               | arch  | lab         | compiler | defconfig        =
   | regressions
-----------------------+-------+-------------+----------+------------------=
---+------------
zynqmp-zcu102          | arm64 | lab-cip     | gcc-10   | defconfig+crypto =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/61f35f033e45a76067abbd46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f35f033e45a76067abb=
d47
        failing since 15 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =



platform               | arch  | lab         | compiler | defconfig        =
   | regressions
-----------------------+-------+-------------+----------+------------------=
---+------------
zynqmp-zcu102          | arm64 | lab-cip     | gcc-10   | defconfig+ima    =
   | 1          =


  Details:     https://kernelci.org/test/plan/id/61f361bf38d0b1aa84abbd35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc1-4=
38-g4db37f24284ff/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220121.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61f361bf38d0b1aa84abb=
d36
        failing since 15 days (last pass: v5.16-6651-gc14f8df2f281, first f=
ail: v5.16-7998-gbeebf0a29205) =

 =20
