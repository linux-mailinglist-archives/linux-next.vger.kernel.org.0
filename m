Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B24772484E
	for <lists+linux-next@lfdr.de>; Tue,  6 Jun 2023 17:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238288AbjFFPzN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Jun 2023 11:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238661AbjFFPzC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Jun 2023 11:55:02 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE9310D1
        for <linux-next@vger.kernel.org>; Tue,  6 Jun 2023 08:54:57 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6af81142b6dso5705124a34.2
        for <linux-next@vger.kernel.org>; Tue, 06 Jun 2023 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686066897; x=1688658897;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nAawE1ludtkecHnDVDYf8Pl0ITl5vW5qpiqQ2n55nY8=;
        b=gcKJ8u7eIbd0WupHSKNHY07+0U56LjeCAAvBJ8yxn4yQxf0T9jrlf/K5kDA1PSimtA
         wMy7f+dJwDCSauVGAlaIjWzmmqwCMvSN6T4g29OHe+fvZHg/NCHhgeXnR9j7lRhuxIZY
         fjZOeD2DocUc9tv64HOrK7AK1ssYnpBjhbqu1oouEu2CN9EPqTWSYIzEGoaaF039wdba
         UUUxj4+MDX3JeckqnShI/Sa+UbADgpNyttRkWr6Ybu9z28IRkGfpC9AQ9mkj63bls6K5
         w3dVJsocStxG+2jwn/0UG8zNToFC9CQ9cMoVCjXE8xCK5N/+SyuGSVxYy+NfO+/tHLQB
         cLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686066897; x=1688658897;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAawE1ludtkecHnDVDYf8Pl0ITl5vW5qpiqQ2n55nY8=;
        b=bCfYf8yNeLxc6QGF2oD8HskVt+q41f69CLcmRgRjn6GxyBKOqWzgrcwjbeRw5rQVw0
         J4Cy//cSwuPY9cgoqSpYc/0Cvmp5tD5bCgBGSPbe/lN97KmOICMLrHyHlqi5/6OiCh2e
         YoB7YhE0UJthhPjcP+xu/cmXo5qK1QqMPSavm+E/XEs9obuB174E/V4k538KSCg37qIA
         XbWuuhx09gq3xECfxbYHw5oxPJH1+RFkHq64RRkdoBUfTrChexVdk50Mecf2y+ts5Ll1
         0Crlqw2DjpiRQ20fwyblf3/X76GUGKQPovdpCMBDdVSmXzVHgEt+9eFrFuiCY8aIvpPO
         QIMw==
X-Gm-Message-State: AC+VfDzIet3s9EvKu24CPLUkSH9H205PvBoPRoad/Ff/m7q7Iz3LSZ5D
        dzkJdRw5RzqcJk6FJ5+CGgLzANwWFCaz3SOUvdeuYw==
X-Google-Smtp-Source: ACHHUZ7brkwnCL1wZRFZ+gxvKAmSXAXpS1VzScDnOS8ddLivqQLvXfHI6VorL1of/4DCCutsk0olGA==
X-Received: by 2002:a05:6870:52d5:b0:1a2:ca8a:b299 with SMTP id p21-20020a05687052d500b001a2ca8ab299mr2120342oak.47.1686066895254;
        Tue, 06 Jun 2023 08:54:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 128-20020a630786000000b0053ba104c113sm7660666pgh.72.2023.06.06.08.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 08:54:54 -0700 (PDT)
Message-ID: <647f56ce.630a0220.d3e62.ecc0@mx.google.com>
Date:   Tue, 06 Jun 2023 08:54:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.4-rc5-142-g7f2b5d41063a
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 612 runs,
 58 regressions (v6.4-rc5-142-g7f2b5d41063a)
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

next/pending-fixes baseline: 612 runs, 58 regressions (v6.4-rc5-142-g7f2b5d=
41063a)

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

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

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
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+ima                | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+debug              | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc5-142-g7f2b5d41063a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc5-142-g7f2b5d41063a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7f2b5d41063a3d69ed516755c5c56cd9204cfe8d =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647d294b105e662598f5de77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d294b105e662598f5d=
e78
        failing since 238 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647d266941c1ce9d95f5de7d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d266941c1ce9d95f5de86
        failing since 68 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:03:47.864906  <8>[   11.968779] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584511_1.4.2.3.1>

    2023-06-05T00:03:47.868831  + set +x

    2023-06-05T00:03:47.976191  / # #

    2023-06-05T00:03:48.078571  export SHELL=3D/bin/sh

    2023-06-05T00:03:48.079352  #

    2023-06-05T00:03:48.180795  / # export SHELL=3D/bin/sh. /lava-10584511/=
environment

    2023-06-05T00:03:48.181609  =


    2023-06-05T00:03:48.283088  / # . /lava-10584511/environment/lava-10584=
