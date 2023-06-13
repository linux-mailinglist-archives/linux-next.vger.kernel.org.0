Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C35DB72DE4F
	for <lists+linux-next@lfdr.de>; Tue, 13 Jun 2023 11:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239358AbjFMJyA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jun 2023 05:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234891AbjFMJx7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jun 2023 05:53:59 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E19AC
        for <linux-next@vger.kernel.org>; Tue, 13 Jun 2023 02:53:54 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-543c692db30so3832006a12.3
        for <linux-next@vger.kernel.org>; Tue, 13 Jun 2023 02:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686650034; x=1689242034;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P4FHlu8l7CU4xn/2WvbyUMF8y/mpq1Ngl6KnA02f580=;
        b=2QOd/IzUovfPhOp1MNgelk3QfJONhV4evxcVd9NdaYHESkgzvgufA1q4zgbL1e0cav
         lbmd4SGMsbLOynf3unchTqjT0mO/uaNRTDchluvKVA1OJDFcUB+q4CTecx1OuMUGBNaZ
         5L8/JDuHPMGxZWofxhyUPs5g+6P7sX20ZcUK01Cnr6wfzuSwV3a7po4SkV+Ceuwvnn9W
         U/0BJSntPRrX0YJp5TVGY/TauPbF1m3LpurWsPWJg/BZKMhbQB2uZHDov6KNvDnwv3GP
         dUUGTnPA99hP8yWNS1a4cnOr2uCaUETUXq1xNgD6mOFDt+bA8x2shRBVIA+TEYCs+cpg
         DX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686650034; x=1689242034;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4FHlu8l7CU4xn/2WvbyUMF8y/mpq1Ngl6KnA02f580=;
        b=dBA8LnDP4zrwXPhDYYe+rvkePNiBzzuvLb/SUBwwMidawQcqWezaaC51bgI5hg9zMl
         TTnGyp6RK4T/fv5VqmRPU8KDOLFk1A0H2pNCB3tGSnPrQOkQA5pTNik9TjNgR6SulTEf
         eKu9me7InYOFlv2cRlp3TSwQadur0ovA0NIJtj/dskComVatpBSn5/M9A40y1nMGDJdK
         A0BXiDxdHhZClvb+TXPcRlveXuwcqgyZz0q1JrmlV48r7bC+U7QDMzhWHDspx89Z/xR1
         UOucWRrlmJY+te2SldL7c9I0lNph6M7qv0vbshvo+zgz2/xpD3SgOZugPunVHaxkpOXj
         u6kw==
X-Gm-Message-State: AC+VfDwSLPuGwhySiQamKqiHiBfAteIZbQNEwWhG35UCUxluSuXzwl7e
        ZrXg4QR0ggGCgOS6yRkdFBvNy4jjLKcFDe44E++4xQ==
X-Google-Smtp-Source: ACHHUZ5Z2WUBkvDLL5qsmlYkwnqJwQL1Gd7KDAGEI83NlYAbnlxlz14LLPL8RSPs1yaT5jrKVCrYHA==
X-Received: by 2002:a17:902:e5d2:b0:1ab:7fb:aac1 with SMTP id u18-20020a170902e5d200b001ab07fbaac1mr11365497plf.24.1686650032048;
        Tue, 13 Jun 2023 02:53:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jw22-20020a170903279600b001b3dada0e78sm2842496plb.258.2023.06.13.02.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 02:53:51 -0700 (PDT)
Message-ID: <64883caf.170a0220.ad6b7.55ad@mx.google.com>
Date:   Tue, 13 Jun 2023 02:53:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc6-221-gf82f3835a7c04
Subject: next/pending-fixes baseline: 463 runs,
 46 regressions (v6.4-rc6-221-gf82f3835a7c04)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 463 runs, 46 regressions (v6.4-rc6-221-gf82f38=
35a7c04)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc6-221-gf82f3835a7c04/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc6-221-gf82f3835a7c04
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f82f3835a7c046d0ef582d2594d266c205a07182 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648805745dc193a88c30613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648805745dc193a88c306=
13e
        failing since 246 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64880394c81118f5f630619b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64880394c81118f5f63061a0
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:49:52.232120  + set +x

    2023-06-13T05:49:52.238858  <8>[   10.351362] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10700521_1.4.2.3.1>

    2023-06-13T05:49:52.340813  #

    2023-06-13T05:49:52.341121  =


    2023-06-13T05:49:52.441705  / # #export SHELL=3D/bin/sh

    2023-06-13T05:49:52.441907  =


    2023-06-13T05:49:52.542473  / # export SHELL=3D/bin/sh. /lava-10700521/=
