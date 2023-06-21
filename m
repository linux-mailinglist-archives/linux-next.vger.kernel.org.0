Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69C2A737A85
	for <lists+linux-next@lfdr.de>; Wed, 21 Jun 2023 07:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjFUFGd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jun 2023 01:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjFUFGb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jun 2023 01:06:31 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3ACE10F9
        for <linux-next@vger.kernel.org>; Tue, 20 Jun 2023 22:06:26 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-25ecc11961dso3502119a91.1
        for <linux-next@vger.kernel.org>; Tue, 20 Jun 2023 22:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687323986; x=1689915986;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jNB/VxXzfuPgFzYojFe7tPW7RMjL31QJVHfQhpoXOi0=;
        b=oAw5+1UVCcwbpLCro9wJe6dNYGZVIHr4ScvtShFynNJ4hjQfhRTr9kKnR9SuyLUHY2
         w1JEjh/M5Xs6R1nvnCwkmDqkbKl3fCIr53dRiWThg0Zk8o+RRBb+4mf7BU/wVPA4dl6y
         B29whziRjNLcxfeXrrY06NXjjVwEKvroQpgYC1JKX2kbAUUv3xRFLycBofMLvhubuvv3
         /6UNKIkHM6PvGLJ2AiGTjx/XZYgZ0KQNQmhSXBLwbhEUMsbMHD4SVMg2mCRx2KtV4Hn+
         glFVvPTmeJQDmKDG5R7Pvz7YzounpGG9g4RRl+bN2DBs2gqdmmA5GI4LV2wfyJ3N/Tfq
         Cbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687323986; x=1689915986;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNB/VxXzfuPgFzYojFe7tPW7RMjL31QJVHfQhpoXOi0=;
        b=GPcu2Ja+KYcPh5JOLe29yyfztTBSlAfe5XBmlir3e9dj83U6OUBrCO/hFonM8czM+G
         wf16agk/j65nSxYO3560yRpJyGie30DtxRNpzU8q54M4dUhCRbdfzGok3U3VLTcW1kMC
         yEZ8/LEOgD+pqppZfsOvKYzL493Zkausjvj71f5RUv5zlJxW9yXVyzF5WgZsABj3DJYv
         rVqsvjNdnq/SjyJC5XdhhdjMFJychN88f37tlNy+jqyT2hXHX69qIIDUAid9pYCp2vhA
         bBno7HmMC6MB1I+rYlw9Lj0hFqSgr10w73Thh9zhP9U980Wn1oigyyGitEGh5XZoDqc5
         1+lg==
X-Gm-Message-State: AC+VfDyzfBRDFxTfZEGxbBNYNIMhVnPjKvnGTNGVJnvM6727VH1S4Zv/
        A6XIaNgeZUX8GLIf6ttkqqLg0Tp8poONH0hPu99ixg==
X-Google-Smtp-Source: ACHHUZ6fZY2TxHActintNGD3+qj6ukZU3taWhGi4XakvMVcNeTRMn0eseqKU+co07sxzGjYh6/ocKQ==
X-Received: by 2002:a17:90a:f185:b0:25e:8da6:74a4 with SMTP id bv5-20020a17090af18500b0025e8da674a4mr13907646pjb.21.1687323983580;
        Tue, 20 Jun 2023 22:06:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090ace0a00b00260a5ecd273sm2281511pju.1.2023.06.20.22.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 22:06:22 -0700 (PDT)
Message-ID: <6492854e.170a0220.c18be.5689@mx.google.com>
Date:   Tue, 20 Jun 2023 22:06:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc7-214-g00072f89e53f9
Subject: next/pending-fixes baseline: 628 runs,
 71 regressions (v6.4-rc7-214-g00072f89e53f9)
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

next/pending-fixes baseline: 628 runs, 71 regressions (v6.4-rc7-214-g00072f=
89e53f9)

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

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+debug              | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc7-214-g00072f89e53f9/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc7-214-g00072f89e53f9
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      00072f89e53f9a979c60cdba705542886217242e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6492508dd5e02cbfc43061cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492508dd5e02cbfc4306=
1cc
        failing since 254 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64924dd0505c2bf9ed306170

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924dd0505c2bf9ed306175
        failing since 84 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-21T01:09:20.631391  + set +x

    2023-06-21T01:09:20.637993  <8>[   10.885965] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10838754_1.4.2.3.1>

    2023-06-21T01:09:20.748905  #

    2023-06-21T01:09:20.749979  =


    2023-06-21T01:09:20.851494  / # #export SHELL=3D/bin/sh

    2023-06-21T01:09:20.851728  =


    2023-06-21T01:09:20.952350  / # export SHELL=3D/bin/sh. /lava-10838754/=
environment

    2023-06-21T01:09:20.953282  =


    2023-06-21T01:09:21.055076  / # . /lava-10838754/environment/lava-10838=
754/bin/lava-test-runner /lava-10838754/1

    2023-06-21T01:09:21.056322  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64924eed8174c4ceb1306137

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924eed8174c4ceb130613c
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-21T01:14:14.987195  + set +x

    2023-06-21T01:14:14.993919  <8>[   13.211162] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10839049_1.4.2.3.1>

    2023-06-21T01:14:15.098198  / # #

    2023-06-21T01:14:15.198728  export SHELL=3D/bin/sh

    2023-06-21T01:14:15.198920  #

    2023-06-21T01:14:15.299449  / # export SHELL=3D/bin/sh. /lava-10839049/=
