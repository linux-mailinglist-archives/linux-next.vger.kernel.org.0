Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60746E6FDF
	for <lists+linux-next@lfdr.de>; Wed, 19 Apr 2023 01:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjDRXP2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Apr 2023 19:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjDRXP1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Apr 2023 19:15:27 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700F87A92
        for <linux-next@vger.kernel.org>; Tue, 18 Apr 2023 16:15:22 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a6817adde4so21599175ad.0
        for <linux-next@vger.kernel.org>; Tue, 18 Apr 2023 16:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681859721; x=1684451721;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AW6RhmU2070QlzcOC/sJUm4couP9ODbzolZx6u05BOQ=;
        b=KoMYPVNQR7UFoAB7C0RIyWaR/dRwMM1yBmnEqeeHGSTWTTsKNOurrafFvrVpoy4nBw
         nNVHly6WrfACVI9RNUZI7AwhkfeAXtxgJIlde81p5XpdmU9b2DSR/Qnl3VTHJfKiNM0m
         0iOsLW8efQTJNJ66qOG8fSPscIvaEU2tUxMTAk7QYrk0GZgDirBrfErBeh6ZQ1YtymFa
         AtO/anHH6qrTsxsb2advejzq/nfVFkod6UltR5Xrs9jom3ifgmxanwXam08cxepwXeoL
         MfN296o6M2xx4Jwdna+VeZXakCYy7LtnQsLczw1uPmBYg2rRSac/mUdUsSyXN1Fyj5oL
         QQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681859721; x=1684451721;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AW6RhmU2070QlzcOC/sJUm4couP9ODbzolZx6u05BOQ=;
        b=Yro8hsqtMNIXGhNdQsbN2Cu7R2BFP4qWkoZWOiisegUCDKfozHej3LLTc40RIGYLkH
         sdMfiwForAvA4/JdKW6FNxx+ZKSDHCrLE0x7zImle5u7m+R6Mnq5SgDYAa8DYwy03OmO
         0AjVxZxeLoNbAT8cTDtutmgrSB8d9NTJ9RFm3KD4OHixwzFdS8HA1cwIoOccLawVdcIM
         rMw+rBDcFfvcjoYM/mzRahL6OmJAh3wRwYCgq1CoZaLobCytkkjYzNzFpwUPRr2EBR2R
         RuP12HteEc8LpS3yxOqtN2uoytMwxdryq/SQFjAzOxwOtHrSYG0VxtzIq/qZcjsvoCsa
         mmWA==
X-Gm-Message-State: AAQBX9c3JMqkHLyI0GPmGGn6FwVBT1PY7vFObGSEQQYfMSL4FuJDnghI
        AKPaPRhIeTaT9zs+RPexNst8REolUp/TkhEZ7M6CzCU7
X-Google-Smtp-Source: AKy350YAcwI097TvT91/yHrfHokZwm5yw7oLp+fUvie0DVqz0k1wCLToM9wjdKw3zIz74Mv6CcGQEA==
X-Received: by 2002:a17:903:41cd:b0:1a8:1b63:8aee with SMTP id u13-20020a17090341cd00b001a81b638aeemr462062ple.46.1681859719887;
        Tue, 18 Apr 2023 16:15:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e1-20020a170902b78100b001a19196af48sm10121585pls.64.2023.04.18.16.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 16:15:19 -0700 (PDT)
Message-ID: <643f2487.170a0220.f1790.6ece@mx.google.com>
Date:   Tue, 18 Apr 2023 16:15:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-rc7-147-g6ba2ee0e9acd
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 667 runs,
 85 regressions (v6.3-rc7-147-g6ba2ee0e9acd)
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

next/pending-fixes baseline: 667 runs, 85 regressions (v6.3-rc7-147-g6ba2ee=
0e9acd)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc7-147-g6ba2ee0e9acd/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc7-147-g6ba2ee0e9acd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6ba2ee0e9acdcdbb3fc8f031f4d9c5769442d13e =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643eeabea7c8652d902e8604

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eeabea7c8652d902e8609
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T19:08:21.838250  + set +x

    2023-04-18T19:08:21.844902  <8>[   12.699915] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10034660_1.4.2.3.1>

    2023-04-18T19:08:21.949435  / # #

    2023-04-18T19:08:22.050547  export SHELL=3D/bin/sh

    2023-04-18T19:08:22.050779  #

    2023-04-18T19:08:22.151748  / # export SHELL=3D/bin/sh. /lava-10034660/=
environment

    2023-04-18T19:08:22.151980  =


    2023-04-18T19:08:22.252907  / # . /lava-10034660/environment/lava-10034=
660/bin/lava-test-runner /lava-10034660/1

    2023-04-18T19:08:22.253265  =


    2023-04-18T19:08:22.258759  / # /lava-10034660/bin/lava-test-runner /la=
va-10034660/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643eed69e70b1f41732e8601

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eed69e70b1f41732e8606
        failing since 21 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:19:53.538768  <8>[   10.544852] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10035061_1.4.2.3.1>

    2023-04-18T19:19:53.542394  + set +x

    2023-04-18T19:19:53.647108  / # #

    2023-04-18T19:19:53.748167  export SHELL=3D/bin/sh

    2023-04-18T19:19:53.748409  #

    2023-04-18T19:19:53.849420  / # export SHELL=3D/bin/sh. /lava-10035061/=
environment

    2023-04-18T19:19:53.849649  =


    2023-04-18T19:19:53.950595  / # . /lava-10035061/environment/lava-10035=
061/bin/lava-test-runner /lava-10035061/1

    2023-04-18T19:19:53.950868  =


    2023-04-18T19:19:53.955857  / # /lava-10035061/bin/lava-test-runner /la=
