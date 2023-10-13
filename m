Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A15937C85FE
	for <lists+linux-next@lfdr.de>; Fri, 13 Oct 2023 14:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjJMMpg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Oct 2023 08:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjJMMpf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Oct 2023 08:45:35 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6ECF91
        for <linux-next@vger.kernel.org>; Fri, 13 Oct 2023 05:45:30 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c9b70b9656so14841685ad.1
        for <linux-next@vger.kernel.org>; Fri, 13 Oct 2023 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697201130; x=1697805930; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JoNXd9csjN+eklUCP7eT6lIax399uY50ZjT+2KNq/40=;
        b=2/G75f3UcwUPfOcqx8kZvFuuk94CGUG/yyP17tzecywogy7L9p9odpbZJwNY5ZLBQm
         kcdT2ezY7C0Bu1JplcwpcCeegYCdjBcYgkY8gpDQBtq890RxA3SbkNKqb9c61DuHq7Vb
         XW7v3Jbxp0LFoWQhvs6oEkUEpp6jNjGegoEqstmF8YJzytXfgLFF30BGrTs7eDpw7RH9
         slJlyzdcMA5HA1l2G57kQNPtXU+tgwbXIH0KqmkCcSsL9BfyEHTpRd4n0FSzv6ygCIXx
         azk6M2Ze5AFNKusAC7Hg0UIVlWyGac0zDhgHdeRNAeWAYVal9WPNP5Q5HJu+V20cokMK
         FdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697201130; x=1697805930;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoNXd9csjN+eklUCP7eT6lIax399uY50ZjT+2KNq/40=;
        b=kpYTKcagEGRN6diprOfbosRauR1yFmpUxeA7rda6GQ100Zau8QvMKpz9wb+xcbIZIt
         aIV8G2iCtogYWKG8YP3nOyqZYKQTJStX/KyHNw8zU8k9+tiIvQI4hIOIbNiTNmTKJSd0
         ypAn1NMwfi6Vfjt8op5l22ZsxUUkchPn8e9HrbVEfi/HI7ctGJ1zVdjiDfoaMt+9pHWO
         gd0AL8ikywrjJRTWsv/3nOfA7QP2463nDqN5OhucYQBezZzHsAqVp9kFmPktAzCU61w6
         8etKXobzlQpwKPURR/9oePZn7uNQzLIC1QebI2gxSH9CeLrA9S1C36AUJrrR810WU8v4
         KI2w==
X-Gm-Message-State: AOJu0YwPNO/oNpDHO9SJEPAVMDTTmvTs4Qj8yzMM61BJufkLp0exSmFr
        SDUMpjHJs05eG6l0zfisRINDrtzXilkvXyQBskGrfQ==
X-Google-Smtp-Source: AGHT+IFpSVWy7H6n+bXSvLhUhqbxN5O4yho/xph9ILgPjBB7r7S52iPz4yfWgeR86HHKNdEhi400+g==
X-Received: by 2002:a17:903:11d2:b0:1b8:8b72:fa28 with SMTP id q18-20020a17090311d200b001b88b72fa28mr28394225plh.58.1697201129288;
        Fri, 13 Oct 2023 05:45:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902bd0500b001b891259eddsm3768798pls.197.2023.10.13.05.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 05:45:28 -0700 (PDT)
Message-ID: <65293be8.170a0220.d203e.b725@mx.google.com>
Date:   Fri, 13 Oct 2023 05:45:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231013
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 334 runs, 29 regressions (next-20231013)
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

next/master baseline: 334 runs, 29 regressions (next-20231013)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+videodec           | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231013/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231013
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e3b18f7200f45d66f7141136c25554ac1e82009b =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fa17e3a9443358efcf12

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6528fa17e3a9443358efcf27
        failing since 44 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-10-13T08:04:19.943010  + <8>[    8.341886] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11758672_1.4.2.3.1>

    2023-10-13T08:04:19.943186  set +x

    2023-10-13T08:04:20.048109  / # #

    2023-10-13T08:04:20.150369  export SHELL=3D/bin/sh

    2023-10-13T08:04:20.151066  #

    2023-10-13T08:04:20.252548  / # export SHELL=3D/bin/sh. /lava-11758672/=
environment

    2023-10-13T08:04:20.253305  =


    2023-10-13T08:04:20.354705  / # . /lava-11758672/environment/lava-11758=