environment

    2023-06-21T01:14:15.299616  =


    2023-06-21T01:14:15.400090  / # . /lava-10839049/environment/lava-10839=
049/bin/lava-test-runner /lava-10839049/1

    2023-06-21T01:14:15.400361  =


    2023-06-21T01:14:15.405729  / # /lava-10839049/bin/lava-test-runner /la=
va-10839049/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64924dcf505c2bf9ed306165

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924dcf505c2bf9ed30616a
        failing since 84 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-21T01:09:18.950197  + set<8>[   11.919019] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10838736_1.4.2.3.1>

    2023-06-21T01:09:18.950283   +x

    2023-06-21T01:09:19.054389  / # #

    2023-06-21T01:09:19.154925  export SHELL=3D/bin/sh

    2023-06-21T01:09:19.155090  #

    2023-06-21T01:09:19.255571  / # export SHELL=3D/bin/sh. /lava-10838736/=
environment

    2023-06-21T01:09:19.255741  =


    2023-06-21T01:09:19.356204  / # . /lava-10838736/environment/lava-10838=
736/bin/lava-test-runner /lava-10838736/1

    2023-06-21T01:09:19.356457  =


    2023-06-21T01:09:19.360772  / # /lava-10838736/bin/lava-test-runner /la=
va-10838736/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/64924e8ebe66defe6c30616d

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924e8ebe66defe6c306172
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-21T01:12:33.980425  + set +x

    2023-06-21T01:12:33.986954  <8>[   15.970191] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10838996_1.4.2.3.1>

    2023-06-21T01:12:34.091041  / # #

    2023-06-21T01:12:34.191615  export SHELL=3D/bin/sh

    2023-06-21T01:12:34.191828  #

    2023-06-21T01:12:34.292337  / # export SHELL=3D/bin/sh. /lava-10838996/=
environment

    2023-06-21T01:12:34.292533  =


    2023-06-21T01:12:34.393133  / # . /lava-10838996/environment/lava-10838=
996/bin/lava-test-runner /lava-10838996/1

    2023-06-21T01:12:34.393422  =


    2023-06-21T01:12:34.397816  / # /lava-10838996/bin/lava-test-runner /la=
va-10838996/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64924e8ebe66def=
e6c306174
        failing since 5 days (last pass: v6.4-rc6-274-g2a7f6b5fd1ca, first =
fail: v6.4-rc6-301-ga3b6bb6457ef)
        3 lines

    2023-06-21T01:12:33.956191  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-21T01:12:33.963024  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-21T01:12:33.969671  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-21T01:12:33.976317  <8>[   15.953538] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64924b7fba4436dc0730612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924b7fba4436dc07306133
        failing since 84 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-21T00:59:45.051268  <8>[   12.551639] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10838766_1.4.2.3.1>

    2023-06-21T00:59:45.056400  + set +x

    2023-06-21T00:59:45.161025  #

    2023-06-21T00:59:45.162614  =


    2023-06-21T00:59:45.264718  / # #export SHELL=3D/bin/sh

    2023-06-21T00:59:45.265095  =


    2023-06-21T00:59:45.365967  / # export SHELL=3D/bin/sh. /lava-10838766/=
environment

    2023-06-21T00:59:45.366930  =


    2023-06-21T00:59:45.468402  / # . /lava-10838766/environment/lava-10838=
766/bin/lava-test-runner /lava-10838766/1

    2023-06-21T00:59:45.469842  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64924e75e74f7ebb0630612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924e75e74f7ebb06306133
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-21T01:11:58.375493  + set +x

    2023-06-21T01:11:58.382506  <8>[   12.142726] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10839014_1.4.2.3.1>

    2023-06-21T01:11:58.486843  / # #

    2023-06-21T01:11:58.587572  export SHELL=3D/bin/sh

    2023-06-21T01:11:58.587832  #

    2023-06-21T01:11:58.688410  / # export SHELL=3D/bin/sh. /lava-10839014/=
environment

    2023-06-21T01:11:58.688688  =


    2023-06-21T01:11:58.789222  / # . /lava-10839014/environment/lava-10839=
014/bin/lava-test-runner /lava-10839014/1

    2023-06-21T01:11:58.789596  =


    2023-06-21T01:11:58.794420  / # /lava-10839014/bin/lava-test-runner /la=
va-10839014/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64924d4663dc8a71ad30614a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924d4663dc8a71ad30614f
        failing since 160 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-21T01:07:50.732540  / # #

    2023-06-21T01:07:50.834833  export SHELL=3D/bin/sh

    2023-06-21T01:07:50.835551  #

    2023-06-21T01:07:50.936919  / # export SHELL=3D/bin/sh. /lava-10838828/=
environment

    2023-06-21T01:07:50.937682  =


    2023-06-21T01:07:51.039083  / # . /lava-10838828/environment/lava-10838=
