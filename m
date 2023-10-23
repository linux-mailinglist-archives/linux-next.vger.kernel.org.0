Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56BF57D3544
	for <lists+linux-next@lfdr.de>; Mon, 23 Oct 2023 13:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234557AbjJWLqt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Oct 2023 07:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234550AbjJWLqe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Oct 2023 07:46:34 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757B810FC
        for <linux-next@vger.kernel.org>; Mon, 23 Oct 2023 04:46:25 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-565e54cb93aso1674918a12.3
        for <linux-next@vger.kernel.org>; Mon, 23 Oct 2023 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698061584; x=1698666384; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kXzkULEyGrrSMqiNrG5fhzkUuP3JI5xsD3Q+T8TC09A=;
        b=JC9juaJrcRnoWzStvp2dsw96AGft02uq5q3bVj5xKGLV3XM4vzaW+e0U/Jd8AVgDVT
         MW481WqqDgCTmLBGuPP5B4kHOQYtJsEZNu7JD0lhUJetsFbjIs74t3s11Nx/lqCJAkEI
         AGMdc1oBnqYlLv4mdnyIyKgVch9E5xk/kheOXoxySIC33gxwLL6SdGi87P3Qq4zSIxeB
         Z+Pbq0YEGzxyDAAKW1ZB2bZAZpuFUdYYaSLVhzK0O06Z/soUlO04kzVVjJt/F+sJ4Qks
         WNQRI60VzY6eY6f4cuWndXgZy4/HdhhbN8/m65Ii9J41/dV1CAFnxRYrVS+w4OeQVLlR
         kyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698061584; x=1698666384;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXzkULEyGrrSMqiNrG5fhzkUuP3JI5xsD3Q+T8TC09A=;
        b=UKSZ26Xw6cPFNExBnmhing0MxrqgBRCSfruHDKMaPN7kZgd2LeeE9i3UafAtqDhUai
         jBec+esnNFsi9ynmquIUI/IQcyaKPhOHAh9PtTON8jzDZMrxtKfF6nM0sDZrGhSplkf2
         +t/gQ7tFjAQqJNWn2dIsODENbIK+egz3aYoPCc80rYmS6PFhiLgugSkhRFb2X4itECk0
         /SLQg0fv4nZoWD4spz7U1wrRfU4ULQ142n2BwaaoHF/HgYp5uDe2OlY6gYH64j2P4oei
         j6a9nfxCYrIPd53xkJFMiCegtb5t7HgHje191GPKuU3K017jBRoplBnGnrQ6XVGyId38
         TSrg==
X-Gm-Message-State: AOJu0YwsJ7kjNS0NzjNid6ESBMsBgEqUlYKHAk5G+bhVhnLCruSwjm93
        soGYz1YBPPHYg5MX7+QAf+pmFQwwgHOoMLERvefyqw==
X-Google-Smtp-Source: AGHT+IE368qhLX4KZZHanod+o2o4oExA2IVqOc7JRIg8itlHtsdSVD6dD48GJ7iDyLmC2Zv83pwKHA==
X-Received: by 2002:a17:902:f9c3:b0:1c9:d948:33ea with SMTP id kz3-20020a170902f9c300b001c9d94833eamr5506065plb.21.1698061584086;
        Mon, 23 Oct 2023 04:46:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b001b890009634sm5734447plg.139.2023.10.23.04.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 04:46:23 -0700 (PDT)
Message-ID: <65365d0f.170a0220.ab915.06f5@mx.google.com>
Date:   Mon, 23 Oct 2023 04:46:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231023
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 381 runs, 24 regressions (next-20231023)
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

next/master baseline: 381 runs, 24 regressions (next-20231023)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | clang-17 | defconfig=
                    | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
                    | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | clang-17 | defconfig=
                    | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =

r8a774c0-ek874               | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =

r8a77960-ulcb                | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =

