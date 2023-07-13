Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02981751CB4
	for <lists+linux-next@lfdr.de>; Thu, 13 Jul 2023 11:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbjGMJH2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Jul 2023 05:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbjGMJGo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Jul 2023 05:06:44 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1412113
        for <linux-next@vger.kernel.org>; Thu, 13 Jul 2023 02:06:22 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5661e8f4c45so434128eaf.1
        for <linux-next@vger.kernel.org>; Thu, 13 Jul 2023 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689239181; x=1691831181;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d3ulQrThLQrk5SyGNU38eAiS8uxriy83G3tYix4+Tm8=;
        b=EShnA/gAEL3g9RW+Hij3W4d0NPbBWbo/yibGxCetU3ekvBJkU2UBzyAxe1Ok9+VA0n
         8GSVzcrhxEBQdNk6rUubpzP4Sk6x0Lo5G8n7zE8stZcYRJFgMgl/e0RDqHj8O60kiMlm
         OJGcLGUOXYrQBpM2euL93VL4ziHDodFNGKd1xJ5O87CzVvDdFRE+dsPInikZwqk4/WN2
         NjXeH+1PqS1FC0D1WTRA3l7y5CFjnbK+OMQhGcKYWT3V5D9nL5AcOyyR1YYkYZfc9bu3
         WAlUfgjtvgRaOPG/QKjFv9gwmOZixrpg3tqKNAY1oWpA/PT//VvQLKM2hT1B+pnDtRwh
         XiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689239181; x=1691831181;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3ulQrThLQrk5SyGNU38eAiS8uxriy83G3tYix4+Tm8=;
        b=Q7kKr1C3xrBq4cALd4zTNUWM3pa9hKNrVUczGNCFnpzSbdKFAgLfzQ8Wai5Wmo9ldU
         f07i/RZb8edcCsUGk6HqVrWbiz49tlekDrMsyVUTqgXtn43LV+d/l1pkjZ1hob+St5a/
         jKJ4vTuIZmOihfVYKMUKzzykOqWlH2TVzCDLNqLVUhk3e1Lpz4iSbUKIbhxfw3GKH/Za
         J1cebKM/A0g+Ls4TodyUIeKDf1iPuY16us80h8Rr25g8SJNcskFCYFh7ogVATFGPzPFB
         JXjPCMFZH0HLljjguA01P+p2tJj5+WzVEbsGWQxrAX6aJ2HuWUaXVsyXbjz8txmU2p0z
         26IQ==
X-Gm-Message-State: ABy/qLZC801AH0TdkfwrmPDDjCu3vlJQkdYNqVEyc2nEMQ0Js3Iofd2p
        zoHTZ76OMULFsDxqjL5GZLIasLhllG9BNdNjcyXvDQ==
X-Google-Smtp-Source: APBJJlFD1mZ+3SnSKaOFZAcXjfO3RGC1ByBXznNfxCt5b8cPW6nGe/bAOAaoOHngC2cYkx0y8Bq20g==
X-Received: by 2002:a05:6358:6f97:b0:134:cb65:fbbe with SMTP id s23-20020a0563586f9700b00134cb65fbbemr1606139rwn.13.1689239181096;
        Thu, 13 Jul 2023 02:06:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a23-20020a637f17000000b0055b3af821d5sm5025861pgd.25.2023.07.13.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 02:06:20 -0700 (PDT)
Message-ID: <64afbe8c.630a0220.d66c6.a3cd@mx.google.com>
Date:   Thu, 13 Jul 2023 02:06:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230713
X-Kernelci-Report-Type: test
Subject: next/master baseline: 290 runs, 34 regressions (next-20230713)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 290 runs, 34 regressions (next-20230713)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =

k3-am625-sk                  | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