environment

    2023-06-13T05:49:52.542686  =


    2023-06-13T05:49:52.643235  / # . /lava-10700521/environment/lava-10700=
521/bin/lava-test-runner /lava-10700521/1

    2023-06-13T05:49:52.643569  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648804485759622716306145

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64880448575962271630614a
        failing since 76 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:52:54.112219  <8>[   14.070129] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10700583_1.4.2.3.1>

    2023-06-13T05:52:54.115435  + set +x

    2023-06-13T05:52:54.221045  =


    2023-06-13T05:52:54.322685  / # #export SHELL=3D/bin/sh

    2023-06-13T05:52:54.323380  =


    2023-06-13T05:52:54.424686  / # export SHELL=3D/bin/sh. /lava-10700583/=
environment

    2023-06-13T05:52:54.424882  =


    2023-06-13T05:52:54.525472  / # . /lava-10700583/environment/lava-10700=
583/bin/lava-test-runner /lava-10700583/1

    2023-06-13T05:52:54.525770  =


    2023-06-13T05:52:54.531185  / # /lava-10700583/bin/lava-test-runner /la=
va-10700583/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6488038d3a4732943f306164

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488038d3a4732943f306169
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:50:01.006842  + set +x<8>[   11.476060] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10700519_1.4.2.3.1>

    2023-06-13T05:50:01.007428  =


    2023-06-13T05:50:01.114613  / # #

    2023-06-13T05:50:01.217019  export SHELL=3D/bin/sh

    2023-06-13T05:50:01.217772  #

    2023-06-13T05:50:01.319374  / # export SHELL=3D/bin/sh. /lava-10700519/=
environment

    2023-06-13T05:50:01.320121  =


    2023-06-13T05:50:01.421623  / # . /lava-10700519/environment/lava-10700=
519/bin/lava-test-runner /lava-10700519/1

    2023-06-13T05:50:01.422833  =


    2023-06-13T05:50:01.428032  / # /lava-10700519/bin/lava-test-runner /la=
va-10700519/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6488045e0ddc233bf0306165

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488045e0ddc233bf030616a
        failing since 76 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:53:19.053319  + set<8>[   11.668568] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10700611_1.4.2.3.1>

    2023-06-13T05:53:19.053824   +x

    2023-06-13T05:53:19.161105  / # #

    2023-06-13T05:53:19.262019  export SHELL=3D/bin/sh

    2023-06-13T05:53:19.262760  #

    2023-06-13T05:53:19.364045  / # export SHELL=3D/bin/sh. /lava-10700611/=
environment

    2023-06-13T05:53:19.364901  =


    2023-06-13T05:53:19.466750  / # . /lava-10700611/environment/lava-10700=
611/bin/lava-test-runner /lava-10700611/1

    2023-06-13T05:53:19.467900  =


    2023-06-13T05:53:19.472850  / # /lava-10700611/bin/lava-test-runner /la=
va-10700611/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648803a4875f25877c306176

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648803a4875f25877c30617b
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:50:06.039468  <8>[   10.798086] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10700535_1.4.2.3.1>

    2023-06-13T05:50:06.042945  + set +x

    2023-06-13T05:50:06.148009  #

    2023-06-13T05:50:06.250658  / # #export SHELL=3D/bin/sh

    2023-06-13T05:50:06.251413  =


    2023-06-13T05:50:06.352908  / # export SHELL=3D/bin/sh. /lava-10700535/=
environment

    2023-06-13T05:50:06.353661  =


    2023-06-13T05:50:06.455226  / # . /lava-10700535/environment/lava-10700=
535/bin/lava-test-runner /lava-10700535/1

    2023-06-13T05:50:06.456537  =


    2023-06-13T05:50:06.462010  / # /lava-10700535/bin/lava-test-runner /la=
va-10700535/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6488045a0ddc233bf030613f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488045a0ddc233bf0306144
        failing since 76 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:53:06.535801  <8>[   10.813014] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10700610_1.4.2.3.1>

    2023-06-13T05:53:06.539407  + set +x

    2023-06-13T05:53:06.645514  =


    2023-06-13T05:53:06.747367  / # #export SHELL=3D/bin/sh

    2023-06-13T05:53:06.748149  =


    2023-06-13T05:53:06.849764  / # export SHELL=3D/bin/sh. /lava-10700610/=
