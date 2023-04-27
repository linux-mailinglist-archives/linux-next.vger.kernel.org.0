Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C66056F0CF7
	for <lists+linux-next@lfdr.de>; Thu, 27 Apr 2023 22:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244781AbjD0UTz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Apr 2023 16:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244414AbjD0UTy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Apr 2023 16:19:54 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34793ABC
        for <linux-next@vger.kernel.org>; Thu, 27 Apr 2023 13:19:49 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-24986c7cf2dso7720617a91.2
        for <linux-next@vger.kernel.org>; Thu, 27 Apr 2023 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682626789; x=1685218789;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0RQmdRinnCvR4Texd2wgP1vkusouvWjmYc4nzyCI7to=;
        b=GbixQaHGPL4maLL34A95AcgMhmf32YCefetB0HiF/UIok8KFssrlD6+lKDEhMq+0mh
         ZfA3QM2DrIqCnagv2Z7cT702EGOaci4jP7VKkIT2Z2C12YucTiofhhou8Y2ITRs4+FeJ
         Dri6U97DrSuJtEjmifmW3u25vERxWCgN2zNCA4NxoSxf8dP3snL/Mf9JI1AwpdpBHTSj
         rztbq5EGdHM2HS1c1UIr/q0iJR4SDbQpcIcRSwrJhsJFHw8khfD1gvwjlkXiu70RR6Xl
         NU/mWwidWS9j6IzMbhJHoVmSnSzhp3CjUz2zU3r77PMd2p5W2EeZRYrnxi6ihPRTmjMs
         cuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682626789; x=1685218789;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RQmdRinnCvR4Texd2wgP1vkusouvWjmYc4nzyCI7to=;
        b=BzmR30GwndUem1KyFrTrIwtEAVqcQ+zaxIIsJeSpahGBg4gHMj4fLQuRB7d0EL/Rg0
         b1OPb8CkzeLzMrQR+AmIbqzGFcmXbX7tsXtonvQEzUorkSEbflANNvMwuE31LU4G0Jj0
         uuMte3h4kUPwwdZ8QUU+UORXvPcClwUS4fDiE4EV7Ua4O08Z8DYLLoweZSelYy6LgYX4
         fBHc2s+G8k8CQXulHRSzBT2HB18RuR+XGh16yAkYBKCU8z7i4P3+CE3416QVuC8V5qF3
         oaYhbXvpxiEePR/TjvAroBTuKGHxAvNnMosV2fjqel3RRZPSJZaE635FDj3IuAQb+Gy/
         zJOw==
X-Gm-Message-State: AC+VfDx7J6wKkeEfEpni9lDDYcEGb2SugPIt6aRApFi/21XP9nZQK3BK
        IsNhM3kWX6vUJCadPP4uUjmTDut1ntbSk877H0I=
X-Google-Smtp-Source: ACHHUZ5gkrwv1HGn2b/yJZJEibXi49covccYAsYirjbXzrgpv/az3FDaPPI6YMA/ivRV/qFcnwSTxg==
X-Received: by 2002:a17:90b:1d81:b0:246:f9f1:ad17 with SMTP id pf1-20020a17090b1d8100b00246f9f1ad17mr2839013pjb.40.1682626787462;
        Thu, 27 Apr 2023 13:19:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ay6-20020a17090b030600b0023fbb21214bsm13567196pjb.17.2023.04.27.13.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 13:19:46 -0700 (PDT)
Message-ID: <644ad8e2.170a0220.531bd.d9c5@mx.google.com>
Date:   Thu, 27 Apr 2023 13:19:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230427
X-Kernelci-Report-Type: test
Subject: next/master baseline: 518 runs, 57 regressions (next-20230427)
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

