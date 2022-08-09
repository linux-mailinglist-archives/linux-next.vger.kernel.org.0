Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728A458D2F8
	for <lists+linux-next@lfdr.de>; Tue,  9 Aug 2022 06:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbiHIEfz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Aug 2022 00:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiHIEfy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Aug 2022 00:35:54 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87A11CB1D
        for <linux-next@vger.kernel.org>; Mon,  8 Aug 2022 21:35:51 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id y1so4725788plb.2
        for <linux-next@vger.kernel.org>; Mon, 08 Aug 2022 21:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=OLLc5qZnQecVN7kkXaVjXlfenlWL1+vUPq7TCKLrThM=;
        b=XPpOEJDchrdz4chI/rxSmGMdjUYQBQmy6YeUWrpIbdnTnG2dv5keihc/QtolN4Sn9E
         wBw4/LP8BllHK+7WJdp7WZZPLdGlwN7WNwPlYuhVUh7PeLjo3OZaEwKZ1izjQ7nUCugP
         UK/3Q9lc95xE9nA44fll5BRJgCjyjG5jSdOsGQZYgrCnDAP/2cAB5YpsXweenpZ8FMxL
         a399jXSDC5zA7K3fVqdaAm1OSv9hQDWm/FmchZz4to/JA70tCz/kKX38T6k0DVA+JbNd
         dNW83KdCKaXZZwpU+7Lsb4IvrIorSinHBp5eHOdAB+Fg3xBF/oegIlI+VCEuBeycDU8u
         6nMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=OLLc5qZnQecVN7kkXaVjXlfenlWL1+vUPq7TCKLrThM=;
        b=Jv1aNS/jGWBQCMiW+JqsG8gH+Y9IO1cIzxMGlmV70kuzbEpQRzSKSGncUdiWw+fyvN
         eHoL5hZobcykQjcWEKKW7GpudciudLpaqL+D9HOCA2nr6YlrJ7DntSavgmpounzjUo2A
         4eiCw/VuSbs8N50kdNmQzjiNSrn4qGO5yOmhAJoprK0pvPNnHJDHzw3MJJDEvVVkO2fp
         mQrLwMcoN7uDI8wTiZewg8cHxTMvgv5xXImzeOG2N5mlczI+0XQaqsz431l3eajm8yX/
         lSO+m7uof2nW3RstD0+8HARzgyFYcG5qgHYeGpb6ZLjgXz/IeNCQfg4VCU12CE8cDErr
         456A==
X-Gm-Message-State: ACgBeo1r9lyqlADgn7zZDDgTMBfMbcXup7FMDl9Q1mjOOEQ/HJK7BRhd
        phKdz0KM7d1xvI72tjR7YuRXGYhXxsYA0VXhJzU=
X-Google-Smtp-Source: AA6agR5nXe5kpJq9UNTu3IDRagR3ZAl7Iucq3DhTJaxV1m0JWaZ8hWj9zF1koBRMrsx4AjyzaFe4Xg==
X-Received: by 2002:a17:90b:1987:b0:1f3:2700:775e with SMTP id mv7-20020a17090b198700b001f32700775emr23789393pjb.54.1660019750609;
        Mon, 08 Aug 2022 21:35:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j17-20020a170902da9100b0016efbccf2c0sm9763755plx.56.2022.08.08.21.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 21:35:50 -0700 (PDT)
Message-ID: <62f1e426.170a0220.d8b6a.035a@mx.google.com>
Date:   Mon, 08 Aug 2022 21:35:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-13355-ge1d444f629ff
Subject: next/pending-fixes baseline: 389 runs,
 35 regressions (v5.19-13355-ge1d444f629ff)
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

next/pending-fixes baseline: 389 runs, 35 regressions (v5.19-13355-ge1d444f=
629ff)

Regressions Summary
-------------------

platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
am57xx-beagle-x15      | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc=
onfig           | 1          =

am57xx-beagle-x15      | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

am57xx-beagle-x15      | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc=
onfig+crypto    | 1          =

am57xx-beagle-x15      | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc=
onfig+debug     | 1          =

beaglebone-black       | arm   | lab-broonie     | gcc-10   | multi_v7_defc=
onfig           | 1          =

