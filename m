Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E54372536C
	for <lists+linux-next@lfdr.de>; Wed,  7 Jun 2023 07:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjFGFgk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Jun 2023 01:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjFGFgi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Jun 2023 01:36:38 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B031989
        for <linux-next@vger.kernel.org>; Tue,  6 Jun 2023 22:36:33 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b00ffb4186so40179385ad.0
        for <linux-next@vger.kernel.org>; Tue, 06 Jun 2023 22:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686116192; x=1688708192;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N6dGKviyDkKFwfx70aS3FlWLJVyh2MCBdtPrDfRGY58=;
        b=BEP8gvukchC0AEVnWVtQBFYruQB/psoORVWIYA9bNWp8KLTDzUzeh89Dh1GqhHxWgq
         9wkeLH35SuM9ylgjjgU8WmZqB/MaeQ2P+/50NZ0S7pXApcw7r42z6NEFSWXoaAUzyH1H
         HPeEw02jDQx0hAqHZIWYwfs5F4EP++e4vYdJMmxOrkDr5a5D4r003UaR1TCh4XiUP3Ps
         btkM7EziHJgmU0p4p7ipIwJ1juI442LXqzGDis8FoigFV4Ne2g4DEzXie4XxwFrS7I3j
         N+jlNr0YIUc6PP3kHRyrD51U89kqe3IPLq7OZM7ZVOqS972eG7DwmS4qZyvUZ4T3HJ+X
         ClgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686116192; x=1688708192;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6dGKviyDkKFwfx70aS3FlWLJVyh2MCBdtPrDfRGY58=;
        b=JgleQCK/Q4OW+8JNcW3jl/ATxownt+cHJYWLz6w0CCOKUejHdKv0WmmaE1SWzHdOXr
         Y7yaNcJrsACKinEpLVrzqS7Ih1rZ3N8jgLpM42f3GzuarZW9Dwu8gVoPeZHKUb98YWs3
         SnenWNTzWm7FmYQaVqV54baT02yi5tv4NshNsoOysBqzZ0VuXlh7G8z0LGJuauGrGyQn
         h5ppdU8CuZjL8GQpXFXiJCrVYTVFjSWtgVb0Wpg0hKujPPvYa6oK5Tug9Un17Lawhg3Y
         f8pBZmPmR03wLA6ecvHdSH78RYxOnKo7DtXuXETIKEtmO9u7hQM+fS8rRJgHygDIC4y+
         fFEA==
X-Gm-Message-State: AC+VfDztyb40ZGT7634/zkChz3BTukQImUS6mVzV3jPOZfH5ErIavrSt
        gIHif0SLbZUv0YNA4yQsR0AFnV45HbX0IHjRPpH7Ag==
X-Google-Smtp-Source: ACHHUZ5n2aj5rizzKRrWY0Ruy56+ww7VhdScq2dxZqQGStO4OsqdBqU/TRlwRzVbX4UivbmpIedR7Q==
X-Received: by 2002:a17:902:e9c4:b0:1a6:4b60:3195 with SMTP id 4-20020a170902e9c400b001a64b603195mr2768476plk.66.1686116191346;
        Tue, 06 Jun 2023 22:36:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902788200b001ac95be5081sm9372290pll.307.2023.06.06.22.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 22:36:30 -0700 (PDT)
Message-ID: <6480175e.170a0220.ae816.2a5d@mx.google.com>
Date:   Tue, 06 Jun 2023 22:36:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc5-244-g9d674be53332
Subject: next/pending-fixes baseline: 524 runs,
 56 regressions (v6.4-rc5-244-g9d674be53332)
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

next/pending-fixes baseline: 524 runs, 56 regressions (v6.4-rc5-244-g9d674b=
e53332)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10   | exynos=
_defconfig             | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc5-244-g9d674be53332/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc5-244-g9d674be53332
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9d674be533320edf2ea08ec2c70fbef0d5b2459e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdf1334e7b85edc30614e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fdf1334e7b85edc306=
14f
        failing since 240 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdd50bf82319b4630614e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdd50bf82319b46306153
        failing since 70 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:28:37.543165  <8>[   11.243577] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612352_1.4.2.3.1>

    2023-06-07T01:28:37.546285  + set +x

    2023-06-07T01:28:37.650456  / # #

    2023-06-07T01:28:37.751140  export SHELL=3D/bin/sh

    2023-06-07T01:28:37.751384  #

    2023-06-07T01:28:37.851944  / # export SHELL=3D/bin/sh. /lava-10612352/=
environment

    2023-06-07T01:28:37.852150  =


    2023-06-07T01:28:37.952642  / # . /lava-10612352/environment/lava-10612=
352/bin/lava-test-runner /lava-10612352/1

    2023-06-07T01:28:37.952903  =


    2023-06-07T01:28:37.958777  / # /lava-10612352/bin/lava-test-runner /la=
