Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB8A65FC37
	for <lists+linux-next@lfdr.de>; Fri,  6 Jan 2023 08:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjAFHpD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Jan 2023 02:45:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjAFHpC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Jan 2023 02:45:02 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F97755F0
        for <linux-next@vger.kernel.org>; Thu,  5 Jan 2023 23:45:00 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id q64so769820pjq.4
        for <linux-next@vger.kernel.org>; Thu, 05 Jan 2023 23:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lSyPzq97Cybobmidc7bo3noIDll7DQYHDCmbtmqeDEo=;
        b=5ohujiAPGGY9gRGkVtUbbmu3u1F1SehKMKzg8lqYF3XzvxMvpK/73ehwpKtBlgijaV
         8RSbyx97zF2dn0X3JA+TRB3bGJIbanWnGCEy61JewSLkWGbPca9aFMzu3b+CBTYX0CTq
         2+Wdj7/UkLcshBCMHzYLcf4+3HhViOavsoBLM/gV16OZzsD7UonLy9fo0lT2r/LCbkBZ
         e5auXQGKQEf/5zuNaVj6U69XbKRk89vUu4ii114gLUajr5r9apj0cSYKNdQIPG1EWQ9S
         S6/ZsnumXMqqw82AL8PPKnhMwT8IJk/AnONFToM28mt9fuWHle80A46k1V90FI4fMPpJ
         e8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSyPzq97Cybobmidc7bo3noIDll7DQYHDCmbtmqeDEo=;
        b=SFzNs6oqtgf+HwCd3jB6IYyJbCQVKrapTsc7DtWvaMAVZtqGk0GBi3lrYYnAJK7U4U
         9TaSolDBxDy0hyT26D7LSSbpfGN+YFggtP+l/g2rAHcLvgEmb8Tkwybf0WXtsT2JAAgH
         uZQfkaTDVQbKi3c0L6PFuWaQp0bXmrlgLgDCz6AcSeB2Xz+/Ac0EVTPtqYk0vTMd9QBj
         RX/MYkTJx6B/GCRxaFB4tWtJmaQImgYnqSdlMKiLzXIO/HRStvbViq6WdX2pnQiy05zr
         xgRriq5GDRVjdjWb10EePrQkTSbC/4Vs3toWROnuvEdjGQkmMdZANGmGzz5/oVsTXyHo
         x68Q==
X-Gm-Message-State: AFqh2krO/ICo0SExRoajbdpM1M4SgR09gpADbcMHsd4GlKhroqcR21Go
        zyA3DALvJWJwqMh9ISwOTLveFQ5qvLcNVSef1qQ=
X-Google-Smtp-Source: AMrXdXvdxvoywKJiyRzKlFfYkQP06i3J2JKT3zmh/8sl0DqmrSq6QoNpfUkHivH/Ff4NAxbsPpG88g==
X-Received: by 2002:a17:90a:f309:b0:225:c112:c871 with SMTP id ca9-20020a17090af30900b00225c112c871mr54265173pjb.12.1672991099460;
        Thu, 05 Jan 2023 23:44:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090a68c900b002260c751b00sm2289182pjj.23.2023.01.05.23.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 23:44:59 -0800 (PST)
Message-ID: <63b7d17b.170a0220.50c7b.3ddb@mx.google.com>
Date:   Thu, 05 Jan 2023 23:44:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230106
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: next/master baseline: 499 runs, 21 regressions (next-20230106)
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

next/master baseline: 499 runs, 21 regressions (next-20230106)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-16 | defconf=
ig                    | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-16 | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+ima                | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | clang-16 | defconf=
ig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+ima                | 2          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230106/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230106
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      469a89fd3bb73bb2eea628da2b3e0f695f80b7ce =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7b628651b947b4a4eee20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7b629651b947b4a4ee=
e21
        failing since 110 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63b79b7d4e8ba317334eee33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b79b7d4e8ba317334eee38
        failing since 0 day (last pass: next-20221017, first fail: next-202=
30105)

    2023-01-06T03:54:20.964846  + set +x
    2023-01-06T03:54:20.968031  <8>[   17.467627] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 57971_1.5.2.4.1>
    2023-01-06T03:54:21.080520  / # #
    2023-01-06T03:54:21.185090  export SHELL=3D/bin/sh
    2023-01-06T03:54:21.186180  #
    2023-01-06T03:54:21.288498  / # export SHELL=3D/bin/sh. /lava-57971/env=
ironment
    2023-01-06T03:54:21.289203  =

    2023-01-06T03:54:21.391423  / # . /lava-57971/environment/lava-57971/bi=
n/lava-test-runner /lava-57971/1
    2023-01-06T03:54:21.392641  =

    2023-01-06T03:54:21.399202  / # /lava-57971/bin/lava-test-runner /lava-=
57971/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a156021ba442a44eeeca

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b7a156021ba442a44eeecf
        new failure (last pass: next-20221125)

    2023-01-06T04:19:23.914132  [   21.430353] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1130309_1.5.2.4.1>
    2023-01-06T04:19:24.020340  / # #
    2023-01-06T04:19:24.121651  export SHELL=3D/bin/sh
    2023-01-06T04:19:24.121999  #
    2023-01-06T04:19:24.222962  / # export SHELL=3D/bin/sh. /lava-1130309/e=
nvironment
    2023-01-06T04:19:24.223324  =

    2023-01-06T04:19:24.324374  / # . /lava-1130309/environment/lava-113030=
