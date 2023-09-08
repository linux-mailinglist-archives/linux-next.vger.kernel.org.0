Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5987984B4
	for <lists+linux-next@lfdr.de>; Fri,  8 Sep 2023 11:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233331AbjIHJUu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Sep 2023 05:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbjIHJUt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Sep 2023 05:20:49 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69231997
        for <linux-next@vger.kernel.org>; Fri,  8 Sep 2023 02:20:42 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso15961615ad.0
        for <linux-next@vger.kernel.org>; Fri, 08 Sep 2023 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694164841; x=1694769641; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R5IFJS0LsKPlRqgmA0CCZpBA6RH0qd0LI5suDhMjSXs=;
        b=O55hdMJJ00jP9XPrrHmG5Edf8TXmDgkoXwMKZd35zMA9/Fvjg75D023hAoL4rFLZSl
         Qc05TQr7TUgewLHrYHIbIOQafgjOJ4zRyHNFzHhXEdbyq0q5xfeU9YmpgYaBxucd2Y2J
         O2ptCONco6llJoxO6buva30rvIlRikXMKKViFSzQA11KET/r1vstObHrv5FDcznu3dMr
         9oOSAGp6wibZai3nMXCDx675mvjxH1BZPI0/v2SFlIWujQRII9tnfDsSLyVRpWCTDVI9
         8QhYhjxngChiY442sGG3fYzFtORhU6elQx8PWexJW9G438SRQCJntx/mx/dHpALjKxzx
         SZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694164841; x=1694769641;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5IFJS0LsKPlRqgmA0CCZpBA6RH0qd0LI5suDhMjSXs=;
        b=IoG6S7RExnI0WZ1N/yzV4IwmgZIPf0uejUzPzT375eFYGM5UuJMBOoCnRZoAz8m28V
         CY11z7vOsaqZfie++KVdoIvb4z5id4kX5RTkFS0D1d0RQeF/3KyXS4Wu77O4+Y9dA8ts
         MXB6rKUfg4S27EZakSbUFNxDXIirwaIAVJK9O9BNuMbglvrrAIalncgIYT3cIFxnwN6b
         a24HkyGwRiHckFKkTEUaqQw9AUiykEvtS7RC+NkaDmJJosLnW8dO2luVjRmbCSwsGBoD
         Ivulk89PWnw9O7+SC+kI+NNTnsfrSSuSbpEcxMBC1NyzRT7IgPTHE7Q4DnP62qUB/eRO
         K4aA==
X-Gm-Message-State: AOJu0YzbvW110XeHYXFCoiGoxV92IqC/Mpq2LCPFsx3lehMDkbjmF6+B
        I7DP+CZRQnpg/dj9k8vXa5SxhSO4k952cPb6WDgHcw==
X-Google-Smtp-Source: AGHT+IHciBXjOYuoFlit2nkiTsablaDfXZBU1RHZqyGwwt+LbKK4yC/3Sz35GYLY3WefJT7W6EmBAg==
X-Received: by 2002:a17:903:24d:b0:1bf:650b:14fb with SMTP id j13-20020a170903024d00b001bf650b14fbmr2487714plh.42.1694164841038;
        Fri, 08 Sep 2023 02:20:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jj18-20020a170903049200b001b9d95945afsm1124920plb.155.2023.09.08.02.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 02:20:40 -0700 (PDT)
Message-ID: <64fae768.170a0220.34ee9.299f@mx.google.com>
Date:   Fri, 08 Sep 2023 02:20:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230908
Subject: next/master baseline: 301 runs, 21 regressions (next-20230908)
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

next/master baseline: 301 runs, 21 regressions (next-20230908)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
acer-R721T-grunt          | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

asus-CM1400CXA-dalboz     | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

hp-11A-G6-EE-grunt        | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

hp-11A-G6-EE-grunt        | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

hp-14-db0003na-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

hp-14-db0003na-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

imx8mp-evk                | arm64  | lab-broonie   | clang-17 | defconfig  =
                  | 1          =

imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig+v=
ideodec           | 1          =

imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =

imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m        | arm64  | lab-kontron   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =

qemu_mips-malta           | mips   | lab-collabora | gcc-10   | malta_defco=
nfig              | 1          =

r8a774a1-hihope-rzg2m-ex  | arm64  | lab-cip       | clang-17 | defconfig  =
                  | 1          =

r8a774a1-hihope-rzg2m-ex  | arm64  | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874            | arm64  | lab-cip       | clang-17 | defconfig  =
                  | 1          =

r8a77960-ulcb             | arm64  | lab-collabora | clang-17 | defconfig  =
                  | 1          =

r8a779m1-ulcb             | arm64  | lab-collabora | clang-17 | defconfig  =
                  | 1          =

sun50i-h6-pine-h64        | arm64  | lab-collabora | clang-17 | defconfig  =
                  | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230908/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230908
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      af3c30d33476bc2694b0d699173544b07f7ae7de =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
acer-R721T-grunt          | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64faaf2e96617805b3286d77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64faaf2e96617805b3286=
d78
        failing since 114 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-CM1400CXA-dalboz     | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64faaab84f28239eba286da2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64faaab84f28239eba286=
da3
        failing since 114 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-11A-G6-EE-grunt        | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64faa87b224bd5a4d7286d93

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faa87b224bd5a4d7286da8
        failing since 9 days (last pass: next-20230823, first fail: next-20=
230829)

    2023-09-08T04:53:04.003121  + <8>[   11.403350] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11466943_1.4.2.3.1>

    2023-09-08T04:53:04.003228  set +x

    2023-09-08T04:53:04.107686  / # #

    2023-09-08T04:53:04.208311  export SHELL=3D/bin/sh

    2023-09-08T04:53:04.208548  #

    2023-09-08T04:53:04.309127  / # export SHELL=3D/bin/sh. /lava-11466943/=
environment

    2023-09-08T04:53:04.309363  =


    2023-09-08T04:53:04.409942  / # . /lava-11466943/environment/lava-11466=
943/bin/lava-test-runner /lava-11466943/1

    2023-09-08T04:53:04.410336  =


    2023-09-08T04:53:04.414791  / # /lava-11466943/bin/lava-test-runner /la=