va-10612352/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe0fd7ed9633061306220

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe0fd7ed9633061306225
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-07T01:44:08.335247  + set +x

    2023-06-07T01:44:08.342378  <8>[   13.494138] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612654_1.4.2.3.1>

    2023-06-07T01:44:08.450526  / # #

    2023-06-07T01:44:08.553403  export SHELL=3D/bin/sh

    2023-06-07T01:44:08.554210  #

    2023-06-07T01:44:08.655710  / # export SHELL=3D/bin/sh. /lava-10612654/=
environment

    2023-06-07T01:44:08.656516  =


    2023-06-07T01:44:08.757924  / # . /lava-10612654/environment/lava-10612=
654/bin/lava-test-runner /lava-10612654/1

    2023-06-07T01:44:08.759550  =


    2023-06-07T01:44:08.764149  / # /lava-10612654/bin/lava-test-runner /la=
va-10612654/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe2186c0be9b79a30614a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe2186c0be9b79a30614f
        failing since 70 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:48:59.333283  + set +x

    2023-06-07T01:48:59.339939  <8>[   10.552276] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612886_1.4.2.3.1>

    2023-06-07T01:48:59.441844  #

    2023-06-07T01:48:59.542784  / # #export SHELL=3D/bin/sh

    2023-06-07T01:48:59.542995  =


    2023-06-07T01:48:59.643482  / # export SHELL=3D/bin/sh. /lava-10612886/=
environment

    2023-06-07T01:48:59.643709  =


    2023-06-07T01:48:59.744258  / # . /lava-10612886/environment/lava-10612=
886/bin/lava-test-runner /lava-10612886/1

    2023-06-07T01:48:59.744586  =


    2023-06-07T01:48:59.750089  / # /lava-10612886/bin/lava-test-runner /la=
va-10612886/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdd329788a9daf8306134

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdd329788a9daf8306139
        failing since 70 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:27:55.636080  + set +x<8>[   11.908040] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10612361_1.4.2.3.1>

    2023-06-07T01:27:55.636562  =


    2023-06-07T01:27:55.743667  / # #

    2023-06-07T01:27:55.845887  export SHELL=3D/bin/sh

    2023-06-07T01:27:55.846605  #

    2023-06-07T01:27:55.948017  / # export SHELL=3D/bin/sh. /lava-10612361/=
environment

    2023-06-07T01:27:55.948784  =


    2023-06-07T01:27:56.050123  / # . /lava-10612361/environment/lava-10612=
361/bin/lava-test-runner /lava-10612361/1

    2023-06-07T01:27:56.051083  =


    2023-06-07T01:27:56.056023  / # /lava-10612361/bin/lava-test-runner /la=
va-10612361/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/647fe0ea14adaaa43f306143

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe0ea14adaaa43f306148
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-07T01:43:59.704427  + set +x

    2023-06-07T01:43:59.707471  <8>[   15.270316] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612655_1.4.2.3.1>

    2023-06-07T01:43:59.816423  / # #

    2023-06-07T01:43:59.918579  export SHELL=3D/bin/sh

    2023-06-07T01:43:59.919329  #

    2023-06-07T01:44:00.020730  / # export SHELL=3D/bin/sh. /lava-10612655/=
environment

    2023-06-07T01:44:00.021486  =


    2023-06-07T01:44:00.122871  / # . /lava-10612655/environment/lava-10612=
655/bin/lava-test-runner /lava-10612655/1

    2023-06-07T01:44:00.124080  =


    2023-06-07T01:44:00.128897  / # /lava-10612655/bin/lava-test-runner /la=
va-10612655/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/647fe0ea14adaaa=
43f30614a
        failing since 27 days (last pass: v6.4-rc1-141-gb95366eba58e, first=
 fail: v6.4-rc1-166-g16fe96af4971)
        3 lines

    2023-06-07T01:43:59.680533  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-07T01:43:59.686552  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-07T01:43:59.693418  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-07T01:43:59.699932  <8>[   15.253649] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe22bcca06c21b030612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe22bcca06c21b0306133
        failing since 70 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:49:13.985250  + set +x<8>[   11.851755] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10612905_1.4.2.3.1>

    2023-06-07T01:49:13.985818  =


    2023-06-07T01:49:14.093580  / # #

    2023-06-07T01:49:14.195871  export SHELL=3D/bin/sh

    2023-06-07T01:49:14.196733  #

    2023-06-07T01:49:14.298649  / # export SHELL=3D/bin/sh. /lava-10612905/=
environment

    2023-06-07T01:49:14.299443  =


    2023-06-07T01:49:14.400917  / # . /lava-10612905/environment/lava-10612=
905/bin/lava-test-runner /lava-10612905/1

    2023-06-07T01:49:14.402068  =


    2023-06-07T01:49:14.406907  / # /lava-10612905/bin/lava-test-runner /la=