va-10035061/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643eef84f953efb6f02e8614

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eef84f953efb6f02e8619
        failing since 21 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:28:48.573615  + set +x

    2023-04-18T19:28:48.579787  <8>[   10.537710] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10035292_1.4.2.3.1>

    2023-04-18T19:28:48.684626  / # #

    2023-04-18T19:28:48.785564  export SHELL=3D/bin/sh

    2023-04-18T19:28:48.785764  #

    2023-04-18T19:28:48.886845  / # export SHELL=3D/bin/sh. /lava-10035292/=
environment

    2023-04-18T19:28:48.887018  =


    2023-04-18T19:28:48.987949  / # . /lava-10035292/environment/lava-10035=
292/bin/lava-test-runner /lava-10035292/1

    2023-04-18T19:28:48.988254  =


    2023-04-18T19:28:48.994292  / # /lava-10035292/bin/lava-test-runner /la=
va-10035292/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/643eeabdb284bc35cf2e8640

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eeabdb284bc35cf2e8645
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T19:08:27.093083  + set +x

    2023-04-18T19:08:27.099449  <8>[   15.754838] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10034657_1.4.2.3.1>

    2023-04-18T19:08:27.203871  / # #

    2023-04-18T19:08:27.305122  export SHELL=3D/bin/sh

    2023-04-18T19:08:27.305356  #

    2023-04-18T19:08:27.406301  / # export SHELL=3D/bin/sh. /lava-10034657/=
environment

    2023-04-18T19:08:27.406552  =


    2023-04-18T19:08:27.507494  / # . /lava-10034657/environment/lava-10034=
657/bin/lava-test-runner /lava-10034657/1

    2023-04-18T19:08:27.507887  =


    2023-04-18T19:08:27.513277  / # /lava-10034657/bin/lava-test-runner /la=
va-10034657/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643eeabdb284bc3=
5cf2e8647
        new failure (last pass: v6.3-rc7-140-g88d3973741d7)
        3 lines

    2023-04-18T19:08:27.068982  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-04-18T19:08:27.075854  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-04-18T19:08:27.082005  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-18T19:08:27.088892  <8>[   15.737794] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643eed6a8ca1d246592e86ac

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eed6a8ca1d246592e86b1
        failing since 21 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:20:01.678128  + set<8>[    9.029870] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10035110_1.4.2.3.1>

    2023-04-18T19:20:01.678214   +x

    2023-04-18T19:20:01.782917  / # #

    2023-04-18T19:20:01.885316  export SHELL=3D/bin/sh

    2023-04-18T19:20:01.886059  #

    2023-04-18T19:20:01.987935  / # export SHELL=3D/bin/sh. /lava-10035110/=
environment

    2023-04-18T19:20:01.988313  =


    2023-04-18T19:20:02.089453  / # . /lava-10035110/environment/lava-10035=
110/bin/lava-test-runner /lava-10035110/1

    2023-04-18T19:20:02.089765  =


    2023-04-18T19:20:02.094837  / # /lava-10035110/bin/lava-test-runner /la=
va-10035110/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643eef729f9a08f07b2e8618

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eef729f9a08f07b2e861d
        failing since 21 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:28:35.719174  + set +x<8>[   11.677999] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10035262_1.4.2.3.1>

    2023-04-18T19:28:35.719257  =


    2023-04-18T19:28:35.824103  / # #

    2023-04-18T19:28:35.925238  export SHELL=3D/bin/sh

    2023-04-18T19:28:35.925428  #

    2023-04-18T19:28:36.026335  / # export SHELL=3D/bin/sh. /lava-10035262/=
environment

    2023-04-18T19:28:36.026558  =


    2023-04-18T19:28:36.127529  / # . /lava-10035262/environment/lava-10035=
262/bin/lava-test-runner /lava-10035262/1

    2023-04-18T19:28:36.127815  =


    2023-04-18T19:28:36.133038  / # /lava-10035262/bin/lava-test-runner /la=
va-10035262/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643eeaab75588bdada2e862d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eeaab75588bdada2e8632
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T19:08:07.103257  <8>[   13.896670] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10034671_1.4.2.3.1>

    2023-04-18T19:08:07.106586  + set +x

    2023-04-18T19:08:07.208214  #

    2023-04-18T19:08:07.208521  =


    2023-04-18T19:08:07.309510  / # #export SHELL=3D/bin/sh

    2023-04-18T19:08:07.309721  =


    2023-04-18T19:08:07.410618  / # export SHELL=3D/bin/sh. /lava-10034671/=
environment

    2023-04-18T19:08:07.410818  =


    2023-04-18T19:08:07.511755  / # . /lava-10034671/environment/lava-10034=
671/bin/lava-test-runner /lava-10034671/1

    2023-04-18T19:08:07.512034  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643eed7b9ce27f6bb62e8660

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eed7b9ce27f6bb62e8665
        failing since 21 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:20:06.711869  <8>[    7.870264] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10035114_1.4.2.3.1>

    2023-04-18T19:20:06.714858  + set +x

    2023-04-18T19:20:06.816676  =


    2023-04-18T19:20:06.917615  / # #export SHELL=3D/bin/sh

    2023-04-18T19:20:06.917782  =


    2023-04-18T19:20:07.018686  / # export SHELL=3D/bin/sh. /lava-10035114/=
environment

    2023-04-18T19:20:07.018871  =


    2023-04-18T19:20:07.119794  / # . /lava-10035114/environment/lava-10035=
114/bin/lava-test-runner /lava-10035114/1

    2023-04-18T19:20:07.120056  =


    2023-04-18T19:20:07.124693  / # /lava-10035114/bin/lava-test-runner /la=
va-10035114/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643eef89e415eacde02e85eb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eef89e415eacde02e85f0
        failing since 21 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:28:55.687600  <8>[   10.642544] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10035274_1.4.2.3.1>

    2023-04-18T19:28:55.691265  + set +x

    2023-04-18T19:28:55.792947  #

    2023-04-18T19:28:55.793252  =


    2023-04-18T19:28:55.894266  / # #export SHELL=3D/bin/sh

    2023-04-18T19:28:55.894510  =


    2023-04-18T19:28:55.995330  / # export SHELL=3D/bin/sh. /lava-10035274/=