672/bin/lava-test-runner /lava-11758672/1

    2023-10-13T08:04:20.355201  =


    2023-10-13T08:04:20.359604  / # /lava-11758672/bin/lava-test-runner /la=
va-11758672/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/6528fa8dcabad77acdefcf0c

  Results:     17 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
528fa8dcabad77acdefcf1f
        new failure (last pass: next-20231011)

    2023-10-13T08:06:16.151036  /usr/bin/tpm2_getcap

    2023-10-13T08:06:19.701783  <6>[   15.377631] udevd (123) used greatest=
 stack depth: 13224 bytes left

    2023-10-13T08:06:19.708085  <6>[   15.384484] udevd (120) used greatest=
 stack depth: 12848 bytes left

    2023-10-13T08:06:26.371278  /lava-11758705/1/../bin/lava-test-case

    2023-10-13T08:06:26.378036  <8>[   22.052010] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6528fa8dcabad77acdefcf21
        failing since 44 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-10-13T08:06:14.674028  <8>[   10.347670] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-10-13T08:06:14.680119  + <8>[   10.356649] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11758705_1.4.2.3.1>

    2023-10-13T08:06:14.681051  set +x

    2023-10-13T08:06:14.784415  /#

    2023-10-13T08:06:14.885256   # #export SHELL=3D/bin/sh

    2023-10-13T08:06:14.885464  =


    2023-10-13T08:06:14.986010  / # export SHELL=3D/bin/sh. /lava-11758705/=
environment

    2023-10-13T08:06:14.986262  =


    2023-10-13T08:06:15.086858  / # . /lava-11758705/environment/lava-11758=
705/bin/lava-test-runner /lava-11758705/1

    2023-10-13T08:06:15.087148  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fa1b82c2c886e9efcf03

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6528fa1b82c2c886e9efcf18
        failing since 44 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-10-13T08:04:35.162742  + <8>[   10.976773] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11758736_1.4.2.3.1>

    2023-10-13T08:04:35.162849  set +x

    2023-10-13T08:04:35.266640  / # #

    2023-10-13T08:04:35.367145  export SHELL=3D/bin/sh

    2023-10-13T08:04:35.367324  #

    2023-10-13T08:04:35.467822  / # export SHELL=3D/bin/sh. /lava-11758736/=
environment

    2023-10-13T08:04:35.468004  =


    2023-10-13T08:04:35.568495  / # . /lava-11758736/environment/lava-11758=
736/bin/lava-test-runner /lava-11758736/1

    2023-10-13T08:04:35.568855  =


    2023-10-13T08:04:35.573397  / # /lava-11758736/bin/lava-test-runner /la=
va-11758736/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fd8cc276f4d8e9efcf34

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6528fd8cc276f4d8e9efcf3d
        failing since 10 days (last pass: next-20230707, first fail: next-2=
0231003)

    2023-10-13T08:19:03.060677  / # #
    2023-10-13T08:19:04.215452  export SHELL=3D/bin/sh
    2023-10-13T08:19:04.221006  #
    2023-10-13T08:19:05.760638  / # export SHELL=3D/bin/sh. /lava-3803646/e=
nvironment
    2023-10-13T08:19:05.766164  =

    2023-10-13T08:19:08.573713  / # . /lava-3803646/environment/lava-380364=
6/bin/lava-test-runner /lava-3803646/1
    2023-10-13T08:19:08.579408  =

    2023-10-13T08:19:08.579606  / # /lava-3803646/bin/lava<3>[   21.388534]=
 caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance
    2023-10-13T08:19:08.583239  -test-runner /lava-3803646/1
    2023-10-13T08:19:08.653191  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6529005c18b1be1670efcef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6529005c18b1be1670efcefc
        failing since 10 days (last pass: next-20230717, first fail: next-2=
0231003)

    2023-10-13T08:31:05.449545  / # #
    2023-10-13T08:31:06.603532  export SHELL=3D/bin/sh
    2023-10-13T08:31:06.608909  #
    2023-10-13T08:31:08.148457  / # export SHELL=3D/bin/sh. /lava-3803666/e=
nvironment
    2023-10-13T08:31:08.153849  =

    2023-10-13T08:31:10.961579  / # . /lava-3803666/environment/lava-380366=
