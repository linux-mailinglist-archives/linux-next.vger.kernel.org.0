Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE1370F4D8
	for <lists+linux-next@lfdr.de>; Wed, 24 May 2023 13:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbjEXLMc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 May 2023 07:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjEXLMb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 May 2023 07:12:31 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8932D83
        for <linux-next@vger.kernel.org>; Wed, 24 May 2023 04:12:27 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1ae3a5dfa42so1041565ad.0
        for <linux-next@vger.kernel.org>; Wed, 24 May 2023 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1684926746; x=1687518746;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vYvq4//bggJ189qK9Z28tEqH/NW+ALAmGbkzSM+OHH8=;
        b=Yme2rEZoefFqgVQedHXNG9vGYyBYD01yjXT4PzTmMvXVrACeFN4J6jjUvwwj8DjPU2
         OZvO/Y10k7EV4a4d55rhxwKgwCJaUV6lenlh8Vaw9K3uKtTJsFn1B+g4en2+mAFzH9m4
         +X5uX7V0GMXiE9On8TyolxDxElRtBNV3XSW+Yc2UKu70krBqEwb11PQCJdlGJ/p4an9M
         JVSs2NLhISXnNQRWW2VJuvtrJEslidyNzNIGtAXolaPb3ElbkB8otIgrWtSkrh0omI14
         mB9b+SzEP9F+CGdNVuc9bwXWQTZKzUwJvV1e3iOYkFp8CYCTqU9MJ5AP/PW9Zb+FSA0I
         aahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684926746; x=1687518746;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYvq4//bggJ189qK9Z28tEqH/NW+ALAmGbkzSM+OHH8=;
        b=F2yLiPk/PRtXD+iPcl+f8Kkvnni+E7+u4AhqhPQPgz3eM0NyZW+8TjVQvo/+GWiids
         nISwES/Z9ACTOgmFAMQ0BGFWA5BsrCmeXzxci/K3Wb8lb8b2CwrqBxSkshh9syh9suns
         2mbd5KaJSRYx5/1ETzrprwAuS+zzpWxhPOb0ao0i5iE7L6Rw9dBYizZwz/leFkIGdsqN
         9MOfJRwWM4PuBPfO85acuYFppnhca2Yh/fvqpRmgYkR7cDq1hmSYRG1ryP/9albGx+eO
         5/AlPPsT8Sr+ViI9sRhmGYYL5ZLOh3+wGqxjpSDHj8dTZut8zx2NUAUGyows7dkF6ff2
         KNDA==
X-Gm-Message-State: AC+VfDxQSHNY0h2vO2xfz9GeXCSKlsZxN4J7hP0M1meLQ9QI7RWWBAMh
        Ry99pOYIuoW7Ksb9OpmacsxLYEK5xh45+1DDqvw/Pg==
X-Google-Smtp-Source: ACHHUZ4kSpYdW83N2njBfSEguDZtK9WNbiwJL9MWUHW/pqkCWvQgqjtp8PHk1ZycM2dFPGqlGahkng==
X-Received: by 2002:a17:902:d714:b0:1ac:8475:87c5 with SMTP id w20-20020a170902d71400b001ac847587c5mr15420233ply.56.1684926745051;
        Wed, 24 May 2023 04:12:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902e94500b001aadd0d7364sm8498883pll.83.2023.05.24.04.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 04:12:24 -0700 (PDT)
Message-ID: <646df118.170a0220.c7fab.f67e@mx.google.com>
Date:   Wed, 24 May 2023 04:12:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230524
X-Kernelci-Report-Type: test
Subject: next/master baseline: 614 runs, 64 regressions (next-20230524)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 614 runs, 64 regressions (next-20230524)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | omap2p=
lus_defconfig          | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10   | exynos=
_defconfig             | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | clang-17 | multi_=
v7_defconfig           | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 3          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig                    | 3          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 3          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230524/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230524
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cf09e328589a2ed7f6c8d90f2edb697fb4f8a96b =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/646dc9b27863cbf7582e870b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dc9b27863cbf7582e8=
70c
        failing since 249 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/646dc9da0ce963e3592e85f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
