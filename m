Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F78F7AD654
	for <lists+linux-next@lfdr.de>; Mon, 25 Sep 2023 12:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjIYKq5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Sep 2023 06:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjIYKq5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Sep 2023 06:46:57 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24286A3
        for <linux-next@vger.kernel.org>; Mon, 25 Sep 2023 03:46:49 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso4651323a12.3
        for <linux-next@vger.kernel.org>; Mon, 25 Sep 2023 03:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695638808; x=1696243608; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pJ4MapUrozr+C9FTGwbeljeGw53o8hy8P/GllLGqVBA=;
        b=mKKpPUg1zIgZWejXZ3OG/cogQaVphDna/A+cxS+B+EoxPCabgDoyDXN5pvaN1ghfe1
         yf8YqrZpsuGTk9h83Y2QjHgpXeD6mzK9CdHefnVJZn0ixwLok4IGD2Pxit4x3cwx04ju
         lRuZfZhi0yeeSGmf++/scOoXwBLiPxTSxA3kLtf7Cwe0BYQVF3tRbMpn9fGx9YtrNbu8
         5rv3dg3D7Wm3bhlaavDRmo2ngEEHxSDI9YdqjxzzcLs0frYAH9Vr+O4eBT5ZCPiI5ukC
         PSBcAxrqYAYfzIyvcTAZPk7exuJT9LTCwaBM+Z/FTPPOEkjrKF5gncHEB+sxjanKS1qL
         /pMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695638808; x=1696243608;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJ4MapUrozr+C9FTGwbeljeGw53o8hy8P/GllLGqVBA=;
        b=sP/S4Wg5zWlq0X00HBbK05eKMiDf55KzkBid1v1wEoXsHQTg1FbPTr+haCb5yeK2gX
         mVqvBVNRF+pZKV/qopIuL4omij8CzzyRu8Hj7WgGq/j4+3wEre17gG7qmTtXoqABPTdh
         2yc1iBsLIWGoA7wrzppNAuaRPksoxjKqmpNjGLlmD4Qby8owZGO0QiW9nt6QXCwrby1w
         1MrUlSeRmkehorpEbYfaBgVboGiNImk6J9yLRnT2kv6sMrgPHAiMV7n2QWAEWav9V8Hk
         pNPK5ICyHwOtO7KR1XUvEiR6c7secXTPpnG8bNddrI7MCIhD2YcgL+h1rqf0RFCctHBl
         waJA==
X-Gm-Message-State: AOJu0Yw4GYhHveIcrxhUXyKAmvpg5QXsYF3759K5tPTDnloCawzXmFri
        ZnV+xq9ouxRGleI1P07PAdam5qyVnJOYrrH4QN4rgg==
X-Google-Smtp-Source: AGHT+IGTbPMGzrcbAyQaP1eUl/fYVbMhin67oQf+50dQDkg9brDh3uSPOCNl1vzoPTpmhBuM26hyAQ==
X-Received: by 2002:a05:6a20:4325:b0:157:d7cd:ebd with SMTP id h37-20020a056a20432500b00157d7cd0ebdmr8446979pzk.1.1695638807979;
        Mon, 25 Sep 2023 03:46:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id kb14-20020a170903338e00b001bb3beb2bc6sm8516305plb.65.2023.09.25.03.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 03:46:47 -0700 (PDT)
Message-ID: <65116517.170a0220.4c721.4991@mx.google.com>
Date:   Mon, 25 Sep 2023 03:46:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230925
X-Kernelci-Report-Type: test
Subject: next/master baseline: 228 runs, 14 regressions (next-20230925)
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

next/master baseline: 228 runs, 14 regressions (next-20230925)

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

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+vi=
deodec           | 1          =

qemu_arm-virt-gicv2      | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv2      | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv3      | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv3      | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230925/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230925
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8fff9184d1b5810dca5dd1a02726d4f844af88fc =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
acer-R721T-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65112c51aad7b263968a0a6b

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65112c51aad7b263968a0a80
        failing since 26 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-25T06:44:17.787919  + <8>[   10.476437] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11611716_1.4.2.3.1>

    2023-09-25T06:44:17.788336  set +x

    2023-09-25T06:44:17.895536  / # #

    2023-09-25T06:44:17.998065  export SHELL=3D/bin/sh

    2023-09-25T06:44:17.998842  #

    2023-09-25T06:44:18.100356  / # export SHELL=3D/bin/sh. /lava-11611716/=
environment

    2023-09-25T06:44:18.101095  =


    2023-09-25T06:44:18.202540  / # . /lava-11611716/environment/lava-11611=
716/bin/lava-test-runner /lava-11611716/1

    2023-09-25T06:44:18.203618  =


    2023-09-25T06:44:18.208315  / # /lava-11611716/bin/lava-test-runner /la=
va-11611716/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
hp-11A-G6-EE-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65112c3e03182d5e128a0a47

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65112c3e03182d5e128a0a5c
        failing since 26 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-25T06:44:01.246945  <8>[   10.417923] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-09-25T06:44:01.253326  + <8>[   10.426867] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11611709_1.4.2.3.1>

    2023-09-25T06:44:01.254564  set +x

    2023-09-25T06:44:01.357640  / # #

    2023-09-25T06:44:01.458224  export SHELL=3D/bin/sh

    2023-09-25T06:44:01.458431  #

    2023-09-25T06:44:01.558956  / # export SHELL=3D/bin/sh. /lava-11611709/=