511/bin/lava-test-runner /lava-10584511/1

    2023-06-05T00:03:48.284344  =


    2023-06-05T00:03:48.289879  / # /lava-10584511/bin/lava-test-runner /la=
va-10584511/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647d279eab057ec7b4f5de71

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d279eab057ec7b4f5de7a
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-05T00:08:37.794966  <8>[   12.662058] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584575_1.4.2.3.1>

    2023-06-05T00:08:37.798842  + set +x

    2023-06-05T00:08:37.903917  #

    2023-06-05T00:08:38.006661  / # #export SHELL=3D/bin/sh

    2023-06-05T00:08:38.007503  =


    2023-06-05T00:08:38.109180  / # export SHELL=3D/bin/sh. /lava-10584575/=
environment

    2023-06-05T00:08:38.110092  =


    2023-06-05T00:08:38.211791  / # . /lava-10584575/environment/lava-10584=
575/bin/lava-test-runner /lava-10584575/1

    2023-06-05T00:08:38.213110  =


    2023-06-05T00:08:38.219208  / # /lava-10584575/bin/lava-test-runner /la=
va-10584575/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647d29b38f5c27ffbff5de25

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d29b38f5c27ffbff5de2e
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:17:45.550145  <8>[   10.773427] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584733_1.4.2.3.1>

    2023-06-05T00:17:45.553516  + set +x

    2023-06-05T00:17:45.658158  / # #

    2023-06-05T00:17:45.758842  export SHELL=3D/bin/sh

    2023-06-05T00:17:45.759055  #

    2023-06-05T00:17:45.859602  / # export SHELL=3D/bin/sh. /lava-10584733/=
environment

    2023-06-05T00:17:45.859812  =


    2023-06-05T00:17:45.960345  / # . /lava-10584733/environment/lava-10584=
733/bin/lava-test-runner /lava-10584733/1

    2023-06-05T00:17:45.960741  =


    2023-06-05T00:17:45.966851  / # /lava-10584733/bin/lava-test-runner /la=
va-10584733/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647d266ef019b865a6f5de70

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d266ef019b865a6f5de79
        failing since 68 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:03:40.768750  + set<8>[   11.543629] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10584495_1.4.2.3.1>

    2023-06-05T00:03:40.768953   +x

    2023-06-05T00:03:40.872889  / # #

    2023-06-05T00:03:40.975265  export SHELL=3D/bin/sh

    2023-06-05T00:03:40.976053  #

    2023-06-05T00:03:41.077493  / # export SHELL=3D/bin/sh. /lava-10584495/=
environment

    2023-06-05T00:03:41.078017  =


    2023-06-05T00:03:41.179153  / # . /lava-10584495/environment/lava-10584=
495/bin/lava-test-runner /lava-10584495/1

    2023-06-05T00:03:41.180395  =


    2023-06-05T00:03:41.185274  / # /lava-10584495/bin/lava-test-runner /la=
va-10584495/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/647d2747d0a9b5dad3f5de29

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/647d2747d0a9b5d=
ad3f5de2c
        failing since 25 days (last pass: v6.4-rc1-141-gb95366eba58e, first=
 fail: v6.4-rc1-166-g16fe96af4971)
        3 lines

    2023-06-05T00:07:23.195145  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-05T00:07:23.201317  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-05T00:07:23.208075  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-05T00:07:23.215038  <8>[   15.453722] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2747d0a9b5dad3f5de32
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-05T00:07:23.218671  + set +x

    2023-06-05T00:07:23.225237  <8>[   15.470617] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584559_1.4.2.3.1>

    2023-06-05T00:07:23.332540  / # #

    2023-06-05T00:07:23.434607  export SHELL=3D/bin/sh

    2023-06-05T00:07:23.435369  #

    2023-06-05T00:07:23.536730  / # export SHELL=3D/bin/sh. /lava-10584559/=
environment

    2023-06-05T00:07:23.537438  =


    2023-06-05T00:07:23.638837  / # . /lava-10584559/environment/lava-10584=
559/bin/lava-test-runner /lava-10584559/1

    2023-06-05T00:07:23.639965  =


    2023-06-05T00:07:23.644706  / # /lava-10584559/bin/lava-test-runner /la=
va-10584559/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647d29b2c81e4a5253f5de27

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d29b2c81e4a5253f5de30
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:17:44.592000  + set<8>[   11.686640] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10584708_1.4.2.3.1>

    2023-06-05T00:17:44.592600   +x

    2023-06-05T00:17:44.701101  / # #

    2023-06-05T00:17:44.803614  export SHELL=3D/bin/sh

    2023-06-05T00:17:44.804424  #

    2023-06-05T00:17:44.906081  / # export SHELL=3D/bin/sh. /lava-10584708/=
environment

    2023-06-05T00:17:44.906895  =


    2023-06-05T00:17:45.008449  / # . /lava-10584708/environment/lava-10584=