r8a779m1-ulcb                | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | clang-17 | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231023/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231023
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e8361b005d7c92997d12f2b85a9e4a525738bd9d =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361c30d97c702b43efcf04

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361c30d97c702b43efcf0d
        new failure (last pass: next-20230704)

    2023-10-23T07:09:16.637660  + set<8>[   18.256496] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3811522_1.5.2.4.1>
    2023-10-23T07:09:16.637860   +x
    2023-10-23T07:09:16.742450  / # #
    2023-10-23T07:09:17.896805  export SHELL=3D/bin/sh
    2023-10-23T07:09:17.902306  #
    2023-10-23T07:09:19.442798  / # export SHELL=3D/bin/sh. /lava-3811522/e=
nvironment
    2023-10-23T07:09:19.448276  =

    2023-10-23T07:09:22.257303  / # . /lava-3811522/environment/lava-381152=
2/bin/lava-test-runner /lava-3811522/1
    2023-10-23T07:09:22.263058  =

    2023-10-23T07:09:22.263265  / # /lava-3811522/bin/lava-t<3>[   22.42288=
7] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistan=
ce =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65361eeab8ae9404e8efcf36

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361eeab8ae9404e8efcf3f
        failing since 20 days (last pass: next-20230717, first fail: next-2=
0231003)

    2023-10-23T07:20:58.571689  / # #
    2023-10-23T07:20:59.726034  export SHELL=3D/bin/sh
    2023-10-23T07:20:59.731530  #
    2023-10-23T07:21:01.271585  / # export SHELL=3D/bin/sh. /lava-3811591/e=
nvironment
    2023-10-23T07:21:01.277066  =

    2023-10-23T07:21:04.085630  / # . /lava-3811591/environment/lava-381159=
1/bin/lava-test-runner /lava-3811591/1
    2023-10-23T07:21:04.091463  =

    2023-10-23T07:21:04.091672  / # /lava-3811591/bin/lava-<3>[   22.425560=
] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance
    2023-10-23T07:21:04.092464  test-runner /lava-3811591/1
    2023-10-23T07:21:04.136880  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361f765178d90aefefcf1a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361f765178d90aefefcf23
        failing since 20 days (last pass: next-20230717, first fail: next-2=
0231003)

    2023-10-23T07:23:03.506798  / # #
    2023-10-23T07:23:04.660639  export SHELL=3D/bin/sh
    2023-10-23T07:23:04.666065  #
    2023-10-23T07:23:06.205350  / # export SHELL=3D/bin/sh. /lava-3811612/e=
nvironment
    2023-10-23T07:23:06.210742  =

    2023-10-23T07:23:09.018099  / # . /lava-3811612/environment/lava-381161=
2/bin/lava-test-runner /lava-3811612/1
    2023-10-23T07:23:09.023822  =

    2023-10-23T07:23:09.024027  / # /lava-3811612/bin/lav<3>[   24.217611] =
caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance
    2023-10-23T07:23:09.026585  a-test-runner /lava-3811612/1
    2023-10-23T07:23:09.058586  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361c495b142c0b78efcf24

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361c495b142c0b78efcf2d
        failing since 68 days (last pass: next-20230807, first fail: next-2=
0230815)

    2023-10-23T07:09:48.359144  + set<8>[   28.559279] <LAVA_SIGNAL_ENDRUN =
0_dmesg 186984_1.5.2.4.1>
    2023-10-23T07:09:48.359768   +x
    2023-10-23T07:09:48.469941  / # #
    2023-10-23T07:09:49.636269  export SHELL=3D/bin/sh
    2023-10-23T07:09:49.642456  #
    2023-10-23T07:09:51.141368  / # export SHELL=3D/bin/sh. /lava-186984/en=
vironment
    2023-10-23T07:09:51.147404  =

    2023-10-23T07:09:53.871014  / # . /lava-186984/environment/lava-186984/=
bin/lava-test-runner /lava-186984/1
    2023-10-23T07:09:53.877891  =

    2023-10-23T07:09:53.894366  / # /lava-186984/bin/lava-test-runner /lava=
