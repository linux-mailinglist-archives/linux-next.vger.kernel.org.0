Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA337A9A42
	for <lists+linux-next@lfdr.de>; Thu, 21 Sep 2023 20:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjIUShq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Sep 2023 14:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjIUSh0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Sep 2023 14:37:26 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB8AD868C
        for <linux-next@vger.kernel.org>; Thu, 21 Sep 2023 11:29:24 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c5cd27b1acso10845075ad.2
        for <linux-next@vger.kernel.org>; Thu, 21 Sep 2023 11:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695320964; x=1695925764; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BUnnmm5jBcYZK1tb9Ao5ub3UsucCCs4C3iO22IgmOWk=;
        b=t3K6mAKKk8CdxrjOFnQXyP3Vlh8tPEvEpH1mORBoM/fX4jGkZPPSNgCZM4rDtZJtd3
         2l+Ubm3ogJWy3HZNh05+5kzXG/qY+u9Yi9A/VU5tId7TMclsF0IP5/yUDXTuSI/EJmNL
         ZlUe2Iw76l/vLBKnCjgJnk1luVA0V0P7oz+a1SLJ1FfeOqaJF0tRYBr4PnkRpHvTrvLn
         aSnPdcYHsi3VWbsihdXF0sxs+oEf8FB6Vy/Glv4Cja73I2WkZUKKWuUrwFzbbsu601Et
         kWrNahm2tk06jug9QH0PoQjmj2ZXcp5AekvApQX4oGQo3itLUMPU5/2LJsw5DfSjIpmJ
         kalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695320964; x=1695925764;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUnnmm5jBcYZK1tb9Ao5ub3UsucCCs4C3iO22IgmOWk=;
        b=d7vgDOHD1ImO8n4C0Z1oiPWqAx6VqSSouzgxPva4Zj6+DQ5uWVXvZF2ggK6+dJ64G5
         uJ797ubmzmWhSNSC4B943hIzdFOayoUcWyLJaNRtD9jVSNxm4bUHZYwV0PW9uMSjZLCW
         9fo21u/4ORvN4wPZEf2vqBNgbOEDMwtotf9sr7GiSRuyGXdPpf/kmUAPo5kVpTE1bl1W
         Uab2HMmGyaHoPEMZdezlFnxWbtKJd/HwVHIldrQee/wmzPHWu560sQxo169R7ZlmrUlK
         GbHoGsIF4t39dpbYDvi4zdRfkgMEZOIUjTAdhRxl+HyjSGJ7MYrSHT+1GgQgZLtc8vTX
         cqzA==
X-Gm-Message-State: AOJu0YyUfU+oLOGyu9fy0i8pcHMnNldJLkIMBgxwZfKLJHtkO6yKxSEa
        fYU4AVg7rYVVDo8SAzxSFCzPgaX7dnaD4tB6Y6kKcw==
X-Google-Smtp-Source: AGHT+IGLJhosp8NXJyvydo54PZV4fwQiJGXYEHTUR/KoT+vKLhlrBis8G8pu2m9NHQ00TZTY9izV4Q==
X-Received: by 2002:a05:6830:1517:b0:6bd:708:c1f2 with SMTP id k23-20020a056830151700b006bd0708c1f2mr5064385otp.14.1695285941370;
        Thu, 21 Sep 2023 01:45:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id k2-20020aa790c2000000b0068c90e1ec84sm806454pfk.167.2023.09.21.01.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 01:45:40 -0700 (PDT)
Message-ID: <650c02b4.a70a0220.328f3.2443@mx.google.com>
Date:   Thu, 21 Sep 2023 01:45:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230921
X-Kernelci-Report-Type: test
Subject: next/master baseline: 224 runs, 7 regressions (next-20230921)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 224 runs, 7 regressions (next-20230921)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
acer-R721T-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =

hp-11A-G6-EE-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =

hp-14-db0003na-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+vi=
deodec           | 1          =

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig   =
                 | 1          =

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip       | gcc-10   | defconfig+vi=
deodec           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230921/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230921
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      940fcc189c51032dd0282cbee4497542c982ac59 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
acer-R721T-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/650bc332524ccd71518a0a42

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650bc332524ccd71518a0a57
        failing since 22 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-21T04:14:31.862193  + <8>[    8.502763] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11585565_1.4.2.3.1>

    2023-09-21T04:14:31.862294  set +x

    2023-09-21T04:14:31.966905  / # #

    2023-09-21T04:14:32.067597  export SHELL=3D/bin/sh

    2023-09-21T04:14:32.067808  #

    2023-09-21T04:14:32.168335  / # export SHELL=3D/bin/sh. /lava-11585565/=
environment

    2023-09-21T04:14:32.168536  =


    2023-09-21T04:14:32.269154  / # . /lava-11585565/environment/lava-11585=
565/bin/lava-test-runner /lava-11585565/1

    2023-09-21T04:14:32.269459  =


    2023-09-21T04:14:32.274048  / # /lava-11585565/bin/lava-test-runner /la=
va-11585565/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
hp-11A-G6-EE-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/650bc3241da428be4e8a0a83

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650bc3241da428be4e8a0a98
        failing since 22 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-21T04:15:40.435810  + <8>[    8.388259] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11585526_1.4.2.3.1>

    2023-09-21T04:15:40.435897  set +x

    2023-09-21T04:15:40.540309  / # #

    2023-09-21T04:15:40.640899  export SHELL=3D/bin/sh

    2023-09-21T04:15:40.641100  #

    2023-09-21T04:15:40.741662  / # export SHELL=3D/bin/sh. /lava-11585526/=