environment

    2023-06-13T05:53:06.850558  =


    2023-06-13T05:53:06.952198  / # . /lava-10700610/environment/lava-10700=
610/bin/lava-test-runner /lava-10700610/1

    2023-06-13T05:53:06.953452  =


    2023-06-13T05:53:06.959163  / # /lava-10700610/bin/lava-test-runner /la=
va-10700610/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6487fe85ce8ff2fe60306174

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6487fe85ce8ff2fe60306179
        failing since 146 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-13T05:28:19.541747  + set +x<8>[   20.864264] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3659794_1.5.2.4.1>
    2023-06-13T05:28:19.541966  =

    2023-06-13T05:28:19.648838  / # #
    2023-06-13T05:28:19.750502  export SHELL=3D/bin/sh
    2023-06-13T05:28:19.750919  #
    2023-06-13T05:28:19.852220  / # export SHELL=3D/bin/sh. /lava-3659794/e=
nvironment
    2023-06-13T05:28:19.852818  =

    2023-06-13T05:28:19.954333  / # . /lava-3659794/environment/lava-365979=
4/bin/lava-test-runner /lava-3659794/1
    2023-06-13T05:28:19.954986  =

    2023-06-13T05:28:19.960089  / # /lava-3659794/bin/lava-test-runner /lav=
a-3659794/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6488054ded93aaf9a930612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488054ded93aaf9a9306133
        failing since 146 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-13T05:57:03.639856  <8>[   15.356270] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3659919_1.5.2.4.1>
    2023-06-13T05:57:03.751061  / # #
    2023-06-13T05:57:03.854365  export SHELL=3D/bin/sh
    2023-06-13T05:57:03.855245  #
    2023-06-13T05:57:03.957361  / # export SHELL=3D/bin/sh. /lava-3659919/e=
nvironment
    2023-06-13T05:57:03.958426  =

    2023-06-13T05:57:04.060695  / # . /lava-3659919/environment/lava-365991=
9/bin/lava-test-runner /lava-3659919/1
    2023-06-13T05:57:04.062274  =

    2023-06-13T05:57:04.068259  / # /lava-3659919/bin/lava-test-runner /lav=
a-3659919/1
    2023-06-13T05:57:04.151072  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648805e71f974812ff3061bb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648805e71f974812ff3061c0
        failing since 146 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-13T05:59:45.995096  <8>[   16.908562] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3659933_1.5.2.4.1>
    2023-06-13T05:59:46.104195  / # #
    2023-06-13T05:59:46.207722  export SHELL=3D/bin/sh
    2023-06-13T05:59:46.208684  #
    2023-06-13T05:59:46.310581  / # export SHELL=3D/bin/sh. /lava-3659933/e=
nvironment
    2023-06-13T05:59:46.311406  =

    2023-06-13T05:59:46.413376  / # . /lava-3659933/environment/lava-365993=
3/bin/lava-test-runner /lava-3659933/1
    2023-06-13T05:59:46.415253  =

    2023-06-13T05:59:46.419939  / # /lava-3659933/bin/lava-test-runner /lav=
a-3659933/1
    2023-06-13T05:59:46.498958  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64880672e6065258df306131

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64880672e6065258df306136
        failing since 146 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-13T06:02:06.729447  <8>[   15.063270] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3659968_1.5.2.4.1>
    2023-06-13T06:02:06.838947  / # #
    2023-06-13T06:02:06.943157  export SHELL=3D/bin/sh
    2023-06-13T06:02:06.944200  #
    2023-06-13T06:02:07.046398  / # export SHELL=3D/bin/sh. /lava-3659968/e=
nvironment
    2023-06-13T06:02:07.047405  =

    2023-06-13T06:02:07.149537  / # . /lava-3659968/environment/lava-365996=
8/bin/lava-test-runner /lava-3659968/1
    2023-06-13T06:02:07.151204  =

    2023-06-13T06:02:07.156041  / # /lava-3659968/bin/lava-test-runner /lav=
a-3659968/1
    2023-06-13T06:02:07.243447  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6488036af3773dfa18306147

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488036af3773dfa1830614c
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:49:23.405285  + set +x

    2023-06-13T05:49:23.411987  <8>[   12.147027] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10700505_1.4.2.3.1>

    2023-06-13T05:49:23.516693  / # #

    2023-06-13T05:49:23.617313  export SHELL=3D/bin/sh

    2023-06-13T05:49:23.617578  #

    2023-06-13T05:49:23.718055  / # export SHELL=3D/bin/sh. /lava-10700505/=