va-10612905/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdd2d88ecc0277e30613d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdd2d88ecc0277e306142
        failing since 70 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:27:54.799568  <8>[   11.153137] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612317_1.4.2.3.1>

    2023-06-07T01:27:54.803657  + set +x

    2023-06-07T01:27:54.909148  /#

    2023-06-07T01:27:55.010278   # #export SHELL=3D/bin/sh

    2023-06-07T01:27:55.010529  =


    2023-06-07T01:27:55.111259  / # export SHELL=3D/bin/sh. /lava-10612317/=
environment

    2023-06-07T01:27:55.112175  =


    2023-06-07T01:27:55.213823  / # . /lava-10612317/environment/lava-10612=
317/bin/lava-test-runner /lava-10612317/1

    2023-06-07T01:27:55.215171  =


    2023-06-07T01:27:55.219926  / # /lava-10612317/bin/lava-test-runner /la=
va-10612317/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe0ec7ed9633061306140

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe0ec7ed9633061306145
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-07T01:43:47.350318  <8>[   13.081256] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612674_1.4.2.3.1>

    2023-06-07T01:43:47.353331  + set +x

    2023-06-07T01:43:47.454691  #

    2023-06-07T01:43:47.455000  =


    2023-06-07T01:43:47.555662  / # #export SHELL=3D/bin/sh

    2023-06-07T01:43:47.555876  =


    2023-06-07T01:43:47.656412  / # export SHELL=3D/bin/sh. /lava-10612674/=
environment

    2023-06-07T01:43:47.656636  =


    2023-06-07T01:43:47.757193  / # . /lava-10612674/environment/lava-10612=
674/bin/lava-test-runner /lava-10612674/1

    2023-06-07T01:43:47.757539  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe22b58c5ebd9e830612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe22b58c5ebd9e8306133
        failing since 70 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:49:07.892750  <8>[   11.200177] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612909_1.4.2.3.1>

    2023-06-07T01:49:07.896275  + set +x

    2023-06-07T01:49:07.997982  =


    2023-06-07T01:49:08.098647  / # #export SHELL=3D/bin/sh

    2023-06-07T01:49:08.098891  =


    2023-06-07T01:49:08.199408  / # export SHELL=3D/bin/sh. /lava-10612909/=
environment

    2023-06-07T01:49:08.199634  =


    2023-06-07T01:49:08.300223  / # . /lava-10612909/environment/lava-10612=
909/bin/lava-test-runner /lava-10612909/1

    2023-06-07T01:49:08.300551  =


    2023-06-07T01:49:08.305716  / # /lava-10612909/bin/lava-test-runner /la=
va-10612909/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdb9d323ecad2463061c4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdb9d323ecad2463061c9
        failing since 146 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-07T01:21:47.604682  / # #

    2023-06-07T01:21:47.707031  export SHELL=3D/bin/sh

    2023-06-07T01:21:47.707814  #

    2023-06-07T01:21:47.809221  / # export SHELL=3D/bin/sh. /lava-10612068/=
environment

    2023-06-07T01:21:47.810020  =


    2023-06-07T01:21:47.911495  / # . /lava-10612068/environment/lava-10612=
068/bin/lava-test-runner /lava-10612068/1

    2023-06-07T01:21:47.912757  =


    2023-06-07T01:21:47.954069  / # /lava-10612068/bin/lava-test-runner /la=
va-10612068/1

    2023-06-07T01:21:48.039338  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-07T01:21:48.039477  + cd /lava-10612068/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe08a21d0b4bc4930613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fe08a21d0b4bc49306=
140
        failing since 100 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe1f300852e318a306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fe1f300852e318a306=