6/bin/lava-test-runner /lava-3803666/1
    2023-10-13T08:31:10.967237  =

    2023-10-13T08:31:10.967443  / # /lava-3803666/bin/lava<3>[   22.412882]=
 caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance
    2023-10-13T08:31:10.968554  -test-runner /lava-3803666/1
    2023-10-13T08:31:11.041472  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fe506d8f2728aaefceff

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6528fe506d8f2728aaefcf08
        failing since 58 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-13T08:22:21.996879  + set<8>[   28.230891] <LAVA_SIGNAL_ENDRUN =
0_dmesg 168683_1.5.2.4.1>
    2023-10-13T08:22:22.000802   +x
    2023-10-13T08:22:22.107898  / # #
    2023-10-13T08:22:23.274029  export SHELL=3D/bin/sh
    2023-10-13T08:22:23.280161  #
    2023-10-13T08:22:24.779029  / # export SHELL=3D/bin/sh. /lava-168683/en=
vironment
    2023-10-13T08:22:24.785112  =

    2023-10-13T08:22:27.507844  / # . /lava-168683/environment/lava-168683/=
bin/lava-test-runner /lava-168683/1
    2023-10-13T08:22:27.514679  =

    2023-10-13T08:22:27.518867  / # /lava-168683/bin/lava-test-runner /lava=
-168683/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65290184cecba6c203efcf59

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65290184cecba6c203efcf62
        failing since 58 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-13T08:35:58.792590  + set<8>[   27.255804] <LAVA_SIGNAL_ENDRUN =
0_dmesg 168727_1.5.2.4.1>
    2023-10-13T08:35:58.793213   +x
    2023-10-13T08:35:58.901758  / # #
    2023-10-13T08:36:00.065645  export SHELL=3D/bin/sh
    2023-10-13T08:36:00.071543  #
    2023-10-13T08:36:01.570201  / # export SHELL=3D/bin/sh. /lava-168727/en=
vironment
    2023-10-13T08:36:01.576273  =

    2023-10-13T08:36:04.296604  / # . /lava-168727/environment/lava-168727/=
bin/lava-test-runner /lava-168727/1
    2023-10-13T08:36:04.303346  =

    2023-10-13T08:36:04.311414  / # /lava-168727/bin/lava-test-runner /lava=
-168727/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528f515b7d67ae2cdefcf5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528f515b7d67ae2cdefc=
f5d
        failing since 247 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fe78d602e0fc7fefcf73

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fe78d602e0fc7fefc=
f74
        failing since 247 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fe7ec01341f0f2efcf11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fe7ec01341f0f2efc=
f12
        failing since 261 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fe74c01341f0f2efcf0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fe74c01341f0f2efc=
f0d
        failing since 261 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fdf8b928943f3eefcef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fdf8b928943f3eefc=
ef6
        failing since 261 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fe7bd7ff816d6eefcf6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fe7bd7ff816d6eefc=