meson-g12a-u200              | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 11         =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | clang-17 | defconfi=
g                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230713/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230713
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e3262265625831348cfb3128d35907ead75d8bf7 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
acer-chromebox-cxi4-puff     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64af93e3e446c054bc8ace3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-chrom=
ebox-cxi4-puff.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af93e3e446c054bc8ac=
e3c
        new failure (last pass: next-20230712) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64af93bc6ac41ef6518ace41

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64af93bc6ac41ef6518ace46
        failing since 106 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-13T06:03:37.361124  + set +x

    2023-07-13T06:03:37.367961  <8>[   10.186538] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11076785_1.4.2.3.1>

    2023-07-13T06:03:37.469676  #

    2023-07-13T06:03:37.570443  / # #export SHELL=3D/bin/sh

    2023-07-13T06:03:37.570621  =


    2023-07-13T06:03:37.671164  / # export SHELL=3D/bin/sh. /lava-11076785/=
environment

    2023-07-13T06:03:37.671337  =


    2023-07-13T06:03:37.771866  / # . /lava-11076785/environment/lava-11076=
785/bin/lava-test-runner /lava-11076785/1

    2023-07-13T06:03:37.772123  =


    2023-07-13T06:03:37.778156  / # /lava-11076785/bin/lava-test-runner /la=
va-11076785/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64af93bc6ac41ef6518ace36

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64af93bc6ac41ef6518ace3b
        failing since 106 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-13T06:03:29.353863  <8>[   10.282980] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11076818_1.4.2.3.1>

    2023-07-13T06:03:29.357323  + set +x

    2023-07-13T06:03:29.462380  / ##

    2023-07-13T06:03:29.565149  export SHELL=3D/bin/sh

    2023-07-13T06:03:29.566010   #

    2023-07-13T06:03:29.667662  / # export SHELL=3D/bin/sh. /lava-11076818/=
environment

    2023-07-13T06:03:29.668525  =


    2023-07-13T06:03:29.770375  / # . /lava-11076818/environment/lava-11076=
818/bin/lava-test-runner /lava-11076818/1

    2023-07-13T06:03:29.771722  =


    2023-07-13T06:03:29.777218  / # /lava-11076818/bin/lava-test-runner /la=
va-11076818/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64af93a81565604d838ace35

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64af93a81565604d838ace3a
        failing since 106 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-13T06:03:10.305387  + set +x

    2023-07-13T06:03:10.311814  <8>[   10.337074] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11076814_1.4.2.3.1>

    2023-07-13T06:03:10.416451  / # #

    2023-07-13T06:03:10.517142  export SHELL=3D/bin/sh

    2023-07-13T06:03:10.517362  #

    2023-07-13T06:03:10.618003  / # export SHELL=3D/bin/sh. /lava-11076814/=
environment

    2023-07-13T06:03:10.618198  =


    2023-07-13T06:03:10.718723  / # . /lava-11076814/environment/lava-11076=
814/bin/lava-test-runner /lava-11076814/1

    2023-07-13T06:03:10.719003  =


    2023-07-13T06:03:10.723185  / # /lava-11076814/bin/lava-test-runner /la=
va-11076814/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64af93a8ccf9544b788ace46

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64af93a8ccf9544b788ace4b
        failing since 106 days (last pass: next-20230324, first fail: next-=
20230328)

    2023-07-13T06:03:45.779121  + set +x

    2023-07-13T06:03:45.785555  <8>[    8.179586] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 11076816_1.4.2.3.1>

    2023-07-13T06:03:45.890089  / # #

    2023-07-13T06:03:45.990717  export SHELL=3D/bin/sh

    2023-07-13T06:03:45.990901  #

    2023-07-13T06:03:46.091435  / # export SHELL=3D/bin/sh. /lava-11076816/=
environment

    2023-07-13T06:03:46.091740  =


    2023-07-13T06:03:46.192381  / # . /lava-11076816/environment/lava-11076=
816/bin/lava-test-runner /lava-11076816/1

    2023-07-13T06:03:46.192671  =


    2023-07-13T06:03:46.197714  / # /lava-11076816/bin/lava-test-runner /la=