-186984/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65361cd58a92993a42efcf05

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-imx8mp-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361cd58a92993a42efcf0e
        failing since 68 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-23T07:12:00.716921  + set<8>[   28.151030] <LAVA_SIGNAL_ENDRUN =
0_dmesg 187021_1.5.2.4.1>
    2023-10-23T07:12:00.717497   +x
    2023-10-23T07:12:00.825871  / # #
    2023-10-23T07:12:01.991618  export SHELL=3D/bin/sh
    2023-10-23T07:12:01.997684  #
    2023-10-23T07:12:03.496546  / # export SHELL=3D/bin/sh. /lava-187021/en=
vironment
    2023-10-23T07:12:03.502628  =

    2023-10-23T07:12:06.224949  / # . /lava-187021/environment/lava-187021/=
bin/lava-test-runner /lava-187021/1
    2023-10-23T07:12:06.231661  =

    2023-10-23T07:12:06.237305  / # /lava-187021/bin/lava-test-runner /lava=
-187021/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/653620090b4c93a89befcf28

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653620090b4c93a89befcf31
        failing since 68 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-23T07:25:46.276093  + set<8>[   28.194630] <LAVA_SIGNAL_ENDRUN =
0_dmesg 187039_1.5.2.4.1>
    2023-10-23T07:25:46.276690   +x
    2023-10-23T07:25:46.385293  / # #
    2023-10-23T07:25:47.551375  export SHELL=3D/bin/sh
    2023-10-23T07:25:47.557462  #
    2023-10-23T07:25:49.056867  / # export SHELL=3D/bin/sh. /lava-187039/en=
vironment
    2023-10-23T07:25:49.062940  =

    2023-10-23T07:25:51.786868  / # . /lava-187039/environment/lava-187039/=
bin/lava-test-runner /lava-187039/1
    2023-10-23T07:25:51.793683  =

    2023-10-23T07:25:51.795670  / # /lava-187039/bin/lava-test-runner /lava=
-187039/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/653620a922d2581e97efcf32

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653620a922d2581e97efcf3b
        failing since 68 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-23T07:28:16.737141  + set<8>[   29.730198] <LAVA_SIGNAL_ENDRUN =
0_dmesg 187077_1.5.2.4.1>
    2023-10-23T07:28:16.737734   +x
    2023-10-23T07:28:16.846254  / # #
    2023-10-23T07:28:18.012393  export SHELL=3D/bin/sh
    2023-10-23T07:28:18.018568  #
    2023-10-23T07:28:19.517960  / # export SHELL=3D/bin/sh. /lava-187077/en=
vironment
    2023-10-23T07:28:19.523987  =

    2023-10-23T07:28:22.238274  / # . /lava-187077/environment/lava-187077/=
bin/lava-test-runner /lava-187077/1
    2023-10-23T07:28:22.244675  =

    2023-10-23T07:28:22.255359  / # /lava-187077/bin/lava-test-runner /lava=
-187077/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361d319b4fea8e3fefcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65361d319b4fea8e3fefc=
ef4
        new failure (last pass: next-20230713) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65361f3a0626ab88f3efcf53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65361f3a0626ab88f3efc=
f54
        new failure (last pass: next-20230719) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/653627c2caaaaca97defcf30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653627c2caaaaca97defc=
f31
        new failure (last pass: next-20231020) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8195-cherry-tomato-r2      | arm64 | lab-collabora | gcc-10   | defconfig=
+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6536285806dc2c1b5eefcefc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-mt8195-=
cherry-tomato-r2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6536285806dc2c1b5eefc=
efd
        new failure (last pass: next-20231020) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a774c0-ek874               | arm64 | lab-cip       | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361c9995ffb0c3b0efcf28

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361c9995ffb0c3b0efcf2f
        failing since 88 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-10-23T07:11:04.364410  / # #
    2023-10-23T07:11:05.818284  export SHELL=3D/bin/sh
    2023-10-23T07:11:05.838630  #
    2023-10-23T07:11:05.838795  / # export SHELL=3D/bin/sh
    2023-10-23T07:11:07.784108  / # . /lava-1024646/environment
    2023-10-23T07:11:11.365602  /lava-1024646/bin/lava-test-runner /lava-10=