environment

    2023-06-13T05:49:23.718262  =


    2023-06-13T05:49:23.818752  / # . /lava-10700505/environment/lava-10700=
505/bin/lava-test-runner /lava-10700505/1

    2023-06-13T05:49:23.819073  =


    2023-06-13T05:49:23.823738  / # /lava-10700505/bin/lava-test-runner /la=
va-10700505/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64880442a0267c9a1e306192

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64880442a0267c9a1e306197
        failing since 76 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:52:58.253397  + <8>[   12.767924] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10700592_1.4.2.3.1>

    2023-06-13T05:52:58.253481  set +x

    2023-06-13T05:52:58.354598  #

    2023-06-13T05:52:58.455485  / # #export SHELL=3D/bin/sh

    2023-06-13T05:52:58.455698  =


    2023-06-13T05:52:58.556243  / # export SHELL=3D/bin/sh. /lava-10700592/=
environment

    2023-06-13T05:52:58.556471  =


    2023-06-13T05:52:58.657002  / # . /lava-10700592/environment/lava-10700=
592/bin/lava-test-runner /lava-10700592/1

    2023-06-13T05:52:58.657306  =


    2023-06-13T05:52:58.661878  / # /lava-10700592/bin/lava-test-runner /la=
va-10700592/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64880399c81118f5f63061db

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64880399c81118f5f63061e0
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:49:56.204486  <8>[   10.640105] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10700523_1.4.2.3.1>

    2023-06-13T05:49:56.207807  + set +x

    2023-06-13T05:49:56.312366  / # #

    2023-06-13T05:49:56.412948  export SHELL=3D/bin/sh

    2023-06-13T05:49:56.413119  #

    2023-06-13T05:49:56.513672  / # export SHELL=3D/bin/sh. /lava-10700523/=
environment

    2023-06-13T05:49:56.513854  =


    2023-06-13T05:49:56.614411  / # . /lava-10700523/environment/lava-10700=
523/bin/lava-test-runner /lava-10700523/1

    2023-06-13T05:49:56.614674  =


    2023-06-13T05:49:56.620081  / # /lava-10700523/bin/lava-test-runner /la=
va-10700523/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6488044a575962271630615b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488044a5759622716306160
        failing since 76 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:52:50.445853  + set +x

    2023-06-13T05:52:50.452986  <8>[   10.514548] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10700643_1.4.2.3.1>

    2023-06-13T05:52:50.560822  #

    2023-06-13T05:52:50.561841  =


    2023-06-13T05:52:50.663385  / # #export SHELL=3D/bin/sh

    2023-06-13T05:52:50.664023  =


    2023-06-13T05:52:50.765428  / # export SHELL=3D/bin/sh. /lava-10700643/=
environment

    2023-06-13T05:52:50.766162  =


    2023-06-13T05:52:50.867698  / # . /lava-10700643/environment/lava-10700=
643/bin/lava-test-runner /lava-10700643/1

    2023-06-13T05:52:50.868854  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6488038e3a4732943f30616f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488038e3a4732943f306174
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:49:44.922628  + set +x<8>[   11.530026] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10700550_1.4.2.3.1>

    2023-06-13T05:49:44.923253  =


    2023-06-13T05:49:45.031223  / # #

    2023-06-13T05:49:45.134046  export SHELL=3D/bin/sh

    2023-06-13T05:49:45.134834  #

    2023-06-13T05:49:45.236463  / # export SHELL=3D/bin/sh. /lava-10700550/=
environment

    2023-06-13T05:49:45.237293  =


    2023-06-13T05:49:45.339010  / # . /lava-10700550/environment/lava-10700=
550/bin/lava-test-runner /lava-10700550/1

    2023-06-13T05:49:45.340265  =


    2023-06-13T05:49:45.345301  / # /lava-10700550/bin/lava-test-runner /la=
va-10700550/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6488045c57596227163061c6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488045c57596227163061cb
        failing since 76 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:53:17.548389  + <8>[   11.055472] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10700600_1.4.2.3.1>

    2023-06-13T05:53:17.548503  set +x

    2023-06-13T05:53:17.653101  / # #

    2023-06-13T05:53:17.755582  export SHELL=3D/bin/sh

    2023-06-13T05:53:17.756243  #

    2023-06-13T05:53:17.857772  / # export SHELL=3D/bin/sh. /lava-10700600/=