environment

    2023-09-25T06:44:01.559133  =


    2023-09-25T06:44:01.659647  / # . /lava-11611709/environment/lava-11611=
709/bin/lava-test-runner /lava-11611709/1

    2023-09-25T06:44:01.659903  =

 =

    ... (13 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
hp-14-db0003na-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65112c3d1ffbc86ad88a0a79

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65112c3d1ffbc86ad88a0a8e
        failing since 26 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-25T06:44:00.308335  + <8>[   11.248988] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11611741_1.4.2.3.1>

    2023-09-25T06:44:00.308803  set +x

    2023-09-25T06:44:00.417110  / # #

    2023-09-25T06:44:00.519608  export SHELL=3D/bin/sh

    2023-09-25T06:44:00.520359  #

    2023-09-25T06:44:00.621851  / # export SHELL=3D/bin/sh. /lava-11611741/=
environment

    2023-09-25T06:44:00.622618  =


    2023-09-25T06:44:00.724083  / # . /lava-11611741/environment/lava-11611=
741/bin/lava-test-runner /lava-11611741/1

    2023-09-25T06:44:00.725241  =


    2023-09-25T06:44:00.730053  / # /lava-11611741/bin/lava-test-runner /la=
va-11611741/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6511246419b95773d78a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6511246419b95773d78a0a4b
        failing since 40 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-25T06:10:30.307050  + set<8>[   27.332016] <LAVA_SIGNAL_ENDRUN =
0_dmesg 129955_1.5.2.4.1>
    2023-09-25T06:10:30.307441   +x
    2023-09-25T06:10:30.416679  =

    2023-09-25T06:10:31.581273  / # #export SHELL=3D/bin/sh
    2023-09-25T06:10:31.587640  =

    2023-09-25T06:10:33.086378  / # export SHELL=3D/bin/sh. /lava-129955/en=
vironment
    2023-09-25T06:10:33.092520  =

    2023-09-25T06:10:35.815733  / # . /lava-129955/environment/lava-129955/=
bin/lava-test-runner /lava-129955/1
    2023-09-25T06:10:35.822441  =

    2023-09-25T06:10:35.827047  / # /lava-129955/bin/lava-test-runner /lava=
-129955/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/651126a92fb4633f748a0a45

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651126a92fb4633f748a0a4e
        failing since 40 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-25T06:20:08.950549  + set<8>[   28.485927] <LAVA_SIGNAL_ENDRUN =
0_dmesg 130003_1.5.2.4.1>
    2023-09-25T06:20:08.951132   +x
    2023-09-25T06:20:09.059532  / # #
    2023-09-25T06:20:10.225415  export SHELL=3D/bin/sh
    2023-09-25T06:20:10.231531  #
    2023-09-25T06:20:11.730474  / # export SHELL=3D/bin/sh. /lava-130003/en=
vironment
    2023-09-25T06:20:11.736594  =

    2023-09-25T06:20:14.460328  / # . /lava-130003/environment/lava-130003/=
bin/lava-test-runner /lava-130003/1
    2023-09-25T06:20:14.466976  =

    2023-09-25T06:20:14.469409  / # /lava-130003/bin/lava-test-runner /lava=
-130003/1 =

    ... (13 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+vi=
deodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6511346b4af6f0650c8a0a6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6511346b4af6f0650c8a0a76
        failing since 40 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-25T07:18:42.602480  + set<8>[   28.683343] <LAVA_SIGNAL_ENDRUN =
0_dmesg 130072_1.5.2.4.1>
    2023-09-25T07:18:42.603072   +x
    2023-09-25T07:18:42.711481  / # #
    2023-09-25T07:18:43.877529  export SHELL=3D/bin/sh
    2023-09-25T07:18:43.883649  #
    2023-09-25T07:18:45.382190  / # export SHELL=3D/bin/sh. /lava-130072/en=
vironment
    2023-09-25T07:18:45.388326  =

    2023-09-25T07:18:48.110974  / # . /lava-130072/environment/lava-130072/=
bin/lava-test-runner /lava-130072/1
    2023-09-25T07:18:48.117731  =

    2023-09-25T07:18:48.121219  / # /lava-130072/bin/lava-test-runner /lava=
-130072/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv2      | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/651133392d2f1898478a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651133392d2f1898478a0=
a43
        failing since 376 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv2      | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6511331a2df83a1f2f8a0a46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6511331a2df83a1f2f8a0=
a47
        failing since 376 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6511332542c477b6228a0a4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6511332542c477b6228a0=
a4c
        failing since 374 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/651133192df83a1f2f8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651133192df83a1f2f8a0=
a43
        failing since 374 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3      | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6511333842c477b6228a0a50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6511333842c477b6228a0=
a51
        failing since 374 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3      | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6511332142c477b6228a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6511332142c477b6228a0=
a46
        failing since 374 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6511333a42c477b6228a0a57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6511333a42c477b6228a0=
a58
        failing since 376 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/651133222df83a1f2f8a0a4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230925/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651133222df83a1f2f8a0=
a4d
        failing since 376 days (last pass: next-20220907, first fail: next-=
20220913) =

 =20