f70
        failing since 247 days (last pass: next-20230203, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fe22d602e0fc7fefcefe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fe22d602e0fc7fefc=
eff
        failing since 247 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fd73c276f4d8e9efcf0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fd73c276f4d8e9efc=
f0c
        failing since 247 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fdffa217058be0efcf22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fdffa217058be0efc=
f23
        failing since 247 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6529192e5135d89c78efcef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6529192e5135d89c78efcefa
        failing since 66 days (last pass: next-20230710, first fail: next-2=
0230808)

    2023-10-13T10:16:52.447828  + set +x
    2023-10-13T10:16:52.451031  <8>[   28.616504] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1020455_1.5.2.4.1>
    2023-10-13T10:16:52.560137  / # #
    2023-10-13T10:16:54.024550  export SHELL=3D/bin/sh
    2023-10-13T10:16:54.045508  #
    2023-10-13T10:16:54.045977  / # export SHELL=3D/bin/sh
    2023-10-13T10:16:56.003897  / # . /lava-1020455/environment
    2023-10-13T10:16:59.605526  /lava-1020455/bin/lava-test-runner /lava-10=
20455/1
    2023-10-13T10:16:59.627110  . /lava-1020455/environment
    2023-10-13T10:16:59.627533  / # /lava-1020455/bin/lava-test-runner /lav=
a-1020455/1 =

    ... (27 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fd9ad58e799c79efcf1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fd9ad58e799c79efc=
f1c
        failing since 247 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fd8ea8bcf872a5efcf02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fd8ea8bcf872a5efc=
f03
        failing since 247 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fe2ec01341f0f2efcef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fe2ec01341f0f2efc=
ef5
        failing since 247 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fd9ca8bcf872a5efcf0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plu=
s.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fd9ca8bcf872a5efc=
f0f
        new failure (last pass: next-20230125) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fd9bd58e799c79efcf1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fd9bd58e799c79efc=
f1f
        failing since 245 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fe12021b5eedb0efcef5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6528fe12021b5eedb0efcefe
        failing since 3 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20231010)

    2023-10-13T08:21:15.109642  / # #
    2023-10-13T08:21:15.211419  export SHELL=3D/bin/sh
    2023-10-13T08:21:15.212010  #
    2023-10-13T08:21:15.313001  / # export SHELL=3D/bin/sh. /lava-438310/en=
vironment
    2023-10-13T08:21:15.313598  =

    2023-10-13T08:21:15.414611  / # . /lava-438310/environment/lava-438310/=
bin/lava-test-runner /lava-438310/1
    2023-10-13T08:21:15.415550  =

    2023-10-13T08:21:15.419797  / # /lava-438310/bin/lava-test-runner /lava=
-438310/1
    2023-10-13T08:21:15.492803  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-13T08:21:15.493203  + cd /lava-438310/<8>[   19.164860] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 438310_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe    | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6529002fe887ddda9defcef9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6529002fe887ddda9defcf02
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-13T08:30:15.608244  / # #
    2023-10-13T08:30:15.709597  export SHELL=3D/bin/sh
    2023-10-13T08:30:15.710152  #
    2023-10-13T08:30:15.810972  / # export SHELL=3D/bin/sh. /lava-438316/en=
vironment
    2023-10-13T08:30:15.811543  =

    2023-10-13T08:30:15.912321  / # . /lava-438316/environment/lava-438316/=
bin/lava-test-runner /lava-438316/1
    2023-10-13T08:30:15.913220  =

    2023-10-13T08:30:15.919421  / # /lava-438316/bin/lava-test-runner /lava=
-438316/1
    2023-10-13T08:30:15.951485  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-13T08:30:15.992739  + cd /lava-438316/<8>[   19.214719] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 438316_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fd6b47e65c6ab1efcf2e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6528fd6b47e65c6ab1efcf37
        failing since 3 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20231010)

    2023-10-13T08:23:01.895096  / # #

    2023-10-13T08:23:01.997220  export SHELL=3D/bin/sh

    2023-10-13T08:23:01.997919  #

    2023-10-13T08:23:02.099295  / # export SHELL=3D/bin/sh. /lava-11758845/=
environment

    2023-10-13T08:23:02.100038  =


    2023-10-13T08:23:02.201475  / # . /lava-11758845/environment/lava-11758=
845/bin/lava-test-runner /lava-11758845/1

    2023-10-13T08:23:02.202547  =


    2023-10-13T08:23:02.204741  / # /lava-11758845/bin/lava-test-runner /la=
va-11758845/1

    2023-10-13T08:23:02.286882  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-13T08:23:02.287388  + cd /lava-11758845/1/tests/1_boot<8>[   17=
.373419] <LAVA_SIGNAL_STARTRUN 1_bootrr 11758845_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fd8fd58e799c79efcef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fd8fd58e799c79efc=
ef5
        failing since 245 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/652900600fe61b201cefcef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652900600fe61b201cefcefc
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-13T08:35:28.165589  / # #

    2023-10-13T08:35:28.267781  export SHELL=3D/bin/sh

    2023-10-13T08:35:28.268502  #

    2023-10-13T08:35:28.369914  / # export SHELL=3D/bin/sh. /lava-11758882/=
environment

    2023-10-13T08:35:28.370634  =


    2023-10-13T08:35:28.472035  / # . /lava-11758882/environment/lava-11758=
882/bin/lava-test-runner /lava-11758882/1

    2023-10-13T08:35:28.473137  =


    2023-10-13T08:35:28.489737  / # /lava-11758882/bin/lava-test-runner /la=
va-11758882/1

    2023-10-13T08:35:28.557793  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-13T08:35:28.558309  + cd /lava-1175888<8>[   18.799372] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11758882_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6528fd6dc276f4d8e9efcf05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231013/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6528fd6dc276f4d8e9efc=
f06
        failing since 127 days (last pass: next-20230605, first fail: next-=
20230608) =

 =20
