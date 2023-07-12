Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21FA674FF78
	for <lists+linux-next@lfdr.de>; Wed, 12 Jul 2023 08:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjGLGjj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Jul 2023 02:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjGLGjR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Jul 2023 02:39:17 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D2D1FFE
        for <linux-next@vger.kernel.org>; Tue, 11 Jul 2023 23:37:47 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b9e93a538dso12822685ad.3
        for <linux-next@vger.kernel.org>; Tue, 11 Jul 2023 23:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689143866; x=1691735866;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h210L2CW0liNeZnP78G/v562IBueTJ6cTxn0BUwAX/w=;
        b=V6W9juipKYDbHWiC6ceav7IAt9b19WsSLYvkcPwfxGHdxtRd3A1BiKpQDfZexi0S79
         PDlq/N91HXmRXCjm8qE+2IdmgJajd+yGeFhX7ygRyVHXHrzsdUHjvDzCSK5qUNSr8DOx
         Uzl/BAT2oTYrUpXp/iDZaYPhGpe28mj4jhIR92oLG/OXmP3bCRX1+FR7VtzvSyk+tTHT
         TA05fv/lUUCgJFsEfvPOw86tY99KXyR3yN1wzBl3pN9nPy00vpyIH1AZHEtimMTuH/hT
         zJY/cYElUfVIk4NB0VVd2uC/UBWphDQ67W/lY6ovAIhzTk+EOD2yGC8LZe1S6ePBhyqi
         /pCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689143866; x=1691735866;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h210L2CW0liNeZnP78G/v562IBueTJ6cTxn0BUwAX/w=;
        b=XYM6p60XiPVP9J4PMc9C4xqA05ommMakICWFiWCE+FTmUDENFLoi4C/cT0xtqy0T83
         9mNnLNQzjItklHc35RVcT1LtngULh8J2106QtgD97AHpr8k6/112UMS25DAMmD/rM6DY
         fgJSJDM4CVPiRk54/C2AsI18QzVOE4W5ZSElmXNcSdJZPbqkDZtHHn7XPUFi60w1El3X
         5PBwvEPY9NZNFMM+/U2f/qF91hx6vuW1mT7/DTc4OhM2fwQw0o9A2xib6BmFmfq3zlLC
         7X/EXzn9vjDtny6v2/4564rZyO/xs0+Iojm3jJeJRysnTGRZ+8nc2CIg2sgvDGKKuPf6
         0Aew==
X-Gm-Message-State: ABy/qLaXRoPVWiV6/swuFEQeEc9e09B8CJZHzLJmYAdSt2LpRjWWGSuG
        JzoQr2WNxlnBetjA29REBgoKsnDzqajMltjr6Lo0ng==
X-Google-Smtp-Source: APBJJlEncHwtLEhakyjAJDfTwNsnrioBb6guBCrCxKh6I5omU/KQXTG+bbCmEQH/V6k47KxWIm3KCQ==
X-Received: by 2002:a17:903:190:b0:1b8:a389:4410 with SMTP id z16-20020a170903019000b001b8a3894410mr15978662plg.0.1689143866309;
        Tue, 11 Jul 2023 23:37:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b001ac444fd07fsm3076797pls.100.2023.07.11.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 23:37:45 -0700 (PDT)