va-11076816/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64af99c890e68f79be8aced8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64af99c890e68f79be8acedd
        failing since 21 days (last pass: next-20230615, first fail: next-2=
0230621)

    2023-07-13T06:29:00.721455  + set +x
    2023-07-13T06:29:00.724749  <8>[    7.717522] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3720518_1.5.2.4.1>
    2023-07-13T06:29:00.831191  / # #
    2023-07-13T06:29:00.932835  export SHELL=3D/bin/sh
    2023-07-13T06:29:00.933190  #
    2023-07-13T06:29:01.034329  / # export SHELL=3D/bin/sh. /lava-3720518/e=
nvironment
    2023-07-13T06:29:01.034741  =

    2023-07-13T06:29:01.135986  / # . /lava-3720518/environment/lava-372051=
8/bin/lava-test-runner /lava-3720518/1
    2023-07-13T06:29:01.136850  =

    2023-07-13T06:29:01.156407  / # /lava-3720518/bin/lava-test-runner /lav=
a-3720518/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64af9c9460cc077a4c8ad049

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-k3-am=
625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-k3-am=
625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64af9c9460cc077a4c8ad04d
        failing since 84 days (last pass: next-20230417, first fail: next-2=
0230419)

    2023-07-13T06:40:57.343067  <8>[    7.815752] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3720576_1.5.2.4.1>
    2023-07-13T06:40:57.453005  / # #
    2023-07-13T06:40:57.556084  export SHELL=3D/bin/sh
    2023-07-13T06:40:57.557029  #
    2023-07-13T06:40:57.658939  / # export SHELL=3D/bin/sh. /lava-3720576/e=
nvironment
    2023-07-13T06:40:57.659837  =

    2023-07-13T06:40:57.762140  / # . /lava-3720576/environment/lava-372057=
6/bin/lava-test-runner /lava-3720576/1
    2023-07-13T06:40:57.763588  =

    2023-07-13T06:40:57.775123  / # /lava-3720576/bin/lava-test-runner /lav=
a-3720576/1
    2023-07-13T06:40:57.819778  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64af9c4bfe30fd17168ace1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af9c4bfe30fd17168ac=
e20
        failing since 84 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/64af98733671367e0d8ace46

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64af98733671367e0d8ace49
        new failure (last pass: next-20230710)

    2023-07-13T06:23:39.079799  / # #
    2023-07-13T06:23:39.181843  export SHELL=3D/bin/sh
    2023-07-13T06:23:39.182570  #
    2023-07-13T06:23:39.284055  / # export SHELL=3D/bin/sh. /lava-371011/en=
vironment
    2023-07-13T06:23:39.284303  =

    2023-07-13T06:23:39.384856  / # . /lava-371011/environment/lava-371011/=
bin/lava-test-runner /lava-371011/1
    2023-07-13T06:23:39.385846  =

    2023-07-13T06:23:39.426391  / # /lava-371011/bin/lava-test-runner /lava=
-371011/1
    2023-07-13T06:23:39.426853  + export 'TESTRUN_ID=3D1_bootrr'
    2023-07-13T06:23:39.456984  + cd /lava-371011/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/64a=
f98733671367e0d8ace59
        new failure (last pass: next-20230710)

    2023-07-13T06:23:41.860068  /lava-371011/1/../bin/lava-test-case
    2023-07-13T06:23:41.860404  <8>[   17.673194] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-07-13T06:23:41.860656  /lava-371011/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64af93bce446c054bc8ace26

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64af93bce446c054bc8ace2b
        failing since 20 days (last pass: next-20230622, first fail: next-2=
0230623)

    2023-07-13T06:03:20.363228  + set<8>[   11.844301] <LAVA_SIGNAL_ENDRUN =
