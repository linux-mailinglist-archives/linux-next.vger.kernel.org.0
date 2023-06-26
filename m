Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 940A173D73A
	for <lists+linux-next@lfdr.de>; Mon, 26 Jun 2023 07:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjFZFln (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Jun 2023 01:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjFZFlm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Jun 2023 01:41:42 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BCA9116
        for <linux-next@vger.kernel.org>; Sun, 25 Jun 2023 22:41:38 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6b2e1023f30so2859466a34.1
        for <linux-next@vger.kernel.org>; Sun, 25 Jun 2023 22:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687758097; x=1690350097;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ1GKWq08TDtvibiDeaMsAsD0cMSsECMX6ZbY8tXMKc=;
        b=1awb5gn4BbJB9qbSVZoTztO0qrV+bUDTNbqTgGO9DUfDgdx9J696DjRBlKgUnibsBU
         mTTx8HycArFXBmotuIssSv+Nb0zyozWpq3WFN4QT4xwq8vy23tXdolVVWkxTKwPKTJI7
         NsI4oDLPFvd5Wrwdr856SkQHpT6dILNxjJEQT+2cj7Jl9Mw6fCizQRQWbw2/FmFoZB+f
         xdy7hOd379bCD7AEgcVQlqYy/ZEm+lxT8IxHXc/K5ui95ZCd9NDXrXHo8CcY0RHCfMv/
         HwiWqg2hzRRm6xzE2p3mtRp1fDBDgQWHUVFIjC25e4wAWBnwu6R2KWQPPwy36CrVRLA9
         k86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687758097; x=1690350097;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQ1GKWq08TDtvibiDeaMsAsD0cMSsECMX6ZbY8tXMKc=;
        b=HjvJ1asZe4/jRPr0KwX5Rpwsi2+vUtyWFObmrlWkdPGv0GIL9jCB06N8+1hul22eYB
         jCTDkH+NgttbQ+nkeEkBa3OsXuFsByTcRLN96thpuFE1IE1VKBvt/IymQY+3UCVTnCIl
         DKF0ifygkqFg1DRgLT0i3OO4qHL5B5m8J0AoXCe8uHwsFp0z+O549yx3btJSkrbgOyLd
         69e0UezCecTJ57sYp+2QJz1QdRaBuaUcFfNmFEoz5XvqcqX+g27ZcvrpyBVh/KGKaA/M
         oSHiLLCLFivver1J/y0xJehGvU1HWTxBs36QaVWpRfS/64V1h1DPaYCm9qL4uD/SKrDB
         c65Q==
X-Gm-Message-State: AC+VfDzxBJtzfZrzgMlYinXaiA0iOagiJitZMsKyGsf26LqyoyC81Of2
        KA03QI/Q5UNMen997Kun0cbSmgBPEy/FFkBqTuE=
X-Google-Smtp-Source: ACHHUZ64dYUdt0xK3vqINrt/r84l8PyBtTRaBtV02gXaW4DudGqf6/FS15RmF3xRUiyQxE4dZxsEng==
X-Received: by 2002:a54:4591:0:b0:3a1:e85f:33ee with SMTP id z17-20020a544591000000b003a1e85f33eemr238186oib.56.1687758095141;
        Sun, 25 Jun 2023 22:41:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902860c00b001b80760fd04sm692967plo.112.2023.06.25.22.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 22:41:34 -0700 (PDT)
Message-ID: <6499250e.170a0220.7f2ec.17e2@mx.google.com>
Date:   Sun, 25 Jun 2023 22:41:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc7-318-gd779731ecfed
Subject: next/pending-fixes baseline: 556 runs,
 57 regressions (v6.4-rc7-318-gd779731ecfed)
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

next/pending-fixes baseline: 556 runs, 57 regressions (v6.4-rc7-318-gd77973=
1ecfed)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc7-318-gd779731ecfed/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc7-318-gd779731ecfed
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d779731ecfed1a8f72b58b61041e2d62ecc7a43e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e92fe21fa9db6f306130

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e92fe21fa9db6f306139
        failing since 89 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:25:50.294237  <8>[    7.929109] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904664_1.4.2.3.1>

    2023-06-26T01:25:50.297932  + set +x

    2023-06-26T01:25:50.403961  =


    2023-06-26T01:25:50.505537  / # #export SHELL=3D/bin/sh

    2023-06-26T01:25:50.505805  =


    2023-06-26T01:25:50.606417  / # export SHELL=3D/bin/sh. /lava-10904664/=
environment

    2023-06-26T01:25:50.606650  =


    2023-06-26T01:25:50.707150  / # . /lava-10904664/environment/lava-10904=
664/bin/lava-test-runner /lava-10904664/1

    2023-06-26T01:25:50.707395  =


    2023-06-26T01:25:50.713278  / # /lava-10904664/bin/lava-test-runner /la=
va-10904664/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e9cff0b271f97a30615a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e9cff0b271f97a306163
        failing since 89 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:28:28.739480  <8>[   10.082011] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904752_1.4.2.3.1>

    2023-06-26T01:28:28.743078  + set +x

    2023-06-26T01:28:28.844651  #

    2023-06-26T01:28:28.844983  =


    2023-06-26T01:28:28.945608  / # #export SHELL=3D/bin/sh

    2023-06-26T01:28:28.945795  =


    2023-06-26T01:28:29.046274  / # export SHELL=3D/bin/sh. /lava-10904752/=
environment

    2023-06-26T01:28:29.046480  =


    2023-06-26T01:28:29.146961  / # . /lava-10904752/environment/lava-10904=
752/bin/lava-test-runner /lava-10904752/1

    2023-06-26T01:28:29.147234  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ebf32ba0c22a613061ac

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ebf32ba0c22a613061b5
        failing since 87 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-26T01:37:52.551949  <8>[   12.897943] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10905000_1.4.2.3.1>

    2023-06-26T01:37:52.555591  + set +x

    2023-06-26T01:37:52.660675  #

    2023-06-26T01:37:52.761895  / # #export SHELL=3D/bin/sh

    2023-06-26T01:37:52.762698  =


    2023-06-26T01:37:52.864092  / # export SHELL=3D/bin/sh. /lava-10905000/=
environment

    2023-06-26T01:37:52.864869  =


    2023-06-26T01:37:52.966420  / # . /lava-10905000/environment/lava-10905=
000/bin/lava-test-runner /lava-10905000/1

    2023-06-26T01:37:52.967994  =


    2023-06-26T01:37:53.013344  / # /lava-10905000/bin/lava-test-runner /la=
va-10905000/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e93764a4f7bda9306177

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e93764a4f7bda9306180
        failing since 89 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:25:55.786717  + <8>[    9.396761] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10904706_1.4.2.3.1>

    2023-06-26T01:25:55.787163  set +x

    2023-06-26T01:25:55.894444  / # #

    2023-06-26T01:25:55.995238  export SHELL=3D/bin/sh

    2023-06-26T01:25:55.995958  #

    2023-06-26T01:25:56.097350  / # export SHELL=3D/bin/sh. /lava-10904706/=
environment

    2023-06-26T01:25:56.098046  =


    2023-06-26T01:25:56.199482  / # . /lava-10904706/environment/lava-10904=
706/bin/lava-test-runner /lava-10904706/1

    2023-06-26T01:25:56.200653  =


    2023-06-26T01:25:56.205221  / # /lava-10904706/bin/lava-test-runner /la=
va-10904706/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e9d6ee4f30a45530618f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e9d6ee4f30a455306198
        failing since 89 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:28:47.016472  + set<8>[   11.436080] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10904744_1.4.2.3.1>

    2023-06-26T01:28:47.017070   +x

    2023-06-26T01:28:47.124837  / # #

    2023-06-26T01:28:47.227436  export SHELL=3D/bin/sh

    2023-06-26T01:28:47.228193  #

    2023-06-26T01:28:47.329905  / # export SHELL=3D/bin/sh. /lava-10904744/=
environment

    2023-06-26T01:28:47.330669  =


    2023-06-26T01:28:47.432108  / # . /lava-10904744/environment/lava-10904=
744/bin/lava-test-runner /lava-10904744/1

    2023-06-26T01:28:47.432820  =


    2023-06-26T01:28:47.436964  / # /lava-10904744/bin/lava-test-runner /la=
va-10904744/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ebea2ba0c22a61306184

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ebea2ba0c22a6130618d
        failing since 87 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-26T01:37:27.626674  + set +x

    2023-06-26T01:37:27.630389  <8>[   15.137640] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904999_1.4.2.3.1>

    2023-06-26T01:37:27.740512  / # #

    2023-06-26T01:37:27.842950  export SHELL=3D/bin/sh

    2023-06-26T01:37:27.843748  #

    2023-06-26T01:37:27.945333  / # export SHELL=3D/bin/sh. /lava-10904999/=
environment

    2023-06-26T01:37:27.946033  =


    2023-06-26T01:37:28.047706  / # . /lava-10904999/environment/lava-10904=
999/bin/lava-test-runner /lava-10904999/1

    2023-06-26T01:37:28.048789  =


    2023-06-26T01:37:28.053437  / # /lava-10904999/bin/lava-test-runner /la=
va-10904999/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e92264a4f7bda9306131

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e92264a4f7bda930613a
        failing since 89 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:25:47.374035  <8>[   10.543020] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904684_1.4.2.3.1>

    2023-06-26T01:25:47.376976  + set +x

    2023-06-26T01:25:47.484763  / # #

    2023-06-26T01:25:47.586008  export SHELL=3D/bin/sh

    2023-06-26T01:25:47.586685  #

    2023-06-26T01:25:47.688145  / # export SHELL=3D/bin/sh. /lava-10904684/=
environment

    2023-06-26T01:25:47.688907  =


    2023-06-26T01:25:47.790455  / # . /lava-10904684/environment/lava-10904=
684/bin/lava-test-runner /lava-10904684/1

    2023-06-26T01:25:47.791794  =


    2023-06-26T01:25:47.796758  / # /lava-10904684/bin/lava-test-runner /la=
va-10904684/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e9d6d1d2e7830c3061af

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e9d6d1d2e7830c3061b8
        failing since 89 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:28:41.684836  <8>[   10.043770] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904790_1.4.2.3.1>

    2023-06-26T01:28:41.688469  + set +x

    2023-06-26T01:28:41.793600  #

    2023-06-26T01:28:41.794730  =


    2023-06-26T01:28:41.896540  / # #export SHELL=3D/bin/sh

    2023-06-26T01:28:41.897327  =


    2023-06-26T01:28:41.998800  / # export SHELL=3D/bin/sh. /lava-10904790/=
environment

    2023-06-26T01:28:41.999531  =


    2023-06-26T01:28:42.101012  / # . /lava-10904790/environment/lava-10904=
790/bin/lava-test-runner /lava-10904790/1

    2023-06-26T01:28:42.102282  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ebe81be018bc6830612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ebe81be018bc68306137
        failing since 87 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-26T01:37:29.367496  <8>[   12.688426] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904995_1.4.2.3.1>

    2023-06-26T01:37:29.370525  + set +x

    2023-06-26T01:37:29.473778  #

    2023-06-26T01:37:29.474450  =


    2023-06-26T01:37:29.575597  / # #export SHELL=3D/bin/sh

    2023-06-26T01:37:29.576295  =


    2023-06-26T01:37:29.677776  / # export SHELL=3D/bin/sh. /lava-10904995/=
environment

    2023-06-26T01:37:29.678464  =


    2023-06-26T01:37:29.779833  / # . /lava-10904995/environment/lava-10904=
995/bin/lava-test-runner /lava-10904995/1

    2023-06-26T01:37:29.780121  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e7f4f59c9fdec030617f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e7f4f59c9fdec0306188
        failing since 165 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-26T01:21:24.775108  / # #

    2023-06-26T01:21:24.875542  export SHELL=3D/bin/sh

    2023-06-26T01:21:24.875658  #

    2023-06-26T01:21:24.976100  / # export SHELL=3D/bin/sh. /lava-10904450/=
environment

    2023-06-26T01:21:24.976228  =


    2023-06-26T01:21:25.076736  / # . /lava-10904450/environment/lava-10904=
450/bin/lava-test-runner /lava-10904450/1

    2023-06-26T01:21:25.076930  =


    2023-06-26T01:21:25.088579  / # /lava-10904450/bin/lava-test-runner /la=
va-10904450/1

    2023-06-26T01:21:25.201663  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-26T01:21:25.201832  + cd /lava-10904450/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6498eb3dfebadf8a63306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498eb3dfebadf8a63306=
145
        failing since 119 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e91b9e22a3cc0d30612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e91b9e22a3cc0d306138
        failing since 89 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:25:38.879161  + set +x

    2023-06-26T01:25:38.885858  <8>[   10.012073] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904683_1.4.2.3.1>

    2023-06-26T01:25:38.990229  / # #

    2023-06-26T01:25:39.090780  export SHELL=3D/bin/sh

    2023-06-26T01:25:39.090974  #

    2023-06-26T01:25:39.191437  / # export SHELL=3D/bin/sh. /lava-10904683/=
environment

    2023-06-26T01:25:39.191608  =


    2023-06-26T01:25:39.292081  / # . /lava-10904683/environment/lava-10904=
683/bin/lava-test-runner /lava-10904683/1

    2023-06-26T01:25:39.292333  =


    2023-06-26T01:25:39.296858  / # /lava-10904683/bin/lava-test-runner /la=
va-10904683/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e9bb65177e7537306136

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e9bb65177e753730613f
        failing since 89 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:28:15.376794  + set +x

    2023-06-26T01:28:15.383359  <8>[   10.389800] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904774_1.4.2.3.1>

    2023-06-26T01:28:15.488102  / # #

    2023-06-26T01:28:15.588808  export SHELL=3D/bin/sh

    2023-06-26T01:28:15.589090  #

    2023-06-26T01:28:15.689668  / # export SHELL=3D/bin/sh. /lava-10904774/=
environment

    2023-06-26T01:28:15.689905  =


    2023-06-26T01:28:15.790468  / # . /lava-10904774/environment/lava-10904=
774/bin/lava-test-runner /lava-10904774/1

    2023-06-26T01:28:15.790814  =


    2023-06-26T01:28:15.795842  / # /lava-10904774/bin/lava-test-runner /la=
va-10904774/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ebd70abbe01b94306134

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ebd70abbe01b9430613d
        failing since 87 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-26T01:37:13.001064  + set +x

    2023-06-26T01:37:13.007194  <8>[   15.929839] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904996_1.4.2.3.1>

    2023-06-26T01:37:13.114523  / # #

    2023-06-26T01:37:13.215236  export SHELL=3D/bin/sh

    2023-06-26T01:37:13.215456  #

    2023-06-26T01:37:13.316002  / # export SHELL=3D/bin/sh. /lava-10904996/=
environment

    2023-06-26T01:37:13.316222  =


    2023-06-26T01:37:13.416762  / # . /lava-10904996/environment/lava-10904=
996/bin/lava-test-runner /lava-10904996/1

    2023-06-26T01:37:13.417059  =


    2023-06-26T01:37:13.421891  / # /lava-10904996/bin/lava-test-runner /la=
va-10904996/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e921d691326d8e3061f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e921d691326d8e3061fd
        failing since 89 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:25:39.360416  <8>[    7.861506] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904677_1.4.2.3.1>

    2023-06-26T01:25:39.364438  + set +x

    2023-06-26T01:25:39.465725  #

    2023-06-26T01:25:39.466045  =


    2023-06-26T01:25:39.566735  / # #export SHELL=3D/bin/sh

    2023-06-26T01:25:39.566937  =


    2023-06-26T01:25:39.667493  / # export SHELL=3D/bin/sh. /lava-10904677/=
environment

    2023-06-26T01:25:39.667691  =


    2023-06-26T01:25:39.768266  / # . /lava-10904677/environment/lava-10904=
677/bin/lava-test-runner /lava-10904677/1

    2023-06-26T01:25:39.768620  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e9cfb47f228e56306135

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e9cfb47f228e5630613e
        failing since 89 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:28:27.934622  <8>[   10.264922] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904814_1.4.2.3.1>

    2023-06-26T01:28:27.938207  + set +x

    2023-06-26T01:28:28.039535  =


    2023-06-26T01:28:28.140271  / # #export SHELL=3D/bin/sh

    2023-06-26T01:28:28.141123  =


    2023-06-26T01:28:28.242668  / # export SHELL=3D/bin/sh. /lava-10904814/=
environment

    2023-06-26T01:28:28.243416  =


    2023-06-26T01:28:28.344954  / # . /lava-10904814/environment/lava-10904=
814/bin/lava-test-runner /lava-10904814/1

    2023-06-26T01:28:28.346330  =


    2023-06-26T01:28:28.351825  / # /lava-10904814/bin/lava-test-runner /la=
va-10904814/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ebde2ba0c22a61306167

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ebde2ba0c22a61306170
        failing since 87 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-26T01:37:17.912157  + set +x

    2023-06-26T01:37:17.918863  <8>[   14.290555] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904986_1.4.2.3.1>

    2023-06-26T01:37:18.026553  / # #

    2023-06-26T01:37:18.127702  export SHELL=3D/bin/sh

    2023-06-26T01:37:18.128447  #

    2023-06-26T01:37:18.230129  / # export SHELL=3D/bin/sh. /lava-10904986/=
environment

    2023-06-26T01:37:18.230911  =


    2023-06-26T01:37:18.332600  / # . /lava-10904986/environment/lava-10904=
986/bin/lava-test-runner /lava-10904986/1

    2023-06-26T01:37:18.333750  =


    2023-06-26T01:37:18.339752  / # /lava-10904986/bin/lava-test-runner /la=
va-10904986/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e918301200dfeb306160

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e918301200dfeb306169
        failing since 89 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:25:28.049517  + <8>[   11.567881] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10904661_1.4.2.3.1>

    2023-06-26T01:25:28.049603  set +x

    2023-06-26T01:25:28.153842  / # #

    2023-06-26T01:25:28.254406  export SHELL=3D/bin/sh

    2023-06-26T01:25:28.254567  #

    2023-06-26T01:25:28.355050  / # export SHELL=3D/bin/sh. /lava-10904661/=
environment

    2023-06-26T01:25:28.355212  =


    2023-06-26T01:25:28.455683  / # . /lava-10904661/environment/lava-10904=
661/bin/lava-test-runner /lava-10904661/1

    2023-06-26T01:25:28.455971  =


    2023-06-26T01:25:28.461134  / # /lava-10904661/bin/lava-test-runner /la=
va-10904661/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e9dc73967985bc30613c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e9dc73967985bc306145
        failing since 89 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:28:33.244490  + <8>[    8.610002] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10904777_1.4.2.3.1>

    2023-06-26T01:28:33.244611  set +x

    2023-06-26T01:28:33.348489  / # #

    2023-06-26T01:28:33.449258  export SHELL=3D/bin/sh

    2023-06-26T01:28:33.449472  #

    2023-06-26T01:28:33.549997  / # export SHELL=3D/bin/sh. /lava-10904777/=
environment

    2023-06-26T01:28:33.550202  =


    2023-06-26T01:28:33.650755  / # . /lava-10904777/environment/lava-10904=
777/bin/lava-test-runner /lava-10904777/1

    2023-06-26T01:28:33.651053  =


    2023-06-26T01:28:33.655399  / # /lava-10904777/bin/lava-test-runner /la=
va-10904777/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ec074f562499fc306175

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ec074f562499fc30617e
        failing since 87 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-26T01:37:50.929643  + <8>[   14.426754] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10904960_1.4.2.3.1>

    2023-06-26T01:37:50.932983  set +x

    2023-06-26T01:37:51.037788  / # #

    2023-06-26T01:37:51.140129  export SHELL=3D/bin/sh

    2023-06-26T01:37:51.140956  #

    2023-06-26T01:37:51.242683  / # export SHELL=3D/bin/sh. /lava-10904960/=
environment

    2023-06-26T01:37:51.243482  =


    2023-06-26T01:37:51.345019  / # . /lava-10904960/environment/lava-10904=
960/bin/lava-test-runner /lava-10904960/1

    2023-06-26T01:37:51.346240  =


    2023-06-26T01:37:51.351531  / # /lava-10904960/bin/lava-test-runner /la=
va-10904960/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e8583452733e2730613d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e8583452733e27306146
        failing since 147 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-26T01:22:07.802666  + set +x
    2023-06-26T01:22:07.802857  [   14.354102] <LAVA_SIGNAL_ENDRUN 0_dmesg =
987895_1.5.2.3.1>
    2023-06-26T01:22:07.910513  / # #
    2023-06-26T01:22:08.012219  export SHELL=3D/bin/sh
    2023-06-26T01:22:08.012661  #
    2023-06-26T01:22:08.113811  / # export SHELL=3D/bin/sh. /lava-987895/en=
vironment
    2023-06-26T01:22:08.114174  =

    2023-06-26T01:22:08.215485  / # . /lava-987895/environment/lava-987895/=
bin/lava-test-runner /lava-987895/1
    2023-06-26T01:22:08.216105  =

    2023-06-26T01:22:08.219497  / # /lava-987895/bin/lava-test-runner /lava=
-987895/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e8a52cb2e6e2e930613c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e8a52cb2e6e2e9306145
        failing since 147 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-26T01:23:26.613615  + set +x
    2023-06-26T01:23:26.613778  [   12.099618] <LAVA_SIGNAL_ENDRUN 0_dmesg =
987898_1.5.2.3.1>
    2023-06-26T01:23:26.720118  / # #
    2023-06-26T01:23:26.821746  export SHELL=3D/bin/sh
    2023-06-26T01:23:26.822232  #
    2023-06-26T01:23:26.923563  / # export SHELL=3D/bin/sh. /lava-987898/en=
vironment
    2023-06-26T01:23:26.924093  =

    2023-06-26T01:23:27.025624  / # . /lava-987898/environment/lava-987898/=
bin/lava-test-runner /lava-987898/1
    2023-06-26T01:23:27.026185  =

    2023-06-26T01:23:27.029486  / # /lava-987898/bin/lava-test-runner /lava=
-987898/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e8f6bf92f416e3306140

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e8f6bf92f416e3306149
        failing since 147 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-26T01:24:45.417826  + set +x
    2023-06-26T01:24:45.417993  [   13.095763] <LAVA_SIGNAL_ENDRUN 0_dmesg =
987910_1.5.2.3.1>
    2023-06-26T01:24:45.525062  / # #
    2023-06-26T01:24:45.626929  export SHELL=3D/bin/sh
    2023-06-26T01:24:45.627390  #
    2023-06-26T01:24:45.728618  / # export SHELL=3D/bin/sh. /lava-987910/en=
vironment
    2023-06-26T01:24:45.729032  =

    2023-06-26T01:24:45.830313  / # . /lava-987910/environment/lava-987910/=
bin/lava-test-runner /lava-987910/1
    2023-06-26T01:24:45.831076  =

    2023-06-26T01:24:45.834177  / # /lava-987910/bin/lava-test-runner /lava=
-987910/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e94721cab976a430617f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e94721cab976a4306188
        failing since 147 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-26T01:26:04.820941  + set +x
    2023-06-26T01:26:04.821161  [   12.895096] <LAVA_SIGNAL_ENDRUN 0_dmesg =
987913_1.5.2.3.1>
    2023-06-26T01:26:04.928561  / # #
    2023-06-26T01:26:05.030083  export SHELL=3D/bin/sh
    2023-06-26T01:26:05.030569  #
    2023-06-26T01:26:05.131906  / # export SHELL=3D/bin/sh. /lava-987913/en=
vironment
    2023-06-26T01:26:05.132367  =

    2023-06-26T01:26:05.233680  / # . /lava-987913/environment/lava-987913/=
bin/lava-test-runner /lava-987913/1
    2023-06-26T01:26:05.234297  =

    2023-06-26T01:26:05.237305  / # /lava-987913/bin/lava-test-runner /lava=
-987913/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6498eb3bfebadf8a63306139

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498eb3bfebadf8a63306142
        failing since 147 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-26T01:34:26.547062  + set +x
    2023-06-26T01:34:26.547227  [   13.193980] <LAVA_SIGNAL_ENDRUN 0_dmesg =
987936_1.5.2.3.1>
    2023-06-26T01:34:26.655298  / # #
    2023-06-26T01:34:26.756979  export SHELL=3D/bin/sh
    2023-06-26T01:34:26.757437  #
    2023-06-26T01:34:26.858774  / # export SHELL=3D/bin/sh. /lava-987936/en=
vironment
    2023-06-26T01:34:26.859234  =

    2023-06-26T01:34:26.960474  / # . /lava-987936/environment/lava-987936/=
bin/lava-test-runner /lava-987936/1
    2023-06-26T01:34:26.961094  =

    2023-06-26T01:34:26.964992  / # /lava-987936/bin/lava-test-runner /lava=
-987936/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e94540855d2afa306209

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e94540855d2afa306212
        new failure (last pass: v6.4-rc7-260-g7124fb0a8216)

    2023-06-26T01:26:14.489558  + set[   15.093741] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 987912_1.5.2.3.1>
    2023-06-26T01:26:14.489725   +x
    2023-06-26T01:26:14.596091  / # #
    2023-06-26T01:26:14.698412  export SHELL=3D/bin/sh
    2023-06-26T01:26:14.698967  #
    2023-06-26T01:26:14.800295  / # export SHELL=3D/bin/sh. /lava-987912/en=
vironment
    2023-06-26T01:26:14.800792  =

    2023-06-26T01:26:14.902189  / # . /lava-987912/environment/lava-987912/=
bin/lava-test-runner /lava-987912/1
    2023-06-26T01:26:14.902875  =

    2023-06-26T01:26:14.905810  / # /lava-987912/bin/lava-test-runner /lava=
-987912/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498eea9f97c3b606b306132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498eea9f97c3b606b306=
133
        failing since 231 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6498eb8c7c1a28273f30614d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengut=
ronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengut=
ronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498eb8c7c1a28273f306=
14e
        new failure (last pass: v6.4-rc7-235-g8d8d57edb1481) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6498ec2ffdf6d54a4b306179

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ec2ffdf6d54a4b306180
        new failure (last pass: v6.4-rc7-260-g7124fb0a8216)

    2023-06-26T01:38:42.704129  / # #
    2023-06-26T01:38:42.807004  export SHELL=3D/bin/sh
    2023-06-26T01:38:42.807819  #
    2023-06-26T01:38:42.909769  / # export SHELL=3D/bin/sh. /lava-365440/en=
vironment
    2023-06-26T01:38:42.910623  =

    2023-06-26T01:38:43.012558  / # . /lava-365440/environment/lava-365440/=
bin/lava-test-runner /lava-365440/1
    2023-06-26T01:38:43.013905  =

    2023-06-26T01:38:43.030201  / # /lava-365440/bin/lava-test-runner /lava=
-365440/1
    2023-06-26T01:38:43.085039  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-26T01:38:43.085605  + cd /l<8>[   15.433833] <LAVA_SIGNAL_START=
RUN 1_bootrr 365440_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/649=
8ec2ffdf6d54a4b306190
        new failure (last pass: v6.4-rc7-260-g7124fb0a8216)

    2023-06-26T01:38:45.471903  /lava-365440/1/../bin/lava-test-case
    2023-06-26T01:38:45.472330  <8>[   17.916762] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-06-26T01:38:45.472610  /lava-365440/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e90374627b926630619e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e90374627b92663061a7
        failing since 89 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:25:11.694316  <8>[   12.286284] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10904659_1.4.2.3.1>

    2023-06-26T01:25:11.799124  / # #

    2023-06-26T01:25:11.899811  export SHELL=3D/bin/sh

    2023-06-26T01:25:11.900050  #

    2023-06-26T01:25:12.000626  / # export SHELL=3D/bin/sh. /lava-10904659/=
environment

    2023-06-26T01:25:12.000846  =


    2023-06-26T01:25:12.101452  / # . /lava-10904659/environment/lava-10904=
659/bin/lava-test-runner /lava-10904659/1

    2023-06-26T01:25:12.101759  =


    2023-06-26T01:25:12.106646  / # /lava-10904659/bin/lava-test-runner /la=
va-10904659/1

    2023-06-26T01:25:12.112916  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6498e9c55e9b9e04e1306159

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498e9c55e9b9e04e1306162
        failing since 89 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-26T01:28:29.821086  + set<8>[   11.136007] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10904806_1.4.2.3.1>

    2023-06-26T01:28:29.821509   +x

    2023-06-26T01:28:29.928460  / # #

    2023-06-26T01:28:30.030487  export SHELL=3D/bin/sh

    2023-06-26T01:28:30.031297  #

    2023-06-26T01:28:30.132624  / # export SHELL=3D/bin/sh. /lava-10904806/=
environment

    2023-06-26T01:28:30.132870  =


    2023-06-26T01:28:30.233464  / # . /lava-10904806/environment/lava-10904=
806/bin/lava-test-runner /lava-10904806/1

    2023-06-26T01:28:30.233766  =


    2023-06-26T01:28:30.238603  / # /lava-10904806/bin/lava-test-runner /la=
va-10904806/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ebe097a9f3c4c330615f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ebe097a9f3c4c3306168
        failing since 87 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-26T01:37:24.118641  + <8>[   13.915172] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10904975_1.4.2.3.1>

    2023-06-26T01:37:24.118732  set +x

    2023-06-26T01:37:24.223681  / # #

    2023-06-26T01:37:24.324330  export SHELL=3D/bin/sh

    2023-06-26T01:37:24.324717  #

    2023-06-26T01:37:24.425555  / # export SHELL=3D/bin/sh. /lava-10904975/=
environment

    2023-06-26T01:37:24.426214  =


    2023-06-26T01:37:24.527538  / # . /lava-10904975/environment/lava-10904=
975/bin/lava-test-runner /lava-10904975/1

    2023-06-26T01:37:24.529318  =


    2023-06-26T01:37:24.534311  / # /lava-10904975/bin/lava-test-runner /la=
va-10904975/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ec9cbb71f5b8f730614f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498ec9cbb71f5b8f7306=
150
        failing since 60 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6498eed9d3f02a29fa30614b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498eed9d3f02a29fa306=
14c
        failing since 48 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ecbc8e8dc3e313306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498ecbc8e8dc3e313306=
134
        failing since 60 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6498eebaf97c3b606b30618b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498eebaf97c3b606b306=
18c
        failing since 48 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ed66a32037885d3061fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498ed66a32037885d306=
1ff
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498f465b1e9c5b49a306173

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498f465b1e9c5b49a306=
174
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ee9c2be29e1395306198

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498ee9c2be29e1395306=
199
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ed78154436ccb8306199

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498ed78154436ccb8306=
19a
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498f467b1e9c5b49a306179

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498f467b1e9c5b49a306=
17a
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498eed94dc148e51d306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498eed94dc148e51d306=
141
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ed647ba477cccf306156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498ed647ba477cccf306=
157
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498f451e23b01dd98306162

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498f451e23b01dd98306=
163
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ee602ab208c8db30613e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498ee602ab208c8db306=
13f
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ed8c6496aced4f306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498ed8c6496aced4f306=
132
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498f479ac5d5cc62e30614d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498f479ac5d5cc62e306=
14e
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6498eecd4dc148e51d30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498eecd4dc148e51d306=
130
        failing since 256 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6498eccdc387236f94306156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498eccdc387236f94306=
157
        failing since 192 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ea756b89a9bb5a30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498ea756b89a9bb5a306=
12f
        failing since 192 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6498eb68a18cdff1f23061df

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498eb68a18cdff1f23061e8
        failing since 145 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-26T01:35:15.586027  [   29.915011] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3692290_1.5.2.4.1>
    2023-06-26T01:35:15.691131  =

    2023-06-26T01:35:15.792708  / # #export SHELL=3D/bin/sh
    2023-06-26T01:35:15.793111  =

    2023-06-26T01:35:15.894476  / # export SHELL=3D/bin/sh. /lava-3692290/e=
nvironment
    2023-06-26T01:35:15.894871  =

    2023-06-26T01:35:15.996924  / # . /lava-3692290/environment/lava-369229=
0/bin/lava-test-runner /lava-3692290/1
    2023-06-26T01:35:15.997626  =

    2023-06-26T01:35:16.001268  / # /lava-3692290/bin/lava-test-runner /lav=
a-3692290/1
    2023-06-26T01:35:16.037050  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ebcc5da1c4192f306188

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ebcc5da1c4192f306191
        failing since 145 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-26T01:36:56.050296  [   28.972641] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3692359_1.5.2.4.1>
    2023-06-26T01:36:56.155870  =

    2023-06-26T01:36:56.257109  / # #export SHELL=3D/bin/sh
    2023-06-26T01:36:56.257455  =

    2023-06-26T01:36:56.358662  / # export SHELL=3D/bin/sh. /lava-3692359/e=
nvironment
    2023-06-26T01:36:56.359296  =

    2023-06-26T01:36:56.460763  / # . /lava-3692359/environment/lava-369235=
9/bin/lava-test-runner /lava-3692359/1
    2023-06-26T01:36:56.461459  =

    2023-06-26T01:36:56.464954  / # /lava-3692359/bin/lava-test-runner /lav=
a-3692359/1
    2023-06-26T01:36:56.499964  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ec31fdf6d54a4b3061b3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ec31fdf6d54a4b3061bc
        failing since 145 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-26T01:38:35.271820  [   28.897069] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3692399_1.5.2.4.1>
    2023-06-26T01:38:35.376266  =

    2023-06-26T01:38:35.477830  / # #export SHELL=3D/bin/sh
    2023-06-26T01:38:35.478266  =

    2023-06-26T01:38:35.579689  / # export SHELL=3D/bin/sh. /lava-3692399/e=
nvironment
    2023-06-26T01:38:35.580131  =

    2023-06-26T01:38:35.681560  / # . /lava-3692399/environment/lava-369239=
9/bin/lava-test-runner /lava-3692399/1
    2023-06-26T01:38:35.682265  =

    2023-06-26T01:38:35.685848  / # /lava-3692399/bin/lava-test-runner /lav=
a-3692399/1
    2023-06-26T01:38:35.719453  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ec94bb71f5b8f7306141

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ec94bb71f5b8f730614a
        failing since 145 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-06-26T01:40:18.067266  [   28.813058] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3692444_1.5.2.4.1>
    2023-06-26T01:40:18.172393  =

    2023-06-26T01:40:18.274115  / # #export SHELL=3D/bin/sh
    2023-06-26T01:40:18.274851  =

    2023-06-26T01:40:18.376723  / # export SHELL=3D/bin/sh. /lava-3692444/e=
nvironment
    2023-06-26T01:40:18.377122  =

    2023-06-26T01:40:18.478629  / # . /lava-3692444/environment/lava-369244=
4/bin/lava-test-runner /lava-3692444/1
    2023-06-26T01:40:18.479833  =

    2023-06-26T01:40:18.483375  / # /lava-3692444/bin/lava-test-runner /lav=
a-3692444/1
    2023-06-26T01:40:18.521846  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ef01846fdd27ee306191

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6498ef01846fdd27ee30619a
        failing since 145 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-26T01:50:38.786778  [   32.100302] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3692494_1.5.2.4.1>
    2023-06-26T01:50:38.891640  =

    2023-06-26T01:50:38.993088  / # #export SHELL=3D/bin/sh
    2023-06-26T01:50:38.993492  =

    2023-06-26T01:50:39.094700  / # export SHELL=3D/bin/sh. /lava-3692494/e=
nvironment
    2023-06-26T01:50:39.095103  =

    2023-06-26T01:50:39.196346  / # . /lava-3692494/environment/lava-369249=
4/bin/lava-test-runner /lava-3692494/1
    2023-06-26T01:50:39.196982  =

    2023-06-26T01:50:39.200380  / # /lava-3692494/bin/lava-test-runner /lav=
a-3692494/1
    2023-06-26T01:50:39.236075  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6498ed40a32037885d30613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-brooni=
e/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-31=
8-gd779731ecfed/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-brooni=
e/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6498ed40a32037885d306=
13d
        new failure (last pass: v6.4-rc7-235-g8d8d57edb1481) =

 =20