646dc9da0ce963e3592e85f8
        failing since 7 days (last pass: next-20230516, first fail: next-20=
230517)

    2023-05-24T08:24:42.517619  /lava-6451076/1/../bin/lava-test-case
    2023-05-24T08:24:42.559771  <8>[   22.934020] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>
    2023-05-24T08:24:42.560133  /lava-6451076/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646db5e9031eabe4f92e85e9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646db5e9031eabe4f92e85ee
        failing since 56 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-24T06:59:40.660952  <8>[   10.775382] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10436088_1.4.2.3.1>

    2023-05-24T06:59:40.664409  + set +x

    2023-05-24T06:59:40.765838  /#

    2023-05-24T06:59:40.866659   # #export SHELL=3D/bin/sh

    2023-05-24T06:59:40.866919  =


    2023-05-24T06:59:40.967508  / # export SHELL=3D/bin/sh. /lava-10436088/=
environment

    2023-05-24T06:59:40.967722  =


    2023-05-24T06:59:41.068214  / # . /lava-10436088/environment/lava-10436=
088/bin/lava-test-runner /lava-10436088/1

    2023-05-24T06:59:41.068489  =


    2023-05-24T06:59:41.074523  / # /lava-10436088/bin/lava-test-runner /la=
va-10436088/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646db984c59e9a56d22e86b9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646db984c59e9a56d22e86be
        failing since 56 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-24T07:14:59.274264  <8>[   12.319111] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10436257_1.4.2.3.1>

    2023-05-24T07:14:59.277887  + set +x

    2023-05-24T07:14:59.381879  / # #

    2023-05-24T07:14:59.482456  export SHELL=3D/bin/sh

    2023-05-24T07:14:59.482680  #

    2023-05-24T07:14:59.583157  / # export SHELL=3D/bin/sh. /lava-10436257/=
environment

    2023-05-24T07:14:59.583416  =


    2023-05-24T07:14:59.683968  / # . /lava-10436257/environment/lava-10436=
257/bin/lava-test-runner /lava-10436257/1

    2023-05-24T07:14:59.684334  =


    2023-05-24T07:14:59.689503  / # /lava-10436257/bin/lava-test-runner /la=
va-10436257/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646db5e97c485843ad2e85fd

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646db5e97c485843ad2e8602
        failing since 56 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-24T06:59:36.858860  <8>[   10.935759] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10436077_1.4.2.3.1>

    2023-05-24T06:59:36.862090  + set +x

    2023-05-24T06:59:36.963680  =


    2023-05-24T06:59:37.064281  / # #export SHELL=3D/bin/sh

    2023-05-24T06:59:37.064497  =


    2023-05-24T06:59:37.164974  / # export SHELL=3D/bin/sh. /lava-10436077/=
environment

    2023-05-24T06:59:37.165183  =


    2023-05-24T06:59:37.265732  / # . /lava-10436077/environment/lava-10436=
077/bin/lava-test-runner /lava-10436077/1

    2023-05-24T06:59:37.266032  =


    2023-05-24T06:59:37.271516  / # /lava-10436077/bin/lava-test-runner /la=
va-10436077/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646db9921b250c1c5e2e8608

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646db9921b250c1c5e2e860d
        failing since 56 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-24T07:15:02.830846  <8>[   11.150205] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10436313_1.4.2.3.1>

    2023-05-24T07:15:02.833951  + set +x

    2023-05-24T07:15:02.935131  #

    2023-05-24T07:15:03.035854  / # #export SHELL=3D/bin/sh

    2023-05-24T07:15:03.036073  =


    2023-05-24T07:15:03.136606  / # export SHELL=3D/bin/sh. /lava-10436313/=