environment

    2023-06-13T05:53:17.858479  =


    2023-06-13T05:53:17.960040  / # . /lava-10700600/environment/lava-10700=
600/bin/lava-test-runner /lava-10700600/1

    2023-06-13T05:53:17.961487  =


    2023-06-13T05:53:17.966459  / # /lava-10700600/bin/lava-test-runner /la=
va-10700600/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6487fe460af009407e30615f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6487fe460af009407e306164
        failing since 134 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-13T05:27:11.063534  + set +x
    2023-06-13T05:27:11.063707  [   14.341402] <LAVA_SIGNAL_ENDRUN 0_dmesg =
975146_1.5.2.3.1>
    2023-06-13T05:27:11.170788  / # #
    2023-06-13T05:27:11.272510  export SHELL=3D/bin/sh
    2023-06-13T05:27:11.273130  #
    2023-06-13T05:27:11.374478  / # export SHELL=3D/bin/sh. /lava-975146/en=
vironment
    2023-06-13T05:27:11.374997  =

    2023-06-13T05:27:11.476340  / # . /lava-975146/environment/lava-975146/=
bin/lava-test-runner /lava-975146/1
    2023-06-13T05:27:11.477023  =

    2023-06-13T05:27:11.480080  / # /lava-975146/bin/lava-test-runner /lava=
-975146/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64880484d053185fd1306139

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64880484d053185fd130613e
        failing since 134 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-13T05:53:52.654576  + set +x
    2023-06-13T05:53:52.654758  [   13.140022] <LAVA_SIGNAL_ENDRUN 0_dmesg =
975157_1.5.2.3.1>
    2023-06-13T05:53:52.761699  / # #
    2023-06-13T05:53:52.863354  export SHELL=3D/bin/sh
    2023-06-13T05:53:52.863768  #
    2023-06-13T05:53:52.964947  / # export SHELL=3D/bin/sh. /lava-975157/en=
vironment
    2023-06-13T05:53:52.965360  =

    2023-06-13T05:53:53.066593  / # . /lava-975157/environment/lava-975157/=
bin/lava-test-runner /lava-975157/1
    2023-06-13T05:53:53.067136  =

    2023-06-13T05:53:53.070645  / # /lava-975157/bin/lava-test-runner /lava=
-975157/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648804c0e162c19fac3061b2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648804c0e162c19fac3061b7
        failing since 134 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-13T05:55:07.212558  + set +x
    2023-06-13T05:55:07.212710  [   12.190947] <LAVA_SIGNAL_ENDRUN 0_dmesg =
975170_1.5.2.3.1>
    2023-06-13T05:55:07.319799  / # #
    2023-06-13T05:55:07.421563  export SHELL=3D/bin/sh
    2023-06-13T05:55:07.422055  #
    2023-06-13T05:55:07.523409  / # export SHELL=3D/bin/sh. /lava-975170/en=
vironment
    2023-06-13T05:55:07.523873  =

    2023-06-13T05:55:07.625174  / # . /lava-975170/environment/lava-975170/=
bin/lava-test-runner /lava-975170/1
    2023-06-13T05:55:07.625890  =

    2023-06-13T05:55:07.629107  / # /lava-975170/bin/lava-test-runner /lava=
-975170/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6488062849a3946e53306185

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6488062849a3946e5330618a
        failing since 134 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-13T06:00:50.705388  + set +x
    2023-06-13T06:00:50.705696  [   13.173345] <LAVA_SIGNAL_ENDRUN 0_dmesg =
975176_1.5.2.3.1>
    2023-06-13T06:00:50.813671  / # #
    2023-06-13T06:00:50.915567  export SHELL=3D/bin/sh
    2023-06-13T06:00:50.916060  #
    2023-06-13T06:00:51.017399  / # export SHELL=3D/bin/sh. /lava-975176/en=
vironment
    2023-06-13T06:00:51.017954  =

    2023-06-13T06:00:51.119361  / # . /lava-975176/environment/lava-975176/=
bin/lava-test-runner /lava-975176/1
    2023-06-13T06:00:51.120076  =

    2023-06-13T06:00:51.123329  / # /lava-975176/bin/lava-test-runner /lava=