beaglebone-black       | arm   | lab-broonie     | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

beaglebone-black       | arm   | lab-broonie     | gcc-10   | multi_v7_defc=
onfig+crypto    | 1          =

beaglebone-black       | arm   | lab-cip         | gcc-10   | multi_v7_defc=
onfig           | 1          =

beaglebone-black       | arm   | lab-cip         | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

beaglebone-black       | arm   | lab-cip         | gcc-10   | multi_v7_defc=
onfig+crypto    | 1          =

imx6dl-riotboard       | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig+debug     | 1          =

imx6qp-wandboard-revd1 | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig+debug     | 1          =

imx6ul-pico-hobbit     | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx6ul-pico-hobbit     | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig           | 1          =

imx6ul-pico-hobbit     | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit     | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig+crypto    | 1          =

imx7d-sdb              | arm   | lab-nxp         | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx7ulp-evk            | arm   | lab-nxp         | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx8mn-ddr4-evk        | arm64 | lab-baylibre    | gcc-10   | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m     | arm64 | lab-kontron     | gcc-10   | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m     | arm64 | lab-kontron     | gcc-10   | defconfig+cry=
pto             | 2          =

panda                  | arm   | lab-baylibre    | gcc-10   | multi_v7_defc=
onfig           | 1          =

panda                  | arm   | lab-baylibre    | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

panda                  | arm   | lab-baylibre    | gcc-10   | multi_v7_defc=
onfig+crypto    | 1          =

qemu_arm-vexpress-a15  | arm   | lab-baylibre    | gcc-10   | vexpress_defc=
onfig           | 1          =

qemu_arm-vexpress-a15  | arm   | lab-broonie     | gcc-10   | vexpress_defc=
onfig           | 1          =

qemu_arm-vexpress-a15  | arm   | lab-collabora   | gcc-10   | vexpress_defc=
onfig           | 1          =

qemu_arm-vexpress-a9   | arm   | lab-baylibre    | gcc-10   | vexpress_defc=
onfig           | 1          =

qemu_arm-vexpress-a9   | arm   | lab-broonie     | gcc-10   | vexpress_defc=
onfig           | 1          =

qemu_arm-vexpress-a9   | arm   | lab-collabora   | gcc-10   | vexpress_defc=
onfig           | 1          =

r8a77950-salvator-x    | arm64 | lab-baylibre    | gcc-10   | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x    | arm64 | lab-baylibre    | gcc-10   | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =

rk3399-roc-pc          | arm64 | lab-clabbe      | gcc-10   | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-13355-ge1d444f629ff/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-13355-ge1d444f629ff
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e1d444f629ff2344ed0231c439aa1ee6320cab08 =