environment

    2023-05-24T07:15:03.136807  =


    2023-05-24T07:15:03.237339  / # . /lava-10436313/environment/lava-10436=
313/bin/lava-test-runner /lava-10436313/1

    2023-05-24T07:15:03.237635  =


    2023-05-24T07:15:03.242710  / # /lava-10436313/bin/lava-test-runner /la=
va-10436313/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646dbb5dc89d063dae2e8611

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dbb5dc89d063dae2e8=
612
        failing since 56 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/646db68a92dc477fe12e860c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646db68a92dc477fe12e8611
        failing since 56 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-24T07:02:21.376499  + set +x

    2023-05-24T07:02:21.383245  <8>[   11.086020] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10436112_1.4.2.3.1>

    2023-05-24T07:02:21.487717  / # #

    2023-05-24T07:02:21.588532  export SHELL=3D/bin/sh

    2023-05-24T07:02:21.588819  #

    2023-05-24T07:02:21.689396  / # export SHELL=3D/bin/sh. /lava-10436112/=
environment

    2023-05-24T07:02:21.689612  =


    2023-05-24T07:02:21.790117  / # . /lava-10436112/environment/lava-10436=
112/bin/lava-test-runner /lava-10436112/1

    2023-05-24T07:02:21.790504  =


    2023-05-24T07:02:21.795059  / # /lava-10436112/bin/lava-test-runner /la=
va-10436112/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646db97bc59e9a56d22e8684

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646db97bc59e9a56d22e8689
        failing since 56 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-24T07:14:52.523490  + set +x

    2023-05-24T07:14:52.529956  <8>[   10.626809] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10436333_1.4.2.3.1>

    2023-05-24T07:14:52.635170  / # #

    2023-05-24T07:14:52.735769  export SHELL=3D/bin/sh

    2023-05-24T07:14:52.735964  #

    2023-05-24T07:14:52.836436  / # export SHELL=3D/bin/sh. /lava-10436333/=
environment

    2023-05-24T07:14:52.836640  =


    2023-05-24T07:14:52.937144  / # . /lava-10436333/environment/lava-10436=
333/bin/lava-test-runner /lava-10436333/1

    2023-05-24T07:14:52.937430  =


    2023-05-24T07:14:52.941880  / # /lava-10436333/bin/lava-test-runner /la=
va-10436333/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646db97ec59e9a56d22e869d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646db97ec59e9a56d22e86a2
        failing since 56 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-24T07:14:58.240923  <8>[   10.444304] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10436318_1.4.2.3.1>

    2023-05-24T07:14:58.244146  + set +x

    2023-05-24T07:14:58.345815  #

    2023-05-24T07:14:58.446756  / # #export SHELL=3D/bin/sh

    2023-05-24T07:14:58.447042  =


    2023-05-24T07:14:58.547684  / # export SHELL=3D/bin/sh. /lava-10436318/=
environment

    2023-05-24T07:14:58.547978  =


    2023-05-24T07:14:58.648661  / # . /lava-10436318/environment/lava-10436=
318/bin/lava-test-runner /lava-10436318/1

    2023-05-24T07:14:58.649114  =


    2023-05-24T07:14:58.653955  / # /lava-10436318/bin/lava-test-runner /la=
va-10436318/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/646db78477c659110d2e860e

  Results:     30 PASS, 3 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
646db78477c659110d2e862d
        failing since 2 days (last pass: next-20230428, first fail: next-20=
230522)

    2023-05-24T07:06:27.777909  /lava-505869/1/../bin/lava-test-case
    2023-05-24T07:06:27.802649  <8>[   17.113167] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/646db77469bb9461f82e86d6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