-975176/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648802bb63c78c8e9330613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648802bb63c78c8e93306=
140
        failing since 409 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6487ff8023cc1109033061d6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6487ff8023cc1109033061db
        failing since 47 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-13T05:31:56.359608  <8>[    7.799571] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3659830_1.5.2.4.1>
    2023-06-13T05:31:56.464149  / #
    2023-06-13T05:31:56.567175  # #export SHELL=3D/bin/sh
    2023-06-13T05:31:56.567538  =

    2023-06-13T05:31:56.668586  / # export SHELL=3D/bin/sh. /lava-3659830/e=
nvironment
    2023-06-13T05:31:56.670247  =

    2023-06-13T05:31:56.773543  / # . /lava-3659830/environment/lava-365983=
0/bin/lava-test-runner /lava-3659830/1
    2023-06-13T05:31:56.774496  =

    2023-06-13T05:31:56.791625  / # /lava-3659830/bin/lava-test-runner /lav=
a-3659830/1
    2023-06-13T05:31:56.838002  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64880ae7986c4ca12030612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-=
sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-=
sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64880ae7986c4ca120306133
        failing since 45 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)

    2023-06-13T06:20:45.629260  <8>[    7.618310] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3660074_1.5.2.4.1>
    2023-06-13T06:20:45.734002  / # #
    2023-06-13T06:20:45.835842  export SHELL=3D/bin/sh
    2023-06-13T06:20:45.836251  #
    2023-06-13T06:20:45.937443  / # export SHELL=3D/bin/sh. /lava-3660074/e=
nvironment
    2023-06-13T06:20:45.937854  =

    2023-06-13T06:20:46.039120  / # . /lava-3660074/environment/lava-366007=
4/bin/lava-test-runner /lava-3660074/1
    2023-06-13T06:20:46.039651  =

    2023-06-13T06:20:46.080906  / # /lava-3660074/bin/lava-test-runner /lav=
a-3660074/1
    2023-06-13T06:20:46.092277  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648803853a4732943f306156

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648803853a4732943f30615b
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:49:41.143565  <8>[   12.240451] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10700520_1.4.2.3.1>

    2023-06-13T05:49:41.247708  / # #

    2023-06-13T05:49:41.348397  export SHELL=3D/bin/sh

    2023-06-13T05:49:41.348628  #

    2023-06-13T05:49:41.449141  / # export SHELL=3D/bin/sh. /lava-10700520/=
environment

    2023-06-13T05:49:41.449391  =


    2023-06-13T05:49:41.549912  / # . /lava-10700520/environment/lava-10700=
520/bin/lava-test-runner /lava-10700520/1

    2023-06-13T05:49:41.550218  =


    2023-06-13T05:49:41.554856  / # /lava-10700520/bin/lava-test-runner /la=
va-10700520/1

    2023-06-13T05:49:41.561160  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648804495759622716306150

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648804495759622716306155
        failing since 76 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-13T05:52:52.798610  <8>[   11.816947] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10700594_1.4.2.3.1>

    2023-06-13T05:52:52.906437  / # #

    2023-06-13T05:52:53.008617  export SHELL=3D/bin/sh

    2023-06-13T05:52:53.008816  #

    2023-06-13T05:52:53.109315  / # export SHELL=3D/bin/sh. /lava-10700594/=
environment

    2023-06-13T05:52:53.109503  =


    2023-06-13T05:52:53.210019  / # . /lava-10700594/environment/lava-10700=
594/bin/lava-test-runner /lava-10700594/1

    2023-06-13T05:52:53.210287  =


    2023-06-13T05:52:53.214600  / # /lava-10700594/bin/lava-test-runner /la=
va-10700594/1

    2023-06-13T05:52:53.221696  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6487ff1c5edbd60b22306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6487ff1c5edbd60b22306=
141
        failing since 6 days (last pass: v6.4-rc5-210-gef2d89b88456f, first=
 fail: v6.4-rc5-244-g9d674be53332) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6488076916ade04f3b30614e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6488076916ade04f3b306=
14f
        failing since 33 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64880aea1411407eee306156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64880aea1411407eee306=