708/bin/lava-test-runner /lava-10584708/1

    2023-06-05T00:17:45.009751  =


    2023-06-05T00:17:45.014836  / # /lava-10584708/bin/lava-test-runner /la=
va-10584708/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647d266c39d4473a8df5de3f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d266c39d4473a8df5de48
        failing since 68 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:03:39.477545  <8>[   10.775221] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584481_1.4.2.3.1>

    2023-06-05T00:03:39.477912  + set +x

    2023-06-05T00:03:39.586809  / # #

    2023-06-05T00:03:39.688905  export SHELL=3D/bin/sh

    2023-06-05T00:03:39.689534  #

    2023-06-05T00:03:39.790823  / # export SHELL=3D/bin/sh. /lava-10584481/=
environment

    2023-06-05T00:03:39.791583  =


    2023-06-05T00:03:39.893203  / # . /lava-10584481/environment/lava-10584=
481/bin/lava-test-runner /lava-10584481/1

    2023-06-05T00:03:39.894226  =


    2023-06-05T00:03:39.900201  / # /lava-10584481/bin/lava-test-runner /la=
va-10584481/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2745840dfb489af5de7a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2745840dfb489af5de83
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-05T00:07:28.351545  <8>[   13.355577] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584583_1.4.2.3.1>

    2023-06-05T00:07:28.354471  + set +x

    2023-06-05T00:07:28.456729  =


    2023-06-05T00:07:28.558348  / # #export SHELL=3D/bin/sh

    2023-06-05T00:07:28.559148  =


    2023-06-05T00:07:28.660649  / # export SHELL=3D/bin/sh. /lava-10584583/=
environment

    2023-06-05T00:07:28.661297  =


    2023-06-05T00:07:28.762754  / # . /lava-10584583/environment/lava-10584=
583/bin/lava-test-runner /lava-10584583/1

    2023-06-05T00:07:28.763783  =


    2023-06-05T00:07:28.768508  / # /lava-10584583/bin/lava-test-runner /la=
va-10584583/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647d29b25bd5de512cf5de55

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d29b25bd5de512cf5de5e
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:17:42.161142  <8>[    7.779944] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584706_1.4.2.3.1>

    2023-06-05T00:17:42.164564  + set +x

    2023-06-05T00:17:42.270042  #

    2023-06-05T00:17:42.271338  =


    2023-06-05T00:17:42.373135  / # #export SHELL=3D/bin/sh

    2023-06-05T00:17:42.373879  =


    2023-06-05T00:17:42.475292  / # export SHELL=3D/bin/sh. /lava-10584706/=
environment

    2023-06-05T00:17:42.476080  =


    2023-06-05T00:17:42.577576  / # . /lava-10584706/environment/lava-10584=
706/bin/lava-test-runner /lava-10584706/1

    2023-06-05T00:17:42.578803  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2501b190b9ac50f5de3d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2501b190b9ac50f5de46
        failing since 144 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-04T23:57:32.755129  / # #

    2023-06-04T23:57:32.857264  export SHELL=3D/bin/sh

    2023-06-04T23:57:32.858010  #

    2023-06-04T23:57:32.959399  / # export SHELL=3D/bin/sh. /lava-10584418/=
environment

    2023-06-04T23:57:32.960115  =


    2023-06-04T23:57:33.061583  / # . /lava-10584418/environment/lava-10584=
418/bin/lava-test-runner /lava-10584418/1

    2023-06-04T23:57:33.062673  =


    2023-06-04T23:57:33.079389  / # /lava-10584418/bin/lava-test-runner /la=
va-10584418/1

    2023-06-04T23:57:33.189307  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-04T23:57:33.189878  + cd /lava-10584418/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647d291368e606eb14f5e06b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d291368e606eb14f5e=
06c
        failing since 98 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647d29f2cd7ae6be9df5de7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d29f2cd7ae6be9df5d=