environment

    2023-04-18T19:28:55.995552  =


    2023-04-18T19:28:56.096517  / # . /lava-10035274/environment/lava-10035=
274/bin/lava-test-runner /lava-10035274/1

    2023-04-18T19:28:56.096849  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/643eebb1c62746b8282e85f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eebb1c62746b8282e85f9
        failing since 97 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-04-18T19:12:31.313920  / # #

    2023-04-18T19:12:31.415204  export SHELL=3D/bin/sh

    2023-04-18T19:12:31.415856  #

    2023-04-18T19:12:31.517642  / # export SHELL=3D/bin/sh. /lava-10034710/=
environment

    2023-04-18T19:12:31.518303  =


    2023-04-18T19:12:31.620184  / # . /lava-10034710/environment/lava-10034=
710/bin/lava-test-runner /lava-10034710/1

    2023-04-18T19:12:31.621207  =


    2023-04-18T19:12:31.623045  / # /lava-10034710/bin/lava-test-runner /la=
va-10034710/1

    2023-04-18T19:12:31.747626  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-18T19:12:31.747789  + cd /lava-10034710/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643eef226c727042342e879f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eef226c727042342e8=
7a0
        failing since 50 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643eef6a82ea79a7372e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eef6a82ea79a7372e8=
603
        failing since 87 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643eeba60659227d962e8603

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eeba60659227d962e8608
        failing since 91 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-18T19:12:10.864670  <8>[   16.685258] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3509130_1.5.2.4.1>
    2023-04-18T19:12:10.973735  / # #
    2023-04-18T19:12:11.076935  export SHELL=3D/bin/sh
    2023-04-18T19:12:11.077866  #
    2023-04-18T19:12:11.179956  / # export SHELL=3D/bin/sh. /lava-3509130/e=
nvironment
    2023-04-18T19:12:11.180978  =

    2023-04-18T19:12:11.283331  / # . /lava-3509130/environment/lava-350913=
0/bin/lava-test-runner /lava-3509130/1
    2023-04-18T19:12:11.284886  =

    2023-04-18T19:12:11.289811  / # /lava-3509130/bin/lava-test-runner /lav=
a-3509130/1
    2023-04-18T19:12:11.370978  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643eec2f59037b8f282e86cc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eec2f59037b8f282e86d1
        failing since 91 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-18T19:14:46.639215  + set +x<8>[   15.161709] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3509147_1.5.2.4.1>
    2023-04-18T19:14:46.639411  =

    2023-04-18T19:14:46.745891  / # #
    2023-04-18T19:14:46.848116  export SHELL=3D/bin/sh
    2023-04-18T19:14:46.848714  #
    2023-04-18T19:14:46.950316  / # export SHELL=3D/bin/sh. /lava-3509147/e=
nvironment
    2023-04-18T19:14:46.951164  =

    2023-04-18T19:14:47.053037  / # . /lava-3509147/environment/lava-350914=
7/bin/lava-test-runner /lava-3509147/1
    2023-04-18T19:14:47.054351  =

    2023-04-18T19:14:47.059243  / # /lava-3509147/bin/lava-test-runner /lav=
a-3509147/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/643eeca8237f6548a02e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eeca8237f6548a02e85eb
        failing since 91 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-18T19:16:43.348611  <8>[   15.327491] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3509177_1.5.2.4.1>
    2023-04-18T19:16:43.458891  / # #
    2023-04-18T19:16:43.561931  export SHELL=3D/bin/sh
    2023-04-18T19:16:43.562813  #
    2023-04-18T19:16:43.664753  / # export SHELL=3D/bin/sh. /lava-3509177/e=
nvironment
    2023-04-18T19:16:43.665225  =

    2023-04-18T19:16:43.766585  / # . /lava-3509177/environment/lava-350917=
7/bin/lava-test-runner /lava-3509177/1
    2023-04-18T19:16:43.767723  =

    2023-04-18T19:16:43.772282  / # /lava-3509177/bin/lava-test-runner /lav=
a-3509177/1
    2023-04-18T19:16:43.865043  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643eed246dbb9781852e866b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eed246dbb9781852e8670
        failing since 91 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-18T19:18:48.691059  <8>[   14.921860] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3509191_1.5.2.4.1>
    2023-04-18T19:18:48.800415  / # #
    2023-04-18T19:18:48.903824  export SHELL=3D/bin/sh
    2023-04-18T19:18:48.904817  #
    2023-04-18T19:18:49.006944  / # export SHELL=3D/bin/sh. /lava-3509191/e=
nvironment
    2023-04-18T19:18:49.007909  =

    2023-04-18T19:18:49.110183  / # . /lava-3509191/environment/lava-350919=
1/bin/lava-test-runner /lava-3509191/1
    2023-04-18T19:18:49.111809  =

    2023-04-18T19:18:49.116695  / # /lava-3509191/bin/lava-test-runner /lav=
a-3509191/1
    2023-04-18T19:18:49.208645  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643eefb7124bf7ae032e8680

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eefb7124bf7ae032e8685
        failing since 91 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-18T19:29:34.572301  <8>[   23.655018] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3509315_1.5.2.4.1>
    2023-04-18T19:29:34.684167  / # #
    2023-04-18T19:29:34.787789  export SHELL=3D/bin/sh
    2023-04-18T19:29:34.788899  #
    2023-04-18T19:29:34.891286  / # export SHELL=3D/bin/sh. /lava-3509315/e=
nvironment
    2023-04-18T19:29:34.892326  =

    2023-04-18T19:29:34.994683  / # . /lava-3509315/environment/lava-350931=
5/bin/lava-test-runner /lava-3509315/1
    2023-04-18T19:29:34.996528  =

    2023-04-18T19:29:35.001574  / # /lava-3509315/bin/lava-test-runner /lav=
