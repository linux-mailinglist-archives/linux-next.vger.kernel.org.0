Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325AC69173B
	for <lists+linux-next@lfdr.de>; Fri, 10 Feb 2023 04:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjBJDkn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Feb 2023 22:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjBJDkl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Feb 2023 22:40:41 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A434E5D1FA
        for <linux-next@vger.kernel.org>; Thu,  9 Feb 2023 19:40:37 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id r18so2887023pgr.12
        for <linux-next@vger.kernel.org>; Thu, 09 Feb 2023 19:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bo9jSNoebyUxQDiB75lEaeYNpEyJYZeU31Ads9lszQM=;
        b=zUSD3ZCmNWZlh/qvltby7KpxzkARg/skGVomEEL3FrN8rJvYZOelxk1sos0rqYzYLS
         1JxgPl97qisKO7NqMCq06MfUic0PG2LUR7ki04X1Ow1ZAGG+drx56+WaQujx2n6YvOlF
         8lUdlpqaNJonTozQXuvlWMHB1jtmDs21EO5Nj4iB0YD+IJI4TNaesaQuXaGTH5L8I+e3
         TwMNef8EAWZEmQlJ9ZlCKxG2pCVaVyAITD8OQbntjJBGcm1r0obMUGxnMQ04I+3oY0rc
         oIrsngcOhqf+M+zUdV1WPuVz1xCNmwxj+yAQf7rzcONSIYVNWX8ncuGKlanD1BzAoLb8
         KgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bo9jSNoebyUxQDiB75lEaeYNpEyJYZeU31Ads9lszQM=;
        b=k6EJAQpVKzh0sg8+SaP/sxI435pWH2pVrSRyxExbhkeXzYj9lbbgUGVCLa5AeFKpQD
         IXZsFxQNx5D1WN+qRJ2hPTCLAn2fnZekEUFtOJf+s3ooYLIwC7GeMk+rVPgJVB3Xgis7
         hKko61qVoglzGx/+OaH05evzh35qQ+jGzVdXyYs9E5E4ZWoQSf62qn4c0q6e8FrzpzKk
         /IUgHbbufUymGewU7mUBn6JReOOTPrmiB0CLC1Z9LG+kwGWXI+xpeZ9y3Xj4vMFd67NA
         kuuG7CmkoTj2DgVv0+WTR/oRZTXGyWMcJjdoIpsqe4RRZjW0jvA6eT0JdjSIp3Gik2iG
         sdow==
X-Gm-Message-State: AO0yUKVmYp8stqGuXY8mGu8HNBWLTyq2aCM7Zzv+M9FNwuyhIn5d9ZkV
        GlVnr2arNysAD5qOr17nEpU+xnrhVt1Pi85Ljh0=
X-Google-Smtp-Source: AK7set9NKQ5Lt6FcRQqdyuhIs8bL0Rfxn61KHso3XmslOHnmNDZPbxfJ/c4RD6uMZElYXWaNvsjEHg==
X-Received: by 2002:a62:154e:0:b0:593:cda6:f402 with SMTP id 75-20020a62154e000000b00593cda6f402mr11072698pfv.17.1676000436155;
        Thu, 09 Feb 2023 19:40:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e24-20020aa78c58000000b005815217e665sm550509pfd.65.2023.02.09.19.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 19:40:35 -0800 (PST)
Message-ID: <63e5bcb3.a70a0220.fc0d5.1a2b@mx.google.com>
Date:   Thu, 09 Feb 2023 19:40:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.2-rc7-233-gd885c5e298888
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 689 runs,
 51 regressions (v6.2-rc7-233-gd885c5e298888)
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

next/pending-fixes baseline: 689 runs, 51 regressions (v6.2-rc7-233-gd885c5=
e298888)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =

meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+kselftest          | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc7-233-gd885c5e298888/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc7-233-gd885c5e298888
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d885c5e2988884cd4c5d431f154405d8f2146466 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63e585063768bf706b8c863a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e585063768bf706b8c8643
        failing since 29 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-02-09T23:42:42.380868  / # #

    2023-02-09T23:42:42.483196  export SHELL=3D/bin/sh

    2023-02-09T23:42:42.483853  #

    2023-02-09T23:42:42.585201  / # export SHELL=3D/bin/sh. /lava-9088650/e=