157
        failing since 5 days (last pass: v6.4-rc5-210-gef2d89b88456f, first=
 fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64880b8a56e41eca1f30613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64880b8a56e41eca1f306=
13e
        failing since 47 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64880b7e98ae6838df306171

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64880b7e98ae6838df306=
172
        failing since 47 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6488038ec81118f5f6306155

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6488038ec81118f5f6306=
156
        failing since 10 days (last pass: v6.4-rc4-316-g2ef1da21bb4b, first=
 fail: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648803e2a31fbdc1e030615d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648803e2a31fbdc1e0306=
15e
        failing since 179 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648802a216ff9ff69730614f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648802a216ff9ff697306=
150
        failing since 179 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6487ff72612c8a22d130613e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6487ff72612c8a22d1306143
        failing since 132 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-13T05:32:12.684593  [   29.035353] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3659823_1.5.2.4.1>
    2023-06-13T05:32:12.789327  =

    2023-06-13T05:32:12.890877  / # #export SHELL=3D/bin/sh
    2023-06-13T05:32:12.891697  =

    2023-06-13T05:32:12.993378  / # export SHELL=3D/bin/sh. /lava-3659823/e=
nvironment
    2023-06-13T05:32:12.993801  =

    2023-06-13T05:32:13.095160  / # . /lava-3659823/environment/lava-365982=
3/bin/lava-test-runner /lava-3659823/1
    2023-06-13T05:32:13.095848  =

    2023-06-13T05:32:13.099333  / # /lava-3659823/bin/lava-test-runner /lav=
a-3659823/1
    2023-06-13T05:32:13.133333  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648807d029c79cddae306137

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648807d029c79cddae30613c
        failing since 132 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-13T06:07:58.723250  [   33.341057] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3660015_1.5.2.4.1>
    2023-06-13T06:07:58.828036  =

    2023-06-13T06:07:58.930257  / # #export SHELL=3D/bin/sh
    2023-06-13T06:07:58.931101  =

    2023-06-13T06:07:59.032985  / # export SHELL=3D/bin/sh. /lava-3660015/e=
nvironment
    2023-06-13T06:07:59.033724  =

    2023-06-13T06:07:59.135624  / # . /lava-3660015/environment/lava-366001=
5/bin/lava-test-runner /lava-3660015/1
    2023-06-13T06:07:59.136269  =

    2023-06-13T06:07:59.139709  / # /lava-3660015/bin/lava-test-runner /lav=
a-3660015/1
    2023-06-13T06:07:59.175649  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64880a8ce9216f68dd30616f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64880a8ce9216f68dd306174
        failing since 132 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-06-13T06:19:34.415678  [   28.918358] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3660080_1.5.2.4.1>
    2023-06-13T06:19:34.520490  =

    2023-06-13T06:19:34.621922  / # #export SHELL=3D/bin/sh
    2023-06-13T06:19:34.622299  =

    2023-06-13T06:19:34.723516  / # export SHELL=3D/bin/sh. /lava-3660080/e=
nvironment
    2023-06-13T06:19:34.723906  =

    2023-06-13T06:19:34.825193  / # . /lava-3660080/environment/lava-366008=
0/bin/lava-test-runner /lava-3660080/1
    2023-06-13T06:19:34.825919  =

    2023-06-13T06:19:34.829191  / # /lava-3660080/bin/lava-test-runner /lav=
a-3660080/1
    2023-06-13T06:19:34.865384  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648804877a9552a82b30613b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-st=
m32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-st=
m32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648804877a9552a82b306140
        failing since 132 days (last pass: v5.19-3879-ge7dffa5317766, first=
 fail: v6.2-rc6-289-g1b7183933813)

    2023-06-13T05:53:56.313001  <8>[   15.020516] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3659926_1.5.2.4.1>
    2023-06-13T05:53:56.418901  / # #
    2023-06-13T05:53:56.520905  export SHELL=3D/bin/sh
    2023-06-13T05:53:56.521698  #
    2023-06-13T05:53:56.623351  / # export SHELL=3D/bin/sh. /lava-3659926/e=
nvironment
    2023-06-13T05:53:56.623766  =

    2023-06-13T05:53:56.725234  / # . /lava-3659926/environment/lava-365992=
6/bin/lava-test-runner /lava-3659926/1
    2023-06-13T05:53:56.725893  =

    2023-06-13T05:53:56.730263  / # /lava-3659926/bin/lava-test-runner /lav=
a-3659926/1
    2023-06-13T05:53:56.805029  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648804d70f49f3436e306172

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648804d70f49f3436e306175
        failing since 132 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-13T05:55:16.285853  <8>[   19.495510] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3659944_1.5.2.4.1>
    2023-06-13T05:55:16.391734  / # #
    2023-06-13T05:55:16.494320  export SHELL=3D/bin/sh
    2023-06-13T05:55:16.495107  #
    2023-06-13T05:55:16.596888  / # export SHELL=3D/bin/sh. /lava-3659944/e=
nvironment
    2023-06-13T05:55:16.597283  =

    2023-06-13T05:55:16.698649  / # . /lava-3659944/environment/lava-365994=
4/bin/lava-test-runner /lava-3659944/1
    2023-06-13T05:55:16.699312  =

    2023-06-13T05:55:16.703878  / # /lava-3659944/bin/lava-test-runner /lav=
a-3659944/1
    2023-06-13T05:55:16.773796  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648805c7376cd15dab306135

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32m=
p157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32m=
p157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648805c7376cd15dab30613a
        failing since 132 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-13T05:59:21.761892  <8>[   19.524646] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3659969_1.5.2.4.1>
    2023-06-13T05:59:21.867770  / # #
    2023-06-13T05:59:21.969538  export SHELL=3D/bin/sh
    2023-06-13T05:59:21.969989  #
    2023-06-13T05:59:22.071429  / # export SHELL=3D/bin/sh. /lava-3659969/e=
nvironment
    2023-06-13T05:59:22.071935  =

    2023-06-13T05:59:22.173504  / # . /lava-3659969/environment/lava-365996=
9/bin/lava-test-runner /lava-3659969/1
    2023-06-13T05:59:22.174205  =

    2023-06-13T05:59:22.177897  / # /lava-3659969/bin/lava-test-runner /lav=
a-3659969/1
    2023-06-13T05:59:22.253779  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64880b1df1c194efbe3061bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64880b1df1c194efbe306=
1c0
        new failure (last pass: v6.4-rc5-342-gc7b658b8488d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6488084ac478acf2c930614b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6488084ac478acf2c9306=
14c
        new failure (last pass: v6.4-rc5-342-gc7b658b8488d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64880c1fed90e012ea306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64=
-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64=
-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64880c1fed90e012ea306=
145
        new failure (last pass: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64880b1bf1c194efbe3061b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-=
libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-=
libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64880b1bf1c194efbe306=
1ba
        new failure (last pass: v6.4-rc5-210-gef2d89b88456f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6487fd01a590dbd16e306139

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6487fd01a590dbd16e30613e
        failing since 131 days (last pass: v6.0-12387-ge54e01f1826aa, first=
 fail: v6.2-rc6-289-g1b7183933813)

    2023-06-13T05:22:00.810970  <8>[    9.618437] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3659769_1.5.2.4.1>
    2023-06-13T05:22:00.931280  / # #
    2023-06-13T05:22:01.037218  export SHELL=3D/bin/sh
    2023-06-13T05:22:01.038987  #
    2023-06-13T05:22:01.142444  / # export SHELL=3D/bin/sh. /lava-3659769/e=
nvironment
    2023-06-13T05:22:01.144294  =

    2023-06-13T05:22:01.247644  / # . /lava-3659769/environment/lava-365976=
9/bin/lava-test-runner /lava-3659769/1
    2023-06-13T05:22:01.250347  =

    2023-06-13T05:22:01.255637  / # /lava-3659769/bin/lava-test-runner /lav=
a-3659769/1
    2023-06-13T05:22:01.387601  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6487fd8dcf007881d030613d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-22=
1-gf82f3835a7c04/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6487fd8dcf007881d0306142
        failing since 102 days (last pass: v6.2-12625-g13efc3a9f23b, first =
fail: v6.2-13370-g5872d227b73f)

    2023-06-13T05:24:14.089320  <8>[    9.512165] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3659767_1.5.2.4.1>
    2023-06-13T05:24:14.208472  / # #
    2023-06-13T05:24:14.314319  export SHELL=3D/bin/sh
    2023-06-13T05:24:14.315947  #
    2023-06-13T05:24:14.419214  / # export SHELL=3D/bin/sh. /lava-3659767/e=
nvironment
    2023-06-13T05:24:14.420886  =

    2023-06-13T05:24:14.524248  / # . /lava-3659767/environment/lava-365976=
7/bin/lava-test-runner /lava-3659767/1
    2023-06-13T05:24:14.527245  =

    2023-06-13T05:24:14.533395  / # /lava-3659767/bin/lava-test-runner /lav=
a-3659767/1
    2023-06-13T05:24:14.666020  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
