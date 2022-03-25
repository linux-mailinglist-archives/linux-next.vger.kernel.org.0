Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC3B4E7C8D
	for <lists+linux-next@lfdr.de>; Sat, 26 Mar 2022 01:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbiCYTeL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Mar 2022 15:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231251AbiCYTdC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Mar 2022 15:33:02 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADD121A883
        for <linux-next@vger.kernel.org>; Fri, 25 Mar 2022 12:07:42 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id c11so7144967pgu.11
        for <linux-next@vger.kernel.org>; Fri, 25 Mar 2022 12:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=pmJ0SZkHW4MZQ5ak8wjytbObUC2NcvTCBpWvEhCoQPM=;
        b=bn6XlESQa60BSQLnsxg913oL+95FNypToSrDXL74IWp+4isIFz7wc8p3NwdtGFD4b4
         uBBpqnbmiqvieuXU/oJOgHpxlcba8OByLIevCQfoeZP310er0DuebK5A4ijhN4ZHLq/S
         oyHrTB+5y1khg8Vq5lUs3BZ/armxhlBg2ibgnCbJEUD5O9YxXgGCl0FGUEC8bXbZ7+uz
         LoNJmmb2hpqKGK9cDhibhR23viZZwLCXoR7eDcg0jx5T3BPqYdffynn1T+OSl2vCU8N3
         k8cq/tWqBvd5R6LWY8ay7LzEE5xQNkrX0wTS1eaf4vfyb9CD6Tb2UEknLQ0m2FSE1emq
         oYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=pmJ0SZkHW4MZQ5ak8wjytbObUC2NcvTCBpWvEhCoQPM=;
        b=q1gEFD9mYD3g12xsdXTKX8v1ozN5f6FlA05SfNVbN5LSpd4HUQH5iihZhIZP2qIcNY
         xq+xVQSBFqyAiaXgx24WgmYSVBvfEK72wgLIrg6Y7vJnoviIKjcw2nE3zrPLpMvU5KM9
         ftt2cZmbBNYOv7dTDgcqbb+sBaero0IAPgMIwPfp4psZfV0aaisVumW8K22MKbALMHDI
         lF8blatjmt0aqX34ksSOfHfUPUOrvSzvjzWPjZf1tS9LdJWSkzXrWAR55JsdusBAFNDK
         cQsUv46mNcKEbmAWSq/gV3FrpcKGsmULZOJKu2OsjQDXuvDKOFy9Br99dYMAGLGlI03b
         k4uQ==
X-Gm-Message-State: AOAM530ug2icFhQVdWJ9cQ2c6BozO7EC++9uEOGZwZNM0m/xWbFqnxZ3
        GNvxK0BDOoxe7AHidSMi3ukBDq8JFaYaGW0BSbA=
X-Google-Smtp-Source: ABdhPJxxAWPD328pUncYpqFeQOzt7NcAUKgTgWanO9C9cJik6e7nBhbXEjomtbWtHqDKz/9UI8802A==
X-Received: by 2002:a05:6a00:238f:b0:4f6:b09a:4c63 with SMTP id f15-20020a056a00238f00b004f6b09a4c63mr11502664pfc.35.1648233345281;
        Fri, 25 Mar 2022 11:35:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a11-20020a056a000c8b00b004fade889fb3sm8306703pfv.18.2022.03.25.11.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 11:35:44 -0700 (PDT)
Message-ID: <623e0b80.1c69fb81.ed1d.73f9@mx.google.com>
Date:   Fri, 25 Mar 2022 11:35:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.17-7667-gf25e53282ab9
Subject: next/pending-fixes baseline: 294 runs,
 12 regressions (v5.17-7667-gf25e53282ab9)
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

next/pending-fixes baseline: 294 runs, 12 regressions (v5.17-7667-gf25e5328=
2ab9)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

bcm2836-rpi-2-b           | arm    | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

d2500cc                   | x86_64 | lab-clabbe    | gcc-10   | x86_64_defc=
onfig             | 1          =

d2500cc                   | x86_64 | lab-clabbe    | gcc-10   | x86_64_defc=
onfig+crypto      | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

imx8mn-ddr4-evk           | arm64  | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =

imx8mn-ddr4-evk           | arm64  | lab-nxp       | gcc-10   | defconfig+i=
ma                | 1          =

kontron-pitx-imx8m        | arm64  | lab-kontron   | gcc-10   | defconfig  =
                  | 1          =