nvironment

    2023-02-09T23:42:42.585732  =


    2023-02-09T23:42:42.687265  / # . /lava-9088650/environment/lava-908865=
0/bin/lava-test-runner /lava-9088650/1

    2023-02-09T23:42:42.688279  =


    2023-02-09T23:42:42.731131  / # /lava-9088650/bin/lava-test-runner /lav=
a-9088650/1

    2023-02-09T23:42:42.816244  + export 'TESTRUN_ID=3D1_bootrr'

    2023-02-09T23:42:42.816688  + cd /lava-9088650/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e585e0298b3cb0f88c8645

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e585e0298b3cb0f88c864e
        failing since 23 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-09T23:46:11.682032  <8>[   15.040615] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3316280_1.5.2.4.1>
    2023-02-09T23:46:11.788598  / # #
    2023-02-09T23:46:11.890411  export SHELL=3D/bin/sh
    2023-02-09T23:46:11.890885  #
    2023-02-09T23:46:11.992098  / # export SHELL=3D/bin/sh. /lava-3316280/e=
nvironment
    2023-02-09T23:46:11.992521  =

    2023-02-09T23:46:12.093754  / # . /lava-3316280/environment/lava-331628=
0/bin/lava-test-runner /lava-3316280/1
    2023-02-09T23:46:12.094296  =

    2023-02-09T23:46:12.099325  / # /lava-3316280/bin/lava-test-runner /lav=
a-3316280/1
    2023-02-09T23:46:12.178174  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e588087d81f7ca308c8657

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e588087d81f7ca308c8660
        failing since 23 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-09T23:55:39.134480  <8>[   16.585895] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3316538_1.5.2.4.1>
    2023-02-09T23:55:39.245799  / # #
    2023-02-09T23:55:39.349134  export SHELL=3D/bin/sh
    2023-02-09T23:55:39.350028  #
    2023-02-09T23:55:39.452274  / # export SHELL=3D/bin/sh. /lava-3316538/e=
nvironment
    2023-02-09T23:55:39.453396  =

    2023-02-09T23:55:39.555756  / # . /lava-3316538/environment/lava-331653=
8/bin/lava-test-runner /lava-3316538/1
    2023-02-09T23:55:39.557323  =

    2023-02-09T23:55:39.561955  / # /lava-3316538/bin/lava-test-runner /lav=
a-3316538/1
    2023-02-09T23:55:39.658603  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63e589f409d6662c608c86aa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e589f509d6662c608c86b3
        failing since 23 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-10T00:03:48.066191  <8>[   15.444514] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3316602_1.5.2.4.1>
    2023-02-10T00:03:48.173006  / # #
    2023-02-10T00:03:48.274655  export SHELL=3D/bin/sh
    2023-02-10T00:03:48.275078  #
    2023-02-10T00:03:48.376359  / # export SHELL=3D/bin/sh. /lava-3316602/e=
nvironment
    2023-02-10T00:03:48.376906  =

    2023-02-10T00:03:48.478829  / # . /lava-3316602/environment/lava-331660=
2/bin/lava-test-runner /lava-3316602/1
    2023-02-10T00:03:48.479505  =

    2023-02-10T00:03:48.484062  / # /lava-3316602/bin/lava-test-runner /lav=
a-3316602/1
    2023-02-10T00:03:48.579102  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58bf09421fdb18e8c86cb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e58bf09421fdb18e8c86d3
        failing since 23 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-10T00:12:07.293440  + set +x<8>[   13.614100] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3316625_1.5.2.4.1>
    2023-02-10T00:12:07.293746  =

    2023-02-10T00:12:07.400076  / # #
    2023-02-10T00:12:07.502021  export SHELL=3D/bin/sh
    2023-02-10T00:12:07.502549  #
    2023-02-10T00:12:07.603830  / # export SHELL=3D/bin/sh. /lava-3316625/e=
