Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B18C6663D3E
	for <lists+linux-next@lfdr.de>; Tue, 10 Jan 2023 10:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238188AbjAJJs7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Jan 2023 04:48:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238272AbjAJJs4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Jan 2023 04:48:56 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5533C4FCC5
        for <linux-next@vger.kernel.org>; Tue, 10 Jan 2023 01:48:53 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id w3so12624678ply.3
        for <linux-next@vger.kernel.org>; Tue, 10 Jan 2023 01:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f5++4YhV66DpNpYmWwlD+j5GHLT+cbtUk9D4u0ie1aQ=;
        b=QmacS4YHSciZ6bUrGY45L/rWzYqbr78Bbz36NypDn3dbfGSBPxgiPj95N9SIZi5jBY
         nPZJo4Ekh3eGJf1D1C6IOoDgkGITyPOy2rCh1/rRvQK7dNE4yR0NuSgBBGUcy+PdYNVc
         luOf09Y2Son9sPHUyzD7VkubXE2Q2FlZYsWWDz0OZkUG6FKjKc0ofJMSJ5Tvrc0CNXAy
         1pjYuzy5U9CvNgij+MnmB9+2wtuVT4Y9W17obdqvkY3pLtaCjwxRfrhLq1GHmkJZmXon
         7ckMjEo9RXnfnklk+9nluPsLYZ6KJRu7DB+LgKTQEpHs/V9QHMX3x7SnBJRYNEEq2Low
         lY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5++4YhV66DpNpYmWwlD+j5GHLT+cbtUk9D4u0ie1aQ=;
        b=vKcEV+3KiSlxcAkq5p4H7TxcVbcpE3nNQCWpkA5SI27+AhKsCjb6dr5TUvsW7w90Oi
         1wlAz/2jKdUwstEYZIiCdfz39GZIzGQsUJI77cAruzOL0CZ5kPJJ1Naez8yfja7qSI7d
         4RxQYyr7OIaCAtW8DTf7oa+mJ41s+4Y8rNzTQ7b154TWnGYPnHQKqw0ku3X9bU9GVWVL
         2Fs3hyxfTn6ADSgJwPKURQWXL+nmag513BB37yN53Zzu7sb82FgO0NOs9G2SuVrwt6/p
         xhC96bwTMZoMWZC/gUe2ZUchbAPFNPF8eoggVoA57p02ys9eMkN8EnZBWq5+orb48+TO
         Fvaw==
X-Gm-Message-State: AFqh2kpcd62SKrx8K0Ld8vw2/VzAxe7FkduozK2kuodCT2KgqQ8nf/uh
        QPW9NqkSGFK2Pem1F42mLzbuDX1zJ5d65aIGyF4qcg==
X-Google-Smtp-Source: AMrXdXsGj6R4QQIQ47qSY0QnMyz8Gl5v6xaQdudW+ePBzQ7IcgU4J9x6FJW3f+k5UMlXKp7/JyoQmQ==
X-Received: by 2002:a17:90a:c390:b0:228:da22:75bc with SMTP id h16-20020a17090ac39000b00228da2275bcmr16368pjt.22.1673344132399;
        Tue, 10 Jan 2023 01:48:52 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090a2a4500b0021e1c8ef788sm8679476pjg.51.2023.01.10.01.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 01:48:52 -0800 (PST)
Message-ID: <63bd3484.170a0220.44373.dc2d@mx.google.com>
Date:   Tue, 10 Jan 2023 01:48:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230110
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: next/master baseline: 328 runs, 18 regressions (next-20230110)
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

next/master baseline: 328 runs, 18 regressions (next-20230110)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie   | gcc-10   | bcm2835_d=
efconfig            | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp       | clang-16 | defconfig=
                    | 1          =

imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx8mp-evk                   | arm64 | lab-nxp       | clang-16 | defconfig=
                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp       | gcc-10   | defconfig=
+crypto             | 1          =