828/bin/lava-test-runner /lava-10838828/1

    2023-06-21T01:07:51.040245  =


    2023-06-21T01:07:51.056027  / # /lava-10838828/bin/lava-test-runner /la=
va-10838828/1

    2023-06-21T01:07:51.168077  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-21T01:07:51.168594  + cd /lava-10838828/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64924e86a2abf8d2dd30613b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924e86a2abf8d2dd306=
13c
        failing since 114 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64924e5a0a387e50f43061c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924e5a0a387e50f4306=
1c3
        failing since 13 days (last pass: v6.4-rc5-244-g9d674be53332, first=
 fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64924e560a387e50f43061a3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924e560a387e50f43061a8
        failing since 154 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-21T01:11:36.732091  <8>[   14.501560] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3682638_1.5.2.4.1>
    2023-06-21T01:11:36.838840  / # #
    2023-06-21T01:11:36.940472  export SHELL=3D/bin/sh
    2023-06-21T01:11:36.940906  #
    2023-06-21T01:11:37.042186  / # export SHELL=3D/bin/sh. /lava-3682638/e=
nvironment
    2023-06-21T01:11:37.042588  =

    2023-06-21T01:11:37.143690  / # . /lava-3682638/environment/lava-368263=
8/bin/lava-test-runner /lava-3682638/1
    2023-06-21T01:11:37.144228  =

    2023-06-21T01:11:37.149100  / # /lava-3682638/bin/lava-test-runner /lav=
a-3682638/1
    2023-06-21T01:11:37.236543  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64924eed938fd5c14e306183

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924eed938fd5c14e306188
        failing since 154 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-21T01:13:56.732153  <8>[   14.813496] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3682681_1.5.2.4.1>
    2023-06-21T01:13:56.839266  / # #
    2023-06-21T01:13:56.942845  export SHELL=3D/bin/sh
    2023-06-21T01:13:56.944076  #
    2023-06-21T01:13:57.046685  / # export SHELL=3D/bin/sh. /lava-3682681/e=
nvironment
    2023-06-21T01:13:57.047736  =

    2023-06-21T01:13:57.149967  / # . /lava-3682681/environment/lava-368268=
1/bin/lava-test-runner /lava-3682681/1
    2023-06-21T01:13:57.151573  =

    2023-06-21T01:13:57.158076  / # /lava-3682681/bin/lava-test-runner /lav=
a-3682681/1<3>[   15.243581] Bluetooth: hci0: command 0x0c03 tx timeout
    2023-06-21T01:13:57.158929   =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64924fbf71fcf43338306158

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924fbf71fcf4333830615d
        failing since 154 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-21T01:17:25.953548  <8>[   14.890953] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3682707_1.5.2.4.1>
    2023-06-21T01:17:26.062859  / # #
    2023-06-21T01:17:26.166238  export SHELL=3D/bin/sh
    2023-06-21T01:17:26.167213  #
    2023-06-21T01:17:26.269407  / # export SHELL=3D/bin/sh. /lava-3682707/e=
nvironment
    2023-06-21T01:17:26.271766  =

    2023-06-21T01:17:26.378747  / # . /lava-3682707/environment/lava-368270=
7/bin/lava-test-runner /lava-3682707/1
    2023-06-21T01:17:26.379500  =

    2023-06-21T01:17:26.386019  / # /lava-3682707/bin/lava-test-runner /lav=
a-3682707/1<3>[   15.328530] Bluetooth: hci0: command 0xfc18 tx timeout
    2023-06-21T01:17:26.386246   =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/649252233d030979db3061c4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649252233d030979db3061c9
        failing since 154 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-21T01:27:40.450175  <8>[   16.854299] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3682801_1.5.2.4.1>
    2023-06-21T01:27:40.557158  / # #
    2023-06-21T01:27:40.658646  export SHELL=3D/bin/sh
    2023-06-21T01:27:40.659205  #
    2023-06-21T01:27:40.761117  / # export SHELL=3D/bin/sh. /lava-3682801/e=
nvironment
    2023-06-21T01:27:40.761656  =

    2023-06-21T01:27:40.863015  / # . /lava-3682801/environment/lava-368280=
1/bin/lava-test-runner /lava-3682801/1
    2023-06-21T01:27:40.863577  =

    2023-06-21T01:27:40.868365  / # /lava-3682801/bin/lava-test-runner /lav=
a-3682801/1
    2023-06-21T01:27:40.964870  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/649252c024e75e612e306185

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649252c024e75e612e30618a
        failing since 154 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-21T01:30:24.219629  <8>[   20.446628] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3682834_1.5.2.4.1>
    2023-06-21T01:30:24.326161  / # #
    2023-06-21T01:30:24.427858  export SHELL=3D/bin/sh
    2023-06-21T01:30:24.428242  #
    2023-06-21T01:30:24.529525  / # export SHELL=3D/bin/sh. /lava-3682834/e=
nvironment
    2023-06-21T01:30:24.530473  =

    2023-06-21T01:30:24.632374  / # . /lava-3682834/environment/lava-368283=
4/bin/lava-test-runner /lava-3682834/1
    2023-06-21T01:30:24.633366  =

    2023-06-21T01:30:24.637953  / # /lava-3682834/bin/lava-test-runner /lav=
a-3682834/1
    2023-06-21T01:30:24.725808  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/64924b9157e7213488306133

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64924b9157e7213=
48830613a
        failing since 110 days (last pass: v6.2-1218-g2d4a54ee969d, first f=
ail: v6.2-13370-g5872d227b73f)
        30 lines

    2023-06-21T00:59:46.712286  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-21T00:59:46.712969  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-21T00:59:46.713779  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2bf000 allocated at load_module+0x6b0/0=
x1954
    2023-06-21T00:59:46.715538  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-21T00:59:46.819478  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-21T00:59:46.820225  kern  :emerg : Process udevd (pid: 70, stac=
k limit =3D 0x753aa8d3)
    2023-06-21T00:59:46.821260  kern  :emerg : Stack: (0xc8915cf8 to 0xc891=
6000)
    2023-06-21T00:59:46.822106  kern  :emerg : 5ce0:                       =
                                c4e3c200 c0777860
    2023-06-21T00:59:46.822603  kern  :emerg : 5d00: 00000000 c03afe80 0000=
0000 0a854e53 0000005d 0a854e53 c0777860 bf2bf220
    2023-06-21T00:59:46.823051  kern  :emerg : 5d20: 00000000 00000000 0000=
0000 00000001 c077785c bf310590 bf2bf220 00000000 =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64924b9157e7213=
48830613b
        failing since 513 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-06-21T00:59:46.631868  kern  :alert : 8<--- cut here ---
    2023-06-21T00:59:46.633558  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-06-21T00:59:46.634044  kern  :alert : [00000060] *pgd=3Dc4a54831, =
*pte=3D00000000, *ppte=3D00000000
    2023-06-21T00:59:46.634523  kern  :alert : Register r0 information: non=
-paged memory
    2023-06-21T00:59:46.634970  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8914000 allocated at kernel_clone+0x98/0x=
3a0
    2023-06-21T00:59:46.636524  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-06-21T00:59:46.675568  kern  :alert : Register r3 information: non=
-paged memory
    2023-06-21T00:59:46.676926  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4e3c200 pointer offset 0 size 512
    2023-06-21T00:59:46.677376  kern  :alert : Register r5 information: non=
-slab/vmalloc me<8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail=
 UNITS=3Dlines MEASUREMENT=3D16>
    2023-06-21T00:59:46.677758  mory =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64924dad7e211f120e306140

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924dad7e211f120e306145
        failing since 84 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-21T01:09:01.509824  + set +x

    2023-06-21T01:09:01.516321  <8>[   75.546495] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10838740_1.4.2.3.1>

    2023-06-21T01:09:01.620781  / # #

    2023-06-21T01:09:01.721459  export SHELL=3D/bin/sh

    2023-06-21T01:09:01.721673  #

    2023-06-21T01:09:01.822223  / # export SHELL=3D/bin/sh. /lava-10838740/=
environment

    2023-06-21T01:09:01.822451  =


    2023-06-21T01:09:01.922966  / # . /lava-10838740/environment/lava-10838=
740/bin/lava-test-runner /lava-10838740/1

    2023-06-21T01:09:01.923320  =


    2023-06-21T01:09:01.928500  / # /lava-10838740/bin/lava-test-runner /la=
va-10838740/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64924e6f580923f8f43061cd

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924e6f580923f8f43061d2
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-21T01:11:57.252491  + set +x

    2023-06-21T01:11:57.258727  <8>[   16.087417] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10839023_1.4.2.3.1>

    2023-06-21T01:11:57.365817  / # #

    2023-06-21T01:11:57.466419  export SHELL=3D/bin/sh

    2023-06-21T01:11:57.466627  #

    2023-06-21T01:11:57.567141  / # export SHELL=3D/bin/sh. /lava-10839023/=
environment

    2023-06-21T01:11:57.567379  =


    2023-06-21T01:11:57.667960  / # . /lava-10839023/environment/lava-10839=
023/bin/lava-test-runner /lava-10839023/1

    2023-06-21T01:11:57.668262  =


    2023-06-21T01:11:57.672908  / # /lava-10839023/bin/lava-test-runner /la=
va-10839023/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64924d917e211f120e306133

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924d917e211f120e306138
        failing since 84 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-21T01:08:18.856285  + set +x

    2023-06-21T01:08:18.862904  <8>[   10.135528] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10838755_1.4.2.3.1>

    2023-06-21T01:08:18.967333  / # #

    2023-06-21T01:08:19.068098  export SHELL=3D/bin/sh

    2023-06-21T01:08:19.068347  #

    2023-06-21T01:08:19.168917  / # export SHELL=3D/bin/sh. /lava-10838755/=
environment

    2023-06-21T01:08:19.169171  =


    2023-06-21T01:08:19.269738  / # . /lava-10838755/environment/lava-10838=
755/bin/lava-test-runner /lava-10838755/1

    2023-06-21T01:08:19.270116  =


    2023-06-21T01:08:19.275690  / # /lava-10838755/bin/lava-test-runner /la=
va-10838755/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64924e590a387e50f43061b4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924e590a387e50f43061b9
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-21T01:11:43.691455  + set<8>[   15.646316] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10839025_1.4.2.3.1>

    2023-06-21T01:11:43.691561   +x

    2023-06-21T01:11:43.795576  / # #

    2023-06-21T01:11:43.896313  export SHELL=3D/bin/sh

    2023-06-21T01:11:43.896539  #

    2023-06-21T01:11:43.997035  / # export SHELL=3D/bin/sh. /lava-10839025/=
environment

    2023-06-21T01:11:43.997249  =


    2023-06-21T01:11:44.097792  / # . /lava-10839025/environment/lava-10839=
025/bin/lava-test-runner /lava-10839025/1

    2023-06-21T01:11:44.098129  =


    2023-06-21T01:11:44.103584  / # /lava-10839025/bin/lava-test-runner /la=
va-10839025/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64924b9c57e7213488306170

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924b9c57e7213488306175
        failing since 84 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-21T00:59:57.648666  + <8>[   11.438527] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10838763_1.4.2.3.1>

    2023-06-21T00:59:57.649258  set +x

    2023-06-21T00:59:57.757019  / # #

    2023-06-21T00:59:57.859548  export SHELL=3D/bin/sh

    2023-06-21T00:59:57.860336  #

    2023-06-21T00:59:57.962081  / # export SHELL=3D/bin/sh. /lava-10838763/=
environment

    2023-06-21T00:59:57.962862  =


    2023-06-21T00:59:58.064672  / # . /lava-10838763/environment/lava-10838=
763/bin/lava-test-runner /lava-10838763/1

    2023-06-21T00:59:58.065888  =


    2023-06-21T00:59:58.071283  / # /lava-10838763/bin/lava-test-runner /la=
va-10838763/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64924e67580923f8f4306136

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924e67580923f8f430613b
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-21T01:11:54.960162  + set +x

    2023-06-21T01:11:54.966593  <8>[   11.903396] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10839030_1.4.2.3.1>

    2023-06-21T01:11:55.074510  / # #

    2023-06-21T01:11:55.176946  export SHELL=3D/bin/sh

    2023-06-21T01:11:55.177800  #

    2023-06-21T01:11:55.279359  / # export SHELL=3D/bin/sh. /lava-10839030/=
environment

    2023-06-21T01:11:55.280149  =


    2023-06-21T01:11:55.381679  / # . /lava-10839030/environment/lava-10839=
030/bin/lava-test-runner /lava-10839030/1

    2023-06-21T01:11:55.382894  =


    2023-06-21T01:11:55.387765  / # /lava-10839030/bin/lava-test-runner /la=
va-10839030/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64924d0cc41610275c306164

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924d0dc41610275c306169
        failing since 142 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-21T01:05:57.189102  + set +x
    2023-06-21T01:05:57.189301  [   13.102315] <LAVA_SIGNAL_ENDRUN 0_dmesg =
983505_1.5.2.3.1>
    2023-06-21T01:05:57.297236  / # #
    2023-06-21T01:05:57.398855  export SHELL=3D/bin/sh
    2023-06-21T01:05:57.399313  #
    2023-06-21T01:05:57.500678  / # export SHELL=3D/bin/sh. /lava-983505/en=
vironment
    2023-06-21T01:05:57.501123  =

    2023-06-21T01:05:57.602389  / # . /lava-983505/environment/lava-983505/=
bin/lava-test-runner /lava-983505/1
    2023-06-21T01:05:57.602982  =

    2023-06-21T01:05:57.606732  / # /lava-983505/bin/lava-test-runner /lava=
-983505/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64924d4963dc8a71ad306155

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924d4963dc8a71ad30615a
        failing since 142 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-21T01:07:14.737283  + set +x
    2023-06-21T01:07:14.737434  [   12.841769] <LAVA_SIGNAL_ENDRUN 0_dmesg =
983510_1.5.2.3.1>
    2023-06-21T01:07:14.845371  / # #
    2023-06-21T01:07:14.947078  export SHELL=3D/bin/sh
    2023-06-21T01:07:14.947838  #
    2023-06-21T01:07:15.049188  / # export SHELL=3D/bin/sh. /lava-983510/en=
vironment
    2023-06-21T01:07:15.049685  =

    2023-06-21T01:07:15.151075  / # . /lava-983510/environment/lava-983510/=
bin/lava-test-runner /lava-983510/1
    2023-06-21T01:07:15.151668  =

    2023-06-21T01:07:15.154919  / # /lava-983510/bin/lava-test-runner /lava=
-983510/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64924dfdcac86a30f730618b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924dfdcac86a30f7306190
        failing since 142 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-21T01:09:57.789082  + set +x
    2023-06-21T01:09:57.789240  [   13.213821] <LAVA_SIGNAL_ENDRUN 0_dmesg =
983520_1.5.2.3.1>
    2023-06-21T01:09:57.896125  / # #
    2023-06-21T01:09:57.997682  export SHELL=3D/bin/sh
    2023-06-21T01:09:57.998131  #
    2023-06-21T01:09:58.099329  / # export SHELL=3D/bin/sh. /lava-983520/en=
vironment
    2023-06-21T01:09:58.099729  =

    2023-06-21T01:09:58.200874  / # . /lava-983520/environment/lava-983520/=
bin/lava-test-runner /lava-983520/1
    2023-06-21T01:09:58.201418  =

    2023-06-21T01:09:58.204596  / # /lava-983520/bin/lava-test-runner /lava=
-983520/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/649250198a3a60f881306169

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649250198a3a60f88130616e
        failing since 142 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-21T01:18:55.698732  + set +x
    2023-06-21T01:18:55.698988  [   12.149705] <LAVA_SIGNAL_ENDRUN 0_dmesg =
983534_1.5.2.3.1>
    2023-06-21T01:18:55.806259  / # #
    2023-06-21T01:18:55.907980  export SHELL=3D/bin/sh
    2023-06-21T01:18:55.908529  #
    2023-06-21T01:18:56.009854  / # export SHELL=3D/bin/sh. /lava-983534/en=
vironment
    2023-06-21T01:18:56.010357  =

    2023-06-21T01:18:56.111669  / # . /lava-983534/environment/lava-983534/=
bin/lava-test-runner /lava-983534/1
    2023-06-21T01:18:56.112541  =

    2023-06-21T01:18:56.115563  / # /lava-983534/bin/lava-test-runner /lava=
-983534/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64925068f0bca31de130616a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64925068f0bca31de130616f
        failing since 142 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-21T01:20:18.090590  + set +x
    2023-06-21T01:20:18.090789  [   14.377217] <LAVA_SIGNAL_ENDRUN 0_dmesg =
983541_1.5.2.3.1>
    2023-06-21T01:20:18.198561  / # #
    2023-06-21T01:20:18.300554  export SHELL=3D/bin/sh
    2023-06-21T01:20:18.301261  #
    2023-06-21T01:20:18.402757  / # export SHELL=3D/bin/sh. /lava-983541/en=
vironment
    2023-06-21T01:20:18.403254  =

    2023-06-21T01:20:18.504627  / # . /lava-983541/environment/lava-983541/=
bin/lava-test-runner /lava-983541/1
    2023-06-21T01:20:18.505289  =

    2023-06-21T01:20:18.508635  / # /lava-983541/bin/lava-test-runner /lava=
-983541/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64924f7985de342123306177

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+crypto/gcc-10/lab-pengutronix/baseline-imx=
8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+crypto/gcc-10/lab-pengutronix/baseline-imx=
8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924f7985de342123306=
178
        new failure (last pass: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64924ff1aca86e70d8306135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-inn=
ocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924ff1aca86e70d8306=
136
        new failure (last pass: v6.4-rc7-164-g1f02f25057f7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/649250b984880a8387306151

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649250b984880a8387306=
152
        new failure (last pass: v6.4-rc7-164-g1f02f25057f7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64925131753e97b7cf306154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64925131753e97b7cf306=
155
        failing since 417 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64924b59fb6fe922c7306132

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924b59fb6fe922c7306137
        failing since 55 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-21T00:58:37.111249  <8>[    7.723388] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3682587_1.5.2.4.1>
    2023-06-21T00:58:37.232052  / # #
    2023-06-21T00:58:37.335006  export SHELL=3D/bin/sh
    2023-06-21T00:58:37.339851  #
    2023-06-21T00:58:37.442863  / # export SHELL=3D/bin/sh. /lava-3682587/e=
nvironment
    2023-06-21T00:58:37.443682  =

    2023-06-21T00:58:37.546850  / # . /lava-3682587/environment/lava-368258=
7/bin/lava-test-runner /lava-3682587/1
    2023-06-21T00:58:37.548020  =

    2023-06-21T00:58:37.558122  / # /lava-3682587/bin/lava-test-runner /lav=
a-3682587/1
    2023-06-21T00:58:37.603045  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6492544683389d6ab0306199

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-a=
m625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-a=
m625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6492544683389d6ab030619e
        failing since 55 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-21T01:36:41.365725  <8>[    7.775097] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3682899_1.5.2.4.1>
    2023-06-21T01:36:41.476412  =

    2023-06-21T01:36:41.579391  / # #export SHELL=3D/bin/sh
    2023-06-21T01:36:41.580604  =

    2023-06-21T01:36:41.682897  / # export SHELL=3D/bin/sh. /lava-3682899/e=
nvironment
    2023-06-21T01:36:41.683828  =

    2023-06-21T01:36:41.785875  / # . /lava-3682899/environment/lava-368289=
9/bin/lava-test-runner /lava-3682899/1
    2023-06-21T01:36:41.787365  =

    2023-06-21T01:36:41.798003  / # /lava-3682899/bin/lava-test-runner /lav=
a-3682899/1
    2023-06-21T01:36:41.842923  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649254b9f961affb4430614a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-=
sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-=
sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649254b9f961affb4430614f
        failing since 53 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)

    2023-06-21T01:38:47.404201  <8>[    7.683319] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3682920_1.5.2.4.1>
    2023-06-21T01:38:47.508465  / # #
    2023-06-21T01:38:47.609865  export SHELL=3D/bin/sh
    2023-06-21T01:38:47.610278  #
    2023-06-21T01:38:47.711393  / # export SHELL=3D/bin/sh. /lava-3682920/e=
nvironment
    2023-06-21T01:38:47.711754  =

    2023-06-21T01:38:47.812870  / # . /lava-3682920/environment/lava-368292=
0/bin/lava-test-runner /lava-3682920/1
    2023-06-21T01:38:47.813556  =

    2023-06-21T01:38:47.857031  / # /lava-3682920/bin/lava-test-runner /lav=
a-3682920/1
    2023-06-21T01:38:47.865994  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64924b9557e721348830614c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924b9557e7213488306151
        failing since 84 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-21T00:59:42.069100  <8>[   11.580199] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10838764_1.4.2.3.1>

    2023-06-21T00:59:42.172983  / # #

    2023-06-21T00:59:42.273548  export SHELL=3D/bin/sh

    2023-06-21T00:59:42.273703  #

    2023-06-21T00:59:42.374160  / # export SHELL=3D/bin/sh. /lava-10838764/=
environment

    2023-06-21T00:59:42.374318  =


    2023-06-21T00:59:42.475046  / # . /lava-10838764/environment/lava-10838=
764/bin/lava-test-runner /lava-10838764/1

    2023-06-21T00:59:42.476242  =


    2023-06-21T00:59:42.480863  / # /lava-10838764/bin/lava-test-runner /la=
va-10838764/1

    2023-06-21T00:59:42.487673  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64924e560a387e50f4306198

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924e560a387e50f430619d
        failing since 82 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-21T01:11:32.306490  + <8>[   14.014918] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10839042_1.4.2.3.1>

    2023-06-21T01:11:32.306923  set +x

    2023-06-21T01:11:32.414454  / # #

    2023-06-21T01:11:32.516539  export SHELL=3D/bin/sh

    2023-06-21T01:11:32.517369  #

    2023-06-21T01:11:32.618992  / # export SHELL=3D/bin/sh. /lava-10839042/=
environment

    2023-06-21T01:11:32.619676  =


    2023-06-21T01:11:32.721120  / # . /lava-10839042/environment/lava-10839=
042/bin/lava-test-runner /lava-10839042/1

    2023-06-21T01:11:32.722293  =


    2023-06-21T01:11:32.726975  / # /lava-10839042/bin/lava-test-runner /la=
va-10839042/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64924b5dfb6fe922c730614d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924b5dfb6fe922c7306=
14e
        failing since 13 days (last pass: v6.4-rc5-210-gef2d89b88456f, firs=
t fail: v6.4-rc5-244-g9d674be53332) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64924f861bdf868a543061dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924f861bdf868a54306=
1dd
        failing since 41 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64925051a52643122f306367

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u2=
00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u2=
00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64925051a52643122f306=
368
        failing since 41 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/649252ac60fcd8de363061f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649252ac60fcd8de36306=
1f7
        failing since 2 days (last pass: v6.4-rc6-301-ga3b6bb6457ef, first =
fail: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649253271ab96a718b30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649253271ab96a718b306=
130
        failing since 13 days (last pass: v6.4-rc5-210-gef2d89b88456f, firs=
t fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6492632ae1e748cf2630612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492632ae1e748cf26306=
12f
        new failure (last pass: v6.4-rc7-164-g1f02f25057f7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649254148dd56b3f9d30613a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649254148dd56b3f9d306=
13b
        failing since 147 days (last pass: v6.2-rc5-157-g1f16e03afb18, firs=
t fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64924e8dbe66defe6c30616a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924e8dbe66defe6c306=
16b
        failing since 43 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64924ff7aca86e70d830613e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924ff7aca86e70d8306=
13f
        failing since 55 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6492540483389d6ab030612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492540483389d6ab0306=
130
        failing since 133 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64924ff6aca86e70d830613b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924ff6aca86e70d8306=
13c
        failing since 43 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/649250208a3a60f881306177

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649250208a3a60f881306=
178
        failing since 55 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64925418189b16579c30614b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64925418189b16579c306=
14c
        failing since 133 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64926210c7ce63d4863061b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64926210c7ce63d486306=
1b8
        failing since 133 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/649251892f1c6692aa306181

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649251892f1c6692aa306=
182
        new failure (last pass: v6.4-rc7-164-g1f02f25057f7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/649251479f64df0d443061a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649251479f64df0d44306=
1a5
        new failure (last pass: v6.4-rc7-164-g1f02f25057f7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6492518beeb1af1196306130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492518beeb1af1196306=
131
        new failure (last pass: v6.4-rc7-164-g1f02f25057f7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/649251489f64df0d443061aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649251489f64df0d44306=
1ab
        new failure (last pass: v6.4-rc7-164-g1f02f25057f7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6492511a8dcf45797930613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492511a8dcf457979306=
140
        failing since 187 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64924f8a04dcafa505306136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924f8a04dcafa505306=
137
        failing since 187 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64924b20b7c78418e3306166

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924b20b7c78418e330616b
        failing since 139 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-21T00:57:59.201310  [   29.501346] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3682598_1.5.2.4.1>
    2023-06-21T00:57:59.305729  =

    2023-06-21T00:57:59.407310  / # #export SHELL=3D/bin/sh
    2023-06-21T00:57:59.407842  =

    2023-06-21T00:57:59.509579  / # export SHELL=3D/bin/sh. /lava-3682598/e=
nvironment
    2023-06-21T00:57:59.510326  =

    2023-06-21T00:57:59.612299  / # . /lava-3682598/environment/lava-368259=
8/bin/lava-test-runner /lava-3682598/1
    2023-06-21T00:57:59.612967  =

    2023-06-21T00:57:59.616474  / # /lava-3682598/bin/lava-test-runner /lav=
a-3682598/1
    2023-06-21T00:57:59.651963  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64924f592c58ba813a306180

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924f592c58ba813a306185
        failing since 140 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-21T01:15:57.416667  [   32.530181] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3682769_1.5.2.4.1>
    2023-06-21T01:15:57.520551  =

    2023-06-21T01:15:57.621829  / # #export SHELL=3D/bin/sh
    2023-06-21T01:15:57.622173  =

    2023-06-21T01:15:57.723329  / # export SHELL=3D/bin/sh. /lava-3682769/e=
nvironment
    2023-06-21T01:15:57.723671  =

    2023-06-21T01:15:57.824815  / # . /lava-3682769/environment/lava-368276=
9/bin/lava-test-runner /lava-3682769/1
    2023-06-21T01:15:57.825358  =

    2023-06-21T01:15:57.828778  / # /lava-3682769/bin/lava-test-runner /lav=
a-3682769/1
    2023-06-21T01:15:57.865282  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64924fba71fcf4333830613a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64924fba71fcf4333830613f
        failing since 140 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-21T01:17:30.342509  [   29.380820] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3682797_1.5.2.4.1>
    2023-06-21T01:17:30.447763  =

    2023-06-21T01:17:30.550112  / # #export SHELL=3D/bin/sh
    2023-06-21T01:17:30.550726  =

    2023-06-21T01:17:30.652522  / # export SHELL=3D/bin/sh. /lava-3682797/e=
nvironment
    2023-06-21T01:17:30.653297  =

    2023-06-21T01:17:30.755246  / # . /lava-3682797/environment/lava-368279=
7/bin/lava-test-runner /lava-3682797/1
    2023-06-21T01:17:30.756261  =

    2023-06-21T01:17:30.759712  / # /lava-3682797/bin/lava-test-runner /lav=
a-3682797/1
    2023-06-21T01:17:30.795521  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64925123753e97b7cf30613c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk33=
28-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk33=
28-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64925123753e97b7cf306141
        failing since 140 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-21T01:23:26.427018  [   30.540982] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3682896_1.5.2.4.1>
    2023-06-21T01:23:26.531621  =

    2023-06-21T01:23:26.633079  / # #export SHELL=3D/bin/sh
    2023-06-21T01:23:26.633466  =

    2023-06-21T01:23:26.735026  / # export SHELL=3D/bin/sh. /lava-3682896/e=
nvironment
    2023-06-21T01:23:26.735375  =

    2023-06-21T01:23:26.836575  / # . /lava-3682896/environment/lava-368289=
6/bin/lava-test-runner /lava-3682896/1
    2023-06-21T01:23:26.837106  =

    2023-06-21T01:23:26.840795  / # /lava-3682896/bin/lava-test-runner /lav=
a-3682896/1
    2023-06-21T01:23:26.877044  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64925186e1388bc92e3061af

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64925186e1388bc92e3061b4
        failing since 140 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-06-21T01:25:05.710167  [   29.061875] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3682935_1.5.2.4.1>
    2023-06-21T01:25:05.815547  =

    2023-06-21T01:25:05.917191  / # #export SHELL=3D/bin/sh
    2023-06-21T01:25:05.917792  =

    2023-06-21T01:25:06.019400  / # export SHELL=3D/bin/sh. /lava-3682935/e=
nvironment
    2023-06-21T01:25:06.019982  =

    2023-06-21T01:25:06.121671  / # . /lava-3682935/environment/lava-368293=
5/bin/lava-test-runner /lava-3682935/1
    2023-06-21T01:25:06.122497  =

    2023-06-21T01:25:06.125993  / # /lava-3682935/bin/lava-test-runner /lav=
a-3682935/1
    2023-06-21T01:25:06.160607  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649254ec868dee552b306164

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649254ec868dee552b306=
165
        failing since 133 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649254158dd56b3f9d306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649254158dd56b3f9d306=
141
        failing since 133 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6492568e136eb853c8306136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492568e136eb853c8306=
137
        failing since 133 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64926172a3c250b69b3061a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64926172a3c250b69b306=
1a9
        new failure (last pass: v6.4-rc7-164-g1f02f25057f7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64924d02657045487930615a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924d026570454879306=
15b
        new failure (last pass: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64924c1253f0895338306143

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broon=
ie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64924c1253f0895338306=
144
        failing since 2 days (last pass: v6.4-rc6-274-g2a7f6b5fd1ca, first =
fail: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64925073f0bca31de13061d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64925073f0bca31de1306=
1d8
        new failure (last pass: v6.4-rc7-110-gdab158ce7741) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/649251db27a91b69a430616b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-21=
4-g00072f89e53f9/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649251db27a91b69a4306=
16c
        failing since 6 days (last pass: v6.4-rc5-294-gda90eaebfb79, first =
fail: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =20