646db77469bb9461f82e86da
        failing since 7 days (last pass: next-20230516, first fail: next-20=
230517)

    2023-05-24T07:06:15.819988  /lava-958208/1/../bin/lava-test-case
    2023-05-24T07:06:15.847926  [    5.997482] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dall-cpus-are-online RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646dba3ee478fd72c52e86b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-juno-uboo=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-juno-uboo=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dba3ee478fd72c52e8=
6b8
        new failure (last pass: next-20230523) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/646dbba8930420f5b72e8616

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646dbba8930420f=
5b72e861d
        new failure (last pass: next-20230523)
        2 lines

    2023-05-24T07:23:59.896584  <3>[   44.583805] mmc0: error -84 whilst in=
itialising SD card
    2023-05-24T07:23:59.896936  :alert :   ESR =3D 0x0000000096000005
    2023-05-24T07:23:59.897259  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-24T07:23:59.897578  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-24T07:23:59.897895  kern<8>[   44.606326] <LAVA_SIGNAL_TESTCASE=
 TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-24T07:23:59.898207    :alert :<8>[   44.615631] <LAVA_SIGNAL_EN=
DRUN 0_dmesg 3614138_1.5.2.4.1>
    2023-05-24T07:23:59.898521     EA =3D 0, S1PTW =3D 0
    2023-05-24T07:23:59.898880  kern  :alert :   FSC =3D 0x05: level 1 tran=
slation fault   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646dbba8930420f=
5b72e861e
        new failure (last pass: next-20230523)
        12 lines

    2023-05-24T07:23:59.894828  kern  <8>[   44.581924] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646db9a350e7ee9d742e8615

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646db9a350e7ee9d742e8=
616
        new failure (last pass: next-20230523) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646dbeccfeb96f78852e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dbeccfeb96f78852e8=
5fe
        new failure (last pass: next-20230523) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646dc1ccac7f7ce45b2e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dc1ccac7f7ce45b2e8=
5f9
        new failure (last pass: next-20230519) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646dc0505893af670d2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dc0505893af670d2e8=
5e7
        new failure (last pass: next-20230522) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646dc1c9ac7f7ce45b2e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dc1c9ac7f7ce45b2e8=
5f4
        failing since 116 days (last pass: next-20230120, first fail: next-=
20230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646dc09beac30e8e742e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dc09beac30e8e742e8=
5f3
        failing since 119 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646dc11a08a8a28b6f2e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dc11a08a8a28b6f2e8=
5e9
        new failure (last pass: next-20230519) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646dc066931926b3622e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dc066931926b3622e8=
5f9
        new failure (last pass: next-20230522) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10   | exynos=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/646db8b5e6f9ae4db92e8639

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
646db8b5e6f9ae4db92e863d
        failing since 7 days (last pass: next-20230516, first fail: next-20=
230517)

    2023-05-24T07:11:26.988598  /lava-10436198/1/../bin/lava-test-case

    2023-05-24T07:11:27.033112  <8>[   15.308382] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/646db6185a9388fde92e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646db6185a9388fde92e8=
5e8
        new failure (last pass: next-20230523) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/646dc45a10600e44222e864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dc45a10600e44222e8=
64f
        failing since 42 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/646dc306d3b75329312e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dc306d3b75329312e8=
603
        failing since 42 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646dbb990204828e2d2e8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dbb990204828e2d2e8=
643
        failing since 182 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | clang-17 | multi_=
v7_defconfig           | 3          =


  Details:     https://kernelci.org/test/plan/id/646dbe57cea01afec52e85e7

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230522071736+3bc1=
ea5b0ac9-1~exp1~20230522071850.674))
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/646dbe57cea01afec52e85fd
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:35:45.269009  /lava-10436858/1/../bin/lava-test-case<8>[ =
  21.633470] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Drockchip-iodomain-driver-=