imx8mp-evk                   | arm64 | lab-nxp       | gcc-10   | defconfig=
+videodec           | 1          =

imx8mp-evk                   | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | clang-16 | defconfig=
                    | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+crypto             | 1          =

mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+crypto             | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora | clang-16 | defconfig=
                    | 1          =

sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | clang-16 | multi_v7_=
defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230110/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230110
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      435bf71af3a0aa8067f3b87ff9febf68b564dbb6 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie   | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcf6e9f6cfff535f1d39f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcf6e9f6cfff535f1d39f8
        failing since 5 days (last pass: next-20221017, first fail: next-20=
230105)

    2023-01-10T05:25:44.243095  + set +x
    2023-01-10T05:25:44.246893  <8>[   16.090345] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 80869_1.5.2.4.1>
    2023-01-10T05:25:44.359308  / # #
    2023-01-10T05:25:44.461544  export SHELL=3D/bin/sh
    2023-01-10T05:25:44.461979  #
    2023-01-10T05:25:44.563420  / # export SHELL=3D/bin/sh. /lava-80869/env=
ironment
    2023-01-10T05:25:44.563849  =

    2023-01-10T05:25:44.665393  / # . /lava-80869/environment/lava-80869/bi=
n/lava-test-runner /lava-80869/1
    2023-01-10T05:25:44.666138  =

    2023-01-10T05:25:44.673436  / # /lava-80869/bin/lava-test-runner /lava-=
80869/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp       | clang-16 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfa986387094a0c1d39e5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcfa986387094a0c1d39ea
        failing since 4 days (last pass: next-20221124, first fail: next-20=
230106)

    2023-01-10T05:41:14.549098  + [   18.894531] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1134000_1.5.2.4.1>
    2023-01-10T05:41:14.549295  set +x
    2023-01-10T05:41:14.653793  / # #
    2023-01-10T05:41:14.755490  export SHELL=3D/bin/sh
    2023-01-10T05:41:14.756058  #
    2023-01-10T05:41:14.857301  / # export SHELL=3D/bin/sh. /lava-1134000/e=
nvironment
    2023-01-10T05:41:14.857834  =

    2023-01-10T05:41:14.959250  / # . /lava-1134000/environment/lava-113400=
0/bin/lava-test-runner /lava-1134000/1
    2023-01-10T05:41:14.960090  =

    2023-01-10T05:41:14.962015  / # /lava-1134000/bin/lava-test-runner /lav=
a-1134000/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6dl-udoo                  | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd0083a6c95a19661d39dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd0083a6c95a19661d3=
9de
        failing since 213 days (last pass: next-20220607, first fail: next-=
20220610) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-udoo                   | arm   | lab-broonie   | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd010f64c3c48d641d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd010f64c3c48d641d3=
9cb
        failing since 124 days (last pass: next-20220831, first fail: next-=
20220907) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | clang-16 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfd0796c012f7491d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfd0796c012f7491d3=
9c3
        failing since 4 days (last pass: next-20221124, first fail: next-20=
230105) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcf7d8c7d5dbf4e21d39cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcf7d8c7d5dbf4e21d3=
9cc
        failing since 5 days (last pass: next-20221226, first fail: next-20=
230105) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | gcc-10   | defconfig=
+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcf9ae40787f99e21d39cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcf9ae40787f99e21d3=
9cd
        failing since 4 days (last pass: next-20221226, first fail: next-20=
230105) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfb67a08e2ad8291d3a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfb67a08e2ad8291d3=
a44
        failing since 5 days (last pass: next-20221226, first fail: next-20=
230105) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | clang-16 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfa2fdc76f1bb331d3a05

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig/clang-16/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig/clang-16/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcfa2fdc76f1bb331d3a0a
        failing since 4 days (last pass: next-20230105, first fail: next-20=
230106)

    2023-01-10T05:39:36.210829  <8>[   18.421001] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 81067_1.5.2.4.1>
    2023-01-10T05:39:36.320731  / # #
    2023-01-10T05:39:36.423934  export SHELL=3D/bin/sh
    2023-01-10T05:39:36.424844  #
    2023-01-10T05:39:36.526892  / # export SHELL=3D/bin/sh. /lava-81067/env=
