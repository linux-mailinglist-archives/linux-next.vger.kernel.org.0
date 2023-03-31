Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA6586D1DC0
	for <lists+linux-next@lfdr.de>; Fri, 31 Mar 2023 12:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbjCaKQZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Mar 2023 06:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbjCaKPl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Mar 2023 06:15:41 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72CE55A6
        for <linux-next@vger.kernel.org>; Fri, 31 Mar 2023 03:11:28 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso24870221pjb.3
        for <linux-next@vger.kernel.org>; Fri, 31 Mar 2023 03:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680257488;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KOlCjLdwBcVWTmhljp8NLZplJmW7OXAFf3AZWB5yaAI=;
        b=qDc2RzjyfsQqQBK8eKaLpwJrhAn7GUiRAsT6SZdqZDeV9kSk79XbTrKylbAQmYqkIs
         im66PfY4kGkP2ea73rfMyLTqm6SXD4OBAq2HjfnQaUr3bLJZVFkHeDcfatcTwHmqtjoQ
         RN75H84jbFaoykmuvr4Jeva69A/UlUcSDOWG1jhLcqj49yxfRBY0JWpVfd9133nXAVWd
         /BqlmLX0F6B91mhPAUcd7jUyD1RMR7eaP4OWTUOhbV3mjmsnyd4Cp7fYHs4adaZ9y5nI
         Fze782PuqHQCiWtY5fQMTD1n66qpcytU2o/8TCNtoUfBJolir3E61vf2YT5ubuTTnt34
         ljEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680257488;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOlCjLdwBcVWTmhljp8NLZplJmW7OXAFf3AZWB5yaAI=;
        b=Z6XxAZbr3oQHOz4bhfDRvNZ10iat/jBbshrk+/cxu4b/sYJCrDcDJf4Cf77WTi5Ldd
         kuyyCSBpKg3VaXWUP+Xp1x5kz75g48xD8DU32Pf7G1t1NHLjQfdJ37yA06OpDIYmkKBE
         jdtgbXPeh8p6LvGtv7HaSDcoSd2xWkjhsmXnoz9viRIeANyvaPotfjCPX2P9CO+r+3Dh
         nzDkAXdDewI4rztZGiShJAtj+Xly4iWxKQTBRC/eFrzQNrQoUjhZqbOcEywF+34Dxood
         HywYUaEo3qc8zNW96iVRBp//xLulp53/pJ5Bc2sQlhkWKNi57z7rst88MjIq5Zy48IlW
         vzEA==
X-Gm-Message-State: AO0yUKWLJ44v/wj+e6rEbETarz1pWJ+g8qmidYEELWNkD5CiMKm30uPb
        ySMs19fuBQ3K9TeO7f0q0IqciuPOvGUQJZnnqS0=
X-Google-Smtp-Source: AK7set8xPPk+3Gne2Pd4Eq1jJ/QmAds4+L6bFPgYzM/49YA83X/QWevnOUzgvwgqADscdC8CArRU4Q==
X-Received: by 2002:a05:6a20:3402:b0:dd:df53:4351 with SMTP id i2-20020a056a20340200b000dddf534351mr20617303pzd.40.1680257486608;
        Fri, 31 Mar 2023 03:11:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b0062d848b7a9esm1423996pfe.153.2023.03.31.03.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 03:11:26 -0700 (PDT)
Message-ID: <6426b1ce.a70a0220.302ce.35fa@mx.google.com>
Date:   Fri, 31 Mar 2023 03:11:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230331
Subject: next/master baseline: 922 runs, 74 regressions (next-20230331)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 922 runs, 74 regressions (next-20230331)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230331/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230331
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4b0f4525dc4fe8af17b3daefe585f0c2eb0fe0a5 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6426784fd6a80945b062f7ad

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6426784fd6a80945b062f7b2
        new failure (last pass: next-20230324)

    2023-03-31T06:06:02.209549  + set +x

    2023-03-31T06:06:02.216573  <8>[   13.376216] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9828828_1.4.2.3.1>

    2023-03-31T06:06:02.321180  / # #

    2023-03-31T06:06:02.422048  export SHELL=3D/bin/sh

    2023-03-31T06:06:02.422254  #

    2023-03-31T06:06:02.523106  / # export SHELL=3D/bin/sh. /lava-9828828/e=
nvironment

    2023-03-31T06:06:02.523319  =


    2023-03-31T06:06:02.624300  / # . /lava-9828828/environment/lava-982882=
8/bin/lava-test-runner /lava-9828828/1

    2023-03-31T06:06:02.624615  =


    2023-03-31T06:06:02.630076  / # /lava-9828828/bin/lava-test-runner /lav=
