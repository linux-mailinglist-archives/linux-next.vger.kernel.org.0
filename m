Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682A178DC8E
	for <lists+linux-next@lfdr.de>; Wed, 30 Aug 2023 20:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243113AbjH3SqA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Aug 2023 14:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242483AbjH3Ipt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Aug 2023 04:45:49 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D4B1B7
        for <linux-next@vger.kernel.org>; Wed, 30 Aug 2023 01:45:45 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bf1935f6c2so4702205ad.1
        for <linux-next@vger.kernel.org>; Wed, 30 Aug 2023 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1693385144; x=1693989944; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MCjBxrRQfMDkh9faCNWlYi2VHm6DLKiwB/wqfGZabdQ=;
        b=YlgLatNDUF4j/XwZfpJz3CX4s1Ng8Jn3vAuPegN4CJO3uYqz9i2fqQ/YGG9+hUhZoA
         sKFD0zNU7gkhaXEQC7RuzXjXd7SJ0Sdaa3r+JqMwuIR7wpd0WaX4pmSotkDhImzhz+NQ
         UmQQdm47qXljANcIthu5I7PZF173Us7M2R2PleRFIRm9O84En8arGA1L/7O+OITEWIhT
         WPr6tK/Bxi0bsEmN/2te7qtHJKJlTWCexFu8k5xXh5o/PU+NX6EHOUT+Dvspre630KkY
         /SGiG/2HqR8OFUrCNd/9FI4q/xbK6OPCCaVKtMIZkBSiDjLF3aqETgdLoDP6glDPot7Q
         T8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693385144; x=1693989944;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCjBxrRQfMDkh9faCNWlYi2VHm6DLKiwB/wqfGZabdQ=;
        b=HigIf79C66xsB38zuGYZaLYs9+Ke1sEphS53gc5ibwnKy6IjDBV3eO73y57HMMJaXZ
         7nPuK5GthSmxf8A2rZDH/DdCh6E2WcM2vDogJMZIXCVYn2iIWkSpqqJ+fsiPWx/R8pWO
         soG+GSw4qfzJpFFdkWxGndgEMwH0glEquK13i5wombENSeanOVqexO+vJvA1eF9t3JYt
         wA3UvsVk0/o3k94eU5+V5u+h3GsIX15nIX+6WQ6RXtJ2QRc/esdVediHGEJ8BVqUsofx
         JB5gZQG98VROoJmZNhE0pPWAuzzjH3JcXrKY219KXHTXnDNqWVmcqBIrdbcAbdcZlVwv
         Ly7Q==
X-Gm-Message-State: AOJu0YzMGzLHz/QVg7m5V2y2+e7rGCZJqlSGabKsR8y9idSSisgtrJgT
        KB+4nJpMHedAhBN/t1/8LgUe+5x5rTkkQ+joOrE=
X-Google-Smtp-Source: AGHT+IGXT+Lpy2bmVfiSBMpAlm/SfvsA9cpCXp5dVxq6ejTIE1STmor9jHd/a3RzvdtfQBPYXILUUQ==
X-Received: by 2002:a17:902:ecc2:b0:1bf:8132:d19f with SMTP id a2-20020a170902ecc200b001bf8132d19fmr2898828plh.27.1693385143871;
        Wed, 30 Aug 2023 01:45:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id je10-20020a170903264a00b001bc2831e1a9sm10664486plb.90.2023.08.30.01.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 01:45:43 -0700 (PDT)
Message-ID: <64ef01b7.170a0220.aea3.28a6@mx.google.com>
Date:   Wed, 30 Aug 2023 01:45:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230830
Subject: next/master baseline: 211 runs, 18 regressions (next-20230830)
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

next/master baseline: 211 runs, 18 regressions (next-20230830)

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

imx8mp-evk               | arm64  | lab-broonie   | clang-17 | defconfig   =
                 | 1          =

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig   =
                 | 1          =

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

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