nvironment
    2023-02-10T00:12:07.604244  =

    2023-02-10T00:12:07.705491  / # . /lava-3316625/environment/lava-331662=
5/bin/lava-test-runner /lava-3316625/1
    2023-02-10T00:12:07.706079  <3>[   13.928880] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-02-10T00:12:07.706221   =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58c79a493dc9bf28c8632

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e58c79a493dc9bf28c863a
        failing since 23 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-02-10T00:14:31.781106  <8>[   24.692314] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3316653_1.5.2.4.1>
    2023-02-10T00:14:31.890251  / # #
    2023-02-10T00:14:31.993613  export SHELL=3D/bin/sh
    2023-02-10T00:14:31.994764  #
    2023-02-10T00:14:32.097250  / # export SHELL=3D/bin/sh. /lava-3316653/e=
nvironment
    2023-02-10T00:14:32.098397  =

    2023-02-10T00:14:32.200789  / # . /lava-3316653/environment/lava-331665=
3/bin/lava-test-runner /lava-3316653/1
    2023-02-10T00:14:32.202476  =

    2023-02-10T00:14:32.207528  / # /lava-3316653/bin/lava-test-runner /lav=
a-3316653/1
    2023-02-10T00:14:32.303904  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e584d9a97274affb8c8665

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e584d9a97274affb8c866e
        failing since 10 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-09T23:41:56.803508  + set +x
    2023-02-09T23:41:56.803695  [   12.627240] <LAVA_SIGNAL_ENDRUN 0_dmesg =
902505_1.5.2.3.1>
    2023-02-09T23:41:56.911488  / # #
    2023-02-09T23:41:57.013233  export SHELL=3D/bin/sh
    2023-02-09T23:41:57.013749  #
    2023-02-09T23:41:57.114980  / # export SHELL=3D/bin/sh. /lava-902505/en=
vironment
    2023-02-09T23:41:57.115592  =

    2023-02-09T23:41:57.216962  / # . /lava-902505/environment/lava-902505/=
bin/lava-test-runner /lava-902505/1
    2023-02-09T23:41:57.217791  =

    2023-02-09T23:41:57.221049  / # /lava-902505/bin/lava-test-runner /lava=
-902505/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e587aa008ea04b158c8648

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e587aa008ea04b158c8651
        failing since 10 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-09T23:53:55.517220  + set +x
    2023-02-09T23:53:55.517389  [   11.900432] <LAVA_SIGNAL_ENDRUN 0_dmesg =
902515_1.5.2.3.1>
    2023-02-09T23:53:55.624198  / # #
    2023-02-09T23:53:55.726069  export SHELL=3D/bin/sh
    2023-02-09T23:53:55.726431  #
    2023-02-09T23:53:55.827568  / # export SHELL=3D/bin/sh. /lava-902515/en=
vironment
    2023-02-09T23:53:55.827915  =

    2023-02-09T23:53:55.929076  / # . /lava-902515/environment/lava-902515/=
bin/lava-test-runner /lava-902515/1
    2023-02-09T23:53:55.929571  =

    2023-02-09T23:53:55.933256  / # /lava-902515/bin/lava-test-runner /lava=
-902515/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63e5893913c8d7ce5b8c863b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e5893913c8d7ce5b8c8644
        failing since 10 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-10T00:00:35.257173  + set +x
    2023-02-10T00:00:35.257343  [   12.883340] <LAVA_SIGNAL_ENDRUN 0_dmesg =
902521_1.5.2.3.1>
    2023-02-10T00:00:35.365306  / # #
    2023-02-10T00:00:35.466975  export SHELL=3D/bin/sh
    2023-02-10T00:00:35.467365  #
    2023-02-10T00:00:35.568588  / # export SHELL=3D/bin/sh. /lava-902521/en=
vironment
    2023-02-10T00:00:35.568968  =

    2023-02-10T00:00:35.670221  / # . /lava-902521/environment/lava-902521/=
bin/lava-test-runner /lava-902521/1
    2023-02-10T00:00:35.670729  =

    2023-02-10T00:00:35.674225  / # /lava-902521/bin/lava-test-runner /lava=