a-9828828/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64267959133019ec9e62f7b0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267959133019ec9e62f7b5
        failing since 2 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-03-31T06:10:21.122067  <8>[   10.325979] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9828908_1.4.2.3.1>

    2023-03-31T06:10:21.125745  + set +x

    2023-03-31T06:10:21.231464  #

    2023-03-31T06:10:21.334992  / # #export SHELL=3D/bin/sh

    2023-03-31T06:10:21.335868  =


    2023-03-31T06:10:21.437829  / # export SHELL=3D/bin/sh. /lava-9828908/e=
nvironment

    2023-03-31T06:10:21.438826  =


    2023-03-31T06:10:21.540941  / # . /lava-9828908/environment/lava-982890=
8/bin/lava-test-runner /lava-9828908/1

    2023-03-31T06:10:21.542303  =


    2023-03-31T06:10:21.547895  / # /lava-9828908/bin/lava-test-runner /lav=
a-9828908/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64267a96cf9e10271c62f7a6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267a96cf9e10271c62f7ab
        failing since 2 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-03-31T06:15:35.597566  + set +x

    2023-03-31T06:15:35.604084  <8>[   10.812033] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9829128_1.4.2.3.1>

    2023-03-31T06:15:35.712498  #

    2023-03-31T06:15:35.713712  =


    2023-03-31T06:15:35.815891  / # #export SHELL=3D/bin/sh

    2023-03-31T06:15:35.816787  =


    2023-03-31T06:15:35.918744  / # export SHELL=3D/bin/sh. /lava-9829128/e=
nvironment

    2023-03-31T06:15:35.919591  =


    2023-03-31T06:15:36.021628  / # . /lava-9829128/environment/lava-982912=
8/bin/lava-test-runner /lava-9829128/1

    2023-03-31T06:15:36.022063  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/6426785198fbc2728662f77c

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6426785198fbc2728662f781
        new failure (last pass: next-20230324)

    2023-03-31T06:06:02.919328  + set +x

    2023-03-31T06:06:02.922955  <8>[   15.220035] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9828857_1.4.2.3.1>

    2023-03-31T06:06:03.028704  / # #

    2023-03-31T06:06:03.129731  export SHELL=3D/bin/sh

    2023-03-31T06:06:03.129944  #

    2023-03-31T06:06:03.230904  / # export SHELL=3D/bin/sh. /lava-9828857/e=
nvironment

    2023-03-31T06:06:03.231141  =


    2023-03-31T06:06:03.332043  / # . /lava-9828857/environment/lava-982885=
7/bin/lava-test-runner /lava-9828857/1

    2023-03-31T06:06:03.332347  =


    2023-03-31T06:06:03.337065  / # /lava-9828857/bin/lava-test-runner /lav=
a-9828857/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6426785198fbc27=
28662f783
        failing since 6 days (last pass: next-20230323, first fail: next-20=
230324)
        3 lines

    2023-03-31T06:06:02.895632  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-03-31T06:06:02.902122  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-03-31T06:06:02.908448  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-03-31T06:06:02.915369  <8>[   15.203555] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64267976f7586ff07362f773

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267976f7586ff07362f778
        failing since 2 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-03-31T06:10:38.969742  + <8>[   11.787478] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9828944_1.4.2.3.1>

    2023-03-31T06:10:38.970306  set +x

    2023-03-31T06:10:39.078215  / # #

    2023-03-31T06:10:39.179316  export SHELL=3D/bin/sh

    2023-03-31T06:10:39.179528  #

    2023-03-31T06:10:39.280438  / # export SHELL=3D/bin/sh. /lava-9828944/e=
nvironment

    2023-03-31T06:10:39.280766  =


    2023-03-31T06:10:39.381714  / # . /lava-9828944/environment/lava-982894=
4/bin/lava-test-runner /lava-9828944/1

    2023-03-31T06:10:39.382010  =


    2023-03-31T06:10:39.386370  / # /lava-9828944/bin/lava-test-runner /lav=
a-9828944/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64267aa36802e60fac62f778

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-CM140=
0CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-CM140=
0CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267aa36802e60fac62f77d
        failing since 2 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-03-31T06:15:47.368855  + set<8>[   11.990863] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9829136_1.4.2.3.1>

    2023-03-31T06:15:47.368948   +x

    2023-03-31T06:15:47.474001  / # #

    2023-03-31T06:15:47.574951  export SHELL=3D/bin/sh

    2023-03-31T06:15:47.575219  #

    2023-03-31T06:15:47.676175  / # export SHELL=3D/bin/sh. /lava-9829136/e=