0_dmesg 11076810_1.4.2.3.1>

    2023-07-13T06:03:20.363304   +x

    2023-07-13T06:03:20.467512  / # #

    2023-07-13T06:03:20.568008  export SHELL=3D/bin/sh

    2023-07-13T06:03:20.568163  #

    2023-07-13T06:03:20.668644  / # export SHELL=3D/bin/sh. /lava-11076810/=
environment

    2023-07-13T06:03:20.668803  =


    2023-07-13T06:03:20.769298  / # . /lava-11076810/environment/lava-11076=
810/bin/lava-test-runner /lava-11076810/1

    2023-07-13T06:03:20.769589  =


    2023-07-13T06:03:20.774016  / # /lava-11076810/bin/lava-test-runner /la=
va-11076810/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64af9ac61e87e530538ace75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af9ac61e87e530538ac=
e76
        new failure (last pass: next-20230711) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64af98b3acf61db3878ace46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af98b3acf61db3878ac=
e47
        failing since 22 days (last pass: next-20230619, first fail: next-2=
0230620) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64af9adb1e87e530538ace78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af9adb1e87e530538ac=
e79
        new failure (last pass: next-20230711) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3328-rock64                | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64af997496b59afbb38ace2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af997496b59afbb38ac=
e2e
        new failure (last pass: next-20230710) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64af9bdecb25decdff8ace29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af9bdecb25decdff8ac=
e2a
        failing since 28 days (last pass: next-20230510, first fail: next-2=
0230614) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64af9e22812d11445c8acf4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af9e22812d11445c8ac=
f4f
        failing since 85 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230417) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64af9e490aa4a943838ace30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af9e490aa4a943838ac=
e31
        failing since 85 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230417) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64af99fe6249898e718ace38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af99fe6249898e718ac=
e39
        failing since 27 days (last pass: next-20230608, first fail: next-2=
0230616) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64af999a42d0d035fa8ace3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af999a42d0d035fa8ac=
e3e
        failing since 27 days (last pass: next-20230608, first fail: next-2=
0230616) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-17 | defconfi=
g                    | 11         =


  Details:     https://kernelci.org/test/plan/id/64af9a3c5378b3b7d98ace29

  Results:     22 PASS, 11 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-driver-present: https://kernelci.org/test/case/id/=
64af9a3c5378b3b7d98ace2c
        new failure (last pass: next-20230608)

    2023-07-13T06:31:09.313597  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:31:09.334597  <8>[   35.674194] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-phy-probed RESULT=3Dblocked>
    2023-07-13T06:31:10.376157  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:31:10.379281  <8>[   36.718330] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8i-hdmi-phy-driver-present: https://kernelci.org/tes=
t/case/id/64af9a3c5378b3b7d98ace2d
        new failure (last pass: next-20230608)

    2023-07-13T06:31:07.220935  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:31:07.243947  <8>[   33.585328] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-probed RESULT=3Dblocked>
    2023-07-13T06:31:08.267819  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:31:08.289833  <8>[   34.630501] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-hdmi-phy-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8i-dw-hdmi-driver-present: https://kernelci.org/test=
/case/id/64af9a3c5378b3b7d98ace2e
        new failure (last pass: next-20230608)

    2023-07-13T06:31:05.130396  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:31:05.157266  <8>[   31.498290] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-mixer-probed RESULT=3Dblocked>
    2023-07-13T06:31:06.193854  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:31:06.197181  <8>[   32.534775] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-dw-hdmi-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8i-mixer-driver-present: https://kernelci.org/test/c=
ase/id/64af9a3c5378b3b7d98ace2f
        new failure (last pass: next-20230608)

    2023-07-13T06:31:03.060467  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:31:03.063588  <8>[   29.401972] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Danalog-audio-probed RESULT=3Dblocked>
    2023-07-13T06:31:04.104402  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:31:04.107544  <8>[   30.446445] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-mixer-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8-codec-analog-driver-present: https://kernelci.org/=