134
        failing since 1 day (last pass: v6.4-rc5-142-g7f2b5d41063a, first f=
ail: v6.4-rc5-210-gef2d89b88456f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdf2100945242a530612f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdf2100945242a5306134
        failing since 140 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-07T01:35:43.959561  <8>[   20.353384] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3644015_1.5.2.4.1>
    2023-06-07T01:35:44.068663  / # #
    2023-06-07T01:35:44.171564  export SHELL=3D/bin/sh
    2023-06-07T01:35:44.172618  #
    2023-06-07T01:35:44.274767  / # export SHELL=3D/bin/sh. /lava-3644015/e=
nvironment
    2023-06-07T01:35:44.275609  =

    2023-06-07T01:35:44.377508  / # . /lava-3644015/environment/lava-364401=
5/bin/lava-test-runner /lava-3644015/1
    2023-06-07T01:35:44.379179  =

    2023-06-07T01:35:44.385215  / # /lava-3644015/bin/lava-test-runner /lav=
a-3644015/1
    2023-06-07T01:35:44.473183  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdfc21fe529f9de30612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdfc21fe529f9de306133
        failing since 140 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-07T01:38:51.679075  <8>[   16.761749] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3644043_1.5.2.4.1>
    2023-06-07T01:38:51.786303  / # #
    2023-06-07T01:38:51.887995  export SHELL=3D/bin/sh
    2023-06-07T01:38:51.888393  #
    2023-06-07T01:38:51.989640  / # export SHELL=3D/bin/sh. /lava-3644043/e=
nvironment
    2023-06-07T01:38:51.990052  =

    2023-06-07T01:38:52.091229  / # . /lava-3644043/environment/lava-364404=
3/bin/lava-test-runner /lava-3644043/1
    2023-06-07T01:38:52.091841  =

    2023-06-07T01:38:52.096913  / # /lava-3644043/bin/lava-test-runner /lav=
a-3644043/1
    2023-06-07T01:38:52.181545  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe0c0d0e33d2bfd306141

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe0c0d0e33d2bfd306146
        failing since 140 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-07T01:42:58.696854  <8>[   17.927613] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3644057_1.5.2.4.1>
    2023-06-07T01:42:58.804191  / # #
    2023-06-07T01:42:58.905826  export SHELL=3D/bin/sh
    2023-06-07T01:42:58.906360  #
    2023-06-07T01:42:58.906689  / # export SHELL=3D/bin/sh<3>[   18.130300]=
 Bluetooth: hci0: command 0x0c03 tx timeout
    2023-06-07T01:42:59.008137  . /lava-3644057/environment
    2023-06-07T01:42:59.008700  =

    2023-06-07T01:42:59.110141  / # . /lava-3644057/environment/lava-364405=
7/bin/lava-test-runner /lava-3644057/1
    2023-06-07T01:42:59.110823  =

    2023-06-07T01:42:59.115552  / # /lava-3644057/bin/lava-test-runner /lav=
a-3644057/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe1526ddb6ca478306170

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe1526ddb6ca478306175
        failing since 140 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-07T01:45:26.037918  <8>[   14.572975] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3644077_1.5.2.4.1>
    2023-06-07T01:45:26.144949  / # #
    2023-06-07T01:45:26.246414  export SHELL=3D/bin/sh
    2023-06-07T01:45:26.246765  #
    2023-06-07T01:45:26.347907  / # export SHELL=3D/bin/sh. /lava-3644077/e=
nvironment
    2023-06-07T01:45:26.348247  =

    2023-06-07T01:45:26.449585  / # . /lava-3644077/environment/lava-364407=
7/bin/lava-test-runner /lava-3644077/1
    2023-06-07T01:45:26.450378  =

    2023-06-07T01:45:26.455131  / # /lava-3644077/bin/lava-test-runner /lav=
a-3644077/1
    2023-06-07T01:45:26.543475  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/647fdfc7d62b4df9f1306144

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/647fdfc7d62b4df=
9f130614b
        failing since 96 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-06-07T01:38:58.686290  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4c21200 pointer offset 4 size 512
    2023-06-07T01:38:58.719913  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-07T01:38:58.720271  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-07T01:38:58.720659  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf285000 allocated at load_module+0x6b0/0=
x1954
    2023-06-07T01:38:58.722517  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-07T01:38:58.826920  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-07T01:38:58.827200  kern  :emerg : Process udevd (pid: 73, stac=
k limit =3D 0x82e36fa3)
    2023-06-07T01:38:58.827389  kern  :emerg : Stack: (0xc8805cf8 to 0xc880=
6000)
    2023-06-07T01:38:58.827553  kern  :emerg : 5ce0:                       =
                                c4c21200 c0777860
    2023-06-07T01:38:58.827732  kern  :emerg : 5d00: 00000000 c03afff0 0000=
0000 f8f2e534 0000005d f8f2e534 c0777860 bf285220 =

    ... (7 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/647fdfc7d62b4df=
9f130614c
        failing since 499 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-06-07T01:38:58.639413  kern  :alert : 8<--- cut here ---
    2023-06-07T01:38:58.639708  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-06-07T01:38:58.639916  kern  :alert : [00000060] *pgd=3Dc4ab0831, =
*pte=3D00000000, *ppte=3D00000000
    2023-06-07T01:38:58.640103  kern  :alert : Register r0 information: non=
-paged memory
    2023-06-07T01:38:58.640279  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8804000 allocated at kernel_clone+0x98/0x=
3a0
    2023-06-07T01:38:58.642161  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-06-07T01:38:58.683271  kern  :alert : Register r3 information: non=
-paged memory
    2023-06-07T01:38:58.683522  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4c21200 pointer offset 0 size 512
    2023-06-07T01:38:58.683703  kern  :alert : Register r5 information: non=
-slab/vmalloc me<8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail=
 UNITS=3Dlines MEASUREMENT=3D16>
    2023-06-07T01:38:58.683850  mory =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdd3d83c45b32d7306168

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdd3d83c45b32d730616d
        failing since 70 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:28:12.584754  + set +x

    2023-06-07T01:28:12.591708  <8>[    8.031913] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612363_1.4.2.3.1>

    2023-06-07T01:28:12.696016  / # #

    2023-06-07T01:28:12.796734  export SHELL=3D/bin/sh

    2023-06-07T01:28:12.796950  #

    2023-06-07T01:28:12.897455  / # export SHELL=3D/bin/sh. /lava-10612363/=
environment

    2023-06-07T01:28:12.897688  =


    2023-06-07T01:28:12.998217  / # . /lava-10612363/environment/lava-10612=
363/bin/lava-test-runner /lava-10612363/1

    2023-06-07T01:28:12.998530  =


    2023-06-07T01:28:13.002777  / # /lava-10612363/bin/lava-test-runner /la=
va-10612363/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe0d85a4bc76d7f3061c4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe0d85a4bc76d7f3061c9
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-07T01:43:46.228338  + set +x

    2023-06-07T01:43:46.234448  <8>[   15.564017] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612668_1.4.2.3.1>

    2023-06-07T01:43:46.341439  / # #

    2023-06-07T01:43:46.442084  export SHELL=3D/bin/sh

    2023-06-07T01:43:46.442311  #

    2023-06-07T01:43:46.542872  / # export SHELL=3D/bin/sh. /lava-10612668/=
environment

    2023-06-07T01:43:46.543105  =


    2023-06-07T01:43:46.643705  / # . /lava-10612668/environment/lava-10612=
668/bin/lava-test-runner /lava-10612668/1

    2023-06-07T01:43:46.643995  =


    2023-06-07T01:43:46.648386  / # /lava-10612668/bin/lava-test-runner /la=
va-10612668/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe21f6c0be9b79a30618e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe21f6c0be9b79a306193
        failing since 70 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:49:16.747279  + set +x

    2023-06-07T01:49:16.753328  <8>[   10.273642] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612921_1.4.2.3.1>

    2023-06-07T01:49:16.857749  / # #

    2023-06-07T01:49:16.958365  export SHELL=3D/bin/sh

    2023-06-07T01:49:16.958586  #

    2023-06-07T01:49:17.059072  / # export SHELL=3D/bin/sh. /lava-10612921/=
environment

    2023-06-07T01:49:17.059266  =


    2023-06-07T01:49:17.159776  / # . /lava-10612921/environment/lava-10612=
921/bin/lava-test-runner /lava-10612921/1

    2023-06-07T01:49:17.160109  =


    2023-06-07T01:49:17.165066  / # /lava-10612921/bin/lava-test-runner /la=
va-10612921/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdd16fd5b56ef6e306176

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdd16fd5b56ef6e30617b
        failing since 70 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:27:32.679549  <8>[   10.251213] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612347_1.4.2.3.1>

    2023-06-07T01:27:32.682684  + set +x

    2023-06-07T01:27:32.787134  /#

    2023-06-07T01:27:32.889686   # #export SHELL=3D/bin/sh

    2023-06-07T01:27:32.890369  =


    2023-06-07T01:27:32.991778  / # export SHELL=3D/bin/sh. /lava-10612347/=
environment

    2023-06-07T01:27:32.992407  =


    2023-06-07T01:27:33.093832  / # . /lava-10612347/environment/lava-10612=
347/bin/lava-test-runner /lava-10612347/1

    2023-06-07T01:27:33.094887  =


    2023-06-07T01:27:33.099719  / # /lava-10612347/bin/lava-test-runner /la=
va-10612347/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe0d900e400887230616b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe0d900e4008872306170
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-07T01:43:36.399197  + set +x

    2023-06-07T01:43:36.405753  <8>[   14.127714] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612707_1.4.2.3.1>

    2023-06-07T01:43:36.510321  / # #

    2023-06-07T01:43:36.610918  export SHELL=3D/bin/sh

    2023-06-07T01:43:36.611102  #

    2023-06-07T01:43:36.711631  / # export SHELL=3D/bin/sh. /lava-10612707/=
environment

    2023-06-07T01:43:36.711827  =


    2023-06-07T01:43:36.812380  / # . /lava-10612707/environment/lava-10612=
707/bin/lava-test-runner /lava-10612707/1

    2023-06-07T01:43:36.812654  =


    2023-06-07T01:43:36.817865  / # /lava-10612707/bin/lava-test-runner /la=
va-10612707/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe20b19ed5f8ca130617d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe20b19ed5f8ca1306182
        failing since 70 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:48:57.618458  + set +x

    2023-06-07T01:48:57.625107  <8>[   10.118737] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612875_1.4.2.3.1>

    2023-06-07T01:48:57.727661  =


    2023-06-07T01:48:57.828320  / # #export SHELL=3D/bin/sh

    2023-06-07T01:48:57.828550  =


    2023-06-07T01:48:57.929032  / # export SHELL=3D/bin/sh. /lava-10612875/=
environment

    2023-06-07T01:48:57.929229  =


    2023-06-07T01:48:58.029792  / # . /lava-10612875/environment/lava-10612=
875/bin/lava-test-runner /lava-10612875/1

    2023-06-07T01:48:58.030098  =


    2023-06-07T01:48:58.035474  / # /lava-10612875/bin/lava-test-runner /la=
va-10612875/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdd27bdfd0f583530612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdd27bdfd0f5835306133
        failing since 70 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:27:43.767305  + set<8>[   10.931812] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10612346_1.4.2.3.1>

    2023-06-07T01:27:43.767797   +x

    2023-06-07T01:27:43.877249  / # #

    2023-06-07T01:27:43.977885  export SHELL=3D/bin/sh

    2023-06-07T01:27:43.978547  #

    2023-06-07T01:27:44.079812  / # export SHELL=3D/bin/sh. /lava-10612346/=
environment

    2023-06-07T01:27:44.080145  =


    2023-06-07T01:27:44.181152  / # . /lava-10612346/environment/lava-10612=
346/bin/lava-test-runner /lava-10612346/1

    2023-06-07T01:27:44.182427  =


    2023-06-07T01:27:44.187028  / # /lava-10612346/bin/lava-test-runner /la=
va-10612346/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe0eec8156f99bb30614a

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe0eec8156f99bb30614f
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-07T01:44:03.348176  + set +x

    2023-06-07T01:44:03.354872  <8>[   14.960938] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612705_1.4.2.3.1>

    2023-06-07T01:44:03.459485  / # #

    2023-06-07T01:44:03.560098  export SHELL=3D/bin/sh

    2023-06-07T01:44:03.560310  #

    2023-06-07T01:44:03.660842  / # export SHELL=3D/bin/sh. /lava-10612705/=
environment

    2023-06-07T01:44:03.661081  =


    2023-06-07T01:44:03.761591  / # . /lava-10612705/environment/lava-10612=
705/bin/lava-test-runner /lava-10612705/1

    2023-06-07T01:44:03.761882  =


    2023-06-07T01:44:03.766386  / # /lava-10612705/bin/lava-test-runner /la=
va-10612705/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe217b4120cc1e830614d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe217b4120cc1e8306152
        failing since 70 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:48:54.729633  + <8>[   10.778693] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10612883_1.4.2.3.1>

    2023-06-07T01:48:54.729738  set +x

    2023-06-07T01:48:54.833804  / # #

    2023-06-07T01:48:54.934474  export SHELL=3D/bin/sh

    2023-06-07T01:48:54.934685  #

    2023-06-07T01:48:55.035236  / # export SHELL=3D/bin/sh. /lava-10612883/=
environment

    2023-06-07T01:48:55.035503  =


    2023-06-07T01:48:55.136165  / # . /lava-10612883/environment/lava-10612=
883/bin/lava-test-runner /lava-10612883/1

    2023-06-07T01:48:55.136473  =


    2023-06-07T01:48:55.140779  / # /lava-10612883/bin/lava-test-runner /la=
va-10612883/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdee65f2cf9759630616b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdee65f2cf97596306170
        failing since 128 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-07T01:35:10.564074  + set +x
    2023-06-07T01:35:10.564283  [   14.343003] <LAVA_SIGNAL_ENDRUN 0_dmesg =
969317_1.5.2.3.1>
    2023-06-07T01:35:10.671987  / # #
    2023-06-07T01:35:10.773623  export SHELL=3D/bin/sh
    2023-06-07T01:35:10.774096  #
    2023-06-07T01:35:10.875362  / # export SHELL=3D/bin/sh. /lava-969317/en=
vironment
    2023-06-07T01:35:10.875890  =

    2023-06-07T01:35:10.977189  / # . /lava-969317/environment/lava-969317/=
bin/lava-test-runner /lava-969317/1
    2023-06-07T01:35:10.977893  =

    2023-06-07T01:35:10.980947  / # /lava-969317/bin/lava-test-runner /lava=
-969317/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdf23cd9e53762c30612f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdf23cd9e53762c306134
        failing since 128 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-07T01:36:28.537844  + set +x
    2023-06-07T01:36:28.538096  [   12.178231] <LAVA_SIGNAL_ENDRUN 0_dmesg =
969325_1.5.2.3.1>
    2023-06-07T01:36:28.644324  / # #
    2023-06-07T01:36:28.746129  export SHELL=3D/bin/sh
    2023-06-07T01:36:28.746586  #
    2023-06-07T01:36:28.848220  / # export SHELL=3D/bin/sh. /lava-969325/en=
vironment
    2023-06-07T01:36:28.849315  =

    2023-06-07T01:36:28.950803  / # . /lava-969325/environment/lava-969325/=
bin/lava-test-runner /lava-969325/1
    2023-06-07T01:36:28.951388  =

    2023-06-07T01:36:28.954737  / # /lava-969325/bin/lava-test-runner /lava=
-969325/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdf7269e59ed5dd30612f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdf7269e59ed5dd306134
        failing since 128 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-07T01:37:29.394740  + set +x
    2023-06-07T01:37:29.394914  [   13.081530] <LAVA_SIGNAL_ENDRUN 0_dmesg =
969333_1.5.2.3.1>
    2023-06-07T01:37:29.502489  / # #
    2023-06-07T01:37:29.604124  export SHELL=3D/bin/sh
    2023-06-07T01:37:29.604578  #
    2023-06-07T01:37:29.705747  / # export SHELL=3D/bin/sh. /lava-969333/en=
vironment
    2023-06-07T01:37:29.706196  =

    2023-06-07T01:37:29.807491  / # . /lava-969333/environment/lava-969333/=
bin/lava-test-runner /lava-969333/1
    2023-06-07T01:37:29.808098  =

    2023-06-07T01:37:29.811564  / # /lava-969333/bin/lava-test-runner /lava=
-969333/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdfc3b4a4db7533306165

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdfc3b4a4db753330616a
        failing since 128 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-07T01:38:48.921009  + set +x
    2023-06-07T01:38:48.921228  [   12.868667] <LAVA_SIGNAL_ENDRUN 0_dmesg =
969340_1.5.2.3.1>
    2023-06-07T01:38:49.028177  / # #
    2023-06-07T01:38:49.130295  export SHELL=3D/bin/sh
    2023-06-07T01:38:49.130782  #
    2023-06-07T01:38:49.232122  / # export SHELL=3D/bin/sh. /lava-969340/en=
vironment
    2023-06-07T01:38:49.232670  =

    2023-06-07T01:38:49.333985  / # . /lava-969340/environment/lava-969340/=
bin/lava-test-runner /lava-969340/1
    2023-06-07T01:38:49.334621  =

    2023-06-07T01:38:49.337789  / # /lava-969340/bin/lava-test-runner /lava=
-969340/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdfd4eba6578238306160

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fdfd4eba6578238306=
161
        failing since 403 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe09ffc82a30abb30617b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe09ffc82a30abb306180
        failing since 27 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.4-rc1-166-g16fe96af4971)

    2023-06-07T01:42:10.787505  <8>[   11.548733] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3644107_1.5.2.4.1>
    2023-06-07T01:42:10.894940  / # #
    2023-06-07T01:42:10.997663  export SHELL=3D/bin/sh
    2023-06-07T01:42:10.998590  #
    2023-06-07T01:42:11.100829  / # export SHELL=3D/bin/sh. /lava-3644107/e=
nvironment
    2023-06-07T01:42:11.101621  =

    2023-06-07T01:42:11.203611  / # . /lava-3644107/environment/lava-364410=
7/bin/lava-test-runner /lava-3644107/1
    2023-06-07T01:42:11.205290  =

    2023-06-07T01:42:11.223058  / # /lava-3644107/bin/lava-test-runner /lav=
a-3644107/1
    2023-06-07T01:42:11.267678  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe3ea992018ae9930613f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe3ea992018ae99306144
        failing since 41 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-07T01:56:33.316356  <8>[    7.741664] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3644187_1.5.2.4.1>
    2023-06-07T01:56:33.420405  =

    2023-06-07T01:56:33.521940  / # #export SHELL=3D/bin/sh
    2023-06-07T01:56:33.522739  =

    2023-06-07T01:56:33.625251  / # export SHELL=3D/bin/sh. /lava-3644187/e=
nvironment
    2023-06-07T01:56:33.626132  =

    2023-06-07T01:56:33.728102  / # . /lava-3644187/environment/lava-364418=
7/bin/lava-test-runner /lava-3644187/1
    2023-06-07T01:56:33.728990  =

    2023-06-07T01:56:33.771052  / # /lava-3644187/bin/lava-test-runner /lav=
a-3644187/1
    2023-06-07T01:56:33.780206  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdf077fbd747eb930619c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-k=
ontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-k=
ontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fdf077fbd747eb9306=
19d
        new failure (last pass: v6.4-rc5-210-gef2d89b88456f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdd299e7137e6eb306173

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdd299e7137e6eb306178
        failing since 70 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:27:54.258931  + set +x<8>[   11.851091] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10612305_1.4.2.3.1>

    2023-06-07T01:27:54.259027  =


    2023-06-07T01:27:54.363628  / # #

    2023-06-07T01:27:54.464260  export SHELL=3D/bin/sh

    2023-06-07T01:27:54.464478  #

    2023-06-07T01:27:54.565008  / # export SHELL=3D/bin/sh. /lava-10612305/=
environment

    2023-06-07T01:27:54.565223  =


    2023-06-07T01:27:54.665756  / # . /lava-10612305/environment/lava-10612=
305/bin/lava-test-runner /lava-10612305/1

    2023-06-07T01:27:54.666067  =


    2023-06-07T01:27:54.670607  / # /lava-10612305/bin/lava-test-runner /la=
va-10612305/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe0eb7ed9633061306135

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe0eb7ed963306130613a
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-07T01:43:51.476368  + set +x

    2023-06-07T01:43:51.479595  <8>[   13.719815] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612657_1.4.2.3.1>

    2023-06-07T01:43:51.584854  / # #

    2023-06-07T01:43:51.685560  export SHELL=3D/bin/sh

    2023-06-07T01:43:51.685797  #

    2023-06-07T01:43:51.786317  / # export SHELL=3D/bin/sh. /lava-10612657/=
environment

    2023-06-07T01:43:51.786526  =


    2023-06-07T01:43:51.887066  / # . /lava-10612657/environment/lava-10612=
657/bin/lava-test-runner /lava-10612657/1

    2023-06-07T01:43:51.887389  =


    2023-06-07T01:43:51.892094  / # /lava-10612657/bin/lava-test-runner /la=
va-10612657/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe20400852e318a30614e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fe20400852e318a306153
        failing since 70 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-07T01:48:41.515692  <8>[   11.665595] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10612896_1.4.2.3.1>

    2023-06-07T01:48:41.620455  / # #

    2023-06-07T01:48:41.721195  export SHELL=3D/bin/sh

    2023-06-07T01:48:41.721344  #

    2023-06-07T01:48:41.821860  / # export SHELL=3D/bin/sh. /lava-10612896/=
environment

    2023-06-07T01:48:41.822041  =


    2023-06-07T01:48:41.922564  / # . /lava-10612896/environment/lava-10612=
896/bin/lava-test-runner /lava-10612896/1

    2023-06-07T01:48:41.922817  =


    2023-06-07T01:48:41.927513  / # /lava-10612896/bin/lava-test-runner /la=
va-10612896/1

    2023-06-07T01:48:41.933928  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdd9a64ff6bd4b8306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fdd9a64ff6bd4b8306=
134
        failing since 27 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe0cfed28b858c330616b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fe0cfed28b858c3306=
16c
        failing since 27 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe44e176d041f04306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fe44e176d041f04306=
135
        new failure (last pass: v6.4-rc5-210-gef2d89b88456f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe241cca06c21b0306177

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fe241cca06c21b0306=
178
        new failure (last pass: v6.4-rc3-342-gff661430bdd5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe07a36b3e1b634306261

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/647fe07a36b3e1b=
634306269
        new failure (last pass: v6.4-rc5-142-g7f2b5d41063a)
        4 lines

    2023-06-07T01:41:52.304886  kern  :alert : BUG: Bad page map in process=
 udevadm  pte:4000000000 pmd:800000009c56003
    2023-06-07T01:41:52.305142  kern  :alert : addr:0000ffff98dfe000 vm_fla=
gs:00000070 anon_vma:00000000<8>[   16.843837] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D4>
    2023-06-07T01:41:52.305412  00000000 mapping:ffff000001435c48 index:8   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe2678d960587c030612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fe2678d960587c0306=
12f
        failing since 29 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe3c2a2fb0cc919306185

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fe3c2a2fb0cc919306=
186
        failing since 41 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe23d1c32814555306142

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fe23d1c32814555306=
143
        failing since 29 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe3ba7ee384f4a4306349

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fe3ba7ee384f4a4306=
34a
        failing since 41 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10   | exynos=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/647fde5a90f76d893c30615c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-x=
u3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-x=
u3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fde5a90f76d893c306=
15d
        new failure (last pass: v6.4-rc5-210-gef2d89b88456f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdb624f2c059790306156

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/647fdb624f2c059=
79030615e
        new failure (last pass: v6.4-rc5-210-gef2d89b88456f)
        1 lines

    2023-06-07T01:20:13.935846  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 69d42478, epc =3D=3D 801ff7a8, ra =3D=
=3D 802021a4
    2023-06-07T01:20:13.936123  =


    2023-06-07T01:20:13.972409  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-06-07T01:20:13.972676  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdd01ad9782aa34306170

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fdd01ad9782aa34306=
171
        failing since 4 days (last pass: v6.4-rc4-316-g2ef1da21bb4b, first =
fail: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647fe04e5ecd76ed473061e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fe04e5ecd76ed47306=
1e5
        failing since 173 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdf3600945242a5306149

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fdf3600945242a5306=
14a
        failing since 173 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/647fde7d06e82246e730614a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647fde7d06e82246e7306=
14b
        new failure (last pass: v6.4-rc5-210-gef2d89b88456f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/647fdadee6418618be306145

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-24=
4-g9d674be53332/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647fdadee6418618be30614a
        failing since 96 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-06-07T01:18:12.043776  / # #
    2023-06-07T01:18:12.149674  export SHELL=3D/bin/sh
    2023-06-07T01:18:12.151299  #
    2023-06-07T01:18:12.254910  / # export SHELL=3D/bin/sh. /lava-3643918/e=
nvironment
    2023-06-07T01:18:12.256622  =

    2023-06-07T01:18:12.360344  / # . /lava-3643918/environment/lava-364391=
8/bin/lava-test-runner /lava-3643918/1
    2023-06-07T01:18:12.364847  =

    2023-06-07T01:18:12.367241  / # /lava-3643918/bin/lava-test-runner /lav=
a-3643918/1
    2023-06-07T01:18:12.512775  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-07T01:18:12.514640  + cd /lava-3643918/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20