nvironment

    2023-03-31T06:15:47.676398  =


    2023-03-31T06:15:47.777205  / # . /lava-9829136/environment/lava-982913=
6/bin/lava-test-runner /lava-9829136/1

    2023-03-31T06:15:47.777559  =


    2023-03-31T06:15:47.782260  / # /lava-9829136/bin/lava-test-runner /lav=
a-9829136/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6426786b74755c379b62f76d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6426786b74755c379b62f772
        new failure (last pass: next-20230324)

    2023-03-31T06:06:16.480679  <8>[   13.283992] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9828861_1.4.2.3.1>

    2023-03-31T06:06:16.484628  + set +x

    2023-03-31T06:06:16.590107  #

    2023-03-31T06:06:16.591472  =


    2023-03-31T06:06:16.693781  / # #export SHELL=3D/bin/sh

    2023-03-31T06:06:16.694674  =


    2023-03-31T06:06:16.796594  / # export SHELL=3D/bin/sh. /lava-9828861/e=
nvironment

    2023-03-31T06:06:16.797465  =


    2023-03-31T06:06:16.899562  / # . /lava-9828861/environment/lava-982886=
1/bin/lava-test-runner /lava-9828861/1

    2023-03-31T06:06:16.901038  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64267962c651b5351f62f7d5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267962c651b5351f62f7da
        failing since 2 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-03-31T06:10:36.456722  <8>[    7.666195] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9828940_1.4.2.3.1>

    2023-03-31T06:10:36.460350  + set +x

    2023-03-31T06:10:36.566252  #

    2023-03-31T06:10:36.567387  =


    2023-03-31T06:10:36.669757  / # #export SHELL=3D/bin/sh

    2023-03-31T06:10:36.670508  =


    2023-03-31T06:10:36.772310  / # export SHELL=3D/bin/sh. /lava-9828940/e=
nvironment

    2023-03-31T06:10:36.773062  =


    2023-03-31T06:10:36.874842  / # . /lava-9828940/environment/lava-982894=
0/bin/lava-test-runner /lava-9828940/1

    2023-03-31T06:10:36.876043  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64267a967cb451fa9362f81a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267a967cb451fa9362f81f
        failing since 2 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-03-31T06:15:29.464172  <8>[   10.157269] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9829076_1.4.2.3.1>

    2023-03-31T06:15:29.467561  + set +x

    2023-03-31T06:15:29.569409  =


    2023-03-31T06:15:29.670427  / # #export SHELL=3D/bin/sh

    2023-03-31T06:15:29.670618  =


    2023-03-31T06:15:29.771553  / # export SHELL=3D/bin/sh. /lava-9829076/e=
nvironment

    2023-03-31T06:15:29.771717  =


    2023-03-31T06:15:29.872658  / # . /lava-9829076/environment/lava-982907=
6/bin/lava-test-runner /lava-9829076/1

    2023-03-31T06:15:29.872914  =


    2023-03-31T06:15:29.878303  / # /lava-9829076/bin/lava-test-runner /lav=
a-9829076/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6426765794f0f39f2762f79b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6426765794f0f39f2762f=
79c
        failing since 58 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64267b48d18e05966b62f7a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267b48d18e05966b62f=
