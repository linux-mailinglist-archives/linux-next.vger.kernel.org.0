Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E12D97B00BC
	for <lists+linux-next@lfdr.de>; Wed, 27 Sep 2023 11:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjI0JlN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Sep 2023 05:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjI0JlM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Sep 2023 05:41:12 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5BCEB
        for <linux-next@vger.kernel.org>; Wed, 27 Sep 2023 02:41:06 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-690d8fb3b7eso9594074b3a.1
        for <linux-next@vger.kernel.org>; Wed, 27 Sep 2023 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695807665; x=1696412465; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1B4BQh8L1QihSsLyOCbtonc9tZU7LKY8Q60j9ihZ+/E=;
        b=hL68OETiWdxPLMnuRuILeT2qwwMzpa4Wxj5Tel5aQe5JaPIhlFvMlsDxmjgnDQ1QAM
         w3ekp9rQYgRYWAafLFKNLHvSWM+55XlbFvY6z5oDAsUO7y90FTPzZFQFGhKWaG2lYDsy
         3We8bnKNFXtumpS2vgrKjKqEWiI7Eiaa8DaR0nsmdcJRudywgJL+e9hM/oMRP83AXuId
         W5Nf9uxZu+NW/i2oNP+BrI6R1F0OA4vmhV8ithzjVHMOMjZtVClRlQZPQGGleztzk8J6
         ei9+XTEYvrnviP/ScRZ2jlSENcq9VVbQvQnizh8RFTvmdxgGODJLhwOzvjCfIJElyWd1
         0j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695807665; x=1696412465;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1B4BQh8L1QihSsLyOCbtonc9tZU7LKY8Q60j9ihZ+/E=;
        b=EpOg1Ebg3nOmw3UDUPQD9wAHZeXy3ylV3UVkxTDvDOXEhmC3oRF3g/9yf9A9yBJ7Ox
         Rv2qz0+hPQ2lI4cFdC+aCzt2tV8IhZoB8Jom2n4VYhJ00amv9h/OYgR9uDtVNigthkLn
         yFxegntRoSSpLDAUXeVspyZiTbmPyQM+egMsYTVLNFg+QLBVQFqbnTDu7h9SOIJgLmGy
         znljaSpXandF4iCJvU/C4vBUnPFoNvS/PxDoGkTo9K9uakTjPd0dZPaOgXseXd+IOL5c
         8Y0KjgtmbPAusDCzsDJcEgjQp80gZuNoMZdTz1z4PR/XEwx5WsU035x2Nw1/13pgcfzn
         QF5A==
X-Gm-Message-State: AOJu0Yx3I7jS9c3wR0Okgm9EXbvRt7O/vNMKOaJIyxlpa93UB0rrPNj/
        glAOSFWcZ+k6Ynu0Y+VKKU0zDK1ZZvV0yxESUOSbXQ==
X-Google-Smtp-Source: AGHT+IFogdhoSVBhR923T7kXHJXsewbaA0qxBVNkNdFT4oYhP+/5KX5vxurse5iIUWODnQ+VejSJ3w==
X-Received: by 2002:a05:6a00:8d1:b0:68f:bb02:fdf with SMTP id s17-20020a056a0008d100b0068fbb020fdfmr1589926pfu.27.1695807665286;
        Wed, 27 Sep 2023 02:41:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fa19-20020a056a002d1300b006926a2c9eb7sm11028741pfb.119.2023.09.27.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:41:04 -0700 (PDT)
Message-ID: <6513f8b0.050a0220.1daf3.df97@mx.google.com>
Date:   Wed, 27 Sep 2023 02:41:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230927
X-Kernelci-Report-Type: test
Subject: next/master baseline: 322 runs, 16 regressions (next-20230927)
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

next/master baseline: 322 runs, 16 regressions (next-20230927)

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

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+vi=
deodec           | 1          =

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig   =
                 | 1          =

imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m       | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 1          =