next/master baseline: 518 runs, 57 regressions (next-20230427)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230427/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230427
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      84e2893b4573da3bc0c9f24e2005442e420e3831 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9d9b9c646a793c2e8612

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a9d9b9c646a793c2e8621
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:06:26.053194  /usr/bin/tpm2_getcap

    2023-04-27T16:06:26.073586  <3>[   10.707027] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:27.102540  <3>[   11.735028] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:28.130285  <3>[   12.763032] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:28.784290  <3>[   13.417037] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:29.157834  <3>[   13.791028] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:30.186047  <3>[   14.819032] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:31.214124  <3>[   15.847034] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:32.242445  <3>[   16.875036] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:33.270113  <3>[   17.903029] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa3c77936c4b01b2e8606

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44aa3c77936c4b01b2e8615
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:32:39.108210  /usr/bin/tpm2_getcap

    2023-04-27T16:32:39.134981  <3>[   11.549024] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:40.163281  <3>[   12.577018] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:41.190726  <3>[   13.605035] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:42.218373  <3>[   14.632024] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:42.538024  <3>[   14.952033] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:43.246051  <3>[   15.660037] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:44.274769  <3>[   16.688034] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:45.302041  <3>[   17.716034] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:46.331213  <3>[   18.744016] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644ab6a9f85afdc65a2e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644ab6a9f85afdc65a2e8=
610
        failing since 222 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9d97e891dbff1c2e8616

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a9d97e891dbff1c2e861b
        failing since 29 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-27T16:06:33.519966  + set +x

    2023-04-27T16:06:33.526818  <8>[   11.174788] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10143582_1.4.2.3.1>

    2023-04-27T16:06:33.631259  / # #

    2023-04-27T16:06:33.731895  export SHELL=3D/bin/sh

    2023-04-27T16:06:33.732076  #

    2023-04-27T16:06:33.832610  / # export SHELL=3D/bin/sh. /lava-10143582/=
environment

    2023-04-27T16:06:33.832793  =


    2023-04-27T16:06:33.933348  / # . /lava-10143582/environment/lava-10143=
582/bin/lava-test-runner /lava-10143582/1

    2023-04-27T16:06:33.933741  =


    2023-04-27T16:06:33.939207  / # /lava-10143582/bin/lava-test-runner /la=
va-10143582/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa3b4c5a4c1d5ce2e8648

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644aa3b4c5a4c1d5ce2e864d
        failing since 30 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-27T16:32:41.424507  <8>[   26.153390] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10143784_1.4.2.3.1>

    2023-04-27T16:32:41.428129  + set +x

    2023-04-27T16:32:41.533169  #

    2023-04-27T16:32:41.635967  / # #export SHELL=3D/bin/sh

    2023-04-27T16:32:41.637013  =


    2023-04-27T16:32:41.738533  / # export SHELL=3D/bin/sh. /lava-10143784/=
environment

    2023-04-27T16:32:41.739333  =


    2023-04-27T16:32:41.840970  / # . /lava-10143784/environment/lava-10143=
784/bin/lava-test-runner /lava-10143784/1

    2023-04-27T16:32:41.842260  =


    2023-04-27T16:32:41.848195  / # /lava-10143784/bin/lava-test-runner /la=
va-10143784/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9daa042cf617f92e85eb

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a9daa042cf617f92e85ee
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:06:34.433245  /usr/bin/tpm2_getcap

    2023-04-27T16:06:34.481421  <3>[   13.661390] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:35.533959  <3>[   14.713398] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:36.585288  <3>[   15.765438] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:37.637309  <3>[   16.817398] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:38.689154  <3>[   17.869390] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:39.741425  <3>[   18.921397] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:40.793350  <3>[   19.973393] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:41.845561  <3>[   21.025390] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:42.455640  <6>[   21.635619] platform MX98357A:00: def=