7a6
        failing since 1 day (last pass: next-20230328, first fail: next-202=
30330) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64267bd177b33f679762f7b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267bd177b33f679762f=
7ba
        failing since 1 day (last pass: next-20230328, first fail: next-202=
30330) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64267979f7586ff07362f78c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267979f7586ff07362f=
78d
        failing since 2 days (last pass: next-20230327, first fail: next-20=
230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642679555150bfd04b62f7ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642679555150bfd04b62f=
7f0
        new failure (last pass: next-20230330) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6426786c617794930e62f76c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6426786c617794930e62f=
76d
        failing since 1 day (last pass: next-20230327, first fail: next-202=
30330) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64267971b2c3d84fcc62f76c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267971b2c3d84fcc62f771
        failing since 71 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-03-31T06:10:34.191453  <8>[   14.576384] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3458594_1.5.2.4.1>
    2023-03-31T06:10:34.301042  / # #
    2023-03-31T06:10:34.402821  export SHELL=3D/bin/sh
    2023-03-31T06:10:34.403281  #
    2023-03-31T06:10:34.504612  / # export SHELL=3D/bin/sh. /lava-3458594/e=
nvironment
    2023-03-31T06:10:34.505040  =

    2023-03-31T06:10:34.505233  / # <3>[   14.850430] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-03-31T06:10:34.606428  . /lava-3458594/environment/lava-3458594/bi=
n/lava-test-runner /lava-3458594/1
    2023-03-31T06:10:34.606973  =

    2023-03-31T06:10:34.612055  / # /lava-3458594/bin/lava-test-runner /lav=
a-3458594/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/64267659e067cd3e2362f7a4

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64267659e067cd3=
e2362f7ab
        failing since 45 days (last pass: next-20230208, first fail: next-2=
0230213)
        29 lines

    2023-03-31T05:57:19.475556  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4e26200 pointer offset 4 size 512
    2023-03-31T05:57:19.506678  kern  :alert : Register r9 information: non=
-paged memory
    2023-03-31T05:57:19.507820  kern  :alert : Register r10 information: NU=
LL pointer
    2023-03-31T05:57:19.508317  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf23f000 allocated at load_module+0x690/0=
x1a80
    2023-03-31T05:57:19.509953  kern  :alert : Register r12 information: no=
n-paged memory
    2023-03-31T05:57:19.613675  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-03-31T05:57:19.614467  kern  :emerg : Process udevd (pid: 65, stac=
k limit =3D 0x677642c9)
    2023-03-31T05:57:19.614920  kern  :emerg : Stack: (0xc88fdd08 to 0xc88f=
e000)
    2023-03-31T05:57:19.615333  kern  :emerg : dd00:                   c4e2=
6200 c076f860 00000000 c03ae3a8 00000000 7d72c8ad
    2023-03-31T05:57:19.615729  kern  :emerg : dd20: 0000005d 7d72c8ad c076=
f860 bf23f220 00000000 00000000 00000000 00000001 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642680726a16f24ece62f7bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642680726a16f24ece62f=
7bc
        failing since 67 days (last pass: next-20230120, first fail: next-2=
0230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64268126ceb822c5fe62f7d2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64268126ceb822c5fe62f7d5
        failing since 49 days (last pass: next-20230209, first fail: next-2=
0230210)

    2023-03-31T06:43:41.102763  + set +x
    2023-03-31T06:43:41.104687  [   20.012901] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1191582_1.5.2.4.1>
    2023-03-31T06:43:41.217957  #
    2023-03-31T06:43:41.320180  / # #export SHELL=3D/bin/sh
    2023-03-31T06:43:41.320686  =

    2023-03-31T06:43:41.422372  / # export SHELL=3D/bin/sh. /lava-1191582/e=
nvironment
    2023-03-31T06:43:41.423037  =

    2023-03-31T06:43:41.524510  / # . /lava-1191582/environment/lava-119158=
2/bin/lava-test-runner /lava-1191582/1
    2023-03-31T06:43:41.525366  =

    2023-03-31T06:43:41.527809  / # /lava-1191582/bin/lava-test-runner /lav=
a-1191582/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6426783d892838fa7f62f77b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6426783d892838fa7f62f780
        new failure (last pass: next-20230324)

    2023-03-31T06:05:32.331666  + set +x<8>[   15.357377] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9828837_1.4.2.3.1>

    2023-03-31T06:05:32.331778  =


    2023-03-31T06:05:32.438501  / # #

    2023-03-31T06:05:32.539498  export SHELL=3D/bin/sh

    2023-03-31T06:05:32.539682  #

    2023-03-31T06:05:32.640547  / # export SHELL=3D/bin/sh. /lava-9828837/e=
nvironment

    2023-03-31T06:05:32.640763  =


    2023-03-31T06:05:32.741696  / # . /lava-9828837/environment/lava-982883=
7/bin/lava-test-runner /lava-9828837/1

    2023-03-31T06:05:32.741964  =


    2023-03-31T06:05:32.746294  / # /lava-9828837/bin/lava-test-runner /lav=
a-9828837/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64267954133019ec9e62f793

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267954133019ec9e62f798
        failing since 2 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-03-31T06:10:23.315886  + <8>[   11.440532] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9828921_1.4.2.3.1>

    2023-03-31T06:10:23.315981  set +x

    2023-03-31T06:10:23.417353  #

    2023-03-31T06:10:23.518604  / # #export SHELL=3D/bin/sh

    2023-03-31T06:10:23.518827  =


    2023-03-31T06:10:23.619732  / # export SHELL=3D/bin/sh. /lava-9828921/e=
nvironment

    2023-03-31T06:10:23.619956  =


    2023-03-31T06:10:23.720811  / # . /lava-9828921/environment/lava-982892=
1/bin/lava-test-runner /lava-9828921/1

    2023-03-31T06:10:23.721130  =


    2023-03-31T06:10:23.725479  / # /lava-9828921/bin/lava-test-runner /lav=
a-9828921/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64267a8e81421adecc62f77a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267a8e81421adecc62f77f
        failing since 2 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-03-31T06:15:35.524224  + set +x

    2023-03-31T06:15:35.530732  <8>[   10.793087] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9829138_1.4.2.3.1>

    2023-03-31T06:15:35.635323  / # #

    2023-03-31T06:15:35.736361  export SHELL=3D/bin/sh

    2023-03-31T06:15:35.736601  #

    2023-03-31T06:15:35.837620  / # export SHELL=3D/bin/sh. /lava-9829138/e=
nvironment

    2023-03-31T06:15:35.837889  =


    2023-03-31T06:15:35.938798  / # . /lava-9829138/environment/lava-982913=
8/bin/lava-test-runner /lava-9829138/1

    2023-03-31T06:15:35.939111  =


    2023-03-31T06:15:35.943314  / # /lava-9829138/bin/lava-test-runner /lav=
a-9829138/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6426783c098793c57962f7a1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6426783c098793c57962f7a6
        new failure (last pass: next-20230324)

    2023-03-31T06:05:39.099299  + set +x

    2023-03-31T06:05:39.106284  <8>[   14.573839] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9828825_1.4.2.3.1>

    2023-03-31T06:05:39.210965  / # #

    2023-03-31T06:05:39.311969  export SHELL=3D/bin/sh

    2023-03-31T06:05:39.312141  #

    2023-03-31T06:05:39.413079  / # export SHELL=3D/bin/sh. /lava-9828825/e=
nvironment

    2023-03-31T06:05:39.413316  =


    2023-03-31T06:05:39.514252  / # . /lava-9828825/environment/lava-982882=
5/bin/lava-test-runner /lava-9828825/1

    2023-03-31T06:05:39.514541  =


    2023-03-31T06:05:39.519848  / # /lava-9828825/bin/lava-test-runner /lav=
a-9828825/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642679539eecc880fc62f9a9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642679539eecc880fc62f9ae
        failing since 2 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-03-31T06:10:08.656935  + set<8>[    9.921805] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9828911_1.4.2.3.1>

    2023-03-31T06:10:08.657036   +x

    2023-03-31T06:10:08.758558  / #

    2023-03-31T06:10:08.859794  # #export SHELL=3D/bin/sh

    2023-03-31T06:10:08.859988  =


    2023-03-31T06:10:08.960906  / # export SHELL=3D/bin/sh. /lava-9828911/e=
nvironment

    2023-03-31T06:10:08.961095  =


    2023-03-31T06:10:09.062028  / # . /lava-9828911/environment/lava-982891=
1/bin/lava-test-runner /lava-9828911/1

    2023-03-31T06:10:09.062299  =


    2023-03-31T06:10:09.067411  / # /lava-9828911/bin/lava-test-runner /lav=
a-9828911/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64267a7f5dcd8cef1862f7a4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267a805dcd8cef1862f7a9
        failing since 2 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-03-31T06:15:15.196795  <8>[   10.503841] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9829125_1.4.2.3.1>

    2023-03-31T06:15:15.199697  + set +x

    2023-03-31T06:15:15.301058  /#

    2023-03-31T06:15:15.402463   # #export SHELL=3D/bin/sh

    2023-03-31T06:15:15.402649  =


    2023-03-31T06:15:15.503647  / # export SHELL=3D/bin/sh. /lava-9829125/e=
nvironment

    2023-03-31T06:15:15.503828  =


    2023-03-31T06:15:15.604831  / # . /lava-9829125/environment/lava-982912=
5/bin/lava-test-runner /lava-9829125/1

    2023-03-31T06:15:15.605153  =


    2023-03-31T06:15:15.610936  / # /lava-9829125/bin/lava-test-runner /lav=
a-9829125/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6426786698fbc2728662f979

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6426786698fbc2728662f97e
        new failure (last pass: next-20230324)

    2023-03-31T06:06:10.260655  + set +x

    2023-03-31T06:06:10.266458  <8>[   14.392548] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9828847_1.4.2.3.1>

    2023-03-31T06:06:10.375504  / # #

    2023-03-31T06:06:10.478382  export SHELL=3D/bin/sh

    2023-03-31T06:06:10.479300  #

    2023-03-31T06:06:10.581223  / # export SHELL=3D/bin/sh. /lava-9828847/e=
nvironment

    2023-03-31T06:06:10.582115  =


    2023-03-31T06:06:10.684270  / # . /lava-9828847/environment/lava-982884=
7/bin/lava-test-runner /lava-9828847/1

    2023-03-31T06:06:10.685541  =


    2023-03-31T06:06:10.690108  / # /lava-9828847/bin/lava-test-runner /lav=
a-9828847/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64267974b2c3d84fcc62f790

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267975b2c3d84fcc62f795
        failing since 2 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-03-31T06:10:36.645837  + set<8>[   10.902022] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9828925_1.4.2.3.1>

    2023-03-31T06:10:36.646395   +x

    2023-03-31T06:10:36.754254  / # #

    2023-03-31T06:10:36.856995  export SHELL=3D/bin/sh

    2023-03-31T06:10:36.857849  #

    2023-03-31T06:10:36.959834  / # export SHELL=3D/bin/sh. /lava-9828925/e=
nvironment

    2023-03-31T06:10:36.960658  =


    2023-03-31T06:10:37.062485  / # . /lava-9828925/environment/lava-982892=
5/bin/lava-test-runner /lava-9828925/1

    2023-03-31T06:10:37.063846  =


    2023-03-31T06:10:37.068192  / # /lava-9828925/bin/lava-test-runner /lav=
a-9828925/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64267aa1b7d2596ec762f79a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267aa1b7d2596ec762f79f
        failing since 2 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-03-31T06:15:46.708442  + set<8>[   11.444171] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9829085_1.4.2.3.1>

    2023-03-31T06:15:46.708912   +x

    2023-03-31T06:15:46.817164  / # #

    2023-03-31T06:15:46.920826  export SHELL=3D/bin/sh

    2023-03-31T06:15:46.921604  #

    2023-03-31T06:15:47.023413  / # export SHELL=3D/bin/sh. /lava-9829085/e=
nvironment

    2023-03-31T06:15:47.023622  =


    2023-03-31T06:15:47.124767  / # . /lava-9829085/environment/lava-982908=
5/bin/lava-test-runner /lava-9829085/1

    2023-03-31T06:15:47.126002  =


    2023-03-31T06:15:47.130956  / # /lava-9829085/bin/lava-test-runner /lav=
a-9829085/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64267b36b63b6225eb62f7ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267b36b63b6225eb62f=
7ef
        failing since 353 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64267d907a9a75085062f77f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267d907a9a75085062f=
780
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64267d6eeeaed7524b62f81f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230324071733+d30b=
c9e91241-1~exp1~20230324071900.603))
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267d6eeeaed7524b62f=
820
        failing since 28 days (last pass: next-20230224, first fail: next-2=
0230303) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/642677911707de633662f79b

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642677911707de633662f79e
        new failure (last pass: next-20230330)

    2023-03-31T06:02:31.574324  / # #
    2023-03-31T06:02:31.677104  export SHELL=3D/bin/sh
    2023-03-31T06:02:31.677928  #
    2023-03-31T06:02:31.779818  / # export SHELL=3D/bin/sh. /lava-307708/en=
