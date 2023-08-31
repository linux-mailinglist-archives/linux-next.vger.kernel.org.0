Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD58678EAF0
	for <lists+linux-next@lfdr.de>; Thu, 31 Aug 2023 12:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345258AbjHaKrp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 31 Aug 2023 06:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343737AbjHaKrm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 31 Aug 2023 06:47:42 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B25E45
        for <linux-next@vger.kernel.org>; Thu, 31 Aug 2023 03:47:05 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c1e780aa95so4152105ad.3
        for <linux-next@vger.kernel.org>; Thu, 31 Aug 2023 03:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1693478816; x=1694083616; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XjZuwRcdngEuD1foXmoY4i8mSS0XD5660HT9dTduTd4=;
        b=LmrPNNuSL3I3XUQBp6l35KMkLQISCO9oPq5Wk1hzSwhpk8oxTtgra1YFPDy/0M7L68
         m5qRHXr60S/J1NpNBv5sgIDwRdVBO+ymwIjRW+0DFnDH6qiPPHZ0w27OuJb2P4Wy6eco
         kTek9XjsN298T31yeh6NHa9zsWA8A4hba0EBgeCUqiz5UYoTBxFiRsNjcS7il6qQWAVQ
         ZPEaA7i1E2LGhJdp1LeT8HJhJ9tVtOVJ0LkiLlhsJshpyKbH/11GRJVpBTJhL8V2AoSx
         8KtVsgf/19JbunT0C3ZubJuQ1+UXbAIwcBBUjYUUKALor0d6fEc041i5Rpcm/7d6iXFG
         1PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693478816; x=1694083616;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjZuwRcdngEuD1foXmoY4i8mSS0XD5660HT9dTduTd4=;
        b=kkAHuQOEc1zVwkfYAaRo/huJLhxkFVO/J4FQyePIezIIeeIIaREBP/vyJbNuFo5mA+
         5gVxdRdFX1CbjAvM/rGUaX78xfdyHS+5rbB7IMNgX3fm5cT0CAnXvFA/7O1QXtdCApjS
         pn54JB9tNVnY9ZS8VErFcRemU+IkJQORJC23nsYmnh0FPYwDR5gzZYdFx/Y7YOoQJWql
         ow2Ry93lDjatoc4rEosTKAPrJJ9nt/lBg55tgnUvN/fcKNiKIUVlMJOlN1CspvvmuT+9
         rrjUWs5xvTLK/bgSVySxMIekcxkEXvjaJfqzvKID2qRPICWkRKBHT0rjO5Au3ss+r+qh
         pbdw==
X-Gm-Message-State: AOJu0YxFU6YdgpW1y7+UD79NkKRT6GOicwVUN1tz8Qh+6tKVpKo3druN
        +xx+SHaTY56cWbYT+Ii4f2mIauj4FiV3cEzFL68=
X-Google-Smtp-Source: AGHT+IHgDGZVk3C4iXKcsFUrXSPFUZEc6bn3RNaLj8bZgm29RuzKHVIuhRg4lmMPrVYB3RwQ3HYrpg==
X-Received: by 2002:a17:903:451:b0:1c2:702:61af with SMTP id iw17-20020a170903045100b001c2070261afmr4244575plb.38.1693478816314;
        Thu, 31 Aug 2023 03:46:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id iz2-20020a170902ef8200b001bb9f104328sm993151plb.146.2023.08.31.03.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 03:46:55 -0700 (PDT)
Message-ID: <64f06f9f.170a0220.f15e1.1991@mx.google.com>
Date:   Thu, 31 Aug 2023 03:46:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230831
Subject: next/master baseline: 88 runs, 6 regressions (next-20230831)
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

next/master baseline: 88 runs, 6 regressions (next-20230831)

Regressions Summary
-------------------

platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =

hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =

hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =

hp-x360-14-G1-sona   | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =

imx8mp-evk           | arm64  | lab-broonie   | clang-17 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m   | arm64  | lab-kontron   | clang-17 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230831/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230831
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a47fc304d2b678db1a5d760a7d644dac9b067752 =



Test Regressions
---------------- =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
acer-R721T-grunt     | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64f0287e1e4e2cbc1b286d7d

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230831/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230831/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f0287e1e4e2cbc1b286d92
        failing since 1 day (last pass: next-20230823, first fail: next-202=
30829)

    2023-08-31T05:43:09.569289  + <8>[   11.191079] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11388266_1.4.2.3.1>

    2023-08-31T05:43:09.569368  set +x

    2023-08-31T05:43:09.673672  / # #

    2023-08-31T05:43:09.774272  export SHELL=3D/bin/sh

    2023-08-31T05:43:09.774436  #

    2023-08-31T05:43:09.874930  / # export SHELL=3D/bin/sh. /lava-11388266/=
