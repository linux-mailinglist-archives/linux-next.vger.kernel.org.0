Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C816D3C5E
	for <lists+linux-next@lfdr.de>; Mon,  3 Apr 2023 06:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbjDCESQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Apr 2023 00:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjDCESP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Apr 2023 00:18:15 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBCE1FC8
        for <linux-next@vger.kernel.org>; Sun,  2 Apr 2023 21:18:09 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id u38so18170114pfg.10
        for <linux-next@vger.kernel.org>; Sun, 02 Apr 2023 21:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680495488;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wT/RuSLTEyHR+CSbeqe6vEISdgjxvz6+dNpxMdacMEQ=;
        b=YENu4rNeYN4eIOyTQyJs2AGjBES1ta4wcWQbVU12elstN3Vkxd6fyMWShcBze7npIz
         TdUVlAK0hXbODFYuNxffrPTh4oXD1qQBTnZ435V90xPapH8BrCHPooxTmxA1XvyFphza
         HDPCLPVT4JSpgeyvNXfuvwq7E/X9AXwz1fuHnzF/OWnIojOPjYNh6/QHdgLkMSPPVCkd
         Hvez77s3oS7ug0O2ixpKLVhBK3vboReZ3pxaG836a0LN3zc/VDVIJr2ops5bmle9130w
         i4zPmI6ipdgqau3JWpHWFkqAaztRruYIDxzyDchNE+HfbcD2cNlQZJueRbrrPHqmrA4x
         Zw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680495488;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT/RuSLTEyHR+CSbeqe6vEISdgjxvz6+dNpxMdacMEQ=;
        b=dtHSrHDdmPgw2QwPHsYbiuhAv94uhS3ctmLvRn4bz9L8Mar2Txujig9F/cXm1aPT+r
         uiRdZpKAPbktV9GrTFInqMH686XNUKuFf/R38C1X20M5yMsjjZsHaL8eevktQdZyoB2f
         8ypM/2HnOmZ80Uf2Ei6DY5XPSf6zgxbT0+yh+WmpWv5RbsBgtReuN1MRCUiyxEbKkhp5
         GcGrifaZ2zVAvUXUhukT+crkEjgzP6NCR+pqQ1hyHf957qesCsut6L/85j76TVLPG4db
         l9Qzsicx1Or7RVh1dOs/UW4s2AjetbbLrsooUsw6h5HZn7Bu9H6piDW2YprBavULkdyL
         5Qfg==
X-Gm-Message-State: AAQBX9fys+RLkdfW0N2i4ZpC57h2B8cfi4PJit1flll7Zp/wkhynonAS
        L22hjh+bLKtCSKeob/s4vngdKsS6FwVYEmpkVcs=
X-Google-Smtp-Source: AKy350ZkF7RI1Cnp2oL4gHPDLcv5LigkuFLeu1GfC6qCK4kV3VYKLvgMctY3w9Xo7sr5/neLcLpHpA==
X-Received: by 2002:a62:4e8f:0:b0:625:cf6d:b260 with SMTP id c137-20020a624e8f000000b00625cf6db260mr33861666pfb.6.1680495487647;
        Sun, 02 Apr 2023 21:18:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u16-20020aa78490000000b006242f4a8945sm5708945pfn.182.2023.04.02.21.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 21:18:07 -0700 (PDT)
Message-ID: <642a537f.a70a0220.b5a53.b6af@mx.google.com>
Date:   Sun, 02 Apr 2023 21:18:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.3-rc5-173-g0a9d12dce512
Subject: next/pending-fixes baseline: 607 runs,
 50 regressions (v6.3-rc5-173-g0a9d12dce512)
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