a-3509315/1
    2023-04-18T19:29:35.094056  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/643eed256dbb9781852e8683

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643eed256dbb978=
1852e868a
        failing since 46 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-04-18T19:18:39.227716  kern  :alert : Register r6 information: NUL=
L pointer
    2023-04-18T19:18:39.272801  kern  :alert : Register r7 information: non=
-paged memory
    2023-04-18T19:18:39.273106  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4cdc200 pointer offset 4 size 512
    2023-04-18T19:18:39.273329  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-18T19:18:39.273530  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-18T19:18:39.273739  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e2000 allocated at load_module+0x898/0=
x1b10
    2023-04-18T19:18:39.275920  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-18T19:18:39.365414  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-18T19:18:39.365672  kern  :emerg : Process udevd (pid: 69, stac=
k limit =3D 0x1b05e7fc)
    2023-04-18T19:18:39.365870  kern  :emerg : Stack: (0xc8909cf8 to 0xc890=
a000) =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643eed256dbb978=
1852e868b
        failing since 449 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-04-18T19:18:39.181299  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-04-18T19:18:39.181555  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-04-18T19:18:39.181738  kern  :alert : 8<--- cut here ---
    2023-04-18T19:18:39.181888  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-04-18T19:18:39.182034  kern  :alert : [00000060] *pgd=3Dc4a22831, =
*pte=3D00000000, *ppte=3D00000000
    2023-04-18T19:18:39.182201  kern  :alert : Register r0 information: non=
-paged memory
    2023-04-18T19:18:39.224610  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8908000 allocated at kernel_clone+0x98/0x=
3a0
    2023-04-18T19:18:39.224856  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-18T19:18:39.225107  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-18T19:18:39.225257  kern  :alert : R<8><LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef1765e41a185f52e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef1765e41a185f52e8=
5f9
        failing since 113 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643eed698ca1d246592e8692

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
43eed698ca1d246592e86a1
        new failure (last pass: v6.3-rc7-140-g88d3973741d7)

    2023-04-18T19:19:53.014631  /usr/bin/tpm2_getcap

    2023-04-18T19:20:03.229159  /lava-10035094/1/../bin/lava-test-case<8>[ =
  21.309100] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dtpm-chip-is-online RESULT=
=3Dfail>

    2023-04-18T19:20:03.229794  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643eedded4d6df9a242e864a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eedded4d6df9a242e864f
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T19:21:41.252856  + set +x

    2023-04-18T19:21:41.258831  <8>[   12.978938] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10034685_1.4.2.3.1>

    2023-04-18T19:21:41.365009  / # #

    2023-04-18T19:21:41.465900  export SHELL=3D/bin/sh

    2023-04-18T19:21:41.466112  #

    2023-04-18T19:21:41.567052  / # export SHELL=3D/bin/sh. /lava-10034685/=
environment

    2023-04-18T19:21:41.567232  =


    2023-04-18T19:21:41.668166  / # . /lava-10034685/environment/lava-10034=
685/bin/lava-test-runner /lava-10034685/1

    2023-04-18T19:21:41.668478  =


    2023-04-18T19:21:41.673802  / # /lava-10034685/bin/lava-test-runner /la=
va-10034685/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643eee7d9c6abde8462e867e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eee7d9c6abde8462e8683
        failing since 21 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:24:31.877830  + set +x

    2023-04-18T19:24:31.884489  <8>[   10.839069] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10035077_1.4.2.3.1>

    2023-04-18T19:24:31.989385  / # #

    2023-04-18T19:24:32.090470  export SHELL=3D/bin/sh

    2023-04-18T19:24:32.090690  #

    2023-04-18T19:24:32.191623  / # export SHELL=3D/bin/sh. /lava-10035077/=
environment

    2023-04-18T19:24:32.191853  =


    2023-04-18T19:24:32.292744  / # . /lava-10035077/environment/lava-10035=
077/bin/lava-test-runner /lava-10035077/1

    2023-04-18T19:24:32.293013  =


    2023-04-18T19:24:32.297511  / # /lava-10035077/bin/lava-test-runner /la=
va-10035077/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643eef7e4e9d668a522e85f7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eef7e4e9d668a522e85fc
        failing since 21 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:28:47.786036  + set +x

    2023-04-18T19:28:47.792370  <8>[   10.724512] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10035265_1.4.2.3.1>

    2023-04-18T19:28:47.897104  / # #

    2023-04-18T19:28:47.998169  export SHELL=3D/bin/sh

    2023-04-18T19:28:47.998370  #

    2023-04-18T19:28:48.099312  / # export SHELL=3D/bin/sh. /lava-10035265/=
environment

    2023-04-18T19:28:48.099536  =


    2023-04-18T19:28:48.200432  / # . /lava-10035265/environment/lava-10035=
265/bin/lava-test-runner /lava-10035265/1

    2023-04-18T19:28:48.200767  =


    2023-04-18T19:28:48.205056  / # /lava-10035265/bin/lava-test-runner /la=
va-10035265/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643eec6647024b5d132e8616

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eec6647024b5d132e861b
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T19:15:39.659227  + set +x

    2023-04-18T19:15:39.665809  <8>[   14.357203] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10034687_1.4.2.3.1>

    2023-04-18T19:15:39.771920  / # #

    2023-04-18T19:15:39.874570  export SHELL=3D/bin/sh

    2023-04-18T19:15:39.874919  #

    2023-04-18T19:15:39.975873  / # export SHELL=3D/bin/sh. /lava-10034687/=
environment

    2023-04-18T19:15:39.976099  =


    2023-04-18T19:15:40.076969  / # . /lava-10034687/environment/lava-10034=
687/bin/lava-test-runner /lava-10034687/1

    2023-04-18T19:15:40.077276  =


    2023-04-18T19:15:40.082607  / # /lava-10034687/bin/lava-test-runner /la=