vironment
    2023-03-31T06:02:31.780653  =

    2023-03-31T06:02:31.882624  / # . /lava-307708/environment/lava-307708/=
bin/lava-test-runner /lava-307708/1
    2023-03-31T06:02:31.883689  =

    2023-03-31T06:02:31.903255  / # /lava-307708/bin/lava-test-runner /lava=
-307708/1
    2023-03-31T06:02:31.919202  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-31T06:02:31.957920  + cd /l<8>[   15.520463] <LAVA_SIGNAL_START=
RUN 1_bootrr 307708_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/642=
677911707de633662f7ae
        new failure (last pass: next-20230330)

    2023-03-31T06:02:34.350234  /lava-307708/1/../bin/lava-test-case
    2023-03-31T06:02:34.350725  <8>[   18.010547] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-03-31T06:02:34.351063  /lava-307708/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64267b3dd18e05966b62f76c

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267b3dd18e05966b62f76f
        new failure (last pass: next-20230330)

    2023-03-31T06:18:14.902776  + set<8>[   14.961489] <LAVA_SIGNAL_ENDRUN =
0_dmesg 307743_1.5.2.4.1>
    2023-03-31T06:18:14.903136   +x
    2023-03-31T06:18:15.011320  / # #
    2023-03-31T06:18:15.113990  export SHELL=3D/bin/sh
    2023-03-31T06:18:15.114812  #
    2023-03-31T06:18:15.216499  / # export SHELL=3D/bin/sh. /lava-307743/en=