qemu_mips-malta          | mips   | lab-collabora | gcc-10   | malta_defcon=
fig              | 1          =

r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip       | clang-17 | defconfig   =
                 | 1          =

r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip       | gcc-10   | defconfig+vi=
deodec           | 1          =

r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874           | arm64  | lab-cip       | clang-17 | defconfig   =
                 | 1          =

r8a77960-ulcb            | arm64  | lab-collabora | clang-17 | defconfig   =
                 | 1          =

r8a779m1-ulcb            | arm64  | lab-collabora | clang-17 | defconfig   =
                 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230927/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230927
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      18030226a48de1fbfabf4ae16aaa2695a484254f =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
acer-R721T-grunt         | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6513bbbd766173c2c98a0aac

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513bbbd766173c2c98a0ac1
        failing since 28 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-27T05:20:38.803099  + <8>[   10.641917] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11625563_1.4.2.3.1>

    2023-09-27T05:20:38.803555  set +x

    2023-09-27T05:20:38.911592  / # #

    2023-09-27T05:20:39.014044  export SHELL=3D/bin/sh

    2023-09-27T05:20:39.014882  #

    2023-09-27T05:20:39.116587  / # export SHELL=3D/bin/sh. /lava-11625563/=
environment

    2023-09-27T05:20:39.117368  =


    2023-09-27T05:20:39.219199  / # . /lava-11625563/environment/lava-11625=
563/bin/lava-test-runner /lava-11625563/1

    2023-09-27T05:20:39.220588  =


    2023-09-27T05:20:39.226026  / # /lava-11625563/bin/lava-test-runner /la=
va-11625563/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
hp-11A-G6-EE-grunt       | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6513bb9ab160bea94e8a0b0b

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513bb9ab160bea94e8a0b20
        failing since 28 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-27T05:20:10.171493  + <8>[   10.686975] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11625514_1.4.2.3.1>

    2023-09-27T05:20:10.171609  set +x

    2023-09-27T05:20:10.276072  / # #

    2023-09-27T05:20:10.376645  export SHELL=3D/bin/sh

    2023-09-27T05:20:10.376854  #

    2023-09-27T05:20:10.477391  / # export SHELL=3D/bin/sh. /lava-11625514/=
environment

    2023-09-27T05:20:10.477603  =


    2023-09-27T05:20:10.578138  / # . /lava-11625514/environment/lava-11625=
514/bin/lava-test-runner /lava-11625514/1

    2023-09-27T05:20:10.578427  =


    2023-09-27T05:20:10.583316  / # /lava-11625514/bin/lava-test-runner /la=
va-11625514/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
hp-14-db0003na-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6513bb8dcc38b30e788a0a57

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513bb8dcc38b30e788a0a6c
        failing since 28 days (last pass: next-20230823, first fail: next-2=
0230829)

    2023-09-27T05:19:57.928409  + <8>[   11.258439] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11625552_1.4.2.3.1>

    2023-09-27T05:19:57.928836  set +x

    2023-09-27T05:19:58.036390  / # #

    2023-09-27T05:19:58.138400  export SHELL=3D/bin/sh

    2023-09-27T05:19:58.139033  #

    2023-09-27T05:19:58.240410  / # export SHELL=3D/bin/sh. /lava-11625552/=
environment

    2023-09-27T05:19:58.241091  =


    2023-09-27T05:19:58.342488  / # . /lava-11625552/environment/lava-11625=
552/bin/lava-test-runner /lava-11625552/1

    2023-09-27T05:19:58.343687  =


    2023-09-27T05:19:58.348221  / # /lava-11625552/bin/lava-test-runner /la=
va-11625552/1
 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | clang-17 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6513bb8fb160bea94e8a0af1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513bb8fb160bea94e8a0afa
        failing since 42 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-09-27T05:20:04.369145  + set<8>[   28.002968] <LAVA_SIGNAL_ENDRUN =
