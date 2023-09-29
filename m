Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0FE67B2F88
	for <lists+linux-next@lfdr.de>; Fri, 29 Sep 2023 11:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbjI2JrY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Sep 2023 05:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232833AbjI2JrX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Sep 2023 05:47:23 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F04195
        for <linux-next@vger.kernel.org>; Fri, 29 Sep 2023 02:47:18 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c723f1c80fso38284515ad.1
        for <linux-next@vger.kernel.org>; Fri, 29 Sep 2023 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695980837; x=1696585637; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v88ax0HBXcCx70s2bOCABZn+CmTiTLkMqtvsXh+w2b0=;
        b=QXDQbhIqNBeN+W6OZNJyoWJUZ+tQwjz9ZaNN52H+LsvdPsTuzyXHAf8nqZBt/gJPog
         kyaAjZ99UMMVXzS0YcvG+NF8Jx40SaHagLb3gcAIyUOcawfn2319p3QzaGhhHmiXyul1
         kxaTlsEUvhI6eRi6eJn7UqYZ2yRE2Dvyjc4BoI3ar+rHxago1M3G/o3EdkvuOdqcdjK5
         wS+8nmA0WPLqIX7KnS9KgoQJHI11RudRjeSqASk0cvuO9LcOE7FTYSbUPIwP7T/Io5kS
         axn0Ngr6NEJ2UXJ7SSWRePhRi2YRroNe0EHieKKooxUmlYkikqtW6CJCYRQGGdHOuCMb
         UBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695980837; x=1696585637;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v88ax0HBXcCx70s2bOCABZn+CmTiTLkMqtvsXh+w2b0=;
        b=MawEtwZ+rhN+diP6mEs64KRPEDQu2MFlKRc5GEzW6m37oodu7AOrB9q0IxPoEnDFW/
         pOCSm/mPsUrsJLN0cGUhNATWapWGZ0421+ed7M6NM9TDozyQQOxnhXDSiBMWLolKD5Wh
         4/jzw/nQyYI3NlEwSkAo14dqG/CDzydn70kPSyyYhJPBxNIahKGGuaqMyJlO/OJU7JfJ
         I8412kjgBAPfFNCZiI8s0lkwBetOcLKGzRHjGujnl/UGwegP8YWUdPcFHPXuLCZelNqg
         YDY6wyOUZcz9fVGP0TNTEA3jSi9IZjgiXQQi3sR1/Kpof0m2+P8VA4O13ANa2vzhPmPL
         xP/Q==
X-Gm-Message-State: AOJu0YzvZlhK24fjS/aKEBLYxRlHIFh0J06W9970WauZogzcljis0D+S
        4pFBZJhUTTlqXo+dSl+nCCSd2abq3b93XAc5IcEMmw==
X-Google-Smtp-Source: AGHT+IGFcdiiU28mP3Dd/S4rXEh93VEuZMhgh7Kmx7kZCF3SiPMie5CzVASoKFEUIswFk7HHMlpiBw==
X-Received: by 2002:a17:903:1251:b0:1c5:59ea:84de with SMTP id u17-20020a170903125100b001c559ea84demr4261696plh.29.1695980836989;
        Fri, 29 Sep 2023 02:47:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c625d6ffccsm8590875pld.129.2023.09.29.02.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 02:47:16 -0700 (PDT)
Message-ID: <65169d24.170a0220.9663.d3cf@mx.google.com>
Date:   Fri, 29 Sep 2023 02:47:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230929
X-Kernelci-Report-Type: test
Subject: next/master baseline: 174 runs, 43 regressions (next-20230929)
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

next/master baseline: 174 runs, 43 regressions (next-20230929)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
acer-R721T-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

hp-11A-G6-EE-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

hp-14-db0003na-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_arm-virt-gicv2        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv3        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =

qemu_i386                  | i386   | lab-baylibre  | clang-17 | i386_defco=
nfig               | 1          =

qemu_i386                  | i386   | lab-broonie   | clang-17 | i386_defco=
nfig               | 1          =

qemu_i386                  | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig+debug         | 1          =

qemu_i386                  | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig               | 1          =

qemu_i386                  | i386   | lab-broonie   | gcc-10   | i386_defco=
nfig+debug         | 1          =

qemu_i386                  | i386   | lab-broonie   | gcc-10   | i386_defco=
nfig               | 1          =

qemu_i386-uefi             | i386   | lab-baylibre  | clang-17 | i386_defco=
nfig               | 1          =

qemu_i386-uefi             | i386   | lab-broonie   | clang-17 | i386_defco=
nfig               | 1          =

qemu_i386-uefi             | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig+debug         | 1          =

qemu_i386-uefi             | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig               | 1          =

qemu_i386-uefi             | i386   | lab-broonie   | gcc-10   | i386_defco=
nfig+debug         | 1          =

qemu_i386-uefi             | i386   | lab-broonie   | gcc-10   | i386_defco=
nfig               | 1          =

