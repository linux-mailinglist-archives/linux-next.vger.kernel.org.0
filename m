Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF595141DE
	for <lists+linux-next@lfdr.de>; Fri, 29 Apr 2022 07:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354189AbiD2Fro (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Apr 2022 01:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbiD2Frn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Apr 2022 01:47:43 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDBC6FF72
        for <linux-next@vger.kernel.org>; Thu, 28 Apr 2022 22:44:26 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id l11-20020a17090a49cb00b001d923a9ca99so6368237pjm.1
        for <linux-next@vger.kernel.org>; Thu, 28 Apr 2022 22:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=S0Cen0PqVMeDXwRTJFnl9qTLl5C0F4momQ0qJ9UyHuo=;
        b=2VQ3IXv0pj9qxL4OBXi49/0RXfcUK4j24OAzKsbEjw9nWdzQ5QNaj1aUG0TaDGzlpv
         FMbvdGZAUWNMqSC3M2KGqyllpuJU1FxCPKmbRQ6y+n12jH159drV3EgYNK458/oZjXwP
         pU2puMoZzsrfONKZBgFc2sSDnsvOMJbpvMWiv8uYC6wX+I0BYBKgsUCWvLnEaP6Ryztz
         1T2LBwi2Dt8JvBovTAi0Pb8D2dTr345gepS93gb7lbefXKnKwyxE2H/IQY8NQgGCjJv+
         Lb0VGhDic2KHHFf+JigZ5tBWMHlyJUN3agfGby8Fc0EjmBNIqxFSfHPIDyPMqnAhZOEi
         DVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=S0Cen0PqVMeDXwRTJFnl9qTLl5C0F4momQ0qJ9UyHuo=;
        b=2Ffu9xyl6hp1qseLmhiLJytlcZcl3Dp+WVit+7TrjqXJ1XvxeC9zYBAy55oNEG6VUk
         cR6Zl5gcMMpBOG2QAO8z/Q/1CEeuo9g1SaGTNB+PmmCSRx1QpcM+fUXBM7BeHqo+Dm7q
         LwGPW0FAHqADWU7PwlJdW2pe54+ROznrWcMjymv+nMKPGxEgPYqGf5l5FxOFlA7/Dcz6
         JVE5g34KstJfcklcOX+rsXgLG3BUbuyKHigb2mETEd2mrI+1EsRE5Scn2pMQ+u/DqrCL
         +zT7v+Y5Aa3mOdFjwv1o8Bq7dHcE/WKpM+X1FnQRSKPfZgvWN9dhvk+hBzli0y6CgnDJ
         hw/w==
X-Gm-Message-State: AOAM532n+iWkqG+Pe1k15h6bSVW4vZLtaky5Ii1ZWlNV5fj6e3Rx9Dhb
        ZNg8YsEWYa0Y5wo6r75pODdR2sybU6IgN43zjAs=
X-Google-Smtp-Source: ABdhPJyUVm6q+upmKXkDeQ/zLGtqrydSabX6fw6bQuhIaT8HqSeqrFZUqTmh14PkV8uCKdXgNq6gWg==
X-Received: by 2002:a17:902:7006:b0:156:3cbe:6b04 with SMTP id y6-20020a170902700600b001563cbe6b04mr36468190plk.68.1651211065304;
        Thu, 28 Apr 2022 22:44:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g10-20020a65594a000000b003c14af50633sm4815905pgu.75.2022.04.28.22.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 22:44:24 -0700 (PDT)
Message-ID: <626b7b38.1c69fb81.e5867.c9a1@mx.google.com>
Date:   Thu, 28 Apr 2022 22:44:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220428
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 308 runs, 14 regressions (next-20220428)
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

next/master baseline: 308 runs, 14 regressions (next-20220428)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | clang-14 | multi_v=
7_defconfig           | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+debug              | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 3          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220428/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220428
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bdc61aad77faf67187525028f1f355eff3849f22 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | clang-14 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/626b46eca66d2aba59ff9463

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220423123016+9a3e8=
1e1f91f-1~exp1~20220423003106.122)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626b46eca66d2aba59ff9=
464
        failing since 28 days (last pass: next-20220328, first fail: next-2=
0220329) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/626b42c1d46164cd05ff949e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626b42c1d46164cd05ff9=
49f
        failing since 183 days (last pass: next-20211026, first fail: next-=
20211027) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/626b4529dc887339a8ff9498

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
6b4529dc887339a8ff94a1
        failing since 14 days (last pass: next-20220411, first fail: next-2=
0220414)

    2022-04-29T01:53:03.870848  /lava-113708/1/../bin/lava-test-case
    2022-04-29T01:53:03.982892  <8>[   39.608062][  T315] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/626b6234896207252cff95ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626b6234896207252cff9=
5eb
        failing since 50 days (last pass: next-20220308, first fail: next-2=
0220309) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/626b45e33812358680ff945b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626b45e33812358680ff9=
45c
        failing since 103 days (last pass: next-20220114, first fail: next-=
20220115) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/626b5346ce8bb975c8ff9482

  Results:     73 PASS, 19 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/626b5346ce8bb975c8ff94c7
        failing since 1 day (last pass: next-20220422, first fail: next-202=
20427)

    2022-04-29T02:53:34.217659  /lava-6205000/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/626b58656a9edae9edff946a

  Results:     84 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/626b58656a9edae9edff94af
        failing since 1 day (last pass: next-20220422, first fail: next-202=
20427)

    2022-04-29T03:15:36.144530  /lava-6205199/1/../bin/lava-test-case
    2022-04-29T03:15:36.157931  <8>[   34.277390] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/626b58656a9edae9edff94b0
        failing since 1 day (last pass: next-20220422, first fail: next-202=
20427)

    2022-04-29T03:15:34.118874  <8>[   32.235041] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-04-29T03:15:35.122390  /lava-6205199/1/../bin/lava-test-case
    2022-04-29T03:15:35.140145  <8>[   33.254736] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/626b58656a9edae9edff94b1
        failing since 1 day (last pass: next-20220422, first fail: next-202=
20427)

    2022-04-29T03:15:33.379943  <4>[   31.494687] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-04-29T03:15:34.103168  /lava-6205199/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/626b46c3d2bdf5d3e4ff945a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626b46c3d2bdf5d3e4ff9=
45b
        failing since 9 days (last pass: next-20220414, first fail: next-20=
220419) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/626b46baf808073569ff94d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626b46baf808073569ff9=
4d1
        failing since 9 days (last pass: next-20220414, first fail: next-20=
220419) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/626b4355070f3426d8ff9474

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626b4355070f3426d8ff9=
475
        failing since 1 day (last pass: next-20220422, first fail: next-202=
20426) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/626b4351070f3426d8ff946e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626b4351070f3426d8ff9=
46f
        new failure (last pass: next-20220427) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/626b4672026bde994cff948b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220428/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220428/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220422.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/626b4672026bde994cff9=
48c
        new failure (last pass: next-20220427) =

 =20