test/case/id/64af9a3c5378b3b7d98ace30
        new failure (last pass: next-20230608)

    2023-07-13T06:31:00.953199  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:31:00.975106  <8>[   27.314607] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrypto-probed RESULT=3Dblocked>
    2023-07-13T06:31:02.016740  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:31:02.019993  <8>[   28.357977] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8-codec-analog-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sun8i-ce-driver-present: https://kernelci.org/test/case=
/id/64af9a3c5378b3b7d98ace31
        new failure (last pass: next-20230608)

    2023-07-13T06:30:57.844780  <8>[   24.182944] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsunxi-ir-driver-present RESULT=3Dfail>
    2023-07-13T06:30:58.879427  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:30:58.882562  <8>[   25.226361] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dir-probed RESULT=3Dblocked>
    2023-07-13T06:30:59.905316  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:30:59.930219  <8>[   26.270205] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsun8i-ce-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sunxi-ir-driver-present: https://kernelci.org/test/case=
/id/64af9a3c5378b3b7d98ace32
        new failure (last pass: next-20230608)

    2023-07-13T06:30:57.841520  /lava-3720492/1/../bin/lava-test-case   =


  * baseline.bootrr.sunxi-wdt-driver-present: https://kernelci.org/test/cas=
e/id/64af9a3c5378b3b7d98ace35
        new failure (last pass: next-20230608)

    2023-07-13T06:30:55.669801  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:30:55.673133  <8>[   22.014049] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsunxi-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.dwmac-sun8i-driver-present: https://kernelci.org/test/c=
ase/id/64af9a3c5378b3b7d98ace49
        new failure (last pass: next-20230608)

    2023-07-13T06:30:53.152641  /lava-3720492/1/../bin/lava-test-case
    2023-07-13T06:30:53.176519  <8>[   19.516023] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwmac-sun8i-driver-present RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64af9a3c5378b3b=
7d98ace4b
        failing since 35 days (last pass: next-20230510, first fail: next-2=
0230608)
        8 lines

    2023-07-13T06:30:51.019538  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-07-13T06:30:51.058490  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-07-13T06:30:51.058741  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2023-07-13T06:30:51.059188  kern  :alert : Data abort info:
    2023-07-13T06:30:51.059427  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004, ISS2 =3D 0x00000000
    2023-07-13T06:30:51.059639  kern  :alert :   CM =3D 0, WnR =3D 0, TnD =
=3D 0, TagAccess =3D 0
    2023-07-13T06:30:51.059845  kern  :alert :   GCS =3D 0, Overl<8>[   17.=
394961] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dli=
nes MEASUREMENT=3D8>
    2023-07-13T06:30:51.060048  ay =3D 0, DirtyBit =3D 0, Xs =3D 0   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64af9a3c5378b3b=
7d98ace4c
        failing since 35 days (last pass: next-20230510, first fail: next-2=
0230608)
        49 lines

    2023-07-13T06:30:51.015679  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000048
    2023-07-13T06:30:51.015935  kern  :alert : Mem abort info:
    2023-07-13T06:30:51.016155  kern  :alert :   ESR =3D 0x0000000096000004
    2023-07-13T06:30:51.016414  kern  :alert :  <8>[   17.348601] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D49>
    2023-07-13T06:30:51.016630   EC =3D 0x25: DABT (current EL), IL =3D 32 =
bits
    2023-07-13T06:30:51.016835  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address fffffff00000b348   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64af9c6e0282d86e888ace89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af9c6e0282d86e888ac=
e8a
        failing since 1 day (last pass: next-20230608, first fail: next-202=
30712) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | clang-17 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64af99d4fc9d67de848ace1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af99d4fc9d67de848ac=
e1d
        failing since 36 days (last pass: next-20230605, first fail: next-2=
0230607) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie   | clang-17 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64af9ca45a090b8dff8ace7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230710112127+f36b=
0169b882-1~exp1~20230710112249.761))
  Plain log:   https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230713/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64af9ca45a090b8dff8ac=
e7d
        failing since 1 day (last pass: next-20230608, first fail: next-202=
30712) =

 =20