present RESULT=3Dpass>

    2023-05-24T07:35:45.269225  =


    2023-05-24T07:35:46.283065  /lava-10436858/1/../bin/lava-test-case

    2023-05-24T07:35:46.292065  <8>[   22.657027] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-grf-probed RESULT=3Dfail>
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/646dbe57cea01afec52e8613
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:35:43.800617  <8>[   20.165433] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwmmc_rockchip-sdmmc-probed RESULT=3Dfail>

    2023-05-24T07:35:44.815462  /lava-10436858/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/646dbe57cea01afec52e8614
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:35:42.776916  /lava-1<8>[   19.139999] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-05-24T07:35:42.779981  0436858/1/../bin/lava-test-case

    2023-05-24T07:35:42.786164  BusyBox v1.31.1 (2023-05-19 20:50:34 UTC) m=
ulti-call binary.

    2023-05-24T07:35:42.786382  =


    2023-05-24T07:35:42.790808  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-05-24T07:35:42.790864  =


    2023-05-24T07:35:42.795769  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-05-24T07:35:42.798533  FIRST, INC default to 1.

    2023-05-24T07:35:42.798934  =


    2023-05-24T07:35:42.802298  	-w	Pad to last with leading zeros
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 3          =


  Details:     https://kernelci.org/test/plan/id/646db8dddd568886712e8617

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/646db8dddd568886712e862d
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:12:06.588407  /lava-10436218/1/../bin/lava-test-case<8>[ =
  23.709683] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Drockchip-iodomain-driver-=
present RESULT=3Dpass>

    2023-05-24T07:12:06.588639  =

   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/646db8dddd568886712e8643
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:12:05.126357  /lava-10436218/1/../bin/lava-test-case<8>[ =
  22.248661] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Ddwmmc_rockchip-sdmmc-prob=
ed RESULT=3Dfail>

    2023-05-24T07:12:05.126629  =

   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/646db8dddd568886712e8644
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:12:04.106306  0436218/1/../bin/lava-test-case

    2023-05-24T07:12:04.112658  BusyBox v1.31.1 (2023-05-19 20:50:34 UTC) m=
ulti-call binary.

    2023-05-24T07:12:04.112712  =


    2023-05-24T07:12:04.117062  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-05-24T07:12:04.117115  =


    2023-05-24T07:12:04.122560  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-05-24T07:12:04.125017  FIRST, INC default to 1.

    2023-05-24T07:12:04.125070  =


    2023-05-24T07:12:04.128429  	-w	Pad to last with leading zeros

    2023-05-24T07:12:04.131243  	-s SEP	String separator
 =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 3          =


  Details:     https://kernelci.org/test/plan/id/646db9f69d71bf19fd2e864b

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/646db9f69d71bf19fd2e8661
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:16:46.341281  <8>[   21.735614] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-driver-present RESULT=3Dpass>

    2023-05-24T07:16:47.355217  /lava-10436363/1/../bin/lava-test-case

    2023-05-24T07:16:47.364451  <8>[   22.759284] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-grf-probed RESULT=3Dfail>
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/646db9f69d71bf19fd2e8677
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:16:45.893128  /lava-10436363/1/../bin/lava-test-case

    2023-05-24T07:16:45.901797  <8>[   21.296841] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwmmc_rockchip-sdio0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/646db9f69d71bf19fd2e8678
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:16:43.855165  	-w	P<8>[   19.248462] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-05-24T07:16:43.858031  ad to last with leading zeros

    2023-05-24T07:16:43.860531  	-s SEP	String separator

    2023-05-24T07:16:43.864480  /lava-10436363/1/../bin/lava-test-case

    2023-05-24T07:16:43.870449  BusyBox v1.31.1 (2023-05-19 20:50:34 UTC) m=
ulti-call binary.

    2023-05-24T07:16:43.870666  =


    2023-05-24T07:16:43.874925  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-05-24T07:16:43.875267  =


    2023-05-24T07:16:43.880058  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-05-24T07:16:43.883079  FIRST, INC default to 1.
 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646dba46dc4eab05dd2e860b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dba46dc4eab05dd2e8=