va-10034687/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643eed638ca1d246592e8627

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eed638ca1d246592e862c
        failing since 21 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:19:42.815367  + set +x

    2023-04-18T19:19:42.821961  <8>[   10.190263] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10035088_1.4.2.3.1>

    2023-04-18T19:19:42.926610  / # #

    2023-04-18T19:19:43.027575  export SHELL=3D/bin/sh

    2023-04-18T19:19:43.027776  #

    2023-04-18T19:19:43.128685  / # export SHELL=3D/bin/sh. /lava-10035088/=
environment

    2023-04-18T19:19:43.128886  =


    2023-04-18T19:19:43.229825  / # . /lava-10035088/environment/lava-10035=
088/bin/lava-test-runner /lava-10035088/1

    2023-04-18T19:19:43.230113  =


    2023-04-18T19:19:43.235235  / # /lava-10035088/bin/lava-test-runner /la=
va-10035088/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643eef6b9f9a08f07b2e85f0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eef6b9f9a08f07b2e85f5
        failing since 21 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:28:23.071052  <8>[   10.465498] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10035264_1.4.2.3.1>

    2023-04-18T19:28:23.074026  + set +x

    2023-04-18T19:28:23.175930  #

    2023-04-18T19:28:23.176258  =


    2023-04-18T19:28:23.277275  / # #export SHELL=3D/bin/sh

    2023-04-18T19:28:23.277497  =


    2023-04-18T19:28:23.378424  / # export SHELL=3D/bin/sh. /lava-10035264/=
environment

    2023-04-18T19:28:23.378634  =


    2023-04-18T19:28:23.479580  / # . /lava-10035264/environment/lava-10035=
264/bin/lava-test-runner /lava-10035264/1

    2023-04-18T19:28:23.479903  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643eeaa50c84ef9bb32e860c

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eeaa50c84ef9bb32e8611
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T19:08:00.113705  + set +x

    2023-04-18T19:08:00.120188  <8>[   14.696987] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10034661_1.4.2.3.1>

    2023-04-18T19:08:00.222338  =


    2023-04-18T19:08:00.323446  / # #export SHELL=3D/bin/sh

    2023-04-18T19:08:00.323641  =


    2023-04-18T19:08:00.424375  / # export SHELL=3D/bin/sh. /lava-10034661/=
environment

    2023-04-18T19:08:00.424573  =


    2023-04-18T19:08:00.525537  / # . /lava-10034661/environment/lava-10034=
661/bin/lava-test-runner /lava-10034661/1

    2023-04-18T19:08:00.525873  =


    2023-04-18T19:08:00.530970  / # /lava-10034661/bin/lava-test-runner /la=
va-10034661/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643eed628ca1d246592e861c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eed628ca1d246592e8621
        failing since 21 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:19:41.427355  + set<8>[   11.328740] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10035075_1.4.2.3.1>

    2023-04-18T19:19:41.427460   +x

    2023-04-18T19:19:41.532637  / # #

    2023-04-18T19:19:41.633615  export SHELL=3D/bin/sh

    2023-04-18T19:19:41.633818  #

    2023-04-18T19:19:41.734707  / # export SHELL=3D/bin/sh. /lava-10035075/=
environment

    2023-04-18T19:19:41.734915  =


    2023-04-18T19:19:41.835854  / # . /lava-10035075/environment/lava-10035=
075/bin/lava-test-runner /lava-10035075/1

    2023-04-18T19:19:41.836116  =


    2023-04-18T19:19:41.841190  / # /lava-10035075/bin/lava-test-runner /la=
va-10035075/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643eef6fe9aef6ec8d2e8602

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eef6fe9aef6ec8d2e8606
        failing since 21 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:28:37.067480  + set +x<8>[   11.051007] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10035285_1.4.2.3.1>

    2023-04-18T19:28:37.067568  =


    2023-04-18T19:28:37.172404  / # #

    2023-04-18T19:28:37.273410  export SHELL=3D/bin/sh

    2023-04-18T19:28:37.273591  #

    2023-04-18T19:28:37.374502  / # export SHELL=3D/bin/sh. /lava-10035285/=
environment

    2023-04-18T19:28:37.374713  =


    2023-04-18T19:28:37.475660  / # . /lava-10035285/environment/lava-10035=
285/bin/lava-test-runner /lava-10035285/1

    2023-04-18T19:28:37.476029  =


    2023-04-18T19:28:37.481018  / # /lava-10035285/bin/lava-test-runner /la=
va-10035285/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643eebb5ac4e0135912e8638

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eebb5ac4e0135912e863d
        failing since 78 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-18T19:12:28.646888  + set +x
    2023-04-18T19:12:28.647212  [   12.088431] <LAVA_SIGNAL_ENDRUN 0_dmesg =
929890_1.5.2.3.1>
    2023-04-18T19:12:28.753640  / # #
    2023-04-18T19:12:28.855324  export SHELL=3D/bin/sh
    2023-04-18T19:12:28.855785  #
    2023-04-18T19:12:28.957076  / # export SHELL=3D/bin/sh. /lava-929890/en=
vironment
    2023-04-18T19:12:28.957561  =

    2023-04-18T19:12:29.058891  / # . /lava-929890/environment/lava-929890/=
bin/lava-test-runner /lava-929890/1
    2023-04-18T19:12:29.059710  =

    2023-04-18T19:12:29.062783  / # /lava-929890/bin/lava-test-runner /lava=
-929890/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643eec0575736e6a7f2e85f0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eec0575736e6a7f2e85f5
        failing since 78 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-18T19:13:49.789668  + set +x
    2023-04-18T19:13:49.789856  [   13.013797] <LAVA_SIGNAL_ENDRUN 0_dmesg =
929897_1.5.2.3.1>
    2023-04-18T19:13:49.898169  / # #
    2023-04-18T19:13:49.999984  export SHELL=3D/bin/sh
    2023-04-18T19:13:50.000437  #
    2023-04-18T19:13:50.101672  / # export SHELL=3D/bin/sh. /lava-929897/en=