-902521/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58ade12884b74c48c8631

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e58ade12884b74c48c863a
        failing since 10 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-10T00:07:37.863997  + set +x
    2023-02-10T00:07:37.864160  [   12.884744] <LAVA_SIGNAL_ENDRUN 0_dmesg =
902528_1.5.2.3.1>
    2023-02-10T00:07:37.971384  / # #
    2023-02-10T00:07:38.073014  export SHELL=3D/bin/sh
    2023-02-10T00:07:38.073394  #
    2023-02-10T00:07:38.174809  / # export SHELL=3D/bin/sh. /lava-902528/en=
vironment
    2023-02-10T00:07:38.175121  =

    2023-02-10T00:07:38.276277  / # . /lava-902528/environment/lava-902528/=
bin/lava-test-runner /lava-902528/1
    2023-02-10T00:07:38.276948  =

    2023-02-10T00:07:38.279978  / # /lava-902528/bin/lava-test-runner /lava=
-902528/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx53-qsrb                   | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58b30714412f9118c8647

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e58b30714412f9118c8650
        failing since 10 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-02-10T00:09:03.509651  + set +x
    2023-02-10T00:09:03.509882  [   16.112118] <LAVA_SIGNAL_ENDRUN 0_dmesg =
902535_1.5.2.3.1>
    2023-02-10T00:09:03.617624  / # #
    2023-02-10T00:09:03.719336  export SHELL=3D/bin/sh
    2023-02-10T00:09:03.719686  #
    2023-02-10T00:09:03.820864  / # export SHELL=3D/bin/sh. /lava-902535/en=
vironment
    2023-02-10T00:09:03.821302  =

    2023-02-10T00:09:03.922704  / # . /lava-902535/environment/lava-902535/=
bin/lava-test-runner /lava-902535/1
    2023-02-10T00:09:03.923911  =

    2023-02-10T00:09:03.927000  / # /lava-902535/bin/lava-test-runner /lava=
-902535/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58b2d2b8e72aee28c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e58b2d2b8e72aee28c8638
        new failure (last pass: v6.2-rc7-188-gc82c3af3ec13)

    2023-02-10T00:09:00.984609  + set[   15.030097] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 902530_1.5.2.3.1>
    2023-02-10T00:09:00.984765   +x
    2023-02-10T00:09:01.090986  / # #
    2023-02-10T00:09:01.192460  export SHELL=3D/bin/sh
    2023-02-10T00:09:01.192944  #
    2023-02-10T00:09:01.294307  / # export SHELL=3D/bin/sh. /lava-902530/en=
vironment
    2023-02-10T00:09:01.294623  =

    2023-02-10T00:09:01.395825  / # . /lava-902530/environment/lava-902530/=
bin/lava-test-runner /lava-902530/1
    2023-02-10T00:09:01.396324  =

    2023-02-10T00:09:01.399501  / # /lava-902530/bin/lava-test-runner /lava=
-902530/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e5878a78dbe6af2f8c867d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e5878a78dbe6af2f8c8=
67e
        failing since 155 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e587891ead75fb958c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e587891ead75fb958c8=
64f
        failing since 156 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58686685eec354e8c866f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58686685eec354e8c8=
670
        failing since 286 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jh7100-starfi...isionfive-v1 | riscv | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e5861905f093762e8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh710=
0-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh710=
0-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e5861905f093762e8c8=
63e
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/63e58697d8b197eb428c8666

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e58697d8b197eb428c866d
        new failure (last pass: v6.2-rc7-188-gc82c3af3ec13)

    2023-02-09T23:49:13.321579  / # #
    2023-02-09T23:49:13.423451  export SHELL=3D/bin/sh
    2023-02-09T23:49:13.424076  #
    2023-02-09T23:49:13.525355  / # export SHELL=3D/bin/sh. /lava-270858/en=
vironment
    2023-02-09T23:49:13.526009  =

    2023-02-09T23:49:13.627510  / # . /lava-270858/environment/lava-270858/=