environment

    2023-09-21T04:15:40.741851  =


    2023-09-21T04:15:40.842394  / # . /lava-11585526/environment/lava-11585=
526/bin/lava-test-runner /lava-11585526/1

    2023-09-21T04:15:40.842659  =


    2023-09-21T04:15:40.846812  / # /lava-11585526/bin/lava-test-runner /la=
va-11585526/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
hp-14-db0003na-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/650bc32e1da428be4e8a0abd

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650bc32e1da428be4e8a0ad2
        failing since 22 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-21T04:14:23.162744  + <8>[   10.765492] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11585522_1.4.2.3.1>

    2023-09-21T04:14:23.163394  set +x

    2023-09-21T04:14:23.270811  / # #

    2023-09-21T04:14:23.373150  export SHELL=3D/bin/sh

    2023-09-21T04:14:23.373919  #

    2023-09-21T04:14:23.475385  / # export SHELL=3D/bin/sh. /lava-11585522/=
environment

    2023-09-21T04:14:23.476201  =


    2023-09-21T04:14:23.577797  / # . /lava-11585522/environment/lava-11585=
522/bin/lava-test-runner /lava-11585522/1

    2023-09-21T04:14:23.578994  =


    2023-09-21T04:14:23.584149  / # /lava-11585522/bin/lava-test-runner /la=
va-11585522/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+vi=
deodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/650bbd39d7ec83627e8a0a8c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230921/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230921/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650bbd39d7ec83627e8a0a95
        failing since 36 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-21T03:48:57.306837  + set<8>[   27.941999] <LAVA_SIGNAL_ENDRUN =
0_dmesg 121698_1.5.2.4.1>
    2023-09-21T03:48:57.307221   +x
    2023-09-21T03:48:57.417000  =

    2023-09-21T03:48:58.581760  / # #export SHELL=3D/bin/sh
    2023-09-21T03:48:58.587870  =

    2023-09-21T03:49:00.086740  / # export SHELL=3D/bin/sh. /lava-121698/en=
vironment
    2023-09-21T03:49:00.092851  =

    2023-09-21T03:49:02.816463  / # . /lava-121698/environment/lava-121698/=
bin/lava-test-runner /lava-121698/1
    2023-09-21T03:49:02.823237  =

    2023-09-21T03:49:02.826536  / # /lava-121698/bin/lava-test-runner /lava=
-121698/1 =

    ... (11 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/650bbf558c30e942168a0a61

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230921/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230921/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650bbf558c30e942168a0a6a
        failing since 36 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-21T03:57:43.948438  + set<8>[   28.890896] <LAVA_SIGNAL_ENDRUN =
0_dmesg 121715_1.5.2.4.1>
    2023-09-21T03:57:43.949139   +x
    2023-09-21T03:57:44.057500  / # #
    2023-09-21T03:57:45.223409  export SHELL=3D/bin/sh
    2023-09-21T03:57:45.229475  #
    2023-09-21T03:57:46.728664  / # export SHELL=3D/bin/sh. /lava-121715/en=
vironment
    2023-09-21T03:57:46.734827  =

    2023-09-21T03:57:49.454442  / # . /lava-121715/environment/lava-121715/=
bin/lava-test-runner /lava-121715/1
    2023-09-21T03:57:49.461514  =

    2023-09-21T03:57:49.467628  / # /lava-121715/bin/lava-test-runner /lava=
-121715/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/650bc8672696eb51c28a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650bc8672696eb51c28a0a4b
        failing since 36 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-21T04:36:38.810751  + set<8>[   28.643437] <LAVA_SIGNAL_ENDRUN =
0_dmesg 121783_1.5.2.4.1>
    2023-09-21T04:36:38.811320   +x
    2023-09-21T04:36:38.919911  / ##
    2023-09-21T04:36:40.085545  export SHELL=3D/bin/sh
    2023-09-21T04:36:40.091669   #
    2023-09-21T04:36:41.587609  / # export SHELL=3D/bin/sh. /lava-121783/en=
vironment
    2023-09-21T04:36:41.593038  =

    2023-09-21T04:36:44.312260  / # . /lava-121783/environment/lava-121783/=
bin/lava-test-runner /lava-121783/1
    2023-09-21T04:36:44.319206  =

    2023-09-21T04:36:44.333323  / # /lava-121783/bin/lava-test-runner /lava=
-121783/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip       | gcc-10   | defconfig+vi=
deodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/650bbd74207ec320388a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230921/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230921/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/650bbd74207ec320388a0a49
        failing since 43 days (last pass: next-20230710, first fail: next-2=
0230808)

    2023-09-21T03:49:43.142586  + set +x
    2023-09-21T03:49:43.145797  <8>[   28.433629] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1011145_1.5.2.4.1>
    2023-09-21T03:49:43.254211  / # #
    2023-09-21T03:49:44.718769  export SHELL=3D/bin/sh
    2023-09-21T03:49:44.739723  #
    2023-09-21T03:49:44.740181  / # export SHELL=3D/bin/sh
    2023-09-21T03:49:46.698146  / # . /lava-1011145/environment
    2023-09-21T03:49:50.300445  /lava-1011145/bin/lava-test-runner /lava-10=
11145/1
    2023-09-21T03:49:50.321951  . /lava-1011145/environment
    2023-09-21T03:49:50.322362  / # /lava-1011145/bin/lava-test-runner /lav=
a-1011145/1 =

    ... (27 line(s) more)  =

 =20