0_dmesg 134928_1.5.2.4.1>
    2023-09-27T05:20:04.383776   +x
    2023-09-27T05:20:04.487564  / # #
    2023-09-27T05:20:05.649149  export SHELL=3D/bin/sh
    2023-09-27T05:20:05.654675  #
    2023-09-27T05:20:07.147101  / # export SHELL=3D/bin/sh. /lava-134928/en=
vironment
    2023-09-27T05:20:07.152588  =

    2023-09-27T05:20:09.863111  / # . /lava-134928/environment/lava-134928/=
bin/lava-test-runner /lava-134928/1
    2023-09-27T05:20:09.868927  =

    2023-09-27T05:20:09.871495  / # /lava-134928/bin/lava-test-runner /lava=
-134928/1 =

    ... (13 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+vi=
deodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6513bc1b12eedbeffb8a0aa8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513bc1b12eedbeffb8a0ab1
        failing since 42 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-27T05:22:15.480443  + set<8>[   29.180735] <LAVA_SIGNAL_ENDRUN =
0_dmesg 134972_1.5.2.4.1>
    2023-09-27T05:22:15.480836   +x
    2023-09-27T05:22:15.587784  / # #
    2023-09-27T05:22:16.750624  export SHELL=3D/bin/sh
    2023-09-27T05:22:16.756366  #
    2023-09-27T05:22:18.250088  / # export SHELL=3D/bin/sh. /lava-134972/en=
vironment
    2023-09-27T05:22:18.256089  =

    2023-09-27T05:22:20.971294  / # . /lava-134972/environment/lava-134972/=
bin/lava-test-runner /lava-134972/1
    2023-09-27T05:22:20.977975  =

    2023-09-27T05:22:20.983604  / # /lava-134972/bin/lava-test-runner /lava=
-134972/1 =

    ... (13 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6513bca7510bbe88c58a0a80

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513bca7510bbe88c58a0a89
        failing since 42 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-27T05:24:35.511695  + set<8>[   29.474642] <LAVA_SIGNAL_ENDRUN =
0_dmesg 135019_1.5.2.4.1>
    2023-09-27T05:24:35.512230   +x
    2023-09-27T05:24:35.622625  / # #
    2023-09-27T05:24:36.785571  export SHELL=3D/bin/sh
    2023-09-27T05:24:36.791751  #
    2023-09-27T05:24:38.285702  / # export SHELL=3D/bin/sh. /lava-135019/en=
vironment
    2023-09-27T05:24:38.291656  =

    2023-09-27T05:24:41.006568  / # . /lava-135019/environment/lava-135019/=
bin/lava-test-runner /lava-135019/1
    2023-09-27T05:24:41.013352  =

    2023-09-27T05:24:41.017717  / # /lava-135019/bin/lava-test-runner /lava=
-135019/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6513bde70279c99a4a8a0a80

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513bde70279c99a4a8a0a89
        failing since 42 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-27T05:29:55.276072  + set<8>[   27.734620] <LAVA_SIGNAL_ENDRUN =
0_dmesg 135050_1.5.2.4.1>
    2023-09-27T05:29:55.276658   +x
    2023-09-27T05:29:55.384957  / # #
    2023-09-27T05:29:56.550342  export SHELL=3D/bin/sh
    2023-09-27T05:29:56.556447  #
    2023-09-27T05:29:58.055371  / # export SHELL=3D/bin/sh. /lava-135050/en=
vironment
    2023-09-27T05:29:58.061342  =

    2023-09-27T05:30:00.784953  / # . /lava-135050/environment/lava-135050/=
bin/lava-test-runner /lava-135050/1
    2023-09-27T05:30:00.791782  =

    2023-09-27T05:30:00.794665  / # /lava-135050/bin/lava-test-runner /lava=
-135050/1 =

    ... (13 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mp-evk               | arm64  | lab-broonie   | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6513c4c91d0b5848908a0a4e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513c4c91d0b5848908a0a57
        failing since 42 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-27T05:59:07.965937  + set<8>[   29.029413] <LAVA_SIGNAL_ENDRUN =
0_dmesg 135124_1.5.2.4.1>
    2023-09-27T05:59:07.966187   +x
    2023-09-27T05:59:08.070158  / # #
    2023-09-27T05:59:09.229969  export SHELL=3D/bin/sh
    2023-09-27T05:59:09.235437  #
    2023-09-27T05:59:10.727092  / # export SHELL=3D/bin/sh. /lava-135124/en=
vironment
    2023-09-27T05:59:10.732879  =

    2023-09-27T05:59:13.446280  / # . /lava-135124/environment/lava-135124/=
bin/lava-test-runner /lava-135124/1
    2023-09-27T05:59:13.452554  =

    2023-09-27T05:59:13.469188  / # /lava-135124/bin/lava-test-runner /lava=
-135124/1 =

    ... (13 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
kontron-pitx-imx8m       | arm64  | lab-kontron   | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6513be9305138c468b8a0a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6513be9305138c468b8a0=
a43
        new failure (last pass: next-20230926) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_mips-malta          | mips   | lab-collabora | gcc-10   | malta_defcon=
fig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6513b878ed902916558a0b8a

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6513b878ed90291=
6558a0b8e
        new failure (last pass: next-20230926)
        1 lines

    2023-09-27T05:06:43.913597  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 20fee44c, epc =3D=3D 802049ec, ra =3D=
=3D 8020723c
    2023-09-27T05:06:43.913812  =


    2023-09-27T05:06:43.956078  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-09-27T05:06:43.956307  =

   =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip       | clang-17 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6513bcdd273e7f8bbc8a0a8d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513bcdd273e7f8bbc8a0a94
        failing since 29 days (last pass: next-20230710, first fail: next-2=
0230828)

    2023-09-27T05:25:25.139724  + set +x
    2023-09-27T05:25:25.142971  <8>[   28.518084] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1013512_1.5.2.4.1>
    2023-09-27T05:25:25.253082  / # #
    2023-09-27T05:25:26.717247  export SHELL=3D/bin/sh
    2023-09-27T05:25:26.738213  #
    2023-09-27T05:25:26.738680  / # export SHELL=3D/bin/sh
    2023-09-27T05:25:28.695593  / # . /lava-1013512/environment
    2023-09-27T05:25:32.297625  /lava-1013512/bin/lava-test-runner /lava-10=
13512/1
    2023-09-27T05:25:32.319411  . /lava-1013512/environment
    2023-09-27T05:25:32.319836  / # /lava-1013512/bin/lava-test-runner /lav=
a-1013512/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip       | gcc-10   | defconfig+vi=
deodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6513bf84b4e6282f758a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513bf84b4e6282f758a0a49
        failing since 49 days (last pass: next-20230710, first fail: next-2=
0230808)

    2023-09-27T05:36:36.860572  + set +x
    2023-09-27T05:36:36.863776  <8>[   28.570764] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1013527_1.5.2.4.1>
    2023-09-27T05:36:36.970958  / # #
    2023-09-27T05:36:38.435641  export SHELL=3D/bin/sh
    2023-09-27T05:36:38.456622  #
    2023-09-27T05:36:38.457086  / # export SHELL=3D/bin/sh
    2023-09-27T05:36:40.413671  / # . /lava-1013527/environment
    2023-09-27T05:36:44.014643  /lava-1013527/bin/lava-test-runner /lava-10=
13527/1
    2023-09-27T05:36:44.036253  . /lava-1013527/environment
    2023-09-27T05:36:44.036715  / # /lava-1013527/bin/lava-test-runner /lav=
a-1013527/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64  | lab-cip       | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6513c7055db98150418a0a42

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513c7055db98150418a0a49
        failing since 57 days (last pass: next-20230712, first fail: next-2=
0230801)

    2023-09-27T06:08:40.065947  + set +x
    2023-09-27T06:08:40.069209  <8>[   28.545410] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1013587_1.5.2.4.1>
    2023-09-27T06:08:40.178108  / # #
    2023-09-27T06:08:41.642044  export SHELL=3D/bin/sh
    2023-09-27T06:08:41.662935  #
    2023-09-27T06:08:41.663391  / # export SHELL=3D/bin/sh
    2023-09-27T06:08:43.621274  / # . /lava-1013587/environment
    2023-09-27T06:08:47.222985  /lava-1013587/bin/lava-test-runner /lava-10=
13587/1
    2023-09-27T06:08:47.244414  . /lava-1013587/environment
    2023-09-27T06:08:47.244859  / # /lava-1013587/bin/lava-test-runner /lav=
a-1013587/1 =

    ... (27 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a774c0-ek874           | arm64  | lab-cip       | clang-17 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6513bac9947e6e8e758a0a4c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513bac9947e6e8e758a0a53
        failing since 62 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-27T05:16:34.947184  / # #
    2023-09-27T05:16:36.409596  export SHELL=3D/bin/sh
    2023-09-27T05:16:36.430297  #
    2023-09-27T05:16:36.430508  / # export SHELL=3D/bin/sh
    2023-09-27T05:16:38.386232  / # . /lava-1013513/environment
    2023-09-27T05:16:41.990815  /lava-1013513/bin/lava-test-runner /lava-10=
13513/1
    2023-09-27T05:16:42.011606  . /lava-1013513/environment
    2023-09-27T05:16:42.011717  / # /lava-1013513/bin/lava-test-runner /lav=
a-1013513/1
    2023-09-27T05:16:42.104952  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-27T05:16:42.105234  + cd /lava-1013513/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a77960-ulcb            | arm64  | lab-collabora | clang-17 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6513f5d6638544372d8a0a58

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513f5d6638544372d8a0a61
        failing since 62 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-27T09:33:02.309847  / # #

    2023-09-27T09:33:02.411974  export SHELL=3D/bin/sh

    2023-09-27T09:33:02.412681  #

    2023-09-27T09:33:02.514097  / # export SHELL=3D/bin/sh. /lava-11625473/=
environment

    2023-09-27T09:33:02.514808  =


    2023-09-27T09:33:02.616230  / # . /lava-11625473/environment/lava-11625=
473/bin/lava-test-runner /lava-11625473/1

    2023-09-27T09:33:02.617250  =


    2023-09-27T09:33:02.634050  / # /lava-11625473/bin/lava-test-runner /la=
va-11625473/1

    2023-09-27T09:33:02.683836  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-27T09:33:02.684342  + cd /lav<8>[   20.514202] <LAVA_SIGNAL_STA=
RTRUN 1_bootrr 11625473_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
r8a779m1-ulcb            | arm64  | lab-collabora | clang-17 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6513d336094df185928a0a47

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20230925113618+4813=
58974fb0-1~exp1~20230925113727.45))
  Plain log:   https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230927/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6513d336094df185928a0a50
        failing since 62 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-27T07:01:05.731936  / # #

    2023-09-27T07:01:06.811870  export SHELL=3D/bin/sh

    2023-09-27T07:01:06.813806  #

    2023-09-27T07:01:08.304531  / # export SHELL=3D/bin/sh. /lava-11625467/=
environment

    2023-09-27T07:01:08.306394  =


    2023-09-27T07:01:11.030941  / # . /lava-11625467/environment/lava-11625=
467/bin/lava-test-runner /lava-11625467/1

    2023-09-27T07:01:11.033305  =


    2023-09-27T07:01:11.039413  / # /lava-11625467/bin/lava-test-runner /la=
va-11625467/1

    2023-09-27T07:01:11.102430  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-27T07:01:11.102923  + cd /lava-116254<8>[   28.549491] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11625467_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =20
