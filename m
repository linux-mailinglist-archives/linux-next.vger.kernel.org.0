Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF677CA605
	for <lists+linux-next@lfdr.de>; Mon, 16 Oct 2023 12:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjJPKtY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Oct 2023 06:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjJPKtX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Oct 2023 06:49:23 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABE383
        for <linux-next@vger.kernel.org>; Mon, 16 Oct 2023 03:49:21 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5ac88d2cfaaso1989241a12.2
        for <linux-next@vger.kernel.org>; Mon, 16 Oct 2023 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697453360; x=1698058160; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Dw8/4pNpFEN3JOa+Zvxb6K92g2zocVRMhI2YNZEYAk=;
        b=WSca/3sUOI6NGMo1GcTWigjtNhtsholBExRVU8qeQck0mVPKCsVlnytbD/ikMNSI9Q
         AZ34WCNnyN2HLncSrd32lIamt3lSZW2Jw/px9YpbswrgpwHvCp6xKG82eFR6rbAuF7GJ
         3Qm3LMzViKMHWEm5IbsfYT4+iiQlqszR3vAvKPoJVpt+N3LS61eZAOY/Ru28RD1De30y
         v0QhKJWSy+kh2+tCgG1S1sEAF5CpnsTGVDc/UD2DOW+lHfHs/diFsNC7Z+TN7ck4Jct/
         Cl5FGGl8srJZN1bd9Ki+wQF+hjRuB9J2nDOxfPV05vX2s6CcEFtuPSiq6bpCE/dZ8TAW
         /z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697453360; x=1698058160;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Dw8/4pNpFEN3JOa+Zvxb6K92g2zocVRMhI2YNZEYAk=;
        b=EpDYHsDIgyhOFxW3qfbY6iQKy9DGS5gHWk6904EJgZCg454e1N8EQS+MAca91q3bGW
         e5h6jQ0jIfdvJF8aX/rNNBcFU5yQPFGfNHleN5HNPBmP80vKotX9YGdQ8LyegSq8w6Iv
         cqhy42T267SWY3Q+nU3kYOVXWB7RWguZQcEr1c/Ff4CLYCeQUVN9MVgvGZ3nuQ5S9DSY
         6d1yN86qvTbbpy66MznzKLEumyE+0QTSq9TGQqr4ey80xEtvOGRNiszXsTJmqFfwpgHE
         peOcG835oyz5iV49pLHUTUmnxJg2h9GKnrTRAYazLcZN3hOJOiQAkpDXV4bSSullDaz1
         8Z3w==
X-Gm-Message-State: AOJu0YyOlI2wM4UrjgfdkMgSJA6D5q4tx3sbUJL65M77DEyjoI8MQqXO
        o4vkZ8XYs7I3AR1I0JKQcUFEEQYP3rdIP5sCQww8YA==
X-Google-Smtp-Source: AGHT+IG4MUMF/h9/1oNmEtipAU+rAu8J850ffzgEYUpVaubyQd8zIUwWrKr9qAPjiCLeYJV3nyoP0w==
X-Received: by 2002:a05:6a20:7f95:b0:140:3aa:e2ce with SMTP id d21-20020a056a207f9500b0014003aae2cemr44385511pzj.42.1697453360020;
        Mon, 16 Oct 2023 03:49:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a29-20020a63705d000000b0058958ea2aaesm7710984pgn.83.2023.10.16.03.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 03:49:19 -0700 (PDT)
Message-ID: <652d152f.630a0220.196a2.6a0d@mx.google.com>
Date:   Mon, 16 Oct 2023 03:49:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231016
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 257 runs, 7 regressions (next-20231016)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 257 runs, 7 regressions (next-20231016)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mn-ddr4-evk            | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_mips-malta            | mips  | lab-collabora | gcc-10   | malta_defco=
nfig              | 1          =

sun50i-h6-pine-h64         | arm64 | lab-clabbe    | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64         | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231016/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231016
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4d0515b235dec789578d135a5db586b25c5870cb =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mn-ddr4-evk            | arm64 | lab-baylibre  | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/652cd9ce29df2b493defcf03

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652cd9ce29df2b493defcf0c
        failing since 13 days (last pass: next-20230717, first fail: next-2=
0231003)

    2023-10-16T06:35:27.680707  + set<8>[  182.162514] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3807227_1.5.2.4.1>
    2023-10-16T06:35:27.680907   +x
    2023-10-16T06:35:27.786177  / # #
    2023-10-16T06:35:28.940184  export SHELL=3D/bin/sh
    2023-10-16T06:35:28.945668  #
    2023-10-16T06:35:30.485295  / # export SHELL=3D/bin/sh. /lava-3807227/e=