erred probe pending
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa3b3c5a4c1d5ce2e863a

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44aa3b3c5a4c1d5ce2e863d
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:32:23.220911  /usr/bin/tpm2_getcap

    2023-04-27T16:32:23.265334  <3>[   13.616723] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:24.319425  <3>[   14.670723] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:25.371939  <3>[   15.723722] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:26.162114  <6>[   16.510148] udevd (119) used greatest=
 stack depth: 13144 bytes left

    2023-04-27T16:32:26.424869  <3>[   16.776722] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:27.478136  <3>[   17.829727] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:28.530970  <3>[   18.882720] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:29.569986  <3>[   19.921756] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:30.623394  <3>[   20.974722] tpm tpm0: Operation Timed=
 out
 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9d8ee0a46f7d472e8670

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a9d8ee0a46f7d472e8675
        failing since 29 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-27T16:06:23.288574  <8>[   13.085579] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10143571_1.4.2.3.1>

    2023-04-27T16:06:23.292221  + set +x

    2023-04-27T16:06:23.395931  =


    2023-04-27T16:06:23.497464  / # #export SHELL=3D/bin/sh

    2023-04-27T16:06:23.497660  =


    2023-04-27T16:06:23.598349  / # export SHELL=3D/bin/sh. /lava-10143571/=
environment

    2023-04-27T16:06:23.598959  =


    2023-04-27T16:06:23.700102  / # . /lava-10143571/environment/lava-10143=
571/bin/lava-test-runner /lava-10143571/1

    2023-04-27T16:06:23.701304  =


    2023-04-27T16:06:23.706333  / # /lava-10143571/bin/lava-test-runner /la=
va-10143571/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa3b3c5a4c1d5ce2e862c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644aa3b3c5a4c1d5ce2e8631
        failing since 30 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-27T16:32:41.469089  <8>[   10.454253] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10143799_1.4.2.3.1>

    2023-04-27T16:32:41.472462  + set +x

    2023-04-27T16:32:41.577771  #

    2023-04-27T16:32:41.578861  =


    2023-04-27T16:32:41.680868  / # #export SHELL=3D/bin/sh

    2023-04-27T16:32:41.681585  =


    2023-04-27T16:32:41.783190  / # export SHELL=3D/bin/sh. /lava-10143799/=
environment

    2023-04-27T16:32:41.783881  =


    2023-04-27T16:32:41.885465  / # . /lava-10143799/environment/lava-10143=
799/bin/lava-test-runner /lava-10143799/1

    2023-04-27T16:32:41.886688  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9d5d7cb231b3622e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a9d5d7cb231b3622e8=
60e
        failing since 85 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa17a68158783692e860c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa17a68158783692e8=
60d
        failing since 30 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa1fc1388b140512e862e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa1fc1388b140512e8=