24646/1
    2023-10-23T07:11:11.387239  . /lava-1024646/environment
    2023-10-23T07:11:11.387688  / # /lava-1024646/bin/lava-test-runner /lav=
a-1024646/1
    2023-10-23T07:11:11.469725  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-23T07:11:11.470038  + cd /lava-1024646/1/tests/1_bootrr =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77960-ulcb                | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361c1bc060b8e7f3efcef3

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361c1bc060b8e7f3efcefc
        failing since 88 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-10-23T07:13:17.040326  / # #

    2023-10-23T07:13:17.142435  export SHELL=3D/bin/sh

    2023-10-23T07:13:17.143159  #

    2023-10-23T07:13:17.244613  / # export SHELL=3D/bin/sh. /lava-11852051/=
environment

    2023-10-23T07:13:17.245301  =


    2023-10-23T07:13:17.346706  / # . /lava-11852051/environment/lava-11852=
051/bin/lava-test-runner /lava-11852051/1

    2023-10-23T07:13:17.347843  =


    2023-10-23T07:13:17.364600  / # /lava-11852051/bin/lava-test-runner /la=
va-11852051/1

    2023-10-23T07:13:17.414350  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-23T07:13:17.414861  + cd /lava-118520<8>[   20.219790] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11852051_1.5.2.4.5>
 =

    ... (28 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a779m1-ulcb                | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361c28ed14daab76efcf2f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-collabora/baseline-r8a779m1-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361c28ed14daab76efcf38
        failing since 88 days (last pass: next-20230713, first fail: next-2=
0230726)

    2023-10-23T07:12:02.954472  / # #

    2023-10-23T07:12:04.029450  export SHELL=3D/bin/sh

    2023-10-23T07:12:04.031141  #

    2023-10-23T07:12:05.519083  / # export SHELL=3D/bin/sh. /lava-11852040/=
environment

    2023-10-23T07:12:05.520343  =


    2023-10-23T07:12:08.236733  / # . /lava-11852040/environment/lava-11852=
040/bin/lava-test-runner /lava-11852040/1

    2023-10-23T07:12:08.238132  =


    2023-10-23T07:12:08.252687  / # /lava-11852040/bin/lava-test-runner /la=
va-11852040/1

    2023-10-23T07:12:08.268660  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-23T07:12:08.311750  + cd /lava-118520<8>[   29.503452] <LAVA_SI=
GNAL_STARTRUN 1_bootrr 11852040_1.5.2.4.5>
 =

    ... (38 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65361c9d95ffb0c3b0efcf40

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361c9d95ffb0c3b0efcf49
        failing since 167 days (last pass: next-20230505, first fail: next-=
20230508)

    2023-10-23T07:11:08.117375  <8>[   19.432097] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 439917_1.5.2.4.1>
    2023-10-23T07:11:08.222182  / # #
    2023-10-23T07:11:08.323710  export SHELL=3D/bin/sh
    2023-10-23T07:11:08.327555  #
    2023-10-23T07:11:08.428424  / # export SHELL=3D/bin/sh. /lava-439917/en=
vironment
    2023-10-23T07:11:08.428913  =

    2023-10-23T07:11:08.529698  / # . /lava-439917/environment/lava-439917/=
bin/lava-test-runner /lava-439917/1
    2023-10-23T07:11:08.530409  =

    2023-10-23T07:11:08.536583  / # /lava-439917/bin/lava-test-runner /lava=
-439917/1
    2023-10-23T07:11:08.581329  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361f595178d90aefefcf0b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361f595178d90aefefcf14
        failing since 2 days (last pass: next-20231013, first fail: next-20=
231020)

    2023-10-23T07:22:50.541566  <8>[   21.921591] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 439926_1.5.2.4.1>
    2023-10-23T07:22:50.647198  / # #
    2023-10-23T07:22:50.749072  export SHELL=3D/bin/sh
    2023-10-23T07:22:50.749730  #
    2023-10-23T07:22:50.850895  / # export SHELL=3D/bin/sh. /lava-439926/en=
vironment
    2023-10-23T07:22:50.851580  =

    2023-10-23T07:22:50.952758  / # . /lava-439926/environment/lava-439926/=
bin/lava-test-runner /lava-439926/1
    2023-10-23T07:22:50.953673  =

    2023-10-23T07:22:50.960368  / # /lava-439926/bin/lava-test-runner /lava=
-439926/1
    2023-10-23T07:22:51.011107  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361c25c060b8e7f3efcf01

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361c25c060b8e7f3efcf0a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-23T07:09:10.712250  <8>[   18.841623] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 439910_1.5.2.4.1>
    2023-10-23T07:09:10.817481  / # #
    2023-10-23T07:09:10.919217  export SHELL=3D/bin/sh
    2023-10-23T07:09:10.919965  #
    2023-10-23T07:09:11.021091  / # export SHELL=3D/bin/sh. /lava-439910/en=
vironment
    2023-10-23T07:09:11.021795  =

    2023-10-23T07:09:11.122911  / # . /lava-439910/environment/lava-439910/=
bin/lava-test-runner /lava-439910/1
    2023-10-23T07:09:11.123836  =

    2023-10-23T07:09:11.127302  / # /lava-439910/bin/lava-test-runner /lava=
-439910/1
    2023-10-23T07:09:11.206440  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | clang-17 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361c2be1ad8d727defcf41

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.2 (++20231003073020+b241=
7f51dbbd-1~exp1~20231003073113.51))
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/clang-17/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361c2be1ad8d727defcf4a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-10-23T07:13:30.814053  / # #

    2023-10-23T07:13:30.914946  export SHELL=3D/bin/sh

    2023-10-23T07:13:30.915698  #

    2023-10-23T07:13:31.017123  / # export SHELL=3D/bin/sh. /lava-11852042/=
environment

    2023-10-23T07:13:31.017421  =


    2023-10-23T07:13:31.118362  / # . /lava-11852042/environment/lava-11852=
042/bin/lava-test-runner /lava-11852042/1

    2023-10-23T07:13:31.119423  =


    2023-10-23T07:13:31.127745  / # /lava-11852042/bin/lava-test-runner /la=
va-11852042/1

    2023-10-23T07:13:31.201154  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-23T07:13:31.201311  + cd /lava-1185204<8>[   19.491867] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11852042_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65361c9e5dcaa5f03defd010

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361c9e5dcaa5f03defd019
        failing since 12 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-10-23T07:11:08.676466  <8>[   18.929521] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 439918_1.5.2.4.1>
    2023-10-23T07:11:08.779987  / # #
    2023-10-23T07:11:08.881482  export SHELL=3D/bin/sh
    2023-10-23T07:11:08.881988  #
    2023-10-23T07:11:08.982901  / # export SHELL=3D/bin/sh. /lava-439918/en=
vironment
    2023-10-23T07:11:08.983393  =

    2023-10-23T07:11:09.084319  / # . /lava-439918/environment/lava-439918/=
bin/lava-test-runner /lava-439918/1
    2023-10-23T07:11:09.088661  =

    2023-10-23T07:11:09.091750  / # /lava-439918/bin/lava-test-runner /lava=
-439918/1
    2023-10-23T07:11:09.179935  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65361ee220b9c06d88efcf46

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361ee220b9c06d88efcf4f
        failing since 12 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-10-23T07:20:44.964878  / # #
    2023-10-23T07:20:45.066740  export SHELL=3D/bin/sh
    2023-10-23T07:20:45.067419  #
    2023-10-23T07:20:45.168476  / # export SHELL=3D/bin/sh. /lava-439921/en=
vironment
    2023-10-23T07:20:45.169545  =

    2023-10-23T07:20:45.270878  / # . /lava-439921/environment/lava-439921/=
bin/lava-test-runner /lava-439921/1
    2023-10-23T07:20:45.271897  =

    2023-10-23T07:20:45.289179  / # /lava-439921/bin/lava-test-runner /lava=
-439921/1
    2023-10-23T07:20:45.353255  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-23T07:20:45.353838  + cd /lava-439921/<8>[   19.334950] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 439921_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361f5a4daa4a1f40efcf0c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361f5a4daa4a1f40efcf15
        failing since 9 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20231013)

    2023-10-23T07:22:48.320130  / # #
    2023-10-23T07:22:48.421836  export SHELL=3D/bin/sh
    2023-10-23T07:22:48.422527  #
    2023-10-23T07:22:48.523635  / # export SHELL=3D/bin/sh. /lava-439929/en=