next/pending-fixes baseline: 607 runs, 50 regressions (v6.3-rc5-173-g0a9d12=
dce512)

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

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

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

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc5-173-g0a9d12dce512/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc5-173-g0a9d12dce512
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0a9d12dce512f0d32c57641ace34902b51c74bcd =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/642a257764645be6f862f79d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a257764645be6f862f=
79e
        failing since 175 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1897b54f3efe9f62f80f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1897b54f3efe9f62f814
        failing since 5 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:06:33.484161  <8>[   10.765531] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9844637_1.4.2.3.1>

    2023-04-03T00:06:33.487907  + set +x

    2023-04-03T00:06:33.596243  / # #

    2023-04-03T00:06:33.697308  export SHELL=3D/bin/sh

    2023-04-03T00:06:33.697463  #

    2023-04-03T00:06:33.798371  / # export SHELL=3D/bin/sh. /lava-9844637/e=
nvironment

    2023-04-03T00:06:33.798519  =


    2023-04-03T00:06:33.899542  / # . /lava-9844637/environment/lava-984463=
7/bin/lava-test-runner /lava-9844637/1

    2023-04-03T00:06:33.899818  =


    2023-04-03T00:06:33.905206  / # /lava-9844637/bin/lava-test-runner /lav=
a-9844637/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1e056ed1d4370e62f858

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1e056ed1d4370e62f85d
        failing since 5 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:29:37.962106  + set +x

    2023-04-03T00:29:37.968753  <8>[   10.684570] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9844956_1.4.2.3.1>

    2023-04-03T00:29:38.072842  / # #

    2023-04-03T00:29:38.173727  export SHELL=3D/bin/sh

    2023-04-03T00:29:38.173970  #

    2023-04-03T00:29:38.274896  / # export SHELL=3D/bin/sh. /lava-9844956/e=
nvironment

    2023-04-03T00:29:38.275108  =


    2023-04-03T00:29:38.376016  / # . /lava-9844956/environment/lava-984495=
6/bin/lava-test-runner /lava-9844956/1

    2023-04-03T00:29:38.376312  =


    2023-04-03T00:29:38.382012  / # /lava-9844956/bin/lava-test-runner /lav=
a-9844956/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1898b54f3efe9f62f81a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1898b54f3efe9f62f81f
        failing since 5 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:06:32.610037  + set +x<8>[   11.657016] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9844610_1.4.2.3.1>

    2023-04-03T00:06:32.610126  =


    2023-04-03T00:06:32.714598  / # #

    2023-04-03T00:06:32.815532  export SHELL=3D/bin/sh

    2023-04-03T00:06:32.815700  #

    2023-04-03T00:06:32.916643  / # export SHELL=3D/bin/sh. /lava-9844610/e=
nvironment

    2023-04-03T00:06:32.916796  =


    2023-04-03T00:06:33.017667  / # . /lava-9844610/environment/lava-984461=
0/bin/lava-test-runner /lava-9844610/1

    2023-04-03T00:06:33.017970  =


    2023-04-03T00:06:33.022395  / # /lava-9844610/bin/lava-test-runner /lav=
a-9844610/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1e0dcc46ecfef662f7b7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1e0dcc46ecfef662f7bc
        failing since 5 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:29:43.892486  + set<8>[   11.441070] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9844964_1.4.2.3.1>

    2023-04-03T00:29:43.892588   +x

    2023-04-03T00:29:43.997407  / # #

    2023-04-03T00:29:44.098478  export SHELL=3D/bin/sh

    2023-04-03T00:29:44.098711  #

    2023-04-03T00:29:44.199616  / # export SHELL=3D/bin/sh. /lava-9844964/e=
nvironment

    2023-04-03T00:29:44.199875  =


    2023-04-03T00:29:44.300822  / # . /lava-9844964/environment/lava-984496=
4/bin/lava-test-runner /lava-9844964/1

    2023-04-03T00:29:44.301151  =


    2023-04-03T00:29:44.305956  / # /lava-9844964/bin/lava-test-runner /lav=
a-9844964/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a188eb54f3efe9f62f789

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a188eb54f3efe9f62f78e
        failing since 5 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:06:19.837410  <8>[   10.283259] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9844635_1.4.2.3.1>

    2023-04-03T00:06:19.840776  + set +x

    2023-04-03T00:06:19.942308  #

    2023-04-03T00:06:20.043561  / # #export SHELL=3D/bin/sh

    2023-04-03T00:06:20.043706  =


    2023-04-03T00:06:20.144625  / # export SHELL=3D/bin/sh. /lava-9844635/e=