r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874           | arm64  | lab-cip       | clang-17 | defconfig   =
                 | 1          =

r8a779m1-ulcb            | arm64  | lab-collabora | clang-17 | defconfig   =
                 | 1          =

sun50i-h6-pine-h64       | arm64  | lab-collabora | clang-17 | defconfig   =
                 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230830/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230830
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      56585460cc2ec44fc5d66924f0a116f57080f0dc =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
acer-R721T-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64eecaa58f3c85a7ad286d91

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eecaa58f3c85a7ad286da6
        failing since 0 day (last pass: next-20230823, first fail: next-202=
30829)

    2023-08-30T04:50:24.303467  + <8>[   11.310436] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11380330_1.4.2.3.1>

    2023-08-30T04:50:24.304086  set +x

    2023-08-30T04:50:24.411966  / # #

    2023-08-30T04:50:24.514177  export SHELL=3D/bin/sh

    2023-08-30T04:50:24.514946  #

    2023-08-30T04:50:24.616535  / # export SHELL=3D/bin/sh. /lava-11380330/=
environment

    2023-08-30T04:50:24.617268  =


    2023-08-30T04:50:24.718696  / # . /lava-11380330/environment/lava-11380=
330/bin/lava-test-runner /lava-11380330/1

    2023-08-30T04:50:24.719776  =


    2023-08-30T04:50:24.724332  / # /lava-11380330/bin/lava-test-runner /la=
va-11380330/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
hp-11A-G6-EE-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64eeca9ad8b545ea88286d83

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eeca9ad8b545ea88286d98
        failing since 0 day (last pass: next-20230823, first fail: next-202=
30829)

    2023-08-30T04:50:29.102094  + <8>[   10.605802] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11380333_1.4.2.3.1>

    2023-08-30T04:50:29.102177  set +x

    2023-08-30T04:50:29.206201  / # #

    2023-08-30T04:50:29.306679  export SHELL=3D/bin/sh

    2023-08-30T04:50:29.306909  #

    2023-08-30T04:50:29.407541  / # export SHELL=3D/bin/sh. /lava-11380333/=
environment

    2023-08-30T04:50:29.407679  =


    2023-08-30T04:50:29.508175  / # . /lava-11380333/environment/lava-11380=
333/bin/lava-test-runner /lava-11380333/1

    2023-08-30T04:50:29.508413  =


    2023-08-30T04:50:29.512614  / # /lava-11380333/bin/lava-test-runner /la=
va-11380333/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
hp-14-db0003na-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64eecaa03de6930f49286ddf

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eecaa03de6930f49286df4
        failing since 0 day (last pass: next-20230823, first fail: next-202=
30829)

    2023-08-30T04:50:25.940186  + <8>[   10.650595] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11380320_1.4.2.3.1>

    2023-08-30T04:50:25.940632  set +x

    2023-08-30T04:50:26.048536  / # #

    2023-08-30T04:50:26.150527  export SHELL=3D/bin/sh

    2023-08-30T04:50:26.150714  #

    2023-08-30T04:50:26.251307  / # export SHELL=3D/bin/sh. /lava-11380320/=
environment

    2023-08-30T04:50:26.251990  =


    2023-08-30T04:50:26.353326  / # . /lava-11380320/environment/lava-11380=
320/bin/lava-test-runner /lava-11380320/1

    2023-08-30T04:50:26.354384  =


    2023-08-30T04:50:26.358943  / # /lava-11380320/bin/lava-test-runner /la=
va-11380320/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | clang-17 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec5dad967b1b273286dc7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230827092956+e91a=
d6b97fcb-1~exp1~20230827093113.32))
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eec5dad967b1b273286dcf
        failing since 14 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-08-30T04:29:54.632260  + set<8>[   27.073821] <LAVA_SIGNAL_ENDRUN =