vironment
    2023-10-23T07:22:48.524282  =

    2023-10-23T07:22:48.625328  / # . /lava-439929/environment/lava-439929/=
bin/lava-test-runner /lava-439929/1
    2023-10-23T07:22:48.626490  =

    2023-10-23T07:22:48.629846  / # /lava-439929/bin/lava-test-runner /lava=
-439929/1
    2023-10-23T07:22:48.709018  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-23T07:22:48.709655  + cd /lava-439929/<8>[   19.133044] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 439929_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65361c7b553030bfe7efcf23

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361c7b553030bfe7efcf2c
        failing since 12 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-10-23T07:14:55.920191  / # #

    2023-10-23T07:14:56.022443  export SHELL=3D/bin/sh

    2023-10-23T07:14:56.023200  #

    2023-10-23T07:14:56.124674  / # export SHELL=3D/bin/sh. /lava-11852072/=
environment

    2023-10-23T07:14:56.125431  =


    2023-10-23T07:14:56.226950  / # . /lava-11852072/environment/lava-11852=
072/bin/lava-test-runner /lava-11852072/1

    2023-10-23T07:14:56.228387  =


    2023-10-23T07:14:56.244679  / # /lava-11852072/bin/lava-test-runner /la=
va-11852072/1

    2023-10-23T07:14:56.317715  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-23T07:14:56.318210  + cd /lava-11852072/1/tests/1_boot<8>[   19=
.452638] <LAVA_SIGNAL_STARTRUN 1_bootrr 11852072_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/65361ee8f121ca7ad0efcf14

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361ee8f121ca7ad0efcf1d
        failing since 12 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-10-23T07:25:13.279270  / # #

    2023-10-23T07:25:13.381470  export SHELL=3D/bin/sh

    2023-10-23T07:25:13.382171  #

    2023-10-23T07:25:13.483542  / # export SHELL=3D/bin/sh. /lava-11852097/=