va-11466943/1
 =

    ... (12 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-11A-G6-EE-grunt        | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64faaa56541c310c3b286dd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64faaa56541c310c3b286=
dd4
        failing since 114 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-14-db0003na-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64faaca4cc1a2d94e8286dba

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faaca4cc1a2d94e8286dcf
        failing since 9 days (last pass: next-20230823, first fail: next-20=
230829)

    2023-09-08T05:09:37.387957  + <8>[   11.367045] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 11466969_1.4.2.3.1>

    2023-09-08T05:09:37.388041  set +x

    2023-09-08T05:09:37.492669  / # #

    2023-09-08T05:09:37.593447  export SHELL=3D/bin/sh

    2023-09-08T05:09:37.593622  #

    2023-09-08T05:09:37.694109  / # export SHELL=3D/bin/sh. /lava-11466969/=
environment

    2023-09-08T05:09:37.694315  =


    2023-09-08T05:09:37.794895  / # . /lava-11466969/environment/lava-11466=
969/bin/lava-test-runner /lava-11466969/1

    2023-09-08T05:09:37.795190  =


    2023-09-08T05:09:37.800009  / # /lava-11466969/bin/lava-test-runner /la=
va-11466969/1
 =

    ... (12 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-14-db0003na-grunt      | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64faad082ed1b0fa58286d72

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64faad082ed1b0fa58286=
d73
        failing since 114 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-14a-cb0001xx-zork | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64faaa7cc2aef737ea286d7d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64faaa7cc2aef737ea286=
d7e
        failing since 114 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
imx8mp-evk                | arm64  | lab-broonie   | clang-17 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/64faa6c75e4352b781286d75

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faa6c75e4352b781286d7e
        failing since 23 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-09-08T04:44:36.500515  / # #
    2023-09-08T04:44:37.666675  export SHELL=3D/bin/sh
    2023-09-08T04:44:37.672857  #
    2023-09-08T04:44:39.116614  / # export SHELL=3D/bin/sh. /lava-91566/env=
ironment
    2023-09-08T04:44:39.122805  =

    2023-09-08T04:44:41.735258  / # . /lava-91566/environment/lava-91566/bi=
n/lava-test-runner /lava-91566/1
    2023-09-08T04:44:41.742066  =

    2023-09-08T04:44:41.753422  / # /lava-91566/bin/lava-test-runner /lava-=
91566/1
    2023-09-08T04:44:41.770131  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-08T04:44:41.783390  + cd /l<8>[   34.153659] <LAVA_SIGNAL_START=
RUN 1_bootrr 91566_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig+v=
ideodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64faa8576f5e47cb4b28709a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faa8576f5e47cb4b2870a3
        failing since 23 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-08T04:51:16.790610  + set<8>[   29.333191] <LAVA_SIGNAL_ENDRUN =
0_dmesg 91596_1.5.2.4.1>
    2023-09-08T04:51:16.791197   +x
    2023-09-08T04:51:16.899462  / # #
    2023-09-08T04:51:18.065258  export SHELL=3D/bin/sh
    2023-09-08T04:51:18.071374  #
    2023-09-08T04:51:19.514738  / # export SHELL=3D/bin/sh. /lava-91596/env=
ironment
    2023-09-08T04:51:19.520827  =

    2023-09-08T04:51:22.132574  / # . /lava-91596/environment/lava-91596/bi=
n/lava-test-runner /lava-91596/1
    2023-09-08T04:51:22.139348  =

    2023-09-08T04:51:22.149427  / # /lava-91596/bin/lava-test-runner /lava-=
91596/1 =

    ... (12 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64faa983ea461963a0286d7a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faa983ea461963a0286d83
        failing since 23 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-08T04:56:16.102831  + set<8>[   28.833041] <LAVA_SIGNAL_ENDRUN =
0_dmesg 91645_1.5.2.4.1>
    2023-09-08T04:56:16.103448   +x
    2023-09-08T04:56:16.211985  / # #
    2023-09-08T04:56:17.377806  export SHELL=3D/bin/sh
    2023-09-08T04:56:17.383907  #
    2023-09-08T04:56:18.827346  / # export SHELL=3D/bin/sh. /lava-91645/env=
ironment
    2023-09-08T04:56:18.833400  =

    2023-09-08T04:56:21.445285  / # . /lava-91645/environment/lava-91645/bi=
n/lava-test-runner /lava-91645/1
    2023-09-08T04:56:21.452111  =

    2023-09-08T04:56:21.461160  / # /lava-91645/bin/lava-test-runner /lava-=
91645/1 =

    ... (12 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/64faac0343f7d930df286e67

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faac0343f7d930df286e70
        failing since 23 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-08T05:06:57.682520  + set<8>[   29.428184] <LAVA_SIGNAL_ENDRUN =
0_dmesg 91669_1.5.2.4.1>
    2023-09-08T05:06:57.683113   +x
    2023-09-08T05:06:57.792966  / # #
    2023-09-08T05:06:58.959272  export SHELL=3D/bin/sh
    2023-09-08T05:06:58.965356  #
    2023-09-08T05:07:00.408646  / # export SHELL=3D/bin/sh. /lava-91669/env=
ironment
    2023-09-08T05:07:00.414661  =

    2023-09-08T05:07:03.026330  / # . /lava-91669/environment/lava-91669/bi=
n/lava-test-runner /lava-91669/1
    2023-09-08T05:07:03.033104  =

    2023-09-08T05:07:03.041001  / # /lava-91669/bin/lava-test-runner /lava-=
91669/1 =

    ... (12 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
imx8mp-evk                | arm64  | lab-broonie   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64faade47f8ee2546f286d6c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faade47f8ee2546f286d75
        failing since 23 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-09-08T05:14:58.626105  + set<8>[   26.305364] <LAVA_SIGNAL_ENDRUN =
0_dmesg 91705_1.5.2.4.1>
    2023-09-08T05:14:58.626679   +x
    2023-09-08T05:14:58.735020  / # #
    2023-09-08T05:14:59.901077  export SHELL=3D/bin/sh
    2023-09-08T05:14:59.907173  #
    2023-09-08T05:15:01.350536  / # export SHELL=3D/bin/sh. /lava-91705/env=
ironment
    2023-09-08T05:15:01.356643  =

    2023-09-08T05:15:03.968636  / # . /lava-91705/environment/lava-91705/bi=
n/lava-test-runner /lava-91705/1
    2023-09-08T05:15:03.975364  =

    2023-09-08T05:15:03.985282  / # /lava-91705/bin/lava-test-runner /lava-=
91705/1 =

    ... (12 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
kontron-pitx-imx8m        | arm64  | lab-kontron   | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64faada0b1373ea6c3286e4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64faada0b1373ea6c3286=
e50
        failing since 37 days (last pass: next-20230728, first fail: next-2=
0230801) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
lenovo-TPad-C13-Yoga-zork | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64faaab934fa46be9b286d83

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64faaab934fa46be9b286=
d84
        failing since 114 days (last pass: next-20230516, first fail: next-=
20230517) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
qemu_mips-malta           | mips   | lab-collabora | gcc-10   | malta_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64faa706eefb61d9b5286e09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64faa706eefb61d9b5286=
e0a
        new failure (last pass: next-20230906) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex  | arm64  | lab-cip       | clang-17 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/64faa6e1eefb61d9b5286dc3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faa6e1eefb61d9b5286dc6
        failing since 10 days (last pass: next-20230710, first fail: next-2=
0230828)

    2023-09-08T04:44:49.453557  + set +x
    2023-09-08T04:44:49.456774  <8>[   28.602617] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1006507_1.5.2.4.1>
    2023-09-08T04:44:49.564601  / # #
    2023-09-08T04:44:51.028624  export SHELL=3D/bin/sh
    2023-09-08T04:44:51.049582  #
    2023-09-08T04:44:51.050048  / # export SHELL=3D/bin/sh
    2023-09-08T04:44:53.008575  / # . /lava-1006507/environment
    2023-09-08T04:44:56.610639  /lava-1006507/bin/lava-test-runner /lava-10=
06507/1
    2023-09-08T04:44:56.632084  . /lava-1006507/environment
    2023-09-08T04:44:56.632568  / # /lava-1006507/bin/lava-test-runner /lav=
a-1006507/1 =

    ... (27 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex  | arm64  | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64faadfd3363f5737d286d6e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faadfd3363f5737d286d71
        failing since 37 days (last pass: next-20230712, first fail: next-2=
0230801)

    2023-09-08T05:15:11.733333  + set +x
    2023-09-08T05:15:11.736512  <8>[   28.470779] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1006548_1.5.2.4.1>
    2023-09-08T05:15:11.844110  / # #
    2023-09-08T05:15:13.308798  export SHELL=3D/bin/sh
    2023-09-08T05:15:13.329758  #
    2023-09-08T05:15:13.330223  / # export SHELL=3D/bin/sh
    2023-09-08T05:15:15.288404  / # . /lava-1006548/environment
    2023-09-08T05:15:18.890459  /lava-1006548/bin/lava-test-runner /lava-10=
06548/1
    2023-09-08T05:15:18.911917  . /lava-1006548/environment
    2023-09-08T05:15:18.912337  / # /lava-1006548/bin/lava-test-runner /lav=
a-1006548/1 =

    ... (27 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
r8a774c0-ek874            | arm64  | lab-cip       | clang-17 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/64faa6eceefb61d9b5286ddc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faa6eceefb61d9b5286ddf
        failing since 43 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-08T04:45:13.302558  / # #
    2023-09-08T04:45:14.766854  export SHELL=3D/bin/sh
    2023-09-08T04:45:14.787426  #
    2023-09-08T04:45:14.787634  / # export SHELL=3D/bin/sh
    2023-09-08T04:45:16.743937  / # . /lava-1006503/environment
    2023-09-08T04:45:20.343580  /lava-1006503/bin/lava-test-runner /lava-10=
06503/1
    2023-09-08T04:45:20.364394  . /lava-1006503/environment
    2023-09-08T04:45:20.364508  / # /lava-1006503/bin/lava-test-runner /lav=
a-1006503/1
    2023-09-08T04:45:20.458677  + export 'TESTRUN_ID=3D1_bootrr'
    2023-09-08T04:45:20.458898  + cd /lava-1006503/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
r8a77960-ulcb             | arm64  | lab-collabora | clang-17 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/64faa695ac057d3e9f286e73

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faa695ac057d3e9f286e7c
        failing since 43 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-08T04:45:28.333996  / # #

    2023-09-08T04:45:28.434458  export SHELL=3D/bin/sh

    2023-09-08T04:45:28.434618  #

    2023-09-08T04:45:28.535108  / # export SHELL=3D/bin/sh. /lava-11466852/=
environment

    2023-09-08T04:45:28.535240  =


    2023-09-08T04:45:28.635752  / # . /lava-11466852/environment/lava-11466=
852/bin/lava-test-runner /lava-11466852/1

    2023-09-08T04:45:28.635955  =


    2023-09-08T04:45:28.647877  / # /lava-11466852/bin/lava-test-runner /la=
va-11466852/1

    2023-09-08T04:45:28.689025  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-08T04:45:28.707057  + cd /lava-114668<8>[   20.462523] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11466852_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
r8a779m1-ulcb             | arm64  | lab-collabora | clang-17 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/64faa6b744c5f5ce95286d86

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faa6b744c5f5ce95286d8f
        failing since 43 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-08T04:45:50.260385  / # #

    2023-09-08T04:45:51.335497  export SHELL=3D/bin/sh

    2023-09-08T04:45:51.337321  #

    2023-09-08T04:45:52.827867  / # export SHELL=3D/bin/sh. /lava-11466848/=
environment

    2023-09-08T04:45:52.829675  =


    2023-09-08T04:45:55.552357  / # . /lava-11466848/environment/lava-11466=
848/bin/lava-test-runner /lava-11466848/1

    2023-09-08T04:45:55.554516  =


    2023-09-08T04:45:55.560366  / # /lava-11466848/bin/lava-test-runner /la=
va-11466848/1

    2023-09-08T04:45:55.624314  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-08T04:45:55.624803  + cd /lava-114668<8>[   29.551091] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11466848_1.5.2.4.5>
 =

    ... (44 line(s) more)  =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64        | arm64  | lab-collabora | clang-17 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/64faa6a94f810bfad8286d8d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230901073029+a612=
cb0b81d8-1~exp1~20230901073151.37))
  Plain log:   https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230908/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64faa6a94f810bfad8286d96
        failing since 43 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-09-08T04:45:41.560694  / # #

    2023-09-08T04:45:41.662888  export SHELL=3D/bin/sh

    2023-09-08T04:45:41.663597  #

    2023-09-08T04:45:41.765000  / # export SHELL=3D/bin/sh. /lava-11466857/=
environment

    2023-09-08T04:45:41.765756  =


    2023-09-08T04:45:41.867226  / # . /lava-11466857/environment/lava-11466=
857/bin/lava-test-runner /lava-11466857/1

    2023-09-08T04:45:41.868322  =


    2023-09-08T04:45:41.885044  / # /lava-11466857/bin/lava-test-runner /la=
va-11466857/1

    2023-09-08T04:45:41.952058  + export 'TESTRUN_ID=3D1_bootrr'

    2023-09-08T04:45:41.952568  + cd /lava-11466857/1/tests/1_boot<8>[   17=
.586935] <LAVA_SIGNAL_STARTRUN 1_bootrr 11466857_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