0_dmesg 78513_1.5.2.4.1>
    2023-08-30T04:29:54.635398   +x
    2023-08-30T04:29:54.741213  / # #
    2023-08-30T04:29:55.907272  export SHELL=3D/bin/sh
    2023-08-30T04:29:55.913355  #
    2023-08-30T04:29:57.357043  / # export SHELL=3D/bin/sh. /lava-78513/env=
ironment
    2023-08-30T04:29:57.363175  =

    2023-08-30T04:29:59.975784  / # . /lava-78513/environment/lava-78513/bi=
n/lava-test-runner /lava-78513/1
    2023-08-30T04:29:59.982496  =

    2023-08-30T04:29:59.992376  / # /lava-78513/bin/lava-test-runner /lava-=
78513/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec512a64dc8e69e286d6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eec512a64dc8e69e286d76
        failing since 14 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-08-30T04:26:34.492749  + set<8>[   28.609663] <LAVA_SIGNAL_ENDRUN =
0_dmesg 78492_1.5.2.4.1>
    2023-08-30T04:26:34.493384   +x
    2023-08-30T04:26:34.602051  / # #
    2023-08-30T04:26:35.767975  export SHELL=3D/bin/sh
    2023-08-30T04:26:35.774118  #
    2023-08-30T04:26:37.217184  / # export SHELL=3D/bin/sh. /lava-78492/env=
ironment
    2023-08-30T04:26:37.223495  =

    2023-08-30T04:26:39.835379  / # . /lava-78492/environment/lava-78492/bi=
n/lava-test-runner /lava-78492/1
    2023-08-30T04:26:39.842188  =

    2023-08-30T04:26:39.851471  / # /lava-78492/bin/lava-test-runner /lava-=
78492/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64eecb7d84e757786f286e22

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eecb7d84e757786f286e2b
        failing since 14 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-08-30T04:54:00.020971  + set<8>[   27.041389] <LAVA_SIGNAL_ENDRUN =
0_dmesg 78566_1.5.2.4.1>
    2023-08-30T04:54:00.021553   +x
    2023-08-30T04:54:00.130064  / # #
    2023-08-30T04:54:01.296012  export SHELL=3D/bin/sh
    2023-08-30T04:54:01.302138  #
    2023-08-30T04:54:02.745204  / # export SHELL=3D/bin/sh. /lava-78566/env=
ironment
    2023-08-30T04:54:02.751263  =

    2023-08-30T04:54:05.361044  / # . /lava-78566/environment/lava-78566/bi=
n/lava-test-runner /lava-78566/1
    2023-08-30T04:54:05.366667  =

    2023-08-30T04:54:05.378758  / # /lava-78566/bin/lava-test-runner /lava-=
78566/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv2      | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec4ddc5cb9d5771286d87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eec4ddc5cb9d5771286=
d88
        failing since 350 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv2      | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec3d9dcd7c1c83e286d74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eec3d9dcd7c1c83e286=
d75
        failing since 350 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec4b5a4fca7185d286d8d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eec4b5a4fca7185d286=
d8e
        failing since 348 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec3e6dcd7c1c83e286d7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eec3e6dcd7c1c83e286=
d7f
        failing since 348 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3      | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec55344d45540d7286db3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eec55344d45540d7286=
db4
        failing since 348 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3      | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec3dadcd7c1c83e286d78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eec3dadcd7c1c83e286=
d79
        failing since 348 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-broonie   | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec3ebc8a35cdb39286d75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eec3ebc8a35cdb39286=
d76
        failing since 350 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-collabora | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec3e4c8a35cdb39286d6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64eec3e4c8a35cdb39286=
d70
        failing since 350 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64eecba6998e06875a286d6c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eecba6998e06875a286d6f
        failing since 28 days (last pass: next-20230712, first fail: next-2=
0230801)

    2023-08-30T04:54:33.239339  + set +x
    2023-08-30T04:54:33.240010  <8>[   28.273838] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1002711_1.5.2.4.1>
    2023-08-30T04:54:33.348605  / # #
    2023-08-30T04:54:34.820428  export SHELL=3D/bin/sh
    2023-08-30T04:54:34.841769  #
    2023-08-30T04:54:34.842357  / # export SHELL=3D/bin/sh
    2023-08-30T04:54:36.807892  / # . /lava-1002711/environment
    2023-08-30T04:54:40.423116  /lava-1002711/bin/lava-test-runner /lava-10=