60c
        failing since 182 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/646dbb0df32436725d2e86ce

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/646dbb0df32436725d2e86e4
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:21:26.842335  <8>[   21.705004] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-driver-present RESULT=3Dpass>

    2023-05-24T07:21:27.865197  /lava-10436467/1/../bin/lava-test-case<8>[ =
  22.728502] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Drockchip-iodomain-grf-pro=
bed RESULT=3Dfail>

    2023-05-24T07:21:27.865342  =

   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/646dbb0df32436725d2e86fa
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:21:25.385459  /lava-10436467/1/../bin/lava-test-case<8>[ =
  20.248684] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Ddwmmc_rockchip-sdmmc-prob=
ed RESULT=3Dfail>

    2023-05-24T07:21:25.385525  =


    2023-05-24T07:21:26.398606  /lava-10436467/1/../bin/lava-test-case

    2023-05-24T07:21:26.407781  <8>[   21.270946] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwmmc_rockchip-sdio0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/646dbb0df32436725d2e86fb
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:21:24.362591  	-w	P<8>[   19.223841] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-05-24T07:21:24.365327  ad to last with leading zeros

    2023-05-24T07:21:24.367851  	-s SEP	String separator

    2023-05-24T07:21:24.371909  /lava-10436467/1/../bin/lava-test-case

    2023-05-24T07:21:24.378054  BusyBox v1.31.1 (2023-05-19 20:50:34 UTC) m=
ulti-call binary.

    2023-05-24T07:21:24.378107  =


    2023-05-24T07:21:24.382654  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-05-24T07:21:24.382870  =


    2023-05-24T07:21:24.387643  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-05-24T07:21:24.390588  FIRST, INC default to 1.
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/646dc59e7e3a59fe732e87e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dc59e7e3a59fe732e8=
7e2
        failing since 42 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig                    | 3          =


  Details:     https://kernelci.org/test/plan/id/646db780c4808985882e8600

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230522071736+3bc1=
ea5b0ac9-1~exp1~20230522071850.674))
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646db780c4808985882e8605
        failing since 14 days (last pass: next-20230508, first fail: next-2=
0230510)

    2023-05-24T07:06:22.944322  <8>[   21.807896] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 433389_1.5.2.4.1>
    2023-05-24T07:06:23.051104  / # #
    2023-05-24T07:06:23.153349  export SHELL=3D/bin/sh
    2023-05-24T07:06:23.153928  #
    2023-05-24T07:06:23.255462  / # export SHELL=3D/bin/sh. /lava-433389/en=
vironment
    2023-05-24T07:06:23.255996  =

    2023-05-24T07:06:23.357568  / # . /lava-433389/environment/lava-433389/=
bin/lava-test-runner /lava-433389/1
    2023-05-24T07:06:23.358514  =

    2023-05-24T07:06:23.363531  / # /lava-433389/bin/lava-test-runner /lava=