odroid-xu3                | arm    | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

r8a77950-salvator-x       | arm64  | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =

sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-10   | defconfig+c=
rypto             | 1          =

sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-7667-gf25e53282ab9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-7667-gf25e53282ab9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f25e53282ab90301cd6a5d5196735792fb08dea0 =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/623dd82a1b58acf27677250b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623dd82a1b58acf276772=
50c
        failing since 10 days (last pass: v5.17-rc7-220-g483b57a0f972, firs=
t fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b           | arm    | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/623de1951b57c52fed772557

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623de1951b57c52fed772=
558
        failing since 36 days (last pass: v5.17-rc4-260-ga9d1ea1cfc32, firs=
t fail: v5.17-rc4-287-g3d4071e48b88) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
d2500cc                   | x86_64 | lab-clabbe    | gcc-10   | x86_64_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/623dd30dbe8c2e5e61772502

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/x86_64/x86_64_defconfig/gcc-10/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/x86_64/x86_64_defconfig/gcc-10/lab-clabbe/baseline-d2500cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623dd30dbe8c2e5e61772=
503
        failing since 1 day (last pass: v5.17-rc8-149-g382d8f4c46c1f, first=
 fail: v5.17-2918-g4fb3edfb1fc4) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
d2500cc                   | x86_64 | lab-clabbe    | gcc-10   | x86_64_defc=
onfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/623dd439dbdc62be3a77250e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/x86_64/x86_64_defconfig+crypto/gcc-10/lab-clabbe/baseline-d25=
00cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/x86_64/x86_64_defconfig+crypto/gcc-10/lab-clabbe/baseline-d25=
00cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623dd439dbdc62be3a772=
50f
        failing since 1 day (last pass: v5.17-rc8-149-g382d8f4c46c1f, first=
 fail: v5.17-2918-g4fb3edfb1fc4) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/623dd4a4aee6353d4677252f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623dd4a4aee6353d46772=
530
        failing since 10 days (last pass: v5.17-rc7-220-g483b57a0f972, firs=
t fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
imx8mn-ddr4-evk           | arm64  | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/623dd6e98fb44ed5cf772507

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-dd=
r4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-dd=
r4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623dd6e98fb44ed5cf772=
508
        new failure (last pass: v5.17-2918-g4fb3edfb1fc4) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
imx8mn-ddr4-evk           | arm64  | lab-nxp       | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/623ddc584c8405404977250f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623ddc584c84054049772=
510
        new failure (last pass: v5.17-2918-g4fb3edfb1fc4) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
kontron-pitx-imx8m        | arm64  | lab-kontron   | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/623dd4b13b5c609681772522

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8=
m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8=
m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/623=
dd4b13b5c609681772535
        new failure (last pass: v5.17-2275-g6bcc7ba3ca32)

    2022-03-25T14:41:41.402230  /lava-102888/1/../bin/lava-test-case
    2022-03-25T14:41:41.402532  <8>[   11.468397] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-03-25T14:41:41.402682  /lava-102888/1/../bin/lava-test-case
    2022-03-25T14:41:41.402822  <8>[   11.488171] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-03-25T14:41:41.402962  /lava-102888/1/../bin/lava-test-case
    2022-03-25T14:41:41.403097  <8>[   11.509242] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-03-25T14:41:41.403233  /lava-102888/1/../bin/lava-test-case   =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
odroid-xu3                | arm    | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/623df24664399ae00c772543

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623df24664399ae00c772=
544
        failing since 15 days (last pass: v5.17-rc6-312-gf15bf60c638f, firs=
t fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
r8a77950-salvator-x       | arm64  | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/623de03b3af4372c557725fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-sal=
vator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-sal=
vator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623de03b3af4372c55772=
5fb
        new failure (last pass: v5.17-2918-g4fb3edfb1fc4) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/623dd62c3b32f6872c772502

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623dd62c3b32f6872c772=
503
        new failure (last pass: v5.17-2918-g4fb3edfb1fc4) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
sun50i-a64-bananapi-m64   | arm64  | lab-clabbe    | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/623dd80c6d4427b5f0772523

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/b=
aseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-7667-=
gf25e53282ab9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/b=
aseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623dd80c6d4427b5f0772=
524
        new failure (last pass: v5.17-2918-g4fb3edfb1fc4) =

 =20