02711/1
    2023-08-30T04:54:40.445019  . /lava-1002711/environment
    2023-08-30T04:54:40.445467  / # /lava-1002711/bin/lava-test-runner /lav=
a-1002711/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a774c0-ek874           | arm64  | lab-cip       | clang-17 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec5fc37b69aa6b4286da3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230827092956+e91a=
d6b97fcb-1~exp1~20230827093113.32))
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eec5fc37b69aa6b4286da6
        failing since 34 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-30T04:30:34.695677  / # #
    2023-08-30T04:30:36.158115  export SHELL=3D/bin/sh
    2023-08-30T04:30:36.178722  #
    2023-08-30T04:30:36.178947  / # export SHELL=3D/bin/sh
    2023-08-30T04:30:38.135143  / # . /lava-1002699/environment
    2023-08-30T04:30:41.735536  /lava-1002699/bin/lava-test-runner /lava-10=
02699/1
    2023-08-30T04:30:41.756466  . /lava-1002699/environment
    2023-08-30T04:30:41.756577  / # /lava-1002699/bin/lava-test-runner /lav=
a-1002699/1
    2023-08-30T04:30:41.799725  + export 'TESTRUN_ID=3D1_bootrr'
    2023-08-30T04:30:41.836452  + cd /lava-1002699/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a779m1-ulcb            | arm64  | lab-collabora | clang-17 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec5e6d967b1b273286deb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230827092956+e91a=
d6b97fcb-1~exp1~20230827093113.32))
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eec5e6d967b1b273286df4
        failing since 34 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-30T04:31:20.342044  / # #

    2023-08-30T04:31:21.420541  export SHELL=3D/bin/sh

    2023-08-30T04:31:21.422340  #

    2023-08-30T04:31:22.910478  / # export SHELL=3D/bin/sh. /lava-11380232/=
environment

    2023-08-30T04:31:22.912225  =


    2023-08-30T04:31:25.631729  / # . /lava-11380232/environment/lava-11380=
232/bin/lava-test-runner /lava-11380232/1

    2023-08-30T04:31:25.633905  =


    2023-08-30T04:31:25.634494  / # /lava-11380232/bin/lava-test-runner /la=
va-11380232/1

    2023-08-30T04:31:25.703148  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-30T04:31:25.703699  + cd /lava-113802<8>[   28.468970] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11380232_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
sun50i-h6-pine-h64       | arm64  | lab-collabora | clang-17 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/64eec5db2998b9d1aa286d8c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230827092956+e91a=
d6b97fcb-1~exp1~20230827093113.32))
  Plain log:   https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230830/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64eec5db2998b9d1aa286d95
        failing since 34 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-08-30T04:31:46.412623  / # #

    2023-08-30T04:31:46.514834  export SHELL=3D/bin/sh

    2023-08-30T04:31:46.515552  #

    2023-08-30T04:31:46.616974  / # export SHELL=3D/bin/sh. /lava-11380226/=
environment

    2023-08-30T04:31:46.617698  =


    2023-08-30T04:31:46.719147  / # . /lava-11380226/environment/lava-11380=
226/bin/lava-test-runner /lava-11380226/1

    2023-08-30T04:31:46.720390  =


    2023-08-30T04:31:46.722501  / # /lava-11380226/bin/lava-test-runner /la=
va-11380226/1

    2023-08-30T04:31:46.805051  + export 'TESTRUN_ID=3D1_bootrr'

    2023-08-30T04:31:46.805564  + cd /lava-11380226/1/te<8>[   18.551793] <=
LAVA_SIGNAL_STARTRUN 1_bootrr 11380226_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