vironment
    2023-04-18T19:13:50.102147  =

    2023-04-18T19:13:50.203526  / # . /lava-929897/environment/lava-929897/=
bin/lava-test-runner /lava-929897/1
    2023-04-18T19:13:50.204171  =

    2023-04-18T19:13:50.207464  / # /lava-929897/bin/lava-test-runner /lava=
-929897/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/643eede53bf3df8ee22e8614

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eede53bf3df8ee22e8619
        failing since 78 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-18T19:21:50.659981  + set +x
    2023-04-18T19:21:50.660141  [   13.036826] <LAVA_SIGNAL_ENDRUN 0_dmesg =
929914_1.5.2.3.1>
    2023-04-18T19:21:50.766920  / # #
    2023-04-18T19:21:50.868605  export SHELL=3D/bin/sh
    2023-04-18T19:21:50.869074  #
    2023-04-18T19:21:50.970390  / # export SHELL=3D/bin/sh. /lava-929914/en=
vironment
    2023-04-18T19:21:50.971017  =

    2023-04-18T19:21:51.072694  / # . /lava-929914/environment/lava-929914/=
bin/lava-test-runner /lava-929914/1
    2023-04-18T19:21:51.073302  =

    2023-04-18T19:21:51.076682  / # /lava-929914/bin/lava-test-runner /lava=
-929914/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643eef8ae415eacde02e85f6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eef8ae415eacde02e85fb
        failing since 78 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-18T19:28:49.415376  + set +x
    2023-04-18T19:28:49.415536  [   12.814780] <LAVA_SIGNAL_ENDRUN 0_dmesg =
929938_1.5.2.3.1>
    2023-04-18T19:28:49.523239  / # #
    2023-04-18T19:28:49.624792  export SHELL=3D/bin/sh
    2023-04-18T19:28:49.625181  #
    2023-04-18T19:28:49.726359  / # export SHELL=3D/bin/sh. /lava-929938/en=
vironment
    2023-04-18T19:28:49.726765  =

    2023-04-18T19:28:49.827976  / # . /lava-929938/environment/lava-929938/=
bin/lava-test-runner /lava-929938/1
    2023-04-18T19:28:49.828554  =

    2023-04-18T19:28:49.832187  / # /lava-929938/bin/lava-test-runner /lava=
-929938/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643eefda7ca299258f2e85eb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eefda7ca299258f2e85f0
        failing since 78 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-04-18T19:30:13.708775  + set +x
    2023-04-18T19:30:13.708948  [   16.319242] <LAVA_SIGNAL_ENDRUN 0_dmesg =
929949_1.5.2.3.1>
    2023-04-18T19:30:13.816649  / # #
    2023-04-18T19:30:13.918123  export SHELL=3D/bin/sh
    2023-04-18T19:30:13.918510  #
    2023-04-18T19:30:14.019741  / # export SHELL=3D/bin/sh. /lava-929949/en=
vironment
    2023-04-18T19:30:14.020194  =

    2023-04-18T19:30:14.121527  / # . /lava-929949/environment/lava-929949/=
bin/lava-test-runner /lava-929949/1
    2023-04-18T19:30:14.122157  =

    2023-04-18T19:30:14.125438  / # /lava-929949/bin/lava-test-runner /lava=
-929949/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643eeb8e66033772262e85fc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eeb8e66033772262e8601
        new failure (last pass: v6.3-rc7-140-g88d3973741d7)

    2023-04-18T19:11:55.663163  + set[   14.480331] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 929889_1.5.2.3.1>
    2023-04-18T19:11:55.663549   +x
    2023-04-18T19:11:55.770685  / # #
    2023-04-18T19:11:55.872432  export SHELL=3D/bin/sh
    2023-04-18T19:11:55.872883  #
    2023-04-18T19:11:55.974102  / # export SHELL=3D/bin/sh. /lava-929889/en=
vironment
    2023-04-18T19:11:55.974620  =

    2023-04-18T19:11:56.076134  / # . /lava-929889/environment/lava-929889/=
bin/lava-test-runner /lava-929889/1
    2023-04-18T19:11:56.076822  =

    2023-04-18T19:11:56.079768  / # /lava-929889/bin/lava-test-runner /lava=
-929889/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643eebdec2f2cabad32e8652

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eebdec2f2cabad32e8657
        new failure (last pass: v6.3-rc7-140-g88d3973741d7)

    2023-04-18T19:13:10.137451  + set[   15.137331] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 929900_1.5.2.3.1>
    2023-04-18T19:13:10.137615   +x
    2023-04-18T19:13:10.243473  / # #
    2023-04-18T19:13:10.345154  export SHELL=3D/bin/sh
    2023-04-18T19:13:10.345625  #
    2023-04-18T19:13:10.446821  / # export SHELL=3D/bin/sh. /lava-929900/en=
vironment
    2023-04-18T19:13:10.447248  =

    2023-04-18T19:13:10.548534  / # . /lava-929900/environment/lava-929900/=
bin/lava-test-runner /lava-929900/1
    2023-04-18T19:13:10.549201  =

    2023-04-18T19:13:10.552141  / # /lava-929900/bin/lava-test-runner /lava=