bin/lava-test-runner /lava-270858/1
    2023-02-09T23:49:13.628332  =

    2023-02-09T23:49:13.634580  / # /lava-270858/bin/lava-test-runner /lava=
-270858/1
    2023-02-09T23:49:13.698625  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-09T23:49:13.698923  + cd /l<8>[  113.303267] <LAVA_SIGNAL_START=
RUN 1_bootrr 270858_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63e=
58697d8b197eb428c867d
        new failure (last pass: v6.2-rc7-188-gc82c3af3ec13)

    2023-02-09T23:49:17.760132  /lava-270858/1/../bin/lava-test-case
    2023-02-09T23:49:17.760604  <8>[  117.529355] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58ad990b9738e698c864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58ad990b9738e698c8=
64c
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58b7d5a1deca7a78c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58b7d5a1deca7a78c8=
646
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58bb34f3ec61ccc8c8655

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58bb34f3ec61ccc8c8=
656
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58c3858cbded52b8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58c3858cbded52b8c8=
637
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58aec59d236a2918c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-me=
son-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-me=
son-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58aec59d236a2918c8=
649
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58aff233030ce2b8c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58aff233030ce2b8c8=
636
        failing since 2 days (last pass: v6.2-rc7-136-g39693c3ba989, first =
fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58b11e1b915db038c8674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58b11e1b915db038c8=
675
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58b0de1b915db038c8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58b0de1b915db038c8=
664
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58b0fe1b915db038c8671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58b0fe1b915db038c8=
672
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58b8c91665a78a48c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58b8c91665a78a48c8=
630
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58b7c13db27c7608c86a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58b7c13db27c7608c8=
6a9
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58ae112884b74c48c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58ae112884b74c48c8=
640
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e5a040a29e72f72f8c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e5a040a29e72f72f8c8=
635
        failing since 11 days (last pass: v6.2-rc5-286-g436294605dc5, first=
 fail: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58c50f42fd430018c8671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58c50f42fd430018c8=
672
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58ad790b9738e698c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58ad790b9738e698c8=
645
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e5870f1f5886afa98c86a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e5870f1f5886afa98c8=
6a2
        new failure (last pass: v6.2-rc7-188-gc82c3af3ec13) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e5855ed7e81614868c86ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e5855ed7e81614868c8=
6af
        failing since 120 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e5943372b1be1b068c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-=
qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-=
qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e5943372b1be1b068c8=
63c
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58aa4a3f65bb5588c8675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58aa4a3f65bb5588c8=
676
        new failure (last pass: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58a176a7522423f8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58a176a7522423f8c8=
630
        new failure (last pass: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e5835785bf95c9978c867b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e5835785bf95c9978c8=
67c
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e5870eba484b039b8c8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e5870eba484b039b8c8=
661
        failing since 56 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e585927f1447274e8c8675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e585927f1447274e8c8=
676
        failing since 56 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58ade86974acb738c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk339=
9-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk339=
9-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58ade86974acb738c8=
650
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58aee233030ce2b8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58aee233030ce2b8c8=
631
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58b2ce1b915db038c86b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50=
i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50=
i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58b2ce1b915db038c8=
6b5
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58bf79421fdb18e8c86fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58bf79421fdb18e8c8=
6fc
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e5897487a62cd5898c8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e5897487a62cd5898c8=
655
        failing since 112 days (last pass: v6.0-10339-g565da9e84d8f, first =
fail: v6.1-rc1-192-gdfe701541ba9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58a3d66d48b96a68c8741

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun=
50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun=
50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58a3d66d48b96a68c8=
742
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58b2e714412f9118c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58b2e714412f9118c8=
642
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58aca90b9738e698c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50=
i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50=
i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58aca90b9738e698c8=
631
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e58a57f42033e8c98c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-su=
n50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-su=
n50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e58a57f42033e8c98c8=
650
        failing since 2 days (last pass: v6.2-rc7-120-g11b3628314a5, first =
fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e586828f6a70f0cf8c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc7-23=
3-gd885c5e298888/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e586828f6a70f0cf8c8=
652
        failing since 56 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