-433389/1
    2023-05-24T07:06:23.412922  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (41 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646db780c480898=
5882e8607
        failing since 42 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-24T07:06:22.931055  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-24T07:06:22.932453  kern  :emerg : Code: 97fe2706 f9405688 5286=
4a69 72a686c9 (b9400908) =

    2023-05-24T07:06:22.942218  <8>[   21.805114] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-24T07:06:22.942624  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646db780c480898=
5882e8608
        failing since 42 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-24T07:06:22.907543  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-24T07:06:22.909079  kern  :alert : Mem abort info:
    2023-05-24T07:06:22.909439  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-24T07:06:22.910473  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-24T07:06:22.911465  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-24T07:06:22.911834  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-24T07:06:22.912564  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-24T07:06:22.913885  kern  :alert : Data abort info:
    2023-05-24T07:06:22.914242  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-24T07:06:22.915032  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 3          =


  Details:     https://kernelci.org/test/plan/id/646db6670b6a31c7562e8606

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/646db6670b6a31c7562e860b
        failing since 7 days (last pass: next-20230515, first fail: next-20=
230516)

    2023-05-24T07:01:45.602637  <8>[   21.533027] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 433381_1.5.2.4.1>
    2023-05-24T07:01:45.709458  / # #
    2023-05-24T07:01:45.811601  export SHELL=3D/bin/sh
    2023-05-24T07:01:45.812134  #
    2023-05-24T07:01:45.913662  / # export SHELL=3D/bin/sh. /lava-433381/en=
vironment
    2023-05-24T07:01:45.914176  =

    2023-05-24T07:01:46.015728  / # . /lava-433381/environment/lava-433381/=
bin/lava-test-runner /lava-433381/1
    2023-05-24T07:01:46.016594  =

    2023-05-24T07:01:46.022904  / # /lava-433381/bin/lava-test-runner /lava=
-433381/1
    2023-05-24T07:01:46.075538  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646db6670b6a31c=
7562e860d
        failing since 42 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-24T07:01:45.588684  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-24T07:01:45.590043  kern  :emerg : Code: 97fdb910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-24T07:01:45.600638  <8>[   21.530404] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-24T07:01:45.600999  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646db6670b6a31c=
7562e860e
        failing since 42 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-24T07:01:45.565570  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-24T07:01:45.567253  kern  :alert : Mem abort info:
    2023-05-24T07:01:45.567620  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-24T07:01:45.568932  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-24T07:01:45.571001  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-24T07:01:45.571354  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-24T07:01:45.572698  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-24T07:01:45.574372  kern  :alert : Data abort info:
    2023-05-24T07:01:45.574745  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-24T07:01:45.576049  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/646db8974d2d18c32d2e8616

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646db8974d2d18c=
32d2e861d
        failing since 42 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-24T07:11:00.112581  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-24T07:11:00.113948  kern  :emerg : Code: 97fdd910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-24T07:11:00.126381  <8>[   19.342800] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-24T07:11:00.126756  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646db8974d2d18c=
32d2e861e
        failing since 42 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-24T07:11:00.089973  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-24T07:11:00.090890  kern  :alert : Mem abort info:
    2023-05-24T07:11:00.091227  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-24T07:11:00.091807  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-24T07:11:00.092334  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-24T07:11:00.092618  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-24T07:11:00.093119  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-24T07:11:00.094022  kern  :alert : Data abort info:
    2023-05-24T07:11:00.094337  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-24T07:11:00.095428  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/646db8fb5fcc3cbd802e8827

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646db8fb5fcc3cb=
d802e882e
        failing since 42 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-24T07:12:42.527649  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-24T07:12:42.528009  kern  :emerg : Code: 97fec110 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-24T07:12:42.538524  <8>[   21.567514] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-24T07:12:42.538898  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646db8fb5fcc3cb=
d802e882f
        failing since 42 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-24T07:12:42.508997  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-24T07:12:42.513521  kern  :alert : Mem abort info:
    2023-05-24T07:12:42.513888  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-24T07:12:42.517422  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-24T07:12:42.521070  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-24T07:12:42.521438  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-24T07:12:42.522013  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-24T07:12:42.522376  kern  :alert : Data abort info:
    2023-05-24T07:12:42.522694  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-24T07:12:42.523038  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/646db95fc812ca228a2e85f6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646db95fc812ca2=
28a2e85fd
        failing since 42 days (last pass: next-20230404, first fail: next-2=
0230411)
        2 lines

    2023-05-24T07:14:27.335948  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-24T07:14:27.337137  kern  :emerg : Code: 97fca910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-24T07:14:27.347153  <8>[   25.706594] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-24T07:14:27.347536  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646db95fc812ca2=
28a2e85fe
        failing since 42 days (last pass: next-20230404, first fail: next-2=
0230411)
        12 lines

    2023-05-24T07:14:27.311655  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-24T07:14:27.313024  kern  :alert : Mem abort info:
    2023-05-24T07:14:27.313362  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-24T07:14:27.314374  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-24T07:14:27.315723  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-24T07:14:27.316046  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-24T07:14:27.317137  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-24T07:14:27.318459  kern  :alert : Data abort info:
    2023-05-24T07:14:27.318828  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-24T07:14:27.319841  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/646db78fbef5dfac992e85e6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230522071736+3bc1=
ea5b0ac9-1~exp1~20230522071850.674))
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646db78fbef5dfa=
c992e85ed
        failing since 42 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-24T07:06:46.457924  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-24T07:06:46.458461  kern  :emerg : Code: 97fb6706 f9405688 5286=