Test Regressions
---------------- =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
am57xx-beagle-x15      | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1b9c5c74c1c90b1daf05a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1b9c5c74c1c90b1daf=
05b
        failing since 0 day (last pass: v5.19-8283-ga8bc7f656e322, first fa=
il: v5.19-12861-g50a89f5a92e3) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
am57xx-beagle-x15      | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1ba031defc87d94daf05c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-l=
inaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-l=
inaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1ba031defc87d94daf=
05d
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
am57xx-beagle-x15      | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc=
onfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1bb1a2c43e37572daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+crypto/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+crypto/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1bb1a2c43e37572daf=
057
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
am57xx-beagle-x15      | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc=
onfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1bb63b07befe013daf060

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1bb63b07befe013daf=
061
        failing since 3 days (last pass: v5.19-3879-ge7dffa5317766, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
beaglebone-black       | arm   | lab-broonie     | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1ab5206abb90c96daf058

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebon=
e-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebon=
e-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1ab5206abb90c96daf=
059
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
beaglebone-black       | arm   | lab-broonie     | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1ac539a1bcaee32daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
roonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
roonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1ac539a1bcaee32daf=
057
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
beaglebone-black       | arm   | lab-broonie     | gcc-10   | multi_v7_defc=
onfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1ae378ae013de1ddaf063

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-be=
aglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-be=
aglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1ae378ae013de1ddaf=
064
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
beaglebone-black       | arm   | lab-cip         | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1be605e0f1883e6daf05b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1be605e0f1883e6daf=
05c
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
beaglebone-black       | arm   | lab-cip         | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1c2ac3973b7a206daf05a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-c=
ip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1c2ac3973b7a206daf=
05b
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
beaglebone-black       | arm   | lab-cip         | gcc-10   | multi_v7_defc=
onfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1c75c69d65a1a5cdaf058

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-beagle=
bone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-beagle=
bone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1c75c69d65a1a5cdaf=
059
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx6dl-riotboard       | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1b1523f4eb3a339daf05b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62f1b1523f4eb3a=
339daf063
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94)
        45 lines

    2022-08-09T00:58:31.345725  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:4  pfn:397c4
    2022-08-09T00:58:31.354492  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397b5
    2022-08-09T00:58:31.363512  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397ba
    2022-08-09T00:58:31.363652  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397b9
    2022-08-09T00:58:31.372509  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397ad
    2022-08-09T00:58:31.381572  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397ac
    2022-08-09T00:58:31.381714  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397ab
    2022-08-09T00:58:31.390844  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:39766
    2022-08-09T00:58:31.399669  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:39765
    2022-08-09T00:58:31.399859  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:39780 =

    ... (20 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx6qp-wandboard-revd1 | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1af9babe5c9aededaf056

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62f1af9babe5c9a=
ededaf05e
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94)
        56 lines

    2022-08-09T00:51:10.401725  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:1  pfn:38fb9
    2022-08-09T00:51:10.410607  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:1  pfn:38fb4
    2022-08-09T00:51:10.419666  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:1  pfn:38fb3
    2022-08-09T00:51:10.419822  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:1  pfn:38fb2
    2022-08-09T00:51:10.428669  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:1  pfn:38fb1
    2022-08-09T00:51:10.437691  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:1  pfn:38fb0
    2022-08-09T00:51:10.437857  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:1  pfn:38faf
    2022-08-09T00:51:10.446750  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:1  pfn:38fae
    2022-08-09T00:51:10.455798  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:1  pfn:38fad
    2022-08-09T00:51:10.455942  kern  :alert : BUG: Bad page state in proce=
ss kworker/2:1  pfn:38fac =

    ... (14 line(s) more)  =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx6ul-pico-hobbit     | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1afc2abe5c9aededaf071

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1afc2abe5c9aededaf=
072
        failing since 20 days (last pass: v5.19-rc6-500-g27ca1dbc37a0, firs=
t fail: v5.19-rc7-183-ga3866a7dc77d) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx6ul-pico-hobbit     | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1ab4e0386d2e2b8daf0a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6u=
l-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6u=
l-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1ab4e0386d2e2b8daf=
0a8
        failing since 44 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx6ul-pico-hobbit     | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1ad42358ef282ebdaf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-p=
engutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1ad42358ef282ebdaf=
058
        failing since 70 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx6ul-pico-hobbit     | arm   | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1af3620a028586bdaf063

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baselin=
e-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1af3620a028586bdaf=
064
        failing since 70 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx7d-sdb              | arm   | lab-nxp         | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1aef9aa92c19127daf079

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1aef9aa92c19127daf=
07a
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx7ulp-evk            | arm   | lab-nxp         | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1aefc636e5e0e97daf0e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1aefc636e5e0e97daf=
0e2
        failing since 5 days (last pass: v5.19-1483-gffa33bbcf63ea, first f=
ail: v5.19-3879-ge7dffa5317766) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
imx8mn-ddr4-evk        | arm64 | lab-baylibre    | gcc-10   | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1adb811a972084fdaf058

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibr=
e/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibr=
e/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1adb811a972084fdaf=
059
        new failure (last pass: v5.19-12861-g50a89f5a92e3) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-pitx-imx8m     | arm64 | lab-kontron     | gcc-10   | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62f1aba8032991c6a1daf063

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron=
/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron=
/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62f1aba8032991c6a1daf071
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94)

    2022-08-09T00:34:37.907731  /lava-152192/1/../bin/lava-test-case
    2022-08-09T00:34:37.908064  <8>[   19.334918] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-09T00:34:37.908275  /lava-152192/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