9/bin/lava-test-runner /lava-1130309/1
    2023-01-06T04:19:24.324885  =

    2023-01-06T04:19:24.326767  / # /lava-1130309/bin/lava-test-runner /lav=
a-1130309/1
    2023-01-06T04:19:24.351606  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-16 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a26124766d89c24eee19

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b7a26124766d89c24eee1e
        new failure (last pass: next-20221124)

    2023-01-06T04:22:13.582466  [   23.277730] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1130310_1.5.2.4.1>
    2023-01-06T04:22:13.690322  / # #
    2023-01-06T04:22:13.791993  export SHELL=3D/bin/sh
    2023-01-06T04:22:13.792406  #
    2023-01-06T04:22:13.893555  / # export SHELL=3D/bin/sh. /lava-1130310/e=
nvironment
    2023-01-06T04:22:13.894004  =

    2023-01-06T04:22:13.995227  / # . /lava-1130310/environment/lava-113031=
0/bin/lava-test-runner /lava-1130310/1
    2023-01-06T04:22:13.996095  =

    2023-01-06T04:22:13.998018  / # /lava-1130310/bin/lava-test-runner /lav=
a-1130310/1
    2023-01-06T04:22:14.018034  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a06c15ad74afd84eee72

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7a06c15ad74afd84ee=
e73
        failing since 209 days (last pass: next-20220607, first fail: next-=
20220610) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63b79ff29ef9f8610e4eee24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b79ff29ef9f8610e4ee=
e25
        failing since 120 days (last pass: next-20220831, first fail: next-=
20220907) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a25c3c1a7dba994eee38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7a25c3c1a7dba994ee=
e39
        new failure (last pass: next-20221125) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-16 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a3eba2afc4ad4a4eeee0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7a3eba2afc4ad4a4ee=
ee1
        failing since 0 day (last pass: next-20221124, first fail: next-202=
30105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b79e95f9a786a87b4eee32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b79e95f9a786a87b4ee=
e33
        failing since 0 day (last pass: next-20221125, first fail: next-202=
30105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a09e0c01d07f934eee19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7a09e0c01d07f934ee=
e1a
        failing since 0 day (last pass: next-20221226, first fail: next-202=
30105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a59b784a217dca4eeead

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7a59b784a217dca4ee=
eae
        failing since 0 day (last pass: next-20221226, first fail: next-202=
30105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a7e398a4a903c24eee2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7a7e398a4a903c24ee=
e2b
        failing since 0 day (last pass: next-20221226, first fail: next-202=
30105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a174b568fb33924eee33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7a174b568fb33924ee=
e34
        failing since 65 days (last pass: next-20221028, first fail: next-2=
0221101) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a585784a217dca4eee3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7a585784a217dca4ee=
e3c
        failing since 57 days (last pass: next-20221107, first fail: next-2=
0221109) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | clang-16 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a185743f0937d94eeebf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230102071821+3100=
0211e011-1~exp1~20230102071919.518))
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig/clang-16/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig/clang-16/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b7a185743f0937d94eeec4
        new failure (last pass: next-20230105)

    2023-01-06T04:20:05.983479  <8>[   18.406216] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 58209_1.5.2.4.1>
    2023-01-06T04:20:06.092546  / # #
    2023-01-06T04:20:06.195566  export SHELL=3D/bin/sh
    2023-01-06T04:20:06.196475  #
    2023-01-06T04:20:06.298530  / # export SHELL=3D/bin/sh. /lava-58209/env=
ironment
    2023-01-06T04:20:06.299401  =

    2023-01-06T04:20:06.401534  / # . /lava-58209/environment/lava-58209/bi=
n/lava-test-runner /lava-58209/1
    2023-01-06T04:20:06.402864  =

    2023-01-06T04:20:06.407037  / # /lava-58209/bin/lava-test-runner /lava-=
58209/1
    2023-01-06T04:20:06.445444  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/63b7a65faff2f094ec4eee19

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63b7a65faff2f09=
4ec4eee20
        new failure (last pass: next-20230105)
        2 lines

    2023-01-06T04:40:51.589373  :alert :   ESR =3D 0x0000000096000004
    2023-01-06T04:40:51.594894  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-01-06T04:40:51.600400  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-01-06T04:40:51.600861  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-01-06T04:40:51.606099  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2023-01-06T04:40:51.616907  kern  :ale<8>[   18.464736] <LAVA_SIGNAL_TE=
STCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63b7a65faff2f09=
4ec4eee21
        new failure (last pass: next-20230105)
        12 lines

    2023-01-06T04:40:51.574722  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address fffffffffffffff8
    2023-01-06T04:40:51.575107  kern  :alert : Mem abort info:
    2023-01-06T04:40:51.583919  kern  <8>[   18.435694] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63b79fa9284476bb424eee2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b79fa9284476bb424ee=
e2e
        failing since 23 days (last pass: next-20221208, first fail: next-2=
0221213) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63b79e13c097189aa54eee35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b79e13c097189aa54ee=
e36
        failing since 135 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a0244868fc435a4eee7b

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63b7a0244868fc4=
35a4eee83
        new failure (last pass: next-20230105)
        1 lines

    2023-01-06T04:14:14.869094  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 1bb1d2fc, epc =3D=3D 80203944, ra =3D=
=3D 80206294
    2023-01-06T04:14:14.869497  =

    2023-01-06T04:14:14.904289  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-01-06T04:14:14.904753     =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7a03b8bcc4f819b4eee45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230106/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230106/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7a03b8bcc4f819b4ee=
e46
        new failure (last pass: next-20230105) =

 =20