environment

    2023-08-31T05:43:09.875119  =


    2023-08-31T05:43:09.975660  / # . /lava-11388266/environment/lava-11388=
266/bin/lava-test-runner /lava-11388266/1

    2023-08-31T05:43:09.976016  =


    2023-08-31T05:43:09.980568  / # /lava-11388266/bin/lava-test-runner /la=
va-11388266/1
 =

    ... (12 line(s) more)  =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
hp-11A-G6-EE-grunt   | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64f0287b925e8e79f1286d7a

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230831/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230831/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f0287b925e8e79f1286d8f
        failing since 1 day (last pass: next-20230823, first fail: next-202=
30829)

    2023-08-31T05:44:05.279751  + <8>[   11.132243] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11388263_1.4.2.3.1>

    2023-08-31T05:44:05.279832  set +x

    2023-08-31T05:44:05.383501  / # #

    2023-08-31T05:44:05.484208  export SHELL=3D/bin/sh

    2023-08-31T05:44:05.484402  #

    2023-08-31T05:44:05.584920  / # export SHELL=3D/bin/sh. /lava-11388263/=
environment

    2023-08-31T05:44:05.585091  =


    2023-08-31T05:44:05.685603  / # . /lava-11388263/environment/lava-11388=
263/bin/lava-test-runner /lava-11388263/1

    2023-08-31T05:44:05.685914  =


    2023-08-31T05:44:05.690335  / # /lava-11388263/bin/lava-test-runner /la=
va-11388263/1
 =

    ... (12 line(s) more)  =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
hp-14-db0003na-grunt | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64f0288e925e8e79f1286da0

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230831/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230831/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f0288e925e8e79f1286db5
        failing since 1 day (last pass: next-20230823, first fail: next-202=
30829)

    2023-08-31T05:43:34.845678  + <8>[   10.890430] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11388269_1.4.2.3.1>

    2023-08-31T05:43:34.845761  set +x

    2023-08-31T05:43:34.950357  / # #

    2023-08-31T05:43:35.050932  export SHELL=3D/bin/sh

    2023-08-31T05:43:35.051113  #

    2023-08-31T05:43:35.151601  / # export SHELL=3D/bin/sh. /lava-11388269/=
environment

    2023-08-31T05:43:35.151781  =


    2023-08-31T05:43:35.252314  / # . /lava-11388269/environment/lava-11388=
269/bin/lava-test-runner /lava-11388269/1

    2023-08-31T05:43:35.252603  =


    2023-08-31T05:43:35.257241  / # /lava-11388269/bin/lava-test-runner /la=
va-11388269/1
 =

    ... (12 line(s) more)  =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
hp-x360-14-G1-sona   | x86_64 | lab-collabora | gcc-10   | x86_64_defcon...=
6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64f029943020fbd854286d77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230831/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230831/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f029943020fbd854286=
d78
        new failure (last pass: next-20230830) =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
imx8mp-evk           | arm64  | lab-broonie   | clang-17 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64f02f6bce593fc749286d73

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230827092956+e91a=
d6b97fcb-1~exp1~20230827093113.32))
  Plain log:   https://storage.kernelci.org//next/master/next-20230831/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230831/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-imx8mp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64f02f6bce593fc749286d7c
        failing since 15 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-08-31T06:12:39.240180  + set<8>[   29.554092] <LAVA_SIGNAL_ENDRUN =
0_dmesg 80357_1.5.2.4.1>
    2023-08-31T06:12:39.240803   +x
    2023-08-31T06:12:39.349375  / # #
    2023-08-31T06:12:40.515142  export SHELL=3D/bin/sh
    2023-08-31T06:12:40.521175  #
    2023-08-31T06:12:41.964662  / # export SHELL=3D/bin/sh. /lava-80357/env=
ironment
    2023-08-31T06:12:41.970693  =

    2023-08-31T06:12:44.582743  / # . /lava-80357/environment/lava-80357/bi=
n/lava-test-runner /lava-80357/1
    2023-08-31T06:12:44.589514  =

    2023-08-31T06:12:44.599335  / # /lava-80357/bin/lava-test-runner /lava-=
80357/1 =

    ... (12 line(s) more)  =

 =



platform             | arch   | lab           | compiler | defconfig       =
             | regressions
---------------------+--------+---------------+----------+-----------------=
-------------+------------
kontron-pitx-imx8m   | arm64  | lab-kontron   | clang-17 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64f02f3fcf0b1f30b2286d7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230827092956+e91a=
d6b97fcb-1~exp1~20230827093113.32))
  Plain log:   https://storage.kernelci.org//next/master/next-20230831/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230831/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64f02f3fcf0b1f30b2286=
d7f
        failing since 29 days (last pass: next-20230728, first fail: next-2=
0230802) =

 =20