vironment
    2023-03-31T06:18:15.217291  =

    2023-03-31T06:18:15.319033  / # . /lava-307743/environment/lava-307743/=
bin/lava-test-runner /lava-307743/1
    2023-03-31T06:18:15.320233  =

    2023-03-31T06:18:15.335629  / # /lava-307743/bin/lava-test-runner /lava=
-307743/1 =

    ... (12 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/642=
67b3ed18e05966b62f77f
        new failure (last pass: next-20230330)

    2023-03-31T06:18:17.783834  /lava-307743/1/../bin/lava-test-case
    2023-03-31T06:18:17.784297  <8>[   17.942911] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64267f3af96d53dcf362f7a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267f3af96d53dcf362f=
7a8
        failing since 28 days (last pass: next-20230222, first fail: next-2=
0230303) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64267853d6a80945b062f7bb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267853d6a80945b062f7c0
        new failure (last pass: next-20230324)

    2023-03-31T06:05:45.604523  + <8>[   11.859128] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9828842_1.4.2.3.1>

    2023-03-31T06:05:45.604611  set +x

    2023-03-31T06:05:45.709331  / # #

    2023-03-31T06:05:45.810443  export SHELL=3D/bin/sh

    2023-03-31T06:05:45.810654  #

    2023-03-31T06:05:45.911614  / # export SHELL=3D/bin/sh. /lava-9828842/e=
nvironment

    2023-03-31T06:05:45.911787  =


    2023-03-31T06:05:46.012749  / # . /lava-9828842/environment/lava-982884=
2/bin/lava-test-runner /lava-9828842/1

    2023-03-31T06:05:46.013008  =


    2023-03-31T06:05:46.018193  / # /lava-9828842/bin/lava-test-runner /lav=
a-9828842/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64267972b2c3d84fcc62f777

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267972b2c3d84fcc62f77c
        failing since 2 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-03-31T06:10:33.687631  <8>[   10.815988] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9828919_1.4.2.3.1>

    2023-03-31T06:10:33.792327  / # #

    2023-03-31T06:10:33.893302  export SHELL=3D/bin/sh

    2023-03-31T06:10:33.893497  #

    2023-03-31T06:10:33.994385  / # export SHELL=3D/bin/sh. /lava-9828919/e=
nvironment

    2023-03-31T06:10:33.994585  =


    2023-03-31T06:10:34.095482  / # . /lava-9828919/environment/lava-982891=
9/bin/lava-test-runner /lava-9828919/1

    2023-03-31T06:10:34.095845  =


    2023-03-31T06:10:34.100172  / # /lava-9828919/bin/lava-test-runner /lav=
a-9828919/1

    2023-03-31T06:10:34.106901  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64267a9cc916b3d5bc62f7ab

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267a9cc916b3d5bc62f7b0
        failing since 2 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-03-31T06:15:41.421277  <8>[   13.789510] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9829081_1.4.2.3.1>

    2023-03-31T06:15:41.526360  / # #

    2023-03-31T06:15:41.627354  export SHELL=3D/bin/sh

    2023-03-31T06:15:41.627567  #

    2023-03-31T06:15:41.728371  / # export SHELL=3D/bin/sh. /lava-9829081/e=
nvironment

    2023-03-31T06:15:41.728607  =


    2023-03-31T06:15:41.829501  / # . /lava-9829081/environment/lava-982908=
1/bin/lava-test-runner /lava-9829081/1

    2023-03-31T06:15:41.829804  =


    2023-03-31T06:15:41.834925  / # /lava-9829081/bin/lava-test-runner /lav=
a-9829081/1

    2023-03-31T06:15:41.841254  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/642680532c425c31bc62f78e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642680532c425c31bc62f=
78f
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/642680cd45ac3eae2062f773

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642680cd45ac3eae2062f=
774
        failing since 65 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6426801c02843271a762f76c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6426801c02843271a762f=
76d
        failing since 65 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6426800d992e78f63f62f803

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6426800d992e78f63f62f=
804
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6426802302843271a762f83a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6426802302843271a762f=
83b
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/642683235eb097ca4562f773

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642683235eb097ca4562f=
774
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64267f14f96d53dcf362f76c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267f14f96d53dcf362f=
76d
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64267f562f38b0371b62f8d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267f562f38b0371b62f=
8d5
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64267e98d50a8b9aca62f791

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267e98d50a8b9aca62f=
792
        new failure (last pass: next-20230324) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64267e1a2ed59d6baa62f772

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267e1a2ed59d6baa62f=
773
        failing since 62 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/642680606a16f24ece62f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642680606a16f24ece62f=
76c
        new failure (last pass: next-20230324) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64267e9fb303e4daa262f7ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267e9fb303e4daa262f=
7ac
        new failure (last pass: next-20230324) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642676e6470fcc8eda62f76e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642676e6470fcc8eda62f=
76f
        failing since 219 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64269d20234511887c62f773

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64269d20234511887c62f=
774
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64267f6b8ead1d0d4662f7a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267f6b8ead1d0d4662f=
7a7
        failing since 8 days (last pass: next-20230322, first fail: next-20=
230323) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642680402eb4647baf62f97b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642680402eb4647baf62f=
97c
        failing since 8 days (last pass: next-20230322, first fail: next-20=
230323) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64267f821cc0ed6b8762f8ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267f821cc0ed6b8762f=
8ed
        new failure (last pass: next-20230324) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64267ff2992e78f63f62f7b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267ff2992e78f63f62f=
7b9
        new failure (last pass: next-20230324) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64267f7f1cc0ed6b8762f8e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267f7f1cc0ed6b8762f=
8e7
        new failure (last pass: next-20230324) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64267ff0992e78f63f62f7b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267ff0992e78f63f62f=
7b6
        new failure (last pass: next-20230324) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64267f806f5d30e47162f807

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267f806f5d30e47162f=
808
        new failure (last pass: next-20230324) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64268005992e78f63f62f7da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64268005992e78f63f62f=
7db
        new failure (last pass: next-20230324) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642677128b161fd22b62f778

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642677128b161fd22b62f=
779
        failing since 16 days (last pass: next-20230310, first fail: next-2=
0230315) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6426ac0ea93c88e19e62f76d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230324071733+d30b=
c9e91241-1~exp1~20230324071900.603))
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
7960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-r8a7=
7960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
6426ac0ea93c88e19e62f771
        failing since 36 days (last pass: next-20230214, first fail: next-2=
0230222)

    2023-03-31T09:46:42.368298  /lava-9829249/1/../bin/lava-test-case

    2023-03-31T09:46:42.416029  <8>[   33.088452] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>

    2023-03-31T09:46:42.416560  /lava-9829249/1/../bin/lava-test-case

    2023-03-31T09:46:42.417059  <8>[   33.104120] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dskip>

    2023-03-31T09:46:42.417510  + set +x

    2023-03-31T09:46:42.417957  <8>[   33.117392] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 9829249_1.5.2.4.5>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6426a9296c0a67300562f850

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
6426a9296c0a67300562f854
        failing since 43 days (last pass: next-20230214, first fail: next-2=
0230215)

    2023-03-31T09:34:21.373053  /lava-9828791/1/../bin/lava-test-case

    2023-03-31T09:34:21.373700  <8>[   31.905349] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>

    2023-03-31T09:34:21.374159  /lava-9828791/1/../bin/lava-test-case

    2023-03-31T09:34:21.374784  <8>[   31.920860] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dskip>

    2023-03-31T09:34:21.375205  + set +x

    2023-03-31T09:34:21.375738  <8>[   31.934443] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 9828791_1.5.2.4.5>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6426acff31d13576c162f7cb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