ironment
    2023-01-10T05:39:36.527843  =

    2023-01-10T05:39:36.629933  / # . /lava-81067/environment/lava-81067/bi=
n/lava-test-runner /lava-81067/1
    2023-01-10T05:39:36.631640  =

    2023-01-10T05:39:36.634545  / # /lava-81067/bin/lava-test-runner /lava-=
81067/1
    2023-01-10T05:39:36.676110  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-broonie   | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcf6aa7d03415bb31d39f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcf6aa7d03415bb31d39fc
        failing since 1 day (last pass: next-20230105, first fail: next-202=
30109)

    2023-01-10T05:24:37.791192  <8>[   18.507050] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 80845_1.5.2.4.1>
    2023-01-10T05:24:37.898368  / # #
    2023-01-10T05:24:38.000086  export SHELL=3D/bin/sh
    2023-01-10T05:24:38.000544  #
    2023-01-10T05:24:38.101803  / # export SHELL=3D/bin/sh. /lava-80845/env=
ironment
    2023-01-10T05:24:38.102258  =

    2023-01-10T05:24:38.203548  / # . /lava-80845/environment/lava-80845/bi=
n/lava-test-runner /lava-80845/1
    2023-01-10T05:24:38.204269  =

    2023-01-10T05:24:38.207242  / # /lava-80845/bin/lava-test-runner /lava-=
80845/1
    2023-01-10T05:24:38.245670  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfbf43f3657c8131d39f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfbf43f3657c8131d3=
9f9
        new failure (last pass: next-20230109) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfbfb3f3657c8131d3a1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfbfb3f3657c8131d3=
a1f
        new failure (last pass: next-20230109) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcf696000a613f761d3a05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcf696000a613f761d3=
a06
        failing since 4 days (last pass: next-20230105, first fail: next-20=
230106) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip       | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63bd0a468f1ee0d5441d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bd0a468f1ee0d5441d3=
9d2
        new failure (last pass: next-20230109) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora | clang-16 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfaf4bef7dba81f1d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig/clang-16/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig/clang-16/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfaf4bef7dba81f1d3=
9d3
        new failure (last pass: next-20230109) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdor-kingoftown    | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfbfd15a03f5ed21d39f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-k=
ingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-k=
ingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfbfd15a03f5ed21d3=
9f4
        new failure (last pass: next-20230109) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfbfd15a03f5ed21d39f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-l=
azor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-l=
azor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bcfbfd15a03f5ed21d3=
9f1
        new failure (last pass: next-20230109) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | clang-16 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bcfd06e2279595db1d39de

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230110/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230110/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bcfd06e2279595db1d39e1
        failing since 5 days (last pass: next-20220919, first fail: next-20=
230105)

    2023-01-10T05:51:45.475989  [   19.524687] <LAVA_SIGNAL_ENDRUN 0_dmesg =
376697_1.5.2.4.1>
    2023-01-10T05:51:45.476402  / # [   19.538745] usb-storage 2-1.1:1.0: U=
SB Mass Storage device detected
    2023-01-10T05:51:45.476592  [   19.547654] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-10T05:51:45.582514  [   19.561827] usbcore: registered new inte=
rface driver uas#
    2023-01-10T05:51:45.684467  export SHELL=3D/bin/sh
    2023-01-10T05:51:45.685064  =

    2023-01-10T05:51:45.685328  #
    2023-01-10T05:51:45.786449  / # export SHELL=3D/bin/sh. /lava-376697/en=
vironment
    2023-01-10T05:51:45.787047  =

    2023-01-10T05:51:45.888402  / # . /lava-376697/environment/lava-376697/=
bin/lava-test-runner /lava-376697/1 =

    ... (22 line(s) more)  =

 =20