-929900/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef1a9f0f5be412a2e8647

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6u=
l-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6u=
l-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643ef1a9f0f5be412a2e864a
        failing since 103 days (last pass: v6.1-rc4-339-g185da88d03ed, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-18T19:38:00.077003  + set +x
    2023-04-18T19:38:00.078142  <8>[   57.549677] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1202765_1.5.2.4.1>
    2023-04-18T19:38:00.186993  / # #
    2023-04-18T19:38:01.346150  export SHELL=3D/bin/sh
    2023-04-18T19:38:01.351888  #
    2023-04-18T19:38:02.899408  / # export SHELL=3D/bin/sh. /lava-1202765/e=
nvironment
    2023-04-18T19:38:02.905085  =

    2023-04-18T19:38:05.727309  / # . /lava-1202765/environment/lava-120276=
5/bin/lava-test-runner /lava-1202765/1
    2023-04-18T19:38:05.733374  =

    2023-04-18T19:38:05.733669  / # /lava-1202765/bin/lava-test-runner /lav=
a-1202765/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643eee4e92b9d1425e2e862c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eee4e92b9d1425e2e862f
        failing since 103 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-18T19:23:23.506093  / # #
    2023-04-18T19:23:24.663802  export SHELL=3D/bin/sh
    2023-04-18T19:23:24.669191  #
    2023-04-18T19:23:26.214321  / # export SHELL=3D/bin/sh. /lava-1202764/e=
nvironment
    2023-04-18T19:23:26.219723  =

    2023-04-18T19:23:29.037487  / # . /lava-1202764/environment/lava-120276=
4/bin/lava-test-runner /lava-1202764/1
    2023-04-18T19:23:29.043128  =

    2023-04-18T19:23:29.047066  / # /lava-1202764/bin/lava-test-runner /lav=
a-1202764/1
    2023-04-18T19:23:29.137142  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T19:23:29.137565  + cd /lava-1202764/1/tests/1_bootrr =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef1d39df0986c4b2e8651

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643ef1d39df0986c4b2e8654
        failing since 103 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-18T19:38:43.477856  + set +x<8>[   67.064032] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1202766_1.5.2.4.1>
    2023-04-18T19:38:43.478158  =

    2023-04-18T19:38:43.587335  / # #
    2023-04-18T19:38:44.747356  export SHELL=3D/bin/sh
    2023-04-18T19:38:44.753038  #
    2023-04-18T19:38:44.753358  / # export SHELL=3D/bin/sh
    2023-04-18T19:38:46.300042  / # . /lava-1202766/environment
    2023-04-18T19:38:49.125736  /lava-1202766/bin/lava-test-runner /lava-12=
02766/1
    2023-04-18T19:38:49.131605  . /lava-1202766/environment
    2023-04-18T19:38:49.131887  / # /lava-1202766/bin/lava-test-runner /lav=
a-1202766/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643eebb92806c3ccd92e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eebb92806c3ccd92e8=
609
        failing since 353 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef4577150a733b52e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-ubo=
ot.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-ubo=
ot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef4577150a733b52e8=
5e7
        new failure (last pass: v6.3-rc7-140-g88d3973741d7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643eeaac0c84ef9bb32e865b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eeaac0c84ef9bb32e8660
        failing since 18 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-18T19:08:19.926170  + set +x

    2023-04-18T19:08:19.929657  <8>[   13.704296] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10034670_1.4.2.3.1>

    2023-04-18T19:08:20.035216  / # #

    2023-04-18T19:08:20.136240  export SHELL=3D/bin/sh

    2023-04-18T19:08:20.136495  #

    2023-04-18T19:08:20.237463  / # export SHELL=3D/bin/sh. /lava-10034670/=
environment

    2023-04-18T19:08:20.237693  =


    2023-04-18T19:08:20.338690  / # . /lava-10034670/environment/lava-10034=
670/bin/lava-test-runner /lava-10034670/1

    2023-04-18T19:08:20.339031  =


    2023-04-18T19:08:20.343354  / # /lava-10034670/bin/lava-test-runner /la=
va-10034670/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643eed7c9ce27f6bb62e866f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eed7c9ce27f6bb62e8674
        failing since 21 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:20:04.269876  <8>[   11.730020] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10035098_1.4.2.3.1>

    2023-04-18T19:20:04.374994  / # #

    2023-04-18T19:20:04.475985  export SHELL=3D/bin/sh

    2023-04-18T19:20:04.476172  #

    2023-04-18T19:20:04.576856  / # export SHELL=3D/bin/sh. /lava-10035098/=
environment

    2023-04-18T19:20:04.577065  =


    2023-04-18T19:20:04.678077  / # . /lava-10035098/environment/lava-10035=
098/bin/lava-test-runner /lava-10035098/1

    2023-04-18T19:20:04.678499  =


    2023-04-18T19:20:04.683405  / # /lava-10035098/bin/lava-test-runner /la=
va-10035098/1

    2023-04-18T19:20:04.690198  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643eef6d7fcecdec152e85f0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eef6d7fcecdec152e85f5
        failing since 21 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-18T19:28:25.229257  <8>[   11.981156] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10035279_1.4.2.3.1>

    2023-04-18T19:28:25.333753  / # #

    2023-04-18T19:28:25.434661  export SHELL=3D/bin/sh

    2023-04-18T19:28:25.434893  #

    2023-04-18T19:28:25.535818  / # export SHELL=3D/bin/sh. /lava-10035279/=
environment

    2023-04-18T19:28:25.536038  =


    2023-04-18T19:28:25.636733  / # . /lava-10035279/environment/lava-10035=
279/bin/lava-test-runner /lava-10035279/1

    2023-04-18T19:28:25.637040  =


    2023-04-18T19:28:25.641391  / # /lava-10035279/bin/lava-test-runner /la=
va-10035279/1

    2023-04-18T19:28:25.648229  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0a5101fe16eff2e861d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0a5101fe16eff2e8=
61e
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0b6b2ca6f62da2e861f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0b6b2ca6f62da2e8=
620
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0e0766203e0952e860b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0e0766203e0952e8=
60c
        failing since 57 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0b1b2ca6f62da2e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0b1b2ca6f62da2e8=
611
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/643eebb749453a08832e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-=
s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-=
s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eebb849453a08832e8=
5ed
        new failure (last pass: v6.3-rc7-140-g88d3973741d7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643eed216dbb9781852e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eed216dbb9781852e8=
5f4
        new failure (last pass: v6.3-rc7-140-g88d3973741d7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/643eee7a51645d04102e8622

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eee7a51645d04102e8=
623
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef18a5e41a185f52e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef18a5e41a185f52e8=
628
        failing since 70 days (last pass: v6.2-rc6-351-gf42837eac380f, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0b6b2ca6f62da2e8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0b6b2ca6f62da2e8=
631
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef14ce7f677ff842e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef14ce7f677ff842e8=
606
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef1382a65a4f54b2e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef1382a65a4f54b2e8=
619
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0b571e81ab08a2e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0b571e81ab08a2e8=
602
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0a4101fe16eff2e8614

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0a4101fe16eff2e8=
615
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0ec11689a51802e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0ec11689a51802e8=
5fe
        failing since 84 days (last pass: v6.2-rc5-157-g1f16e03afb18, first=
 fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/643eed3d160934499a2e85ea

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/643=
eed3d160934499a2e863a
        failing since 55 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-04-18T19:19:17.041040  /lava-10034975/1/../bin/lava-test-case
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/643eed3e160934499a2e8688
        failing since 50 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-18T19:19:14.155891  /lava-10034975/1/../bin/lava-test-case

    2023-04-18T19:19:14.165515  <8>[   20.571053] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/643eed3e160934499a2e8689
        failing since 50 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-18T19:19:13.130011  /lava-10034975/1/../bin/lava-test-case

    2023-04-18T19:19:13.136628  <8>[   19.543130] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0d6cb282b519f2e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0d6cb282b519f2e8=
5ff
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643eee455615cf9a8b2e8675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eee455615cf9a8b2e8=
676
        new failure (last pass: v6.3-rc7-140-g88d3973741d7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0df11689a51802e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0df11689a51802e8=
5ea
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643ee94c4090e498342e8623

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ee94c4090e498342e8=
624
        failing since 188 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef63b0c9fb881e02e861d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef63b0c9fb881e02e8=
61e
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643efa38ad9ddbb5312e861f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linar=
o-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linar=
o-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643efa38ad9ddbb5312e8=
620
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef13c406e180e222e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef13c406e180e222e8=
5e9
        new failure (last pass: v6.3-rc7-140-g88d3973741d7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0d9e686250cff2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0d9e686250cff2e8=
5f8
        new failure (last pass: v6.3-rc7-140-g88d3973741d7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef150c5ea5b473a2e8621

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef150c5ea5b473a2e8=
622
        new failure (last pass: v6.3-rc7-140-g88d3973741d7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0b0b2ca6f62da2e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0b0b2ca6f62da2e8=
5f5
        new failure (last pass: v6.3-rc7-140-g88d3973741d7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643eeb759f40b983aa2e8663

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643eeb759f40b98=
3aa2e866b
        failing since 0 day (last pass: v6.3-rc6-279-g281ec23cca3f, first f=
ail: v6.3-rc7-140-g88d3973741d7)
        1 lines

    2023-04-18T19:11:27.252284  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 3f300f78, epc =3D=3D 801ff9d8, ra =3D=
=3D 8020239c
    2023-04-18T19:11:27.252543  =


    2023-04-18T19:11:27.295083  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-04-18T19:11:27.295352  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643eec6181a9e295b22e865b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eec6181a9e295b22e8=
65c
        failing since 5 days (last pass: v6.3-rc6-158-g254ff7648cb9, first =
fail: v6.3-rc6-249-g122e82851461) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0121072cb41dd2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0121072cb41dd2e8=
5e8
        failing since 124 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643eec6781a9e295b22e8681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eec6781a9e295b22e8=
682
        failing since 124 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef114c9c21ac4ee2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef114c9c21ac4ee2e8=
5e8
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0b4b2ca6f62da2e8619

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0b4b2ca6f62da2e8=
61a
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0c575dba935452e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0c575dba935452e8=
5fa
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef0f25cc749e8a92e862c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef0f25cc749e8a92e8=
62d
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef11b2416ed49722e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef11b2416ed49722e8=
606
        failing since 70 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/643ef15958669b3c2e2e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ef15958669b3c2e2e8=
5f1
        failing since 69 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643eebcac6d3fabb762e85f2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eebcac6d3fabb762e85f7
        failing since 76 days (last pass: v6.0-12387-ge54e01f1826aa, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-04-18T19:12:44.324020  <8>[    9.393957] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3509053_1.5.2.4.1>
    2023-04-18T19:12:44.443414  / # #
    2023-04-18T19:12:44.548924  export SHELL=3D/bin/sh
    2023-04-18T19:12:44.550513  #
    2023-04-18T19:12:44.653827  / # export SHELL=3D/bin/sh. /lava-3509053/e=
nvironment
    2023-04-18T19:12:44.655364  =

    2023-04-18T19:12:44.758784  / # . /lava-3509053/environment/lava-350905=
3/bin/lava-test-runner /lava-3509053/1
    2023-04-18T19:12:44.761415  =

    2023-04-18T19:12:44.769107  / # /lava-3509053/bin/lava-test-runner /lav=
a-3509053/1
    2023-04-18T19:12:44.865029  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643eec065a92469cc92e85ef

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc7-14=
7-g6ba2ee0e9acd/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643eec065a92469cc92e85f4
        failing since 46 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-04-18T19:13:53.526066  <8>[    9.488512] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3509048_1.5.2.4.1>
    2023-04-18T19:13:53.645423  / # #
    2023-04-18T19:13:53.750977  export SHELL=3D/bin/sh
    2023-04-18T19:13:53.752486  #
    2023-04-18T19:13:53.855756  / # export SHELL=3D/bin/sh. /lava-3509048/e=
nvironment
    2023-04-18T19:13:53.857283  =

    2023-04-18T19:13:53.960729  / # . /lava-3509048/environment/lava-350904=
8/bin/lava-test-runner /lava-3509048/1
    2023-04-18T19:13:53.963455  =

    2023-04-18T19:13:53.970314  / # /lava-3509048/bin/lava-test-runner /lav=
a-3509048/1
    2023-04-18T19:13:54.099926  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