environment

    2023-10-23T07:25:13.484336  =


    2023-10-23T07:25:13.585798  / # . /lava-11852097/environment/lava-11852=
097/bin/lava-test-runner /lava-11852097/1

    2023-10-23T07:25:13.587002  =


    2023-10-23T07:25:13.628206  / # /lava-11852097/bin/lava-test-runner /la=
va-11852097/1

    2023-10-23T07:25:13.628690  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-23T07:25:13.667672  + cd /lava-1185209<8>[   19.324032] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11852097_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65361f4cc3cac114daefcefa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231023/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65361f4cc3cac114daefcf03
        failing since 9 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20231013)

    2023-10-23T07:26:50.243910  / # #

    2023-10-23T07:26:50.346061  export SHELL=3D/bin/sh

    2023-10-23T07:26:50.346753  #

    2023-10-23T07:26:50.448039  / # export SHELL=3D/bin/sh. /lava-11852128/=
environment

    2023-10-23T07:26:50.448705  =


    2023-10-23T07:26:50.550069  / # . /lava-11852128/environment/lava-11852=
128/bin/lava-test-runner /lava-11852128/1

    2023-10-23T07:26:50.551159  =


    2023-10-23T07:26:50.568015  / # /lava-11852128/bin/lava-test-runner /la=
va-11852128/1

    2023-10-23T07:26:50.633241  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-23T07:26:50.633735  + cd /lava-1185212<8>[   19.400573] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11852128_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