nvironment

    2023-04-03T00:06:20.144792  =


    2023-04-03T00:06:20.245797  / # . /lava-9844635/environment/lava-984463=
5/bin/lava-test-runner /lava-9844635/1

    2023-04-03T00:06:20.246045  =


    2023-04-03T00:06:20.250556  / # /lava-9844635/bin/lava-test-runner /lav=
a-9844635/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1dfd6ed1d4370e62f83d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1dfd6ed1d4370e62f842
        failing since 5 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:29:43.872325  <8>[   10.720469] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9844910_1.4.2.3.1>

    2023-04-03T00:29:43.875396  + set +x

    2023-04-03T00:29:43.977396  #

    2023-04-03T00:29:43.977652  =


    2023-04-03T00:29:44.078610  / # #export SHELL=3D/bin/sh

    2023-04-03T00:29:44.078835  =


    2023-04-03T00:29:44.179719  / # export SHELL=3D/bin/sh. /lava-9844910/e=
nvironment

    2023-04-03T00:29:44.179930  =


    2023-04-03T00:29:44.280898  / # . /lava-9844910/environment/lava-984491=
0/bin/lava-test-runner /lava-9844910/1

    2023-04-03T00:29:44.281217  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/642a16a744bb31fa8062f76d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a16a744bb31fa8062f772
        failing since 81 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-04-02T23:58:14.134802  / # #

    2023-04-02T23:58:14.238140  export SHELL=3D/bin/sh

    2023-04-02T23:58:14.239344  #

    2023-04-02T23:58:14.341583  / # export SHELL=3D/bin/sh. /lava-9844573/e=
nvironment

    2023-04-02T23:58:14.342757  =


    2023-04-02T23:58:14.445015  / # . /lava-9844573/environment/lava-984457=
3/bin/lava-test-runner /lava-9844573/1

    2023-04-02T23:58:14.446666  =


    2023-04-02T23:58:14.452958  / # /lava-9844573/bin/lava-test-runner /lav=
a-9844573/1

    2023-04-02T23:58:14.532776  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-02T23:58:14.576550  + cd /lava-9844573/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1d24a41158207f62f7b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a1d24a41158207f62f=
7b1
        failing since 35 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1c83d95a9fa0bd62f7e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a1c83d95a9fa0bd62f=
7e3
        failing since 71 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1a432736308e8362f7c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a1a432736308e8362f=
