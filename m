Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB1753F94B
	for <lists+linux-next@lfdr.de>; Tue,  7 Jun 2022 11:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239161AbiFGJQq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jun 2022 05:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239162AbiFGJQn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2022 05:16:43 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0879FB0D0B
        for <linux-next@vger.kernel.org>; Tue,  7 Jun 2022 02:16:42 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id t2so14330079pld.4
        for <linux-next@vger.kernel.org>; Tue, 07 Jun 2022 02:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7O1LUaJ88q5cwtXN18Mh/4qEoc8BiFhL5fS68jPCAMs=;
        b=0yvgoLKwhcehvNlAS771bZ4OxxvBAlFbLB72aztMRPLq1mWuuPZ+9YJu7Yiz1kJu4+
         wOnlXlOL1445XWlQk75sXNHKiCEGXlHLN0S7Zinuy9fjEaTl+MWsR2wFstUo9t2SoIPa
         D1Sknjf5oSF644qc4rzdj7d5csHQYn1nZmK4KuMbjXRlR535ASy3kqByuF8gQxxw2/Dk
         hE0DerR1nszC/v/EN4qSU0dpviB5/u0l3KbsoqjQvD2PKTdqyIMDD8o84xAGUgDNlxOX
         Sr2GFfj6o9fO35yT5XLHRoGKw2e+S0jmcB2AbVXGP/s+2bS8jAIadSclJyQ7rMyj9ms3
         7Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7O1LUaJ88q5cwtXN18Mh/4qEoc8BiFhL5fS68jPCAMs=;
        b=ryGyN6zDL4epS3TvnqDtMQeUWQfHz6C6sGvpG+rSRuPtaCeF63ChT8bXehtFH558g7
         dBtVlH9H0mi0dcMHKevvFMqlfRK8+oxVnwElFYE/Zh4y2Pn33MAgpjFenlAm41ZYo2Ax
         CUjCpxHg3CzR9XPSk1/QJfjxUIZwFBSjHQz4VOx+Q7h8dgLtWNrWpsa2pPmXEYSF8m/B
         znNBR+kCQysK9T3mUhxyYgBqa24fu5rN0ZdUhh0XIIXtzTZsOrC2AWlcewXXYDyLBMqe
         UmC/IkW6hySmX7tTFVcCo++R3pAT8T4WQzUEp6cU7nBJ5EDrZm91KIJKTDREiLLhDw/y
         dp/w==
X-Gm-Message-State: AOAM5318UU5uBbS4s7H3fmF/a1uVOsKMCzkAh5P6UufXiNyxtEDEZbOq
        RfpQ9FPdh/UDxWIL7/mf3GMkDFE496AmFYKR
X-Google-Smtp-Source: ABdhPJwglS9GEdgL6rtFRNbe1DCa0aq0FzzEMH5N5+RRQOwPLizqr53ZdJ+8PA6SrzQ9N36+lX4Vog==
X-Received: by 2002:a17:903:2452:b0:166:4b6c:affb with SMTP id l18-20020a170903245200b001664b6caffbmr23562819pls.68.1654593401212;
        Tue, 07 Jun 2022 02:16:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 205-20020a6216d6000000b0050dc76281f0sm12230628pfw.202.2022.06.07.02.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:16:40 -0700 (PDT)
Message-ID: <629f1778.1c69fb81.b9a0d.bdfb@mx.google.com>
Date:   Tue, 07 Jun 2022 02:16:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc1-144-g9b6181f62e678
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 192 runs,
 21 regressions (v5.19-rc1-144-g9b6181f62e678)
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

next/pending-fixes baseline: 192 runs, 21 regressions (v5.19-rc1-144-g9b618=
1f62e678)

Regressions Summary
-------------------

platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
da850-lcdk                  | arm   | lab-baylibre  | gcc-10   | davinci_al=
l_defconfig        | 1          =

kontron-pitx-imx8m          | arm64 | lab-kontron   | gcc-10   | defconfig+=
crypto             | 1          =

rk3399-gru-kevin            | arm64 | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 13         =

sun50i-a64-bananapi-m64     | arm64 | lab-clabbe    | gcc-10   | defconfig+=
crypto             | 1          =

sun50i-a64-pine64-plus      | arm64 | lab-broonie   | gcc-10   | defconfig+=
crypto             | 1          =

sun50i-h5-nanopi-neo-plus2  | arm64 | lab-clabbe    | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h6-pine-h64          | arm64 | lab-collabora | gcc-10   | defconfig+=
crypto             | 1          =

sun8i-h2-plus-orangepi-zero | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =

sun8i-h3-bananapi-m2-plus   | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc1-144-g9b6181f62e678/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc1-144-g9b6181f62e678
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9b6181f62e678985a4dfe07164e4e240292fd251 =



Test Regressions
---------------- =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
da850-lcdk                  | arm   | lab-baylibre  | gcc-10   | davinci_al=
l_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/629edc4b2d4ff91958a39bfc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/629edc4b2d4ff91=
958a39c04
        failing since 134 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-06-07T05:03:53.637432  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-06-07T05:03:53.637895  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-06-07T05:03:53.640567  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-06-07T05:03:53.693339  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
kontron-pitx-imx8m          | arm64 | lab-kontron   | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/629ee33d86f18b4623a39bfc

  Results:     50 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/629=