qemu_riscv64               | riscv  | lab-baylibre  | clang-17 | defconfig =
                   | 1          =

qemu_riscv64               | riscv  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =

qemu_smp8_riscv64          | riscv  | lab-baylibre  | clang-17 | defconfig =
                   | 1          =

qemu_smp8_riscv64          | riscv  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =

qemu_x86_64                | x86_64 | lab-baylibre  | clang-17 | x86_64_def=
config             | 1          =

qemu_x86_64                | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64                | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64                | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre  | clang-17 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | clang-17 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+debug       | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230929/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230929
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      df964ce9ef9fea10cf131bf6bad8658fde7956f6 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
acer-R721T-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6516634ddd5009b0648a0a69

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6516634ddd5009b0648a0a7e
        failing since 30 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-29T05:40:33.609568  + <8>[   11.126341] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11638419_1.4.2.3.1>

    2023-09-29T05:40:33.609688  set +x

    2023-09-29T05:40:33.714492  / # #

    2023-09-29T05:40:33.815164  export SHELL=3D/bin/sh

    2023-09-29T05:40:33.815377  #

    2023-09-29T05:40:33.915920  / # export SHELL=3D/bin/sh. /lava-11638419/=
environment

    2023-09-29T05:40:33.916134  =


    2023-09-29T05:40:34.016633  / # . /lava-11638419/environment/lava-11638=
419/bin/lava-test-runner /lava-11638419/1

    2023-09-29T05:40:34.016987  =


    2023-09-29T05:40:34.020910  / # /lava-11638419/bin/lava-test-runner /la=
va-11638419/1
 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-11A-G6-EE-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6516633b6dd3455a338a0a5c

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6516633b6dd3455a338a0a71
        failing since 30 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-29T05:39:57.022324  + <8>[    9.987926] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11638458_1.4.2.3.1>

    2023-09-29T05:39:57.025889  set +x

    2023-09-29T05:39:57.130720  / # #

    2023-09-29T05:39:57.232990  export SHELL=3D/bin/sh

    2023-09-29T05:39:57.233194  #

    2023-09-29T05:39:57.333717  / # export SHELL=3D/bin/sh. /lava-11638458/=
environment

    2023-09-29T05:39:57.333933  =


    2023-09-29T05:39:57.434532  / # . /lava-11638458/environment/lava-11638=
458/bin/lava-test-runner /lava-11638458/1

    2023-09-29T05:39:57.435234  =


    2023-09-29T05:39:57.436710  / # /lava-11638458/bin/lava-test-runner /la=
va-11638458/1
 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hp-14-db0003na-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/65166344dd5009b0648a0a42

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65166344dd5009b0648a0a57
        failing since 30 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-29T05:40:02.663339  + <8>[    7.921118] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11638451_1.4.2.3.1>

    2023-09-29T05:40:02.663424  set +x

    2023-09-29T05:40:02.767947  / # #

    2023-09-29T05:40:02.868610  export SHELL=3D/bin/sh

    2023-09-29T05:40:02.868787  #

    2023-09-29T05:40:02.969306  / # export SHELL=3D/bin/sh. /lava-11638451/=
environment

    2023-09-29T05:40:02.969557  =


    2023-09-29T05:40:03.070107  / # . /lava-11638451/environment/lava-11638=
451/bin/lava-test-runner /lava-11638451/1

    2023-09-29T05:40:03.070370  =


    2023-09-29T05:40:03.074664  / # /lava-11638451/bin/lava-test-runner /la=
va-11638451/1
 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65165e73c65e7b53898a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165e73c65e7b53898a0=