Message-ID: <64ae4a39.170a0220.51e6c.6df9@mx.google.com>
Date:   Tue, 11 Jul 2023 23:37:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.5-rc1-266-g5d4deffc2b3b
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 82 runs,
 8 regressions (v6.5-rc1-266-g5d4deffc2b3b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 82 runs, 8 regressions (v6.5-rc1-266-g5d4deffc=
2b3b)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
rk3328-rock64                | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =

sun50i-a64-pine64-plus       | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-10   | defconfig =
| 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre | gcc-10   | defconfig =
| 5          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.5-rc1-266-g5d4deffc2b3b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.5-rc1-266-g5d4deffc2b3b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5d4deffc2b3b1422611cafe884db6364d1e5d4cb =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
rk3328-rock64                | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64ae19e727a0216319bb2aac

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-26=
6-g5d4deffc2b3b/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-26=
6-g5d4deffc2b3b/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64ae19e727a0216319bb2ab1
        failing since 161 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-07-12T03:11:14.475431  [   29.197323] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3719771_1.5.2.4.1>
    2023-07-12T03:11:14.580099  =

    2023-07-12T03:11:14.682043  / # #export SHELL=3D/bin/sh
    2023-07-12T03:11:14.682461  =

    2023-07-12T03:11:14.783949  / # export SHELL=3D/bin/sh. /lava-3719771/e=
nvironment
    2023-07-12T03:11:14.784403  =

    2023-07-12T03:11:14.885733  / # . /lava-3719771/environment/lava-371977=
1/bin/lava-test-runner /lava-3719771/1
    2023-07-12T03:11:14.886417  =

    2023-07-12T03:11:14.889835  / # /lava-3719771/bin/lava-test-runner /lav=
a-3719771/1
    2023-07-12T03:11:14.926746  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
sun50i-a64-pine64-plus       | arm64 | lab-baylibre | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64ae1f3510b9934809bb2a7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-26=
6-g5d4deffc2b3b/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-26=
6-g5d4deffc2b3b/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pin=
e64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ae1f3510b9934809bb2=
a7b
        failing since 9 days (last pass: v6.4-4072-ge8f5f1933319, first fai=
l: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie  | gcc-10   | defconfig =
| 1          =


  Details:     https://kernelci.org/test/plan/id/64ae1cbc999de5862ebb2a7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-26=
6-g5d4deffc2b3b/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-26=
6-g5d4deffc2b3b/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64ae1cbc999de5862ebb2=
a7b
        failing since 9 days (last pass: v6.4-4072-ge8f5f1933319, first fai=
l: v6.4-10301-g9e106c7d604e) =

 =



platform                     | arch  | lab          | compiler | defconfig =
| regressions
-----------------------------+-------+--------------+----------+-----------=
+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre | gcc-10   | defconfig =
| 5          =


  Details:     https://kernelci.org/test/plan/id/64ae1a9d42895d275bbb2a8d

  Results:     34 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-26=
6-g5d4deffc2b3b/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libr=
etech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.5-rc1-26=
6-g5d4deffc2b3b/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libr=
etech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sun8i-hdmi-phy-driver-present: https://kernelci.org/tes=
t/case/id/64ae1a9d42895d275bbb2a92
        new failure (last pass: v6.4-rc5-294-gda90eaebfb79)

    2023-07-12T03:14:28.532746  /lava-3719751/1/../bin/lava-test-case
    2023-07-12T03:14:28.536011  <8>[   53.868490] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-probed RESULT=3Dblocked>
    2023-07-12T03:14:29.558767  /lava-3719751/1/../bin/lava-test-case
    2023-07-12T03:14:29.582705  <8>[   54.912105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-hdmi-phy-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8i-dw-hdmi-driver-present: https://kernelci.org/test=
/case/id/64ae1a9d42895d275bbb2a93
        new failure (last pass: v6.4-rc5-294-gda90eaebfb79)

    2023-07-12T03:14:26.428338  /lava-3719751/1/../bin/lava-test-case
    2023-07-12T03:14:26.452353  <8>[   51.781080] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-mixer-probed RESULT=3Dblocked>
    2023-07-12T03:14:27.475138  /lava-3719751/1/../bin/lava-test-case
    2023-07-12T03:14:27.497026  <8>[   52.824159] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-dw-hdmi-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8i-mixer-driver-present: https://kernelci.org/test/c=
ase/id/64ae1a9d42895d275bbb2a94
        new failure (last pass: v6.4-rc5-294-gda90eaebfb79)

    2023-07-12T03:14:25.383498  /lava-3719751/1/../bin/lava-test-case
    2023-07-12T03:14:25.405403  <8>[   50.732113] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-mixer-driver-present RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64ae1a9d42895d2=
75bbb2ab5
        new failure (last pass: v6.4-rc5-294-gda90eaebfb79)
        2 lines

    2023-07-12T03:14:22.544354  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2023-07-12T03:14:22.544680  kern  :alert : Data abort info:
    2023-07-12T03:14:22.584749  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2023-07-12T03:14:22.585238  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2023-07-12T03:14:22.585557  kern  :alert :   GCS =3D 0, Overlay =3D 0, =
DirtyBit =3D 0, Xs =3D 0
    2023-07-12T03:14:22.586665  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D0000000041a56000
    2023-07-12T03:14:22.588005  kern  :alert : [fffffff000004348] pgd=3D000=
0000000000000, p4<8>[   47.919572] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Deme=
rg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-07-12T03:14:22.588500  d=3D0000000000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64ae1a9d42895d2=
75bbb2ab6
        new failure (last pass: v6.4-rc5-294-gda90eaebfb79)
        13 lines

    2023-07-12T03:14:22.540498  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address fffffff000004348
    2023-07-12T03:14:22.541040  kern  :alert : Mem abort info:
    2023-07-12T03:14:22.541356  kern  :alert :   ESR =3D 0x0000000096000004
    2023-07-12T03:14:22.541717  kern  :alert :   EC =3D 0x25<8>[   47.86282=
5] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D13>
    2023-07-12T03:14:22.542027  : DABT (current EL), IL =3D 32 bits
    2023-07-12T03:14:22.542322  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-07-12T03:14:22.542606  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =20