ee33d86f18b4623a39c0f
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23)

    2022-06-07T05:33:37.252248  /lava-125299/1/../bin/lava-test-case
    2022-06-07T05:33:37.252659  <8>[   20.950927] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-06-07T05:33:37.252896  /lava-125299/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin            | arm64 | lab-collabora | gcc-10   | defconfig+=
arm64-chromebook   | 13         =


  Details:     https://kernelci.org/test/plan/id/629edf2549d816768ca39bce

  Results:     76 PASS, 16 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-typec-phy1-probed: https://kernelci.org/test/c=
ase/id/629edf2549d816768ca39bd7
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23)

    2022-06-07T05:16:08.639862  <8>[   65.317252] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy0-probed RESULT=3Dfail>
    2022-06-07T05:16:09.645204  /lava-6559684/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-typec-phy0-probed: https://kernelci.org/test/c=
ase/id/629edf2549d816768ca39bd8
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23)

    2022-06-07T05:16:07.612370  <8>[   64.289911] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy-driver-present RESULT=3Dpass>
    2022-06-07T05:16:08.626944  /lava-6559684/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/629edf2549d816768ca39bf0
        failing since 99 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-06-07T05:16:06.187547  <8>[   62.865745] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-06-07T05:16:07.192219  /lava-6559684/1/../bin/lava-test-case   =


  * baseline.bootrr.hdmi-audio-codec-probed: https://kernelci.org/test/case=
/id/629edf2549d816768ca39c0a
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23)

    2022-06-07T05:16:05.707863  /lava-6559684/1/../bin/lava-test-case
    2022-06-07T05:16:05.719451  <8>[   62.398506] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-audio-codec-probed RESULT=3Dfail>   =


  * baseline.bootrr.hdmi-audio-codec-driver-present: https://kernelci.org/t=
est/case/id/629edf2549d816768ca39c0b
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23)

    2022-06-07T05:16:04.679779  /lava-6559684/1/../bin/lava-test-case
    2022-06-07T05:16:04.692245  <8>[   61.370084] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-audio-codec-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sysfs-attr-kb_wake_angle: https://kernelci.org/=
test/case/id/629edf2549d816768ca39c0d
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23)

    2022-06-07T05:16:02.631907  <8>[   59.309474] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-flashinfo RESULT=3Dpass>
    2022-06-07T05:16:03.634449  /lava-6559684/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/629edf2549d816768ca39c13
        failing since 7 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed)

    2022-06-07T05:16:02.538962  /lava-6559684/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/629edf2549d816768ca39c14
        failing since 7 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed)

    2022-06-07T05:16:00.516391  <8>[   57.193655] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-06-07T05:16:01.520886  /lava-6559684/1/../bin/lava-test-case
    2022-06-07T05:16:01.536224  <8>[   58.211177] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/629edf2549d816768ca39c15
        failing since 7 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed)

    2022-06-07T05:15:59.488409  <8>[   56.164020] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dfail>
    2022-06-07T05:16:00.503564  /lava-6559684/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/629edf2549d816768ca39c16
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23)

    2022-06-07T05:15:59.473704  /lava-6559684/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
29edf2549d816768ca39c17
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23)

    2022-06-07T05:15:58.455973  /lava-6559684/1/../bin/lava-test-case
    2022-06-07T05:15:58.466965  <8>[   55.146267] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
629edf2549d816768ca39c1c
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23)

    2022-06-07T05:15:56.373098  <8>[   53.047958] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-driver-present RESULT=3Dpass>
    2022-06-07T05:15:57.373314  /lava-6559684/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-debugfs-attr-console_log: https://kernelci.org/=
test/case/id/629edf2549d816768ca39c23
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23)

    2022-06-07T05:15:55.251794  <8>[   51.930205] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-probed RESULT=3Dpass>
    2022-06-07T05:15:56.255933  /lava-6559684/1/../bin/lava-test-case   =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun50i-a64-bananapi-m64     | arm64 | lab-clabbe    | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/629ee4c227f697fc42a39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629ee4c227f697fc42a39=
bdc
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun50i-a64-pine64-plus      | arm64 | lab-broonie   | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/629ee5aa9d2c171666a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629ee5aa9d2c171666a39=
bdb
        failing since 12 days (last pass: v5.18-1222-g391cf5a1244f, first f=
ail: v5.18-5613-ge079cf8f6817) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun50i-h5-nanopi-neo-plus2  | arm64 | lab-clabbe    | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629ee2d3ba3cac9654a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clab=
be/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clab=
be/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629ee2d3ba3cac9654a39=
bce
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-pine-h64          | arm64 | lab-collabora | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/629ee438acdb3b8932a39c04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629ee438acdb3b8932a39=
c05
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun8i-h2-plus-orangepi-zero | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629ee34a86f18b4623a39c3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629ee34a86f18b4623a39=
c3f
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23) =

 =



platform                    | arch  | lab           | compiler | defconfig =
                   | regressions
----------------------------+-------+---------------+----------+-----------=
-------------------+------------
sun8i-h3-bananapi-m2-plus   | arm   | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629ee1e6735a86a26ca39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc1-1=
44-g9b6181f62e678/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baselin=
e-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220603.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629ee1e6735a86a26ca39=
bd9
        new failure (last pass: v5.19-rc1-102-g5a749a6e62f23) =

 =20