7c9
        failing since 2 days (last pass: v6.3-rc4-271-g7827aece40de, first =
fail: v6.3-rc4-334-g60f00557d56b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/642a18c55c373b400c62f78b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a18c55c373b400c62f790
        failing since 75 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-03T00:07:12.654948  + set +x<8>[   21.966564] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3465664_1.5.2.4.1>
    2023-04-03T00:07:12.655521  =

    2023-04-03T00:07:12.766461  / # #
    2023-04-03T00:07:12.869413  export SHELL=3D/bin/sh
    2023-04-03T00:07:12.870306  #
    2023-04-03T00:07:12.972244  / # export SHELL=3D/bin/sh. /lava-3465664/e=
nvironment
    2023-04-03T00:07:12.973103  =

    2023-04-03T00:07:13.075333  / # . /lava-3465664/environment/lava-346566=
4/bin/lava-test-runner /lava-3465664/1
    2023-04-03T00:07:13.076689  =

    2023-04-03T00:07:13.081833  / # /lava-3465664/bin/lava-test-runner /lav=
a-3465664/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1b31e3d3885f9562f79f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1b31e3d3885f9562f7a4
        failing since 75 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-03T00:17:31.030856  <8>[   14.497705] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3465781_1.5.2.4.1>
    2023-04-03T00:17:31.137913  / # #
    2023-04-03T00:17:31.241615  export SHELL=3D/bin/sh
    2023-04-03T00:17:31.241976  #
    2023-04-03T00:17:31.343304  / # export SHELL=3D/bin/sh. /lava-3465781/e=
nvironment
    2023-04-03T00:17:31.343671  =

    2023-04-03T00:17:31.444811  / # . /lava-3465781/environment/lava-346578=
1/bin/lava-test-runner /lava-3465781/1
    2023-04-03T00:17:31.446407  =

    2023-04-03T00:17:31.451074  / # /lava-3465781/bin/lava-test-runner /lav=
a-3465781/1
    2023-04-03T00:17:31.543635  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1bd9c47ca5726762f7b5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1bd9c47ca5726762f7ba
        failing since 75 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-03T00:20:27.583096  <8>[   12.801168] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3465801_1.5.2.4.1>
    2023-04-03T00:20:27.695848  / # #
    2023-04-03T00:20:27.799015  export SHELL=3D/bin/sh
    2023-04-03T00:20:27.799900  #
    2023-04-03T00:20:27.901913  / # export SHELL=3D/bin/sh. /lava-3465801/e=
nvironment
    2023-04-03T00:20:27.902377  =

    2023-04-03T00:20:27.902635  / # <3>[   13.071426] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-04-03T00:20:28.003947  . /lava-3465801/environment/lava-3465801/bi=
n/lava-test-runner /lava-3465801/1
    2023-04-03T00:20:28.004469  =

    2023-04-03T00:20:28.009627  / # /lava-3465801/bin/lava-test-runner /lav=
a-3465801/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1c68d95a9fa0bd62f785

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1c68d95a9fa0bd62f78a
        failing since 75 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-03T00:22:41.775019  <8>[   12.852899] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3465803_1.5.2.4.1>
    2023-04-03T00:22:41.887361  / # #
    2023-04-03T00:22:41.988891  export SHELL=3D/bin/sh
    2023-04-03T00:22:41.989303  #
    2023-04-03T00:22:42.090540  / # export SHELL=3D/bin/sh. /lava-3465803/e=
nvironment
    2023-04-03T00:22:42.090948  <3>[   13.071601] Bluetooth: hci0: command =
0xfc18 tx timeout
    2023-04-03T00:22:42.091141  =

    2023-04-03T00:22:42.192204  / # . /lava-3465803/environment/lava-346580=
3/bin/lava-test-runner /lava-3465803/1
    2023-04-03T00:22:42.192792  =

    2023-04-03T00:22:42.197712  / # /lava-3465803/bin/lava-test-runner /lav=
a-3465803/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1d805fc54ff03662f776

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1d805fc54ff03662f77b
        failing since 75 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-03T00:27:25.800802  <8>[   12.775164] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3465837_1.5.2.4.1>
    2023-04-03T00:27:25.911143  / # #
    2023-04-03T00:27:26.014628  export SHELL=3D/bin/sh
    2023-04-03T00:27:26.015560  #
    2023-04-03T00:27:26.117798  / # export SHELL=3D/bin/sh. /lava-3465837/e=
nvironment
    2023-04-03T00:27:26.118676  =

    2023-04-03T00:27:26.119106  / # <3>[   13.005869] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-04-03T00:27:26.221029  . /lava-3465837/environment/lava-3465837/bi=
n/lava-test-runner /lava-3465837/1
    2023-04-03T00:27:26.222700  =

    2023-04-03T00:27:26.227559  / # /lava-3465837/bin/lava-test-runner /lav=
a-3465837/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/642a1889e8ad303c5562f78c

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/642a1889e8ad303=
c5562f793
        failing since 30 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-04-03T00:06:21.017489  kern  :alert : Register r6 information: NUL=
L pointer
    2023-04-03T00:06:21.061767  kern  :alert : Register r7 information: non=
-paged memory
    2023-04-03T00:06:21.062131  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4b47200 pointer offset 4 size 512
    2023-04-03T00:06:21.062374  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-03T00:06:21.062594  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-03T00:06:21.062781  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e2000 allocated at load_module+0x898/0=
x1b10
    2023-04-03T00:06:21.064879  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-03T00:06:21.157597  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-03T00:06:21.158018  kern  :emerg : Process udevd (pid: 71, stac=
k limit =3D 0x501577b9)
    2023-04-03T00:06:21.158248  kern  :emerg : Stack: (0xc892dcf8 to 0xc892=
e000) =

    ... (8 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/642a1889e8ad303=
c5562f794
        failing since 434 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-04-03T00:06:20.970557  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-04-03T00:06:20.971119  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-04-03T00:06:20.971330  kern  :alert : 8<--- cut here ---
    2023-04-03T00:06:20.971555  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-04-03T00:06:20.971718  kern  :alert : [00000060] *pgd=3Dc4a60831, =
*pte=3D00000000, *ppte=3D00000000
    2023-04-03T00:06:20.971883  kern  :alert : Register r0 information: non=
-paged memory
    2023-04-03T00:06:21.014336  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc892c000 allocated at kernel_clone+0x98/0x=
3a0
    2023-04-03T00:06:21.014686  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-03T00:06:21.015121  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-03T00:06:21.015268  kern  :alert : Register r4 infor<8><LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642a19ce1fceae4a4262f789

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a19ce1fceae4a4262f=
78a
        failing since 97 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1884e8ad303c5562f77e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1884e8ad303c5562f783
        failing since 5 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:06:19.613982  + set +x

    2023-04-03T00:06:19.620684  <8>[   10.156154] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9844618_1.4.2.3.1>

    2023-04-03T00:06:19.725392  / # #

    2023-04-03T00:06:19.826357  export SHELL=3D/bin/sh

    2023-04-03T00:06:19.826545  #

    2023-04-03T00:06:19.927403  / # export SHELL=3D/bin/sh. /lava-9844618/e=
nvironment

    2023-04-03T00:06:19.927610  =


    2023-04-03T00:06:20.028501  / # . /lava-9844618/environment/lava-984461=
8/bin/lava-test-runner /lava-9844618/1

    2023-04-03T00:06:20.028790  =


    2023-04-03T00:06:20.033111  / # /lava-9844618/bin/lava-test-runner /lav=
a-9844618/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1dea845b1605dc62f7c1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1dea845b1605dc62f7c6
        failing since 5 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:29:19.322475  + set +x

    2023-04-03T00:29:19.329194  <8>[   10.093352] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9844946_1.4.2.3.1>

    2023-04-03T00:29:19.434376  / # #

    2023-04-03T00:29:19.535336  export SHELL=3D/bin/sh

    2023-04-03T00:29:19.535559  #

    2023-04-03T00:29:19.636568  / # export SHELL=3D/bin/sh. /lava-9844946/e=
nvironment

    2023-04-03T00:29:19.636760  =


    2023-04-03T00:29:19.737536  / # . /lava-9844946/environment/lava-984494=
6/bin/lava-test-runner /lava-9844946/1

    2023-04-03T00:29:19.737882  =


    2023-04-03T00:29:19.742477  / # /lava-9844946/bin/lava-test-runner /lav=
a-9844946/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a188cb54f3efe9f62f77b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a188cb54f3efe9f62f780
        failing since 5 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:06:24.480905  <8>[   10.009232] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9844640_1.4.2.3.1>

    2023-04-03T00:06:24.483938  + set +x

    2023-04-03T00:06:24.589682  #

    2023-04-03T00:06:24.692710  / # #export SHELL=3D/bin/sh

    2023-04-03T00:06:24.693477  =


    2023-04-03T00:06:24.795467  / # export SHELL=3D/bin/sh. /lava-9844640/e=
nvironment

    2023-04-03T00:06:24.796254  =


    2023-04-03T00:06:24.898366  / # . /lava-9844640/environment/lava-984464=
0/bin/lava-test-runner /lava-9844640/1

    2023-04-03T00:06:24.899494  =


    2023-04-03T00:06:24.905035  / # /lava-9844640/bin/lava-test-runner /lav=
a-9844640/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1df6072258834562f98c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1df6072258834562f991
        failing since 5 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:29:28.749023  <8>[   10.535911] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9844952_1.4.2.3.1>

    2023-04-03T00:29:28.752159  + set +x

    2023-04-03T00:29:28.853915  /#

    2023-04-03T00:29:28.954948   # #export SHELL=3D/bin/sh

    2023-04-03T00:29:28.955147  =


    2023-04-03T00:29:29.056078  / # export SHELL=3D/bin/sh. /lava-9844952/e=
nvironment

    2023-04-03T00:29:29.056309  =


    2023-04-03T00:29:29.157209  / # . /lava-9844952/environment/lava-984495=
2/bin/lava-test-runner /lava-9844952/1

    2023-04-03T00:29:29.157506  =


    2023-04-03T00:29:29.163139  / # /lava-9844952/bin/lava-test-runner /lav=
a-9844952/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a18a151e705187862f7a5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a18a151e705187862f7aa
        failing since 5 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:06:36.569186  + set<8>[   11.180213] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9844615_1.4.2.3.1>

    2023-04-03T00:06:36.569311   +x

    2023-04-03T00:06:36.674635  / # #

    2023-04-03T00:06:36.777509  export SHELL=3D/bin/sh

    2023-04-03T00:06:36.778250  #

    2023-04-03T00:06:36.879997  / # export SHELL=3D/bin/sh. /lava-9844615/e=
nvironment

    2023-04-03T00:06:36.880714  =


    2023-04-03T00:06:36.982419  / # . /lava-9844615/environment/lava-984461=
5/bin/lava-test-runner /lava-9844615/1

    2023-04-03T00:06:36.983632  =


    2023-04-03T00:06:36.988228  / # /lava-9844615/bin/lava-test-runner /lav=
a-9844615/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1e022491302f5662f7a6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1e022491302f5662f7ab
        failing since 5 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:29:34.556493  + set<8>[   11.174069] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9844930_1.4.2.3.1>

    2023-04-03T00:29:34.556574   +x

    2023-04-03T00:29:34.661272  / # #

    2023-04-03T00:29:34.762390  export SHELL=3D/bin/sh

    2023-04-03T00:29:34.762608  #

    2023-04-03T00:29:34.863498  / # export SHELL=3D/bin/sh. /lava-9844930/e=
nvironment

    2023-04-03T00:29:34.863715  =


    2023-04-03T00:29:34.964603  / # . /lava-9844930/environment/lava-984493=
0/bin/lava-test-runner /lava-9844930/1

    2023-04-03T00:29:34.964926  =


    2023-04-03T00:29:34.969303  / # /lava-9844930/bin/lava-test-runner /lav=
a-9844930/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/642a192ae4bd1e2e8862f76b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a192ae4bd1e2e8862f76e
        failing since 88 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-03T00:08:40.097940  <8>[   38.323144] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1193252_1.5.2.4.1>
    2023-04-03T00:08:40.201001  / # #
    2023-04-03T00:08:41.360041  export SHELL=3D/bin/sh
    2023-04-03T00:08:41.365699  #
    2023-04-03T00:08:42.912461  / # export SHELL=3D/bin/sh. /lava-1193252/e=
nvironment
    2023-04-03T00:08:42.918130  =

    2023-04-03T00:08:45.738372  / # . /lava-1193252/environment/lava-119325=
2/bin/lava-test-runner /lava-1193252/1
    2023-04-03T00:08:45.744416  =

    2023-04-03T00:08:45.744726  / # /lava-1193252/bin/lava-test-runner /lav=
a-1193252/1
    2023-04-03T00:08:45.837877  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/642a19529266b26d1d62f7eb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a19529266b26d1d62f7ee
        failing since 88 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-03T00:09:33.832599  + set +x<8>[   67.234281] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1193253_1.5.2.4.1>
    2023-04-03T00:09:33.832931  =

    2023-04-03T00:09:33.941287  / # #
    2023-04-03T00:09:35.101865  export SHELL=3D/bin/sh
    2023-04-03T00:09:35.107555  #
    2023-04-03T00:09:35.107862  / # export SHELL=3D/bin/sh
    2023-04-03T00:09:36.655167  / # . /lava-1193253/environment
    2023-04-03T00:09:39.481985  /lava-1193253/bin/lava-test-runner /lava-11=
93253/1
    2023-04-03T00:09:39.487612  . /lava-1193253/environment
    2023-04-03T00:09:39.487735  / # /lava-1193253/bin/lava-test-runner /lav=
a-1193253/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1de8845b1605dc62f7a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a1de8845b1605dc62f=
7a6
        failing since 338 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1c04619585439862f791

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a1c04619585439862f=
792
        failing since 54 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/642a18b2b4b71fb15c62f792

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-k=
ontron-kswitch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-k=
ontron-kswitch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a18b2b4b71fb15c62f=
793
        new failure (last pass: v6.3-rc4-334-g60f00557d56b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1891b54f3efe9f62f79f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1891b54f3efe9f62f7a4
        failing since 5 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:06:30.912827  + set<8>[   11.395972] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9844639_1.4.2.3.1>

    2023-04-03T00:06:30.913285   +x

    2023-04-03T00:06:31.021577  / # #

    2023-04-03T00:06:31.124749  export SHELL=3D/bin/sh

    2023-04-03T00:06:31.125680  #

    2023-04-03T00:06:31.227302  / # export SHELL=3D/bin/sh. /lava-9844639/e=
nvironment

    2023-04-03T00:06:31.228247  =


    2023-04-03T00:06:31.330236  / # . /lava-9844639/environment/lava-984463=
9/bin/lava-test-runner /lava-9844639/1

    2023-04-03T00:06:31.331372  =


    2023-04-03T00:06:31.336286  / # /lava-9844639/bin/lava-test-runner /lav=
a-9844639/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1df7072258834562f997

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1df7072258834562f99c
        failing since 5 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-03T00:29:31.720386  + set<8>[   12.206014] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9844932_1.4.2.3.1>

    2023-04-03T00:29:31.720469   +x

    2023-04-03T00:29:31.825222  / # #

    2023-04-03T00:29:31.926253  export SHELL=3D/bin/sh

    2023-04-03T00:29:31.926467  #

    2023-04-03T00:29:32.027302  / # export SHELL=3D/bin/sh. /lava-9844932/e=
nvironment

    2023-04-03T00:29:32.027504  =


    2023-04-03T00:29:32.128412  / # . /lava-9844932/environment/lava-984493=
2/bin/lava-test-runner /lava-9844932/1

    2023-04-03T00:29:32.128719  =


    2023-04-03T00:29:32.133024  / # /lava-9844932/bin/lava-test-runner /lav=
a-9844932/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1b5707c066228862f7fe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1b5707c066228862f803
        failing since 2 days (last pass: v6.3-rc4-271-g7827aece40de, first =
fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-03T00:17:54.988255  + set +x
    2023-04-03T00:17:54.988804  <8>[   18.342895] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3465653_1.5.2.4.1>
    2023-04-03T00:17:55.097961  / # #
    2023-04-03T00:17:55.201271  export SHELL=3D/bin/sh
    2023-04-03T00:17:55.201913  #
    2023-04-03T00:17:55.202212  / # <3>[   18.484084] mmc2: tuning executio=
n failed: -5
    2023-04-03T00:17:55.202450  <3>[   18.484134] mmc2: error -5 whilst ini=
tialising SDIO card
    2023-04-03T00:17:55.303771  export SHELL=3D/bin/sh. /lava-3465653/envir=
onment
    2023-04-03T00:17:55.304583  =

    2023-04-03T00:17:55.406760  / # . /lava-3465653/environment/lava-346565=
3/bin/lava-test-runner /lava-3465653/1 =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/642a1d8a5fc54ff03662f79a

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/642=
a1d8a5fc54ff03662f7ea
        failing since 39 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-04-03T00:27:40.258177  /lava-9844830/1/../bin/lava-test-case

    2023-04-03T00:27:40.268267  <8>[   23.461091] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/642a1d8a5fc54ff03662f83c
        failing since 35 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-03T00:27:37.380398  /lava-9844830/1/../bin/lava-test-case

    2023-04-03T00:27:37.390365  <8>[   20.583668] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/642a1d8a5fc54ff03662f83d
        failing since 35 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-03T00:27:36.210027  <3>[   19.406942] Bluetooth: hci0: command =
0x0c14 tx timeout

    2023-04-03T00:27:36.219675  <3>[   19.406940] Bluetooth: hci0: Opcode 0=
x c14 failed: -110

    2023-04-03T00:27:36.350219  /lava-9844830/1/../bin/lava-test-case

    2023-04-03T00:27:36.359746  <8>[   19.552699] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/642a2027af067c6bb762f7a0

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/642=
a2027af067c6bb762f7d3
        failing since 38 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-04-03T00:38:50.688588  /lava-9845026/1/../bin/lava-test-case

    2023-04-03T00:38:50.694908  <8>[   23.307908] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/642a2027af067c6bb762f82b
        failing since 28 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13684-gf93c476d9769)

    2023-04-03T00:38:47.839077  /lava-9845026/1/../bin/lava-test-case

    2023-04-03T00:38:47.849341  <8>[   20.460437] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/642a2027af067c6bb762f82c
        failing since 28 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13684-gf93c476d9769)

    2023-04-03T00:38:46.696047  <3>[   19.310520] Bluetooth: hci0: command =
0x1002 tx timeout

    2023-04-03T00:38:46.702393  <3>[   19.310652] Bluetooth: hci0: Opcode 0=
x1002 failed: -110

    2023-04-03T00:38:46.810956  /lava-9845026/1/../bin/lava-test-case

    2023-04-03T00:38:46.820800  <8>[   19.431860] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/642a1dea0fe98c367162f795

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/642a1deb0fe98c367162f847
        failing since 35 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-03T00:28:59.807642  /lava-9844807/1/../bin/lava-test-case

    2023-04-03T00:28:59.814710  <8>[   20.954309] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/642a1deb0fe98c367162f848
        failing since 35 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-03T00:28:58.788517  /lava-9844807/1/../bin/lava-test-case

    2023-04-03T00:28:58.795240  <8>[   19.934991] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/642a1deb0fe98c367162f849
        failing since 35 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-03T00:28:57.769057  /lava-9844807/1/../bin/lava-test-case

    2023-04-03T00:28:57.776086  <8>[   18.915729] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/642a1fbcba942dbcb662f776

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/642a1fbcba942dbcb662f828
        failing since 31 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-04-03T00:36:52.080003  /lava-9845017/1/../bin/lava-test-case

    2023-04-03T00:36:52.086667  <8>[   20.998001] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/642a1fbcba942dbcb662f829
        failing since 31 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-04-03T00:36:51.060432  /lava-9845017/1/../bin/lava-test-case

    2023-04-03T00:36:51.066793  <8>[   19.978690] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/642a1fbcba942dbcb662f82a
        failing since 31 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-04-03T00:36:50.041151  /lava-9845017/1/../bin/lava-test-case

    2023-04-03T00:36:50.047662  <8>[   18.958844] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1ab1ecbe81a80f62f76e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a1ab1ecbe81a80f62f=
76f
        failing since 172 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642a187ae8ad303c5562f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a187ae8ad303c5562f=
76c
        failing since 5 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1e3dd97285adaa62f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a1e3dd97285adaa62f=
76c
        failing since 108 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1d3900a4d32db662f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642a1d3900a4d32db662f=
76c
        failing since 108 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/642a1d66f738e4032762f7ff

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-17=
3-g0a9d12dce512/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642a1d66f738e4032762f804
        new failure (last pass: v6.3-rc4-334-g60f00557d56b)

    2023-04-03T00:26:47.440074  / # #
    2023-04-03T00:26:47.542446  export SHELL=3D/bin/sh
    2023-04-03T00:26:47.543376  #
    2023-04-03T00:26:47.646455  / # export SHELL=3D/bin/sh. /lava-420202/en=
vironment
    2023-04-03T00:26:47.647077  =

    2023-04-03T00:26:47.748556  / # . /lava-420202/environment/lava-420202/=
bin/lava-test-runner /lava-420202/1
    2023-04-03T00:26:47.749675  =

    2023-04-03T00:26:47.762320  / # /lava-420202/bin/lava-test-runner /lava=
-420202/1
    2023-04-03T00:26:47.860212  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-03T00:26:47.860937  + cd /lava-420202/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20