nvironment
    2023-10-16T06:35:30.490721  =

    2023-10-16T06:35:33.298309  / # . /lava-3807227/environment/lava-380722=
7/bin/lava-test-runner /lava-3807227/1
    2023-10-16T06:35:33.304018  =

    2023-10-16T06:35:33.304237  / # /lava-3807227/bin/lava<3>[  186.252677]=
 caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance =

    ... (13 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/652cdb0aaa3d63f623efcef6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652cdb0aaa3d63f623efceff
        failing since 61 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-16T06:40:46.937451  + set<8>[  188.842275] <LAVA_SIGNAL_ENDRUN =
0_dmesg 173438_1.5.2.4.1>
    2023-10-16T06:40:46.937656   +x
    2023-10-16T06:40:47.044209  / # #
    2023-10-16T06:40:48.203771  export SHELL=3D/bin/sh
    2023-10-16T06:40:48.209361  #
    2023-10-16T06:40:49.700799  / # export SHELL=3D/bin/sh. /lava-173438/en=
vironment
    2023-10-16T06:40:49.706496  =

    2023-10-16T06:40:52.416807  / # . /lava-173438/environment/lava-173438/=
bin/lava-test-runner /lava-173438/1
    2023-10-16T06:40:52.422671  =

    2023-10-16T06:40:52.426560  / # /lava-173438/bin/lava-test-runner /lava=
-173438/1 =

    ... (13 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/652cd8a46077a768c6efcf0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652cd8a46077a768c6efc=
f0d
        new failure (last pass: next-20230929) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/652cd89e6077a768c6efcf03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652cd89e6077a768c6efc=
f04
        new failure (last pass: next-20230929) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_mips-malta            | mips  | lab-collabora | gcc-10   | malta_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/652cd3d9e05891e655efcef3

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231016/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231016/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/652cd3d9e05891e=
655efcef7
        new failure (last pass: next-20231013)
        1 lines

    2023-10-16T06:10:13.438343  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address d3557f8c, epc =3D=3D 8020461c, ra =3D=
=3D 80206e6c
    2023-10-16T06:10:13.438604  =


    2023-10-16T06:10:13.479416  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-10-16T06:10:13.479603  =

   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64         | arm64 | lab-clabbe    | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/652cd8fccd81e6c956efcf66

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652cd8fccd81e6c956efcf6f
        failing since 5 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20231010)

    2023-10-16T06:32:20.280430  / # #
    2023-10-16T06:32:20.382689  export SHELL=3D/bin/sh
    2023-10-16T06:32:20.383260  #
    2023-10-16T06:32:20.484274  / # export SHELL=3D/bin/sh. /lava-438814/en=
vironment
    2023-10-16T06:32:20.484905  =

    2023-10-16T06:32:20.585953  / # . /lava-438814/environment/lava-438814/=
bin/lava-test-runner /lava-438814/1
    2023-10-16T06:32:20.587021  =

    2023-10-16T06:32:20.604259  / # /lava-438814/bin/lava-test-runner /lava=
-438814/1
    2023-10-16T06:32:20.668306  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-16T06:32:20.668997  + cd /lava-438814/<8>[   19.204863] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 438814_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64         | arm64 | lab-collabora | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/652cd8ffcd81e6c956efcf71

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231016/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652cd8ffcd81e6c956efcf7a
        failing since 5 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20231010)

    2023-10-16T06:36:46.855971  / # #

    2023-10-16T06:36:46.958027  export SHELL=3D/bin/sh

    2023-10-16T06:36:46.958690  #

    2023-10-16T06:36:47.060000  / # export SHELL=3D/bin/sh. /lava-11787198/=
environment

    2023-10-16T06:36:47.060707  =


    2023-10-16T06:36:47.162143  / # . /lava-11787198/environment/lava-11787=
198/bin/lava-test-runner /lava-11787198/1

    2023-10-16T06:36:47.163213  =


    2023-10-16T06:36:47.165531  / # /lava-11787198/bin/lava-test-runner /la=
va-11787198/1

    2023-10-16T06:36:47.245503  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-16T06:36:47.246003  + cd /lava-1178719<8>[   17.149139] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11787198_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