e80
        failing since 134 days (last pass: v6.2-rc4-412-g665ddd640630, firs=
t fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2787b4fe4b4a0bf5de32

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2787b4fe4b4a0bf5de3b
        failing since 138 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-05T00:08:05.521111  <8>[   14.045411] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3640792_1.5.2.4.1>
    2023-06-05T00:08:05.633647  / # #
    2023-06-05T00:08:05.737707  export SHELL=3D/bin/sh
    2023-06-05T00:08:05.738897  #
    2023-06-05T00:08:05.841470  / # export SHELL=3D/bin/sh. /lava-3640792/e=
nvironment
    2023-06-05T00:08:05.842762  =

    2023-06-05T00:08:05.945549  / # . /lava-3640792/environment/lava-364079=
2/bin/lava-test-runner /lava-3640792/1
    2023-06-05T00:08:05.947416  =

    2023-06-05T00:08:05.952445  / # /lava-3640792/bin/lava-test-runner /lav=
a-3640792/1
    2023-06-05T00:08:06.047586  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647d29668865966c39f5dea7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d29668865966c39f5deb0
        failing since 138 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-05T00:16:14.219794  <8>[   14.440226] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3640874_1.5.2.4.1>
    2023-06-05T00:16:14.331384  / # #
    2023-06-05T00:16:14.434434  export SHELL=3D/bin/sh
    2023-06-05T00:16:14.435591  #
    2023-06-05T00:16:14.537529  / # export SHELL=3D/bin/sh. /lava-3640874/e=
nvironment
    2023-06-05T00:16:14.538396  =

    2023-06-05T00:16:14.538928  / # <3>[   14.684101] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-06-05T00:16:14.641084  . /lava-3640874/environment/lava-3640874/bi=
n/lava-test-runner /lava-3640874/1
    2023-06-05T00:16:14.642513  =

    2023-06-05T00:16:14.646912  / # /lava-3640874/bin/lava-test-runner /lav=
a-3640874/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647d29f4e1edc91f11f5de3c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d29f4e1edc91f11f5de45
        failing since 138 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-05T00:18:37.266920  <8>[   16.826204] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3640887_1.5.2.4.1>
    2023-06-05T00:18:37.375356  / # #
    2023-06-05T00:18:37.479000  export SHELL=3D/bin/sh
    2023-06-05T00:18:37.480071  #
    2023-06-05T00:18:37.582738  / # export SHELL=3D/bin/sh. /lava-3640887/e=
nvironment
    2023-06-05T00:18:37.583793  =

    2023-06-05T00:18:37.686384  / # . /lava-3640887/environment/lava-364088=
7/bin/lava-test-runner /lava-3640887/1
    2023-06-05T00:18:37.688078  =

    2023-06-05T00:18:37.693054  / # /lava-3640887/bin/lava-test-runner /lav=
a-3640887/1
    2023-06-05T00:18:37.772983  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2a92cd184f747cf5de25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2a93cd184f747cf5de2e
        failing since 138 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-05T00:21:12.614226  <8>[   14.670623] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3640907_1.5.2.4.1>
    2023-06-05T00:21:12.724568  / # #
    2023-06-05T00:21:12.828070  export SHELL=3D/bin/sh
    2023-06-05T00:21:12.828546  #
    2023-06-05T00:21:12.930282  / # export SHELL=3D/bin/sh. /lava-3640907/e=
nvironment
    2023-06-05T00:21:12.931455  =

    2023-06-05T00:21:13.033990  / # . /lava-3640907/environment/lava-364090=
7/bin/lava-test-runner /lava-3640907/1
    2023-06-05T00:21:13.035787  =

    2023-06-05T00:21:13.036257  / # <3>[   15.010318] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-06-05T00:21:13.040960  /lava-3640907/bin/lava-test-runner /lava-36=
40907/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2bd47655d9407af5de25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2bd47655d9407af5de2e
        failing since 138 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-05T00:26:35.920113  <8>[   20.572165] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3640955_1.5.2.4.1>
    2023-06-05T00:26:36.031286  / # #
    2023-06-05T00:26:36.135499  export SHELL=3D/bin/sh
    2023-06-05T00:26:36.136629  #
    2023-06-05T00:26:36.239133  / # export SHELL=3D/bin/sh. /lava-3640955/e=
nvironment
    2023-06-05T00:26:36.240254  =

    2023-06-05T00:26:36.342630  / # . /lava-3640955/environment/lava-364095=
5/bin/lava-test-runner /lava-3640955/1
    2023-06-05T00:26:36.343257  =

    2023-06-05T00:26:36.347585  / # /lava-3640955/bin/lava-test-runner /lav=
a-3640955/1
    2023-06-05T00:26:36.434129  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2dfc62694b58e4f5de25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d2dfc62694b58e4f5d=
e26
        failing since 160 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2656dc818c8515f5de30

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2656dc818c8515f5de39
        failing since 68 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:03:28.273224  + set +x

    2023-06-05T00:03:28.279334  <8>[   10.673369] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584491_1.4.2.3.1>

    2023-06-05T00:03:28.384315  / # #

    2023-06-05T00:03:28.484950  export SHELL=3D/bin/sh

    2023-06-05T00:03:28.485139  #

    2023-06-05T00:03:28.585629  / # export SHELL=3D/bin/sh. /lava-10584491/=
environment

    2023-06-05T00:03:28.585843  =


    2023-06-05T00:03:28.686423  / # . /lava-10584491/environment/lava-10584=
491/bin/lava-test-runner /lava-10584491/1

    2023-06-05T00:03:28.686721  =


    2023-06-05T00:03:28.691140  / # /lava-10584491/bin/lava-test-runner /la=
va-10584491/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647d27340e5cdb5507f5de82

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d27340e5cdb5507f5de8b
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-05T00:07:04.862647  + set +x

    2023-06-05T00:07:04.869449  <8>[   17.618900] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584548_1.4.2.3.1>

    2023-06-05T00:07:04.980917  / # #

    2023-06-05T00:07:05.082606  export SHELL=3D/bin/sh

    2023-06-05T00:07:05.083178  #

    2023-06-05T00:07:05.184270  / # export SHELL=3D/bin/sh. /lava-10584548/=
environment

    2023-06-05T00:07:05.184774  =


    2023-06-05T00:07:05.285946  / # . /lava-10584548/environment/lava-10584=
548/bin/lava-test-runner /lava-10584548/1

    2023-06-05T00:07:05.286716  =


    2023-06-05T00:07:05.291614  / # /lava-10584548/bin/lava-test-runner /la=
va-10584548/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647d29b336d4acde08f5de28

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d29b336d4acde08f5de31
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:17:31.569282  + <8>[   10.377420] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10584743_1.4.2.3.1>

    2023-06-05T00:17:31.569372  set +x

    2023-06-05T00:17:31.670521  #

    2023-06-05T00:17:31.771343  / # #export SHELL=3D/bin/sh

    2023-06-05T00:17:31.771534  =


    2023-06-05T00:17:31.872000  / # export SHELL=3D/bin/sh. /lava-10584743/=
environment

    2023-06-05T00:17:31.872184  =


    2023-06-05T00:17:31.972735  / # . /lava-10584743/environment/lava-10584=
743/bin/lava-test-runner /lava-10584743/1

    2023-06-05T00:17:31.972999  =


    2023-06-05T00:17:31.977464  / # /lava-10584743/bin/lava-test-runner /la=
va-10584743/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647d265a56f7fa496bf5de3f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d265a56f7fa496bf5de48
        failing since 68 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:03:19.571706  + set +x

    2023-06-05T00:03:19.578300  <8>[   10.213848] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584501_1.4.2.3.1>

    2023-06-05T00:03:19.679925  #

    2023-06-05T00:03:19.680158  =


    2023-06-05T00:03:19.780690  / # #export SHELL=3D/bin/sh

    2023-06-05T00:03:19.780862  =


    2023-06-05T00:03:19.881386  / # export SHELL=3D/bin/sh. /lava-10584501/=
environment

    2023-06-05T00:03:19.881623  =


    2023-06-05T00:03:19.982199  / # . /lava-10584501/environment/lava-10584=
501/bin/lava-test-runner /lava-10584501/1

    2023-06-05T00:03:19.982475  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2736840dfb489af5de35

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2736840dfb489af5de3e
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-05T00:06:59.499479  + <8>[   14.434741] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10584568_1.4.2.3.1>

    2023-06-05T00:06:59.499878  set +x

    2023-06-05T00:06:59.607141  / # #

    2023-06-05T00:06:59.709470  export SHELL=3D/bin/sh

    2023-06-05T00:06:59.710255  #

    2023-06-05T00:06:59.811746  / # export SHELL=3D/bin/sh. /lava-10584568/=
environment

    2023-06-05T00:06:59.812453  =


    2023-06-05T00:06:59.913877  / # . /lava-10584568/environment/lava-10584=
568/bin/lava-test-runner /lava-10584568/1

    2023-06-05T00:06:59.914962  =


    2023-06-05T00:06:59.920818  / # /lava-10584568/bin/lava-test-runner /la=
va-10584568/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647d29a05bd5de512cf5de43

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d29a05bd5de512cf5de4c
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:17:32.109637  + set +x

    2023-06-05T00:17:32.116120  <8>[   10.479515] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584717_1.4.2.3.1>

    2023-06-05T00:17:32.223352  / # #

    2023-06-05T00:17:32.325477  export SHELL=3D/bin/sh

    2023-06-05T00:17:32.326211  #

    2023-06-05T00:17:32.427549  / # export SHELL=3D/bin/sh. /lava-10584717/=
environment

    2023-06-05T00:17:32.428337  =


    2023-06-05T00:17:32.529805  / # . /lava-10584717/environment/lava-10584=
717/bin/lava-test-runner /lava-10584717/1

    2023-06-05T00:17:32.530896  =


    2023-06-05T00:17:32.536074  / # /lava-10584717/bin/lava-test-runner /la=
va-10584717/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2669f019b865a6f5de5e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2669f019b865a6f5de67
        failing since 68 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:03:41.515583  + set<8>[   11.437794] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10584500_1.4.2.3.1>

    2023-06-05T00:03:41.516064   +x

    2023-06-05T00:03:41.623564  / # #

    2023-06-05T00:03:41.725717  export SHELL=3D/bin/sh

    2023-06-05T00:03:41.726435  #

    2023-06-05T00:03:41.827944  / # export SHELL=3D/bin/sh. /lava-10584500/=
environment

    2023-06-05T00:03:41.828652  =


    2023-06-05T00:03:41.930035  / # . /lava-10584500/environment/lava-10584=
500/bin/lava-test-runner /lava-10584500/1

    2023-06-05T00:03:41.931066  =


    2023-06-05T00:03:41.935593  / # /lava-10584500/bin/lava-test-runner /la=
va-10584500/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2759e5982c2214f5de55

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2759e5982c2214f5de5e
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-05T00:07:30.289275  + set +x

    2023-06-05T00:07:30.296085  <8>[   13.900400] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584587_1.4.2.3.1>

    2023-06-05T00:07:30.403799  / # #

    2023-06-05T00:07:30.506173  export SHELL=3D/bin/sh

    2023-06-05T00:07:30.506954  #

    2023-06-05T00:07:30.608696  / # export SHELL=3D/bin/sh. /lava-10584587/=
environment

    2023-06-05T00:07:30.609537  =


    2023-06-05T00:07:30.711280  / # . /lava-10584587/environment/lava-10584=
587/bin/lava-test-runner /lava-10584587/1

    2023-06-05T00:07:30.712457  =


    2023-06-05T00:07:30.717309  / # /lava-10584587/bin/lava-test-runner /la=
va-10584587/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647d29b436d4acde08f5de34

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d29b436d4acde08f5de3d
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:17:42.520525  + set<8>[   11.150643] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10584720_1.4.2.3.1>

    2023-06-05T00:17:42.521105   +x

    2023-06-05T00:17:42.629482  / # #

    2023-06-05T00:17:42.732061  export SHELL=3D/bin/sh

    2023-06-05T00:17:42.732880  #

    2023-06-05T00:17:42.834404  / # export SHELL=3D/bin/sh. /lava-10584720/=
environment

    2023-06-05T00:17:42.835241  =


    2023-06-05T00:17:42.936939  / # . /lava-10584720/environment/lava-10584=
720/bin/lava-test-runner /lava-10584720/1

    2023-06-05T00:17:42.938224  =


    2023-06-05T00:17:42.943147  / # /lava-10584720/bin/lava-test-runner /la=
va-10584720/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647d27261408243d86f5de4a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d27261408243d86f5de53
        failing since 125 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-05T00:06:47.657224  + set +x
    2023-06-05T00:06:47.657402  [   13.100814] <LAVA_SIGNAL_ENDRUN 0_dmesg =
967167_1.5.2.3.1>
    2023-06-05T00:06:47.764626  / # #
    2023-06-05T00:06:47.866221  export SHELL=3D/bin/sh
    2023-06-05T00:06:47.866717  #
    2023-06-05T00:06:47.968004  / # export SHELL=3D/bin/sh. /lava-967167/en=
vironment
    2023-06-05T00:06:47.968434  =

    2023-06-05T00:06:48.069716  / # . /lava-967167/environment/lava-967167/=
bin/lava-test-runner /lava-967167/1
    2023-06-05T00:06:48.070321  =

    2023-06-05T00:06:48.073682  / # /lava-967167/bin/lava-test-runner /lava=
-967167/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647d28de0c661fec6df5de8b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d28de0c661fec6df5de94
        failing since 125 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-05T00:13:57.109642  + set +x
    2023-06-05T00:13:57.109862  [   12.830092] <LAVA_SIGNAL_ENDRUN 0_dmesg =
967179_1.5.2.3.1>
    2023-06-05T00:13:57.217442  / # #
    2023-06-05T00:13:57.319549  export SHELL=3D/bin/sh
    2023-06-05T00:13:57.320019  #
    2023-06-05T00:13:57.421507  / # export SHELL=3D/bin/sh. /lava-967179/en=
vironment
    2023-06-05T00:13:57.421964  =

    2023-06-05T00:13:57.523336  / # . /lava-967179/environment/lava-967179/=
bin/lava-test-runner /lava-967179/1
    2023-06-05T00:13:57.523934  =

    2023-06-05T00:13:57.527399  / # /lava-967179/bin/lava-test-runner /lava=
-967179/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/647d292ed1a36fdf63f5de8a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d292ed1a36fdf63f5de93
        failing since 126 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-05T00:15:17.477236  + set +x
    2023-06-05T00:15:17.477389  [   12.106674] <LAVA_SIGNAL_ENDRUN 0_dmesg =
967187_1.5.2.3.1>
    2023-06-05T00:15:17.584497  / # #
    2023-06-05T00:15:17.686313  export SHELL=3D/bin/sh
    2023-06-05T00:15:17.686824  #
    2023-06-05T00:15:17.788404  / # export SHELL=3D/bin/sh. /lava-967187/en=
vironment
    2023-06-05T00:15:17.788852  =

    2023-06-05T00:15:17.890096  / # . /lava-967187/environment/lava-967187/=
bin/lava-test-runner /lava-967187/1
    2023-06-05T00:15:17.890721  =

    2023-06-05T00:15:17.894089  / # /lava-967187/bin/lava-test-runner /lava=
-967187/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/647d297e057b2e3bdcf5de25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d297e057b2e3bdcf5de2e
        failing since 126 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-05T00:16:38.632563  + set +x
    2023-06-05T00:16:38.632730  [   13.092127] <LAVA_SIGNAL_ENDRUN 0_dmesg =
967191_1.5.2.3.1>
    2023-06-05T00:16:38.740112  / # #
    2023-06-05T00:16:38.841580  export SHELL=3D/bin/sh
    2023-06-05T00:16:38.842027  #
    2023-06-05T00:16:38.943239  / # export SHELL=3D/bin/sh. /lava-967191/en=
vironment
    2023-06-05T00:16:38.943710  =

    2023-06-05T00:16:39.045003  / # . /lava-967191/environment/lava-967191/=
bin/lava-test-runner /lava-967191/1
    2023-06-05T00:16:39.045580  =

    2023-06-05T00:16:39.049211  / # /lava-967191/bin/lava-test-runner /lava=
-967191/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2b72fb5685509df5de25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2b72fb5685509df5de2e
        failing since 125 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-05T00:25:02.285111  + set +x
    2023-06-05T00:25:02.285471  [   14.416580] <LAVA_SIGNAL_ENDRUN 0_dmesg =
967209_1.5.2.3.1>
    2023-06-05T00:25:02.393021  / # #
    2023-06-05T00:25:02.494944  export SHELL=3D/bin/sh
    2023-06-05T00:25:02.495495  #
    2023-06-05T00:25:02.596887  / # export SHELL=3D/bin/sh. /lava-967209/en=
vironment
    2023-06-05T00:25:02.597461  =

    2023-06-05T00:25:02.698964  / # . /lava-967209/environment/lava-967209/=
bin/lava-test-runner /lava-967209/1
    2023-06-05T00:25:02.699646  =

    2023-06-05T00:25:02.702853  / # /lava-967209/bin/lava-test-runner /lava=
-967209/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/647d28c9cf5b726a67f5deaf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+ima/gcc-10/lab-pengutronix/baseline-imx8mm-=
innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+ima/gcc-10/lab-pengutronix/baseline-imx8mm-=
innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d28c9cf5b726a67f5d=
eb0
        new failure (last pass: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2b71bc2201ee19f5decf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d2b71bc2201ee19f5d=
ed0
        new failure (last pass: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2d1b673abb8f87f5de55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d2d1b673abb8f87f5d=
e56
        failing since 117 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/647d28a9bbd8bdc2c4f5de32

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d28a9bbd8bdc2c4f5de39
        failing since 2 days (last pass: v6.4-rc4-279-g33e2f287e32d, first =
fail: v6.4-rc4-407-g4cdb5de9397d)

    2023-06-05T00:13:04.363650  / # #
    2023-06-05T00:13:04.466353  export SHELL=3D/bin/sh
    2023-06-05T00:13:04.466688  #
    2023-06-05T00:13:04.568038  / # export SHELL=3D/bin/sh. /lava-350086/en=
vironment
    2023-06-05T00:13:04.568887  =

    2023-06-05T00:13:04.670789  / # . /lava-350086/environment/lava-350086/=
bin/lava-test-runner /lava-350086/1
    2023-06-05T00:13:04.672115  =

    2023-06-05T00:13:04.689658  / # /lava-350086/bin/lava-test-runner /lava=
-350086/1
    2023-06-05T00:13:04.744289  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-05T00:13:04.744716  + cd /l<8>[   15.460788] <LAVA_SIGNAL_START=
RUN 1_bootrr 350086_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/647=
d28a9bbd8bdc2c4f5de49
        failing since 2 days (last pass: v6.4-rc4-279-g33e2f287e32d, first =
fail: v6.4-rc4-407-g4cdb5de9397d)

    2023-06-05T00:13:07.133290  /lava-350086/1/../bin/lava-test-case
    2023-06-05T00:13:07.133772  <8>[   17.945928] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-06-05T00:13:07.134102  /lava-350086/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2657f019b865a6f5de26

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2657f019b865a6f5de2f
        failing since 68 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:03:21.812299  <8>[   11.489979] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584460_1.4.2.3.1>

    2023-06-05T00:03:21.920180  / # #

    2023-06-05T00:03:22.022351  export SHELL=3D/bin/sh

    2023-06-05T00:03:22.023037  #

    2023-06-05T00:03:22.124528  / # export SHELL=3D/bin/sh. /lava-10584460/=
environment

    2023-06-05T00:03:22.125206  =


    2023-06-05T00:03:22.227004  / # . /lava-10584460/environment/lava-10584=
460/bin/lava-test-runner /lava-10584460/1

    2023-06-05T00:03:22.228071  =


    2023-06-05T00:03:22.232763  / # /lava-10584460/bin/lava-test-runner /la=
va-10584460/1

    2023-06-05T00:03:22.239668  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2731180a26f45df5de91

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d2731180a26f45df5de9a
        failing since 65 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-05T00:06:55.952085  + <8>[   14.289695] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10584580_1.4.2.3.1>

    2023-06-05T00:06:55.952168  set +x

    2023-06-05T00:06:56.057043  / # #

    2023-06-05T00:06:56.157682  export SHELL=3D/bin/sh

    2023-06-05T00:06:56.157872  #

    2023-06-05T00:06:56.258392  / # export SHELL=3D/bin/sh. /lava-10584580/=
environment

    2023-06-05T00:06:56.258606  =


    2023-06-05T00:06:56.359161  / # . /lava-10584580/environment/lava-10584=
580/bin/lava-test-runner /lava-10584580/1

    2023-06-05T00:06:56.359489  =


    2023-06-05T00:06:56.364086  / # /lava-10584580/bin/lava-test-runner /la=
va-10584580/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/647d299ddf35953bcbf5de2e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d299ddf35953bcbf5de37
        failing since 68 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-05T00:17:25.383416  <8>[   11.506809] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10584729_1.4.2.3.1>

    2023-06-05T00:17:25.487779  / # #

    2023-06-05T00:17:25.588389  export SHELL=3D/bin/sh

    2023-06-05T00:17:25.588581  #

    2023-06-05T00:17:25.689073  / # export SHELL=3D/bin/sh. /lava-10584729/=
environment

    2023-06-05T00:17:25.689284  =


    2023-06-05T00:17:25.789809  / # . /lava-10584729/environment/lava-10584=
729/bin/lava-test-runner /lava-10584729/1

    2023-06-05T00:17:25.790078  =


    2023-06-05T00:17:25.794801  / # /lava-10584729/bin/lava-test-runner /la=
va-10584729/1

    2023-06-05T00:17:25.801732  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/647d27ecdc89e8320af5de94

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d27ecdc89e8320af5d=
e95
        failing since 25 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2902c5b7d7e320f5de29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a=
-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a=
-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d2902c5b7d7e320f5d=
e2a
        new failure (last pass: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2d36fae11604f5f5de96

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d2d36fae11604f5f5d=
e97
        failing since 39 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2d24fae11604f5f5de2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d2d24fae11604f5f5d=
e2f
        failing since 39 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2c3fa11cb461f8f5de32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d2c3fa11cb461f8f5d=
e33
        failing since 2 days (last pass: v6.4-rc4-279-g33e2f287e32d, first =
fail: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2ce7d05cfb4021f5de5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d2ce7d05cfb4021f5d=
e5d
        failing since 2 days (last pass: v6.4-rc4-279-g33e2f287e32d, first =
fail: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/647d29f7cd7ae6be9df5de84

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d29f7cd7ae6be9df5d=
e85
        new failure (last pass: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/647d27e6dc89e8320af5de8c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d27e6dc89e8320af5d=
e8d
        failing since 2 days (last pass: v6.4-rc4-316-g2ef1da21bb4b, first =
fail: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647d29d98f17f4001ef5de25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d29d98f17f4001ef5d=
e26
        failing since 171 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/647d28d59d47741c8cf5de95

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d28d59d47741c8cf5d=
e96
        failing since 171 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/647d28d01f6f7f1903f5de26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d28d01f6f7f1903f5d=
e27
        new failure (last pass: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/647d28e69d47741c8cf5deb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d28e69d47741c8cf5d=
eb3
        new failure (last pass: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/647d2a4eee73d89300f5de99

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-l=
ibretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-l=
ibretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d2a4eee73d89300f5d=
e9a
        new failure (last pass: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/647d299ddf35953bcbf5de2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6=
-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6=
-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d299ddf35953bcbf5d=
e2c
        new failure (last pass: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/647d288e9e46f0853cf5df0a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/647d288e9e46f0853cf5df13
        failing since 94 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-06-05T00:12:22.854515  / # #
    2023-06-05T00:12:22.960508  export SHELL=3D/bin/sh
    2023-06-05T00:12:22.962117  #
    2023-06-05T00:12:23.065662  / # export SHELL=3D/bin/sh. /lava-3640825/e=
nvironment
    2023-06-05T00:12:23.067307  =

    2023-06-05T00:12:23.170961  / # . /lava-3640825/environment/lava-364082=
5/bin/lava-test-runner /lava-3640825/1
    2023-06-05T00:12:23.173847  =

    2023-06-05T00:12:23.177738  / # /lava-3640825/bin/lava-test-runner /lav=
a-3640825/1
    2023-06-05T00:12:23.301650  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-05T00:12:23.303367  + cd /lava-3640825/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/647d28bc428b34615cf5de43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-14=
2-g7f2b5d41063a/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/647d28bc428b34615cf5d=
e44
        failing since 2 days (last pass: v6.4-rc4-316-g2ef1da21bb4b, first =
fail: v6.4-rc4-407-g4cdb5de9397d) =

 =20