1aba8032991c6a1daf073
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94)

    2022-08-09T00:34:38.945553  /lava-152192/1/../bin/lava-test-case
    2022-08-09T00:34:38.945928  <8>[   20.379317] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-09T00:34:38.946174  /lava-152192/1/../bin/lava-test-case
    2022-08-09T00:34:38.946404  <8>[   20.399198] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-09T00:34:38.946632  /lava-152192/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
kontron-pitx-imx8m     | arm64 | lab-kontron     | gcc-10   | defconfig+cry=
pto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62f1aeddb3640c0c4fdaf057

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62f1aeddb3640c0c4fdaf065
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94)

    2022-08-09T00:48:10.808207  /lava-152205/1/../bin/lava-test-case
    2022-08-09T00:48:10.808660  <8>[   19.411202] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-09T00:48:10.809805  /lava-152205/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
1aeddb3640c0c4fdaf067
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94)

    2022-08-09T00:48:11.845163  /lava-152205/1/../bin/lava-test-case
    2022-08-09T00:48:11.845454  <8>[   20.455323] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-09T00:48:11.845616  /lava-152205/1/../bin/lava-test-case
    2022-08-09T00:48:11.845764  <8>[   20.475096] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-09T00:48:11.845915  /lava-152205/1/../bin/lava-test-case
    2022-08-09T00:48:11.846058  <8>[   20.495411] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-09T00:48:11.846202  /lava-152205/1/../bin/lava-test-case   =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
panda                  | arm   | lab-baylibre    | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1ab230386d2e2b8daf094

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1ab230386d2e2b8daf=
095
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
panda                  | arm   | lab-baylibre    | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1acb4db4d3e7f8adaf07c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-b=
aylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1acb4db4d3e7f8adaf=
07d
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
panda                  | arm   | lab-baylibre    | gcc-10   | multi_v7_defc=
onfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1ae6c5bfc1cfe87daf07a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-p=
anda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-p=
anda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1ae6c5bfc1cfe87daf=
07b
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a15  | arm   | lab-baylibre    | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1a862efc538a1dbdaf086

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm=
-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm=
-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1a862efc538a1dbdaf=
087
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a15  | arm   | lab-broonie     | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1a8796dc8352c78daf08e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-=
vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-=
vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1a8796dc8352c78daf=
08f
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a15  | arm   | lab-collabora   | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1a858efc538a1dbdaf080

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_ar=
m-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_ar=
m-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1a858efc538a1dbdaf=
081
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a9   | arm   | lab-baylibre    | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1a863efc538a1dbdaf089

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm=
-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm=
-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1a863efc538a1dbdaf=
08a
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a9   | arm   | lab-broonie     | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1a87b6dc8352c78daf091

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-=
vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-=
vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1a87b6dc8352c78daf=
092
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a9   | arm   | lab-collabora   | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1a859efc538a1dbdaf083

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_ar=
m-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_ar=
m-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1a859efc538a1dbdaf=
084
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
r8a77950-salvator-x    | arm64 | lab-baylibre    | gcc-10   | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1adec15562d6a29daf09e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibr=
e/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibr=
e/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1adec15562d6a29daf=
09f
        new failure (last pass: v5.19-12861-g50a89f5a92e3) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
r8a77950-salvator-x    | arm64 | lab-baylibre    | gcc-10   | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1b149e287601e02daf06a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibr=
e/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibr=
e/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1b149e287601e02daf=
06b
        new failure (last pass: v5.19-12861-g50a89f5a92e3) =

 =



platform               | arch  | lab             | compiler | defconfig    =
                | regressions
-----------------------+-------+-----------------+----------+--------------=
----------------+------------
rk3399-roc-pc          | arm64 | lab-clabbe      | gcc-10   | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f1ab88855ebad6a9daf078

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/=
baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-13355=
-ge1d444f629ff/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/=
baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f1ab88855ebad6a9daf=
079
        failing since 1 day (last pass: v5.19-11387-gd91170a44a94, first fa=
il: v5.19-12861-g50a89f5a92e3) =

 =20