4a69 72a686c9 (b9400908) =


    2023-05-24T07:06:46.458811  <8>[   20.014663] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-24T07:06:46.459138  + set +x

    2023-05-24T07:06:46.459453  <8>[   20.017144] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10436176_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646db78fbef5dfa=
c992e85ee
        failing since 42 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-24T07:06:46.392770  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-24T07:06:46.393304  kern  :alert : Mem abort info:

    2023-05-24T07:06:46.393683  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-24T07:06:46.394000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-24T07:06:46.394358  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-24T07:06:46.394666  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-24T07:06:46.394964  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-24T07:06:46.395257  kern  :alert : Data abort info:

    2023-05-24T07:06:46.395543  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-24T07:06:46.395828  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/646db69fc42c3d7a612e863b

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646db69fc42c3d7=
a612e8642
        failing since 42 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-24T07:02:32.839004  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-24T07:02:32.839535  kern  :emerg : Code: 97fbc510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-24T07:02:32.839878  <8>[   17.993112] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-24T07:02:32.840196  + set +x

    2023-05-24T07:02:32.840501  <8>[   17.995709] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10436142_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646db69fc42c3d7=
a612e8643
        failing since 42 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-24T07:02:32.775693  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-24T07:02:32.776223  kern  :alert : Mem abort info:

    2023-05-24T07:02:32.776566  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-24T07:02:32.776881  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-24T07:02:32.777183  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-24T07:02:32.777510  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-24T07:02:32.777806  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-24T07:02:32.778093  kern  :alert : Data abort info:

    2023-05-24T07:02:32.778377  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-24T07:02:32.778657  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/646db8944d2d18c32d2e85e7

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/646db8944d2d18c=
32d2e85ee
        failing since 42 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-24T07:10:59.038512  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-24T07:10:59.039036  kern  :emerg : Code: 97fa7910 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-24T07:10:59.039383  <8>[   17.907860] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-24T07:10:59.039707  + set +x

    2023-05-24T07:10:59.040019  <8>[   17.910584] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10436194_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/646db8944d2d18c=
32d2e85ef
        failing since 42 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-24T07:10:58.977264  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-24T07:10:58.977813  kern  :alert : Mem abort info:

    2023-05-24T07:10:58.978160  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-24T07:10:58.978481  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-24T07:10:58.978786  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-24T07:10:58.979081  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-24T07:10:58.979378  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-24T07:10:58.979670  kern  :alert : Data abort info:

    2023-05-24T07:10:58.979957  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-24T07:10:58.980243  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/646db962c812ca228a2e8606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646db962c812ca228a2e8=
607
        new failure (last pass: next-20230523) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/646dbaf2188682daf82e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dbaf2188682daf82e8=
604
        new failure (last pass: next-20230523) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/646db9d7b6c8dbddf42e8683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646db9d7b6c8dbddf42e8=
684
        failing since 0 day (last pass: next-20230522, first fail: next-202=
30523) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/646dbb53c89d063dae2e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230524/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230519.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/646dbb53c89d063dae2e8=
5ea
        failing since 1 day (last pass: next-20230522, first fail: next-202=
30523) =

 =20