6426acff31d13576c162f7cf
        failing since 43 days (last pass: next-20230214, first fail: next-2=
0230215)

    2023-03-31T09:50:36.478659  /lava-9829610/1/../bin/lava-test-case

    2023-03-31T09:50:36.510677  <8>[  114.388744] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64267c99208fd5521a62f8c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267c99208fd5521a62f=
8c6
        failing since 128 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64267a2f9e6ff4bb8a62f814

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267a2f9e6ff4bb8a62f=
815
        failing since 128 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64268074613d9f119f62f771

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64268074613d9f119f62f=
772
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64267f0e5243b5832c62f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267f0e5243b5832c62f=
76c
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/642680e145ac3eae2062f778

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642680e145ac3eae2062f=
779
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64267f3ef96d53dcf362f7ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267f3ef96d53dcf362f=
7bb
        failing since 51 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64267948133019ec9e62f77b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64267948133019ec9e62f780
        failing since 65 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-03-31T06:09:44.353371  / # #
    2023-03-31T06:09:44.455264  export SHELL=3D/bin/sh
    2023-03-31T06:09:44.455625  #
    2023-03-31T06:09:44.556939  / # export SHELL=3D/bin/sh. /lava-3458603/e=
nvironment
    2023-03-31T06:09:44.557295  =

    2023-03-31T06:09:44.658602  / # . /lava-3458603/environment/lava-345860=
3/bin/lava-test-runner /lava-3458603/1
    2023-03-31T06:09:44.659219  =

    2023-03-31T06:09:44.680323  / # /lava-3458603/bin/lava-test-runner /lav=
a-3458603/1
    2023-03-31T06:09:44.810312  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-31T06:09:44.810796  + cd /lava-3458603/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64267c74566f39b2c662f7e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230331/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64267c74566f39b2c662f=
7e4
        new failure (last pass: next-20230330) =

 =20