a45
        failing since 0 day (last pass: next-20230718, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/651668c59acb6ae2db8a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651668c59acb6ae2db8a0=
a46
        new failure (last pass: next-20230719) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65165d837e3210d8758a0a4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165d837e3210d8758a0=
a4b
        failing since 0 day (last pass: next-20230718, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65166915f0cc1a796c8a0a90

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65166915f0cc1a796c8a0=
a91
        new failure (last pass: next-20230719) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65165e2309da16982a8a0a54

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165e2309da16982a8a0=
a55
        failing since 0 day (last pass: next-20230718, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6516696547151148c88a0a5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6516696547151148c88a0=
a5e
        new failure (last pass: next-20230719) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65165dd359690b69958a0a4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165dd359690b69958a0=
a4f
        failing since 0 day (last pass: next-20230718, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65166875b73122f1b58a0b24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65166875b73122f1b58a0=
b25
        new failure (last pass: next-20230719) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6516599a514e6883a68a0a44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6516599a514e6883a68a0=
a45
        new failure (last pass: next-20230920) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65165a3f11e194ae7b8a0a4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165a3f11e194ae7b8a0=
a50
        new failure (last pass: next-20230920) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6516594a3d70675bf98a0abb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6516594a3d70675bf98a0=
abc
        new failure (last pass: next-20230920) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65165a53905983f4b98a0a89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165a53905983f4b98a0=
a8a
        new failure (last pass: next-20230920) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386                  | i386   | lab-baylibre  | clang-17 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65165fb37f2880191d8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165fb37f2880191d8a0=
a43
        new failure (last pass: next-20230928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386                  | i386   | lab-broonie   | clang-17 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65165f533899d2b0258a0a6a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165f533899d2b0258a0=
a6b
        new failure (last pass: next-20230928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386                  | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/6516643cf26b710e098a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6516643cf26b710e098a0=
a43
        failing since 0 day (last pass: next-20230720, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386                  | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65166825d031e7430c8a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65166825d031e7430c8a0=
a46
        failing since 0 day (last pass: next-20230720, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386                  | i386   | lab-broonie   | gcc-10   | i386_defco=
nfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/6516652551516b7f038a0a58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6516652551516b7f038a0=
a59
        failing since 0 day (last pass: next-20230720, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386                  | i386   | lab-broonie   | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/651669404a6af62c538a0a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651669404a6af62c538a0=
a44
        failing since 0 day (last pass: next-20230720, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386-uefi             | i386   | lab-baylibre  | clang-17 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/6516600312641e71e38a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6516600312641e71e38a0=
a43
        new failure (last pass: next-20230928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386-uefi             | i386   | lab-broonie   | clang-17 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/65165f705ede9e96488a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/clang-17/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165f705ede9e96488a0=
a43
        new failure (last pass: next-20230928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386-uefi             | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/6516648cd42f8c3b2e8a0a96

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6516648cd42f8c3b2e8a0=
a97
        failing since 0 day (last pass: next-20230720, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386-uefi             | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/651667d5402a1a36a48a0a61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651667d5402a1a36a48a0=
a62
        failing since 0 day (last pass: next-20230720, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386-uefi             | i386   | lab-broonie   | gcc-10   | i386_defco=
nfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/65166580d0a7e5aa5e8a0a58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65166580d0a7e5aa5e8a0=
a59
        failing since 0 day (last pass: next-20230720, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_i386-uefi             | i386   | lab-broonie   | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/651668a9445a9315978a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651668a9445a9315978a0=
a43
        failing since 0 day (last pass: next-20230720, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_riscv64               | riscv  | lab-baylibre  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65166284957936cfa88a0a4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/risc=
v/defconfig/clang-17/lab-baylibre/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/risc=
v/defconfig/clang-17/lab-baylibre/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65166284957936cfa88a0=
a4d
        failing since 0 day (last pass: next-20230718, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_riscv64               | riscv  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/6516661d2b7c3046878a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6516661d2b7c3046878a0=
a43
        failing since 0 day (last pass: next-20230724, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_smp8_riscv64          | riscv  | lab-baylibre  | clang-17 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/651662344f9770eda68a0a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/risc=
v/defconfig/clang-17/lab-baylibre/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/risc=
v/defconfig/clang-17/lab-baylibre/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651662344f9770eda68a0=
a54
        failing since 0 day (last pass: next-20230718, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_smp8_riscv64          | riscv  | lab-baylibre  | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/651665cc7158df86918a0a4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651665cc7158df86918a0=
a4c
        failing since 0 day (last pass: next-20230724, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre  | clang-17 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/65166a2dcf5336260f8a0a5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65166a2dcf5336260f8a0=
a5c
        failing since 0 day (last pass: next-20230721, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65165c437958c4e08c8a0a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165c437958c4e08c8a0=
a48
        failing since 0 day (last pass: next-20230721, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/65165d330586b218bb8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165d330586b218bb8a0=
a43
        failing since 0 day (last pass: next-20230724, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64                | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6516634cdd5009b0648a0a64

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6516634cdd5009b0648a0=
a65
        failing since 0 day (last pass: next-20230720, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre  | clang-17 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/65166acd38b3acc0fd8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65166acd38b3acc0fd8a0=
a43
        failing since 0 day (last pass: next-20230721, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65165bf30f9fca0a698a0a5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165bf30f9fca0a698a0=
a5c
        failing since 0 day (last pass: next-20230721, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/65165c9397c904b01e8a0a48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165c9397c904b01e8a0=
a49
        failing since 0 day (last pass: next-20230724, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6516639cfca3a1055d8a0a52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6516639cfca3a1055d8a0=
a53
        failing since 0 day (last pass: next-20230720, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | clang-17 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/65166a7d6dc68f660b8a0a45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65166a7d6dc68f660b8a0=
a46
        failing since 0 day (last pass: next-20230721, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/65165ba359a47eff0c8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165ba359a47eff0c8a0=
a43
        failing since 0 day (last pass: next-20230721, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/65165ce3b3feb335638a0a49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65165ce3b3feb335638a0=
a4a
        failing since 0 day (last pass: next-20230724, first fail: next-202=
30928) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651663ec35b23807f78a0a59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230929/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/651663ec35b23807f78a0=
a5a
        failing since 0 day (last pass: next-20230720, first fail: next-202=
30928) =

 =20