62f
        failing since 27 days (last pass: next-20230330, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9e39d7af3065972e8608

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644a9e39d7af306=
5972e860f
        failing since 73 days (last pass: next-20230208, first fail: next-2=
0230213)
        30 lines

    2023-04-27T16:09:06.131102  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-27T16:09:06.131983  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-27T16:09:06.132787  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf306000 allocated at load_module+0x6b0/0=
x1954
    2023-04-27T16:09:06.134502  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-27T16:09:06.237440  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-27T16:09:06.237723  kern  :emerg : Process udevd (pid: 69, stac=
k limit =3D 0x79961295)
    2023-04-27T16:09:06.237938  kern  :emerg : Stack: (0xc8915cf8 to 0xc891=
6000)
    2023-04-27T16:09:06.238330  kern  :emerg : 5ce0:                       =
                                c4bd0200 c0777860
    2023-04-27T16:09:06.238510  kern  :emerg : 5d00: 00000000 c03b0730 0000=
0000 072106a0 0000005d 072106a0 c0777860 bf306220
    2023-04-27T16:09:06.240633  kern  :emerg : 5d20: 00000000 00000000 0000=
0000 00000001 c077785c bf1795ac bf306220 00000000 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9dabfdaab33caf2e85e8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a9dabfdaab33caf2e85ed
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:06:39.703329  /usr/bin/tpm2_getcap

    2023-04-27T16:06:39.733920  <3>[    9.928199] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:40.781424  <3>[   10.975191] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:41.830441  <3>[   12.024191] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:42.879325  <3>[   13.073192] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:43.926916  <3>[   14.121192] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:44.977201  <3>[   15.170194] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:46.024676  <3>[   16.218191] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:46.904439  <3>[   17.098191] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:47.050980  <3>[   17.244182] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa3c67936c4b01b2e85fa

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44aa3c67936c4b01b2e85fd
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:32:44.909896  <8>[   12.995131] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-27T16:32:44.913158  /usr/bin/tpm2_getcap

    2023-04-27T16:32:44.947050  <3>[   13.039229] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:45.994571  <3>[   14.086215] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:47.043030  <3>[   15.135216] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:48.091289  <3>[   16.183217] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:49.005151  <3>[   17.097222] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:49.117238  <3>[   17.209208] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:50.165436  <3>[   18.257215] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:51.194682  <3>[   19.286208] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9da0e891dbff1c2e864c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a9da0e891dbff1c2e864f
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:06:32.986115  <8>[   10.373038] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-04-27T16:06:32.990078  /usr/bin/tpm2_getcap

    2023-04-27T16:06:33.023737  <3>[   10.418899] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:34.055903  <3>[   11.450946] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:34.102249  <3>[   11.496901] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:35.079646  <3>[   12.473962] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:36.106756  <3>[   13.501945] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:37.136677  <3>[   14.531955] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:37.796363  <6>[   15.189189] udevd (155) used greatest=
 stack depth: 13240 bytes left

    2023-04-27T16:06:38.183235  <3>[   15.577899] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa3d7db0bf5aaad2e8628

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44aa3d7db0bf5aaad2e862b
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:33:03.647140  /usr/bin/tpm2_getcap

    2023-04-27T16:33:03.682364  <3>[   10.675761] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:33:04.712012  <3>[   11.705794] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:33:05.524127  <3>[   12.517753] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:33:05.735768  <3>[   12.729802] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:33:06.764021  <3>[   13.757796] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:33:07.792180  <3>[   14.785791] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:33:08.450053  <6>[   15.441517] udevd (154) used greatest=
 stack depth: 13296 bytes left

    2023-04-27T16:33:08.820398  <3>[   15.813798] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:33:09.847726  <3>[   16.841796] tpm tpm0: Operation Timed=
 out
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9d84e0a46f7d472e8616

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a9d84e0a46f7d472e8625
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:06:10.477427  /usr/bin/tpm2_getcap

    2023-04-27T16:06:20.697343  /lava-10143551/1/../bin/lava-test-case<8>[ =
  20.849632] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dtpm-chip-is-online RESULT=
=3Dfail>

    2023-04-27T16:06:20.697479  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa39b7090a60f372e862c

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44aa39b7090a60f372e863b
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:32:11.778143  /usr/bin/tpm2_getcap

    2023-04-27T16:32:21.988008  /lava-10143786/1/../bin/lava-test-case

    2023-04-27T16:32:21.995002  <8>[   20.936437] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9d88e0a46f7d472e8638

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44a9d88e0a46f7d472e8647
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:06:01.397172  /usr/bin/tpm2_getcap

    2023-04-27T16:06:01.420950  <3>[    9.440290] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:02.448645  <3>[   10.468294] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:03.475626  <3>[   11.495297] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:04.503647  <3>[   12.523294] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:05.531598  <3>[   13.551295] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:06.559904  <3>[   14.579293] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:06.933005  <3>[   14.952239] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:07.582782  <3>[   15.602293] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:06:08.610697  <3>[   16.630285] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa3b6c5a4c1d5ce2e8663

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
44aa3b6c5a4c1d5ce2e8672
        failing since 2 days (last pass: next-20230421, first fail: next-20=
230424)

    2023-04-27T16:32:20.117617  /usr/bin/tpm2_getcap

    2023-04-27T16:32:20.143311  <3>[   11.452283] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:21.170485  <3>[   12.479282] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:22.198163  <3>[   13.507280] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:23.226114  <3>[   14.535282] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:23.643319  <3>[   14.952283] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:24.249142  <3>[   15.558285] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:25.277431  <3>[   16.586282] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:26.305242  <3>[   17.614284] tpm tpm0: Operation Timed=
 out

    2023-04-27T16:32:27.333249  <3>[   18.642284] tpm tpm0: Operation Timed=
 out
 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9d82a3d238fb122e860d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a9d82a3d238fb122e8612
        failing since 29 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-27T16:06:18.260236  + set +x

    2023-04-27T16:06:18.266736  <8>[   10.578439] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10143545_1.4.2.3.1>

    2023-04-27T16:06:18.372245  / # #

    2023-04-27T16:06:18.472872  export SHELL=3D/bin/sh

    2023-04-27T16:06:18.473070  #

    2023-04-27T16:06:18.573576  / # export SHELL=3D/bin/sh. /lava-10143545/=
environment

    2023-04-27T16:06:18.573772  =


    2023-04-27T16:06:18.674289  / # . /lava-10143545/environment/lava-10143=
545/bin/lava-test-runner /lava-10143545/1

    2023-04-27T16:06:18.674640  =


    2023-04-27T16:06:18.679041  / # /lava-10143545/bin/lava-test-runner /la=
va-10143545/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa39e4da59ee0712e85fe

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644aa39e4da59ee0712e8603
        failing since 30 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-27T16:32:21.846739  + <8>[   11.222856] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10143780_1.4.2.3.1>

    2023-04-27T16:32:21.846823  set +x

    2023-04-27T16:32:21.948123  =


    2023-04-27T16:32:22.048734  / # #export SHELL=3D/bin/sh

    2023-04-27T16:32:22.048937  =


    2023-04-27T16:32:22.149490  / # export SHELL=3D/bin/sh. /lava-10143780/=
environment

    2023-04-27T16:32:22.149735  =


    2023-04-27T16:32:22.250345  / # . /lava-10143780/environment/lava-10143=
780/bin/lava-test-runner /lava-10143780/1

    2023-04-27T16:32:22.250606  =


    2023-04-27T16:32:22.255021  / # /lava-10143780/bin/lava-test-runner /la=
va-10143780/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9d74e0a46f7d472e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644a9d74e0a46f7d472e85eb
        failing since 29 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-27T16:06:06.667710  <8>[   10.993272] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10143577_1.4.2.3.1>

    2023-04-27T16:06:06.671123  + set +x

    2023-04-27T16:06:06.776271  / # #

    2023-04-27T16:06:06.878463  export SHELL=3D/bin/sh

    2023-04-27T16:06:06.879270  #

    2023-04-27T16:06:06.980689  / # export SHELL=3D/bin/sh. /lava-10143577/=
environment

    2023-04-27T16:06:06.981416  =


    2023-04-27T16:06:07.082745  / # . /lava-10143577/environment/lava-10143=
577/bin/lava-test-runner /lava-10143577/1

    2023-04-27T16:06:07.083907  =


    2023-04-27T16:06:07.089225  / # /lava-10143577/bin/lava-test-runner /la=
va-10143577/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa39c7090a60f372e8643

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644aa39c7090a60f372e8648
        failing since 30 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-27T16:32:16.234925  <8>[   10.757180] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10143779_1.4.2.3.1>

    2023-04-27T16:32:16.237995  + set +x

    2023-04-27T16:32:16.342340  / # #

    2023-04-27T16:32:16.442915  export SHELL=3D/bin/sh

    2023-04-27T16:32:16.443107  #

    2023-04-27T16:32:16.543670  / # export SHELL=3D/bin/sh. /lava-10143779/=
environment

    2023-04-27T16:32:16.543855  =


    2023-04-27T16:32:16.644409  / # . /lava-10143779/environment/lava-10143=
779/bin/lava-test-runner /lava-10143779/1

    2023-04-27T16:32:16.644671  =


    2023-04-27T16:32:16.649489  / # /lava-10143779/bin/lava-test-runner /la=
va-10143779/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa4a1e2763c037d2e86bf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644aa4a1e2763c037d2e86c4
        failing since 8 days (last pass: next-20230417, first fail: next-20=
230418)

    2023-04-27T16:36:27.545338  + set +x
    2023-04-27T16:36:27.548645  <8>[    7.703593] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537854_1.5.2.4.1>
    2023-04-27T16:36:27.652468  / # #
    2023-04-27T16:36:27.756118  export SHELL=3D/bin/sh
    2023-04-27T16:36:27.757156  #
    2023-04-27T16:36:27.859377  / # export SHELL=3D/bin/sh. /lava-3537854/e=
nvironment
    2023-04-27T16:36:27.860546  =

    2023-04-27T16:36:27.962763  / # . /lava-3537854/environment/lava-353785=
4/bin/lava-test-runner /lava-3537854/1
    2023-04-27T16:36:27.963316  =

    2023-04-27T16:36:27.980565  / # /lava-3537854/bin/lava-test-runner /lav=
a-3537854/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9e25d7af3065972e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a9e25d7af3065972e8=
5e7
        failing since 2 days (last pass: next-20230424, first fail: next-20=
230425) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa486154a013d732e883c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa486154a013d732e8=
83d
        failing since 156 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa382e4b3e4aa2f2e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa382e4b3e4aa2f2e8=
5f0
        failing since 156 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa20f4b104c56a72e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa20f4b104c56a72e8=
5f6
        new failure (last pass: next-20221012) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa75ed421317e082e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa75ed421317e082e8=
5fb
        new failure (last pass: next-20230201) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/644aa494e2fb7668752e85e6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644aa494e2fb766=
8752e85ed
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-27T16:36:16.760317  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-27T16:36:16.761791  kern  :emerg : Code: 97fcfedf f9405688 5286=
4a69 72a686c9 (b9400908) =

    2023-04-27T16:36:16.771770  <8>[   19.539218] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-27T16:36:16.772144  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644aa494e2fb766=
8752e85ee
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-27T16:36:16.734607  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-27T16:36:16.735299  kern  :alert : Mem abort info:
    2023-04-27T16:36:16.735643  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-27T16:36:16.736188  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-27T16:36:16.737122  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-27T16:36:16.737482  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-27T16:36:16.738052  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-27T16:36:16.738887  kern  :alert : Data abort info:
    2023-04-27T16:36:16.739208  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-27T16:36:16.739755  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/644aa123bb25ca79e12e85ec

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644aa123bb25ca7=
9e12e85f3
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-27T16:21:43.647973  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-27T16:21:43.649298  kern  :emerg : Code: 97fd5d10 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-27T16:21:43.660218  <8>[   21.476008] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-27T16:21:43.660699  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644aa123bb25ca7=
9e12e85f4
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-27T16:21:43.624474  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-27T16:21:43.626555  kern  :alert : Mem abort info:
    2023-04-27T16:21:43.627020  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-27T16:21:43.628545  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-27T16:21:43.630587  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-27T16:21:43.631026  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-27T16:21:43.631781  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-27T16:21:43.632416  kern  :alert : Data abort info:
    2023-04-27T16:21:43.632776  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-27T16:21:43.634147  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/644aa65f2b9c3071db2e85f4

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644aa65f2b9c307=
1db2e85fb
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-27T16:43:59.144326  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-27T16:43:59.145626  kern  :emerg : Code: 97fe5d10 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-27T16:43:59.156382  <8>[   19.443049] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-27T16:43:59.156683  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644aa65f2b9c307=
1db2e85fc
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-27T16:43:59.087103  + KERNELCI_LAVA=3Dy /bin/sh /opt/kernelci/d=
mesg.sh
    2023-04-27T16:43:59.115240  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-27T16:43:59.115934  kern  :alert : Mem abort info:
    2023-04-27T16:43:59.116203  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-27T16:43:59.116687  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-27T16:43:59.117389  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-27T16:43:59.117672  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-27T16:43:59.118138  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-27T16:43:59.118828  kern  :alert : Data abort info:
    2023-04-27T16:43:59.119092  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/644aa4c1eda816e56c2e8667

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644aa4c1eda816e=
56c2e866e
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-27T16:37:03.235094  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-27T16:37:03.235585  kern  :emerg : Code: 97fcd2df f9405688 5286=
4a69 72a686c9 (b9400908) =


    2023-04-27T16:37:03.235893  <8>[   23.762869] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-27T16:37:03.236181  + set +x

    2023-04-27T16:37:03.236460  <8>[   23.764820] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10143846_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644aa4c1eda816e=
56c2e866f
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-27T16:37:03.188417  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-27T16:37:03.188805  kern  :alert : Mem abort info:

    2023-04-27T16:37:03.189113  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-27T16:37:03.189419  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-27T16:37:03.189699  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-27T16:37:03.189969  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-27T16:37:03.190233  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-27T16:37:03.190493  kern  :alert : Data abort info:

    2023-04-27T16:37:03.190749  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-27T16:37:03.191003  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/644aa14ab8db85887c2e86b4

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644aa14ab8db858=
87c2e86bb
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-27T16:22:14.680499  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-27T16:22:14.681015  kern  :emerg : Code: 97f27510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-27T16:22:14.681381  <8>[   23.767947] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-27T16:22:14.681708  + set +x

    2023-04-27T16:22:14.682013  <8>[   23.770131] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10143655_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644aa14ab8db858=
87c2e86bc
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-27T16:22:14.630340  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-27T16:22:14.630858  kern  :alert : Mem abort info:

    2023-04-27T16:22:14.631194  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-27T16:22:14.631501  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-27T16:22:14.631801  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-27T16:22:14.632093  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-27T16:22:14.632377  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-27T16:22:14.632657  kern  :alert : Data abort info:

    2023-04-27T16:22:14.632936  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-27T16:22:14.633216  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/644aa6a13a485beaa42e85f9

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644aa6a23a485be=
aa42e8600
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-04-27T16:45:06.053992  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-27T16:45:06.054559  kern  :emerg : Code: 97fd1510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-27T16:45:06.054935  <8>[   22.957189] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-27T16:45:06.055283  + set +x

    2023-04-27T16:45:06.055614  <8>[   22.959267] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10143920_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644aa6a23a485be=
aa42e8601
        failing since 16 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-04-27T16:45:06.004286  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-27T16:45:06.004652  kern  :alert : Mem abort info:

    2023-04-27T16:45:06.004979  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-27T16:45:06.005317  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-27T16:45:06.005639  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-27T16:45:06.005947  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-27T16:45:06.006249  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-27T16:45:06.006556  kern  :alert : Data abort info:

    2023-04-27T16:45:06.006770  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-27T16:45:06.006830  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa25ef4deb794ab2e8608

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-st=
m32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-st=
m32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644aa25ef4deb794ab2e860d
        failing since 83 days (last pass: next-20221012, first fail: next-2=
0230203)

    2023-04-27T16:26:49.260875  <8>[   15.665996] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537667_1.5.2.4.1>
    2023-04-27T16:26:49.365905  / # #
    2023-04-27T16:26:49.467526  export SHELL=3D/bin/sh
    2023-04-27T16:26:49.467921  #
    2023-04-27T16:26:49.569160  / # export SHELL=3D/bin/sh. /lava-3537667/e=
nvironment
    2023-04-27T16:26:49.569574  =

    2023-04-27T16:26:49.670828  / # . /lava-3537667/environment/lava-353766=
7/bin/lava-test-runner /lava-3537667/1
    2023-04-27T16:26:49.671498  =

    2023-04-27T16:26:49.675972  / # /lava-3537667/bin/lava-test-runner /lav=
a-3537667/1
    2023-04-27T16:26:49.744918  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa2c13ffb1afc5b2e862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-stm32mp157c-=
dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-stm32mp157c-=
dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644aa2c13ffb1afc5b2e8634
        failing since 85 days (last pass: next-20221012, first fail: next-2=
0230201)

    2023-04-27T16:28:34.251284  <8>[   15.253897] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537744_1.5.2.4.1>
    2023-04-27T16:28:34.356873  / # #
    2023-04-27T16:28:34.459016  export SHELL=3D/bin/sh
    2023-04-27T16:28:34.459474  #
    2023-04-27T16:28:34.560783  / # export SHELL=3D/bin/sh. /lava-3537744/e=
nvironment
    2023-04-27T16:28:34.561199  =

    2023-04-27T16:28:34.662548  / # . /lava-3537744/environment/lava-353774=
4/bin/lava-test-runner /lava-3537744/1
    2023-04-27T16:28:34.663825  =

    2023-04-27T16:28:34.667451  / # /lava-3537744/bin/lava-test-runner /lav=
a-3537744/1
    2023-04-27T16:28:34.739557  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa2fe4ca7966f682e866a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/644aa2fe4ca7966f682e866f
        failing since 85 days (last pass: next-20221012, first fail: next-2=
0230201)

    2023-04-27T16:29:43.139158  <8>[   13.909622] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3537771_1.5.2.4.1>
    2023-04-27T16:29:43.245131  / # #
    2023-04-27T16:29:43.347505  export SHELL=3D/bin/sh
    2023-04-27T16:29:43.347893  #
    2023-04-27T16:29:43.449194  / # export SHELL=3D/bin/sh. /lava-3537771/e=
nvironment
    2023-04-27T16:29:43.449774  =

    2023-04-27T16:29:43.551520  / # . /lava-3537771/environment/lava-353777=
1/bin/lava-test-runner /lava-3537771/1
    2023-04-27T16:29:43.552488  =

    2023-04-27T16:29:43.556365  / # /lava-3537771/bin/lava-test-runner /lav=
a-3537771/1
    2023-04-27T16:29:43.631221  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa6c316c4cb397a2e8628

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa6c316c4cb397a2e8=
629
        new failure (last pass: next-20230426) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa64bd00f26d4bb2e8621

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa64bd00f26d4bb2e8=
622
        new failure (last pass: next-20230426) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa227d84dd295712e8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa227d84dd295712e8=
63a
        new failure (last pass: next-20230224) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa23277b05d5d0b2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa23277b05d5d0b2e8=
5e7
        new failure (last pass: next-20230224) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa79fd421317e082e860c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa79fd421317e082e8=
60d
        failing since 7 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa226ddb6c155472e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa226ddb6c155472e8=
5f7
        new failure (last pass: next-20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa1f91222b426702e8615

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa1f91222b426702e8=
616
        failing since 219 days (last pass: next-20220719, first fail: next-=
20220920) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa34d9717cdd6702e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-ban=
anapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-ban=
anapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa34d9717cdd6702e8=
5ed
        failing since 219 days (last pass: next-20220719, first fail: next-=
20220920) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/644aa4a3395b15682c2e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644aa4a3395b15682c2e8=
5fe
        failing since 219 days (last pass: next-20220718, first fail: next-=
20220920) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/644a9f268bed9e03d72e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644a9f268bed9e03d72e8=
5f0
        new failure (last pass: next-20220719) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/644ab07527991f02bd2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230427/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230427/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644ab07527991f02bd2e8=
5e7
        failing since 0 day (last pass: v6.3-rc6-12018-gd3f2cd248191, first=
 fail: next-20230426) =

 =20
