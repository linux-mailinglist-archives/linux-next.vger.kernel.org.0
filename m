Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85CA7AEBEC
	for <lists+linux-next@lfdr.de>; Tue, 26 Sep 2023 13:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234614AbjIZLvq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Sep 2023 07:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234572AbjIZLve (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Sep 2023 07:51:34 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8111410CF
        for <linux-next@vger.kernel.org>; Tue, 26 Sep 2023 04:51:11 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c5bf7871dcso64394365ad.1
        for <linux-next@vger.kernel.org>; Tue, 26 Sep 2023 04:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695729070; x=1696333870; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Wat/GO4+YIz5WKEHtSBiLy8oh2UoYCQp443X1p1UGs=;
        b=SSyX055v1D701QDVupZw4iqlCEcqYSgtG5hVNz/z/QI9XWnjtr+yPC8AS99m2m9pMQ
         oeWJvy8FwPTvf1rx7bAuYy1Bf5ZdSvTb7LD8saBxwBLTNxLYumwvpkZA6QdDN6qRt4ho
         yGR0tH68jLzCxYZ8vlGjJUIu2+iYhZ3XYycKWW6lPLfFZ2LwUQAhE+/Z+0iOGrcDiU8a
         j9HlKdhPmQFjycX447umI7oBrUjzXm6S1adBGLRG0GFZN2o/UdqpDQFmI5q+fDMmxGCC
         Fcj1PkUiC2JUB1uyYJb28LoAb9CtPSLEusqn+W+sfoQ+VDDfzKiUyr5xH2EYNm8A3PY5
         Ut5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695729070; x=1696333870;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Wat/GO4+YIz5WKEHtSBiLy8oh2UoYCQp443X1p1UGs=;
        b=to6898AtDwAvkqvp+5sn82hYuA7B1MEv4ZJEl8wZiKqBD04Nj5/o3WuXHhUT6O2+TF
         tl8cBXj4UwsI+VskzcBteU+nWSZ6mAvYOQ3M6/cCD6z8sr8ZL9OF+nLiIDS0BcByVE0k
         BkiZBqiXGiCgrS6aOU3L/RFt0Vjs6sPDvRZb/XNeHmoTYyyi+UnCVCVScUmcXEKYFmta
         vPtst7weCAGmQd8BaOtqehO4HIgyOL9NXs+yZlsOgw6H1OsqxVkpSZekCTvUuPHKI1+n
         XDs5Z00cLsx0jG1BAk8ryIaBrj7zg9Oyvrk4fFTc/RGB/GS+C3Nm+vpPF7raVmzhGja1
         +AAQ==
X-Gm-Message-State: AOJu0YzLZggyxU0ZWeLPuAjHYSFMX0U50Lfq2pl8EanqIYob1rhbwxlM
        VB57u2sSkcmidePkdLpsblaQ/667Dr8Ph6GTDK5HGA==
X-Google-Smtp-Source: AGHT+IFk6tSFQ44odbf4+iD4i2QyOuPdLnVyIX3uJHmwFnJ2vK0VfqBJQh8alNFU6xflGu8VADm/eA==
X-Received: by 2002:a17:902:d505:b0:1c5:9f52:6a5b with SMTP id b5-20020a170902d50500b001c59f526a5bmr8762982plg.42.1695729070323;
        Tue, 26 Sep 2023 04:51:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i16-20020a17090332d000b001c6189ce950sm4386961plr.188.2023.09.26.04.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 04:51:09 -0700 (PDT)
Message-ID: <6512c5ad.170a0220.714e4.ce66@mx.google.com>
Date:   Tue, 26 Sep 2023 04:51:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230926
X-Kernelci-Report-Type: test
Subject: next/master baseline: 281 runs, 8 regressions (next-20230926)
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

next/master baseline: 281 runs, 8 regressions (next-20230926)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
acer-R721T-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

hp-11A-G6-EE-grunt       | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

hp-14-db0003na-grunt     | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

imx8mm-innocomm-wb15-evk | arm64  | lab-pengutronix | gcc-10   | defconfig =
                   | 1          =

imx8mp-evk               | arm64  | lab-broonie     | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64  | lab-broonie     | gcc-10   | defconfig+=
videodec           | 1          =

imx8mp-evk               | arm64  | lab-broonie     | gcc-10   | defconfig =
                   | 1          =

r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip         | gcc-10   | defconfig+=
videodec           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230926/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230926
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4ae73bba62a367f2314f6ce69e3085a941983d8b =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
acer-R721T-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651292a07fcf7a41088a0ab0

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230926/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230926/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651292a07fcf7a41088a0ac5
        failing since 28 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-26T08:12:57.357505  + <8>[   10.741762] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11618803_1.4.2.3.1>

    2023-09-26T08:12:57.357612  set +x

    2023-09-26T08:12:57.462252  / # #

    2023-09-26T08:12:57.563530  export SHELL=3D/bin/sh

    2023-09-26T08:12:57.564370  #

    2023-09-26T08:12:57.666061  / # export SHELL=3D/bin/sh. /lava-11618803/=
environment

    2023-09-26T08:12:57.666974  =


    2023-09-26T08:12:57.768715  / # . /lava-11618803/environment/lava-11618=
803/bin/lava-test-runner /lava-11618803/1

    2023-09-26T08:12:57.770466  =


    2023-09-26T08:12:57.775119  / # /lava-11618803/bin/lava-test-runner /la=
va-11618803/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
hp-11A-G6-EE-grunt       | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651291f76e33cddb138a0a6d

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230926/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230926/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651291f76e33cddb138a0a82
        failing since 28 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-26T08:11:45.659689  + <8>[   10.434146] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11618820_1.4.2.3.1>

    2023-09-26T08:11:45.659807  set +x

    2023-09-26T08:11:45.764586  / # #

    2023-09-26T08:11:45.865321  export SHELL=3D/bin/sh

    2023-09-26T08:11:45.865499  #

    2023-09-26T08:11:45.965983  / # export SHELL=3D/bin/sh. /lava-11618820/=
environment

    2023-09-26T08:11:45.966186  =


    2023-09-26T08:11:46.066712  / # . /lava-11618820/environment/lava-11618=
820/bin/lava-test-runner /lava-11618820/1

    2023-09-26T08:11:46.067127  =


    2023-09-26T08:11:46.071421  / # /lava-11618820/bin/lava-test-runner /la=
va-11618820/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
hp-14-db0003na-grunt     | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/651292825e7bfdc5ca8a0a5a

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230926/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230926/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/651292825e7bfdc5ca8a0a6f
        failing since 28 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-26T08:12:32.666997  + <8>[   11.253218] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11618825_1.4.2.3.1>

    2023-09-26T08:12:32.667556  set +x

    2023-09-26T08:12:32.775302  / # #

    2023-09-26T08:12:32.877765  export SHELL=3D/bin/sh

    2023-09-26T08:12:32.878541  #

    2023-09-26T08:12:32.980136  / # export SHELL=3D/bin/sh. /lava-11618825/=
environment

    2023-09-26T08:12:32.980917  =


    2023-09-26T08:12:33.082563  / # . /lava-11618825/environment/lava-11618=
825/bin/lava-test-runner /lava-11618825/1

    2023-09-26T08:12:33.083831  =


    2023-09-26T08:12:33.089048  / # /lava-11618825/bin/lava-test-runner /la=
va-11618825/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mm-innocomm-wb15-evk | arm64  | lab-pengutronix | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65128d3d4988d89e8f8a0a50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230926/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230926/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65128d3d4988d89e8f8a0=
a51
        new failure (last pass: next-20230921) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk               | arm64  | lab-broonie     | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6512881887694f89898a0a4d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230926/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230926/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6512881887694f89898a0a56
        failing since 41 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-26T07:28:13.007522  + set<8>[   28.117296] <LAVA_SIGNAL_ENDRUN =
0_dmesg 132042_1.5.2.4.1>
    2023-09-26T07:28:13.008115   +x
    2023-09-26T07:28:13.116497  / # #
    2023-09-26T07:28:14.282087  export SHELL=3D/bin/sh
    2023-09-26T07:28:14.288201  #
    2023-09-26T07:28:15.786616  / # export SHELL=3D/bin/sh. /lava-132042/en=
vironment
    2023-09-26T07:28:15.792646  =

    2023-09-26T07:28:18.511570  / # . /lava-132042/environment/lava-132042/=
bin/lava-test-runner /lava-132042/1
    2023-09-26T07:28:18.518252  =

    2023-09-26T07:28:18.526183  / # /lava-132042/bin/lava-test-runner /lava=
-132042/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk               | arm64  | lab-broonie     | gcc-10   | defconfig+=
videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65128ad4f1c5e8be288a0a6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230926/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230926/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65128ad4f1c5e8be288a0a76
        failing since 41 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-26T07:39:42.484471  + set<8>[   27.296950] <LAVA_SIGNAL_ENDRUN =
0_dmesg 132079_1.5.2.4.1>
    2023-09-26T07:39:42.485107   +x
    2023-09-26T07:39:42.594380  / # #
    2023-09-26T07:39:43.756539  export SHELL=3D/bin/sh
    2023-09-26T07:39:43.762679  #
    2023-09-26T07:39:45.257987  / # export SHELL=3D/bin/sh. /lava-132079/en=
vironment
    2023-09-26T07:39:45.263643  =

    2023-09-26T07:39:47.978237  / # . /lava-132079/environment/lava-132079/=
bin/lava-test-runner /lava-132079/1
    2023-09-26T07:39:47.984488  =

    2023-09-26T07:39:47.987973  / # /lava-132079/bin/lava-test-runner /lava=
-132079/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
imx8mp-evk               | arm64  | lab-broonie     | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/65128d406602cb15268a0abf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230926/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230926/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65128d406602cb15268a0ac8
        failing since 41 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-26T07:50:04.931532  <8>[   27.661046] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-09-26T07:50:04.934776  + set<8>[   27.670616] <LAVA_SIGNAL_ENDRUN =
0_dmesg 132114_1.5.2.4.1>
    2023-09-26T07:50:04.935353   +x
    2023-09-26T07:50:05.044239  / # #
    2023-09-26T07:50:06.209993  export SHELL=3D/bin/sh
    2023-09-26T07:50:06.216103  #
    2023-09-26T07:50:07.714776  / # export SHELL=3D/bin/sh. /lava-132114/en=
vironment
    2023-09-26T07:50:07.720921  =

    2023-09-26T07:50:10.444173  / # . /lava-132114/environment/lava-132114/=
bin/lava-test-runner /lava-132114/1
    2023-09-26T07:50:10.450825   =

    ... (14 line(s) more)  =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip         | gcc-10   | defconfig+=
videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/65128c13100b8a03ec8a0a83

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230926/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230926/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65128c13100b8a03ec8a0a8a
        failing since 49 days (last pass: next-20230710, first fail: next-2=
0230808)

    2023-09-26T07:44:57.096641  + set +x
    2023-09-26T07:44:57.099885  <8>[   28.266914] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1013161_1.5.2.4.1>
    2023-09-26T07:44:57.207087  / # #
    2023-09-26T07:44:58.669564  export SHELL=3D/bin/sh
    2023-09-26T07:44:58.690688  #
    2023-09-26T07:44:58.691159  / # export SHELL=3D/bin/sh
    2023-09-26T07:45:00.649098  / # . /lava-1013161/environment
    2023-09-26T07:45:04.250668  /lava-1013161/bin/lava-test-runner /lava-10=
13161/1
    2023-09-26T07:45:04.272136  . /lava-1013161/environment
    2023-09-26T07:45:04.272620  / # /lava-1013161/bin/lava-test-runner /lav=
a-1013161/1 =

    ... (27 line(s) more)  =

 =20
