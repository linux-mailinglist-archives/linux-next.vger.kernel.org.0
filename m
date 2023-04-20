Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 181E66E873F
	for <lists+linux-next@lfdr.de>; Thu, 20 Apr 2023 03:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjDTBME (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Apr 2023 21:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjDTBMC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Apr 2023 21:12:02 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD26749DE
        for <linux-next@vger.kernel.org>; Wed, 19 Apr 2023 18:11:37 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63b51fd2972so432059b3a.3
        for <linux-next@vger.kernel.org>; Wed, 19 Apr 2023 18:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681953097; x=1684545097;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IAfhUYQWdAIvee7WOKlbFwAiXb4yZAmiMtuhtVGJix4=;
        b=IUv5zSD8ZQIHsN4WT5Z7rn1Qo+4Em7HPkQdKrU61vJs3PwYt6qZu2t4NRjAd8tldCF
         F09M+I64XiJmbTNqkTpEiBd+tKUi9lmAh2Qgnqi4JyPntzZeGJ6CesPfyH8qagod3odd
         T2N9noOZCTy9gRcogGWnHDFpr+bqaNT4vTm1Tzc7m63RX4MHteGuQxBv5E8x1D0PXcSZ
         BMQwJwgY1OmBjhKPXYj4nn1njweRHXHtiT4JFjD0GTHKS6/1JkDmII9Au25XIsNIOo8t
         9xr7hcI+8o0n1T9dvVsmqaY+9PFu62YmlTTz+tXPxp5VwAYEFNntlwMM5ajFn33fsIh7
         gUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681953097; x=1684545097;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAfhUYQWdAIvee7WOKlbFwAiXb4yZAmiMtuhtVGJix4=;
        b=ar6R3X9A0efl5PmFNzaHMVPUwXRLM7sjkr3FB+ZSYRFOnwQ2/Qk9WWrMk+uG1wucc7
         Bpc55dtjG+KfwCu2eJTqNQtgkpL61Cqq+UJHSik+B5zLTp6NNxSQA2J2zHUHi8cdfboj
         YWgmb/LcN9yy/iX4JTGEN20j25bcgEHmC+8A3lxw7WZpVqBmtm2xFETlZfLgfTec79Ry
         4R+xEaRdFiKg2ovzIcwfgvn+YbssE78VeE9qv/rJvjuKHDl2Sz4mj2Nbtaaa4yRNoFoW
         Sy+XuiQw6vDdu8eK8V5dhUdEkAJErST5BkefROaAkUOr7jzI0C+fka2uWBKgqxVXKFgt
         iXmw==
X-Gm-Message-State: AAQBX9eXWwOHTG7Nfr0rfuq7ZsdDdWsCKEu7sjqAmyLx7AEZosXMeNaI
        DF3hIuVIyvQxxwnO3NGUgUTxlvpACHnTm8yUbb+Obp74
X-Google-Smtp-Source: AKy350biCtk5D/IrvgoBy1yfHjrYe5MVF9/1pzTCBIbbwZ1y4gOMBV8nmnxX7LvtucjTupArRgLkig==
X-Received: by 2002:a05:6a20:3ca7:b0:ec:5eb2:a2bb with SMTP id b39-20020a056a203ca700b000ec5eb2a2bbmr605505pzj.61.1681953096101;
        Wed, 19 Apr 2023 18:11:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y4-20020a62ce04000000b006363690dddasm35591pfg.5.2023.04.19.18.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 18:11:35 -0700 (PDT)
Message-ID: <64409147.620a0220.75870.022b@mx.google.com>
Date:   Wed, 19 Apr 2023 18:11:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230419
X-Kernelci-Report-Type: test
Subject: next/master baseline: 695 runs, 50 regressions (next-20230419)
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

next/master baseline: 695 runs, 50 regressions (next-20230419)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre    | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 2          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 2          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+ima                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230419/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230419
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3cdbc01c40e34c57697f8934f2727a88551696be =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6440626091f9e341792e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6440626091f9e341792e8=
610
        failing since 214 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | sama5_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64405a9cc5170b1be02e869d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405a9cc5170b1be02e8=
69e
        failing since 77 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6440596f85744d73b72e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6440596f85744d73b72e8=
5e8
        failing since 22 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644059dc552ebe664c2e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644059dd552ebe664c2e8=
602
        failing since 19 days (last pass: next-20230330, first fail: next-2=
0230331) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64406172369d4cdad92e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64406172369d4cdad92e8=
5f7
        failing since 86 days (last pass: next-20230120, first fail: next-2=
0230123) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405abf89bb58c2ef2e8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405abf89bb58c2ef2e8=
647
        failing since 373 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre    | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405c6ba936ff64822e85e7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-k3-am=
625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-k3-am=
625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64405c6ba936ff64822e85ec
        new failure (last pass: next-20230417)

    2023-04-19T21:25:52.906753  <8>[    7.815983] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3513813_1.5.2.4.1>
    2023-04-19T21:25:53.011296  / # #
    2023-04-19T21:25:53.112944  export SHELL=3D/bin/sh
    2023-04-19T21:25:53.113385  #
    2023-04-19T21:25:53.214635  / # export SHELL=3D/bin/sh. /lava-3513813/e=
nvironment
    2023-04-19T21:25:53.215070  =

    2023-04-19T21:25:53.316313  / # . /lava-3513813/environment/lava-351381=
3/bin/lava-test-runner /lava-3513813/1
    2023-04-19T21:25:53.316965  =

    2023-04-19T21:25:53.322668  / # /lava-3513813/bin/lava-test-runner /lav=
a-3513813/1
    2023-04-19T21:25:53.370725  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64405c089be0e8875d2e860c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64405c089be0e8875d2e8611
        new failure (last pass: next-20230417)

    2023-04-19T21:24:12.450678  <8>[   11.478865] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3513765_1.5.2.4.1>
    2023-04-19T21:24:12.569133  / # #
    2023-04-19T21:24:12.670807  export SHELL=3D/bin/sh
    2023-04-19T21:24:12.671220  #
    2023-04-19T21:24:12.772504  / # export SHELL=3D/bin/sh. /lava-3513765/e=
nvironment
    2023-04-19T21:24:12.772911  =

    2023-04-19T21:24:12.874404  / # . /lava-3513765/environment/lava-351376=
5/bin/lava-test-runner /lava-3513765/1
    2023-04-19T21:24:12.875137  =

    2023-04-19T21:24:12.881775  / # /lava-3513765/bin/lava-test-runner /lav=
a-3513765/1
    2023-04-19T21:24:12.926749  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
k3-am625-sk                  | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405cd2071c3a64dc2e8614

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64405cd2071c3a64dc2e8619
        new failure (last pass: next-20230417)

    2023-04-19T21:27:30.851201  <8>[    7.665147] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3513868_1.5.2.4.1>
    2023-04-19T21:27:30.960979  / # #
    2023-04-19T21:27:31.063342  export SHELL=3D/bin/sh
    2023-04-19T21:27:31.064272  #
    2023-04-19T21:27:31.166302  / # export SHELL=3D/bin/sh. /lava-3513868/e=
nvironment
    2023-04-19T21:27:31.167092  =

    2023-04-19T21:27:31.268902  / # . /lava-3513868/environment/lava-351386=
8/bin/lava-test-runner /lava-3513868/1
    2023-04-19T21:27:31.270197  =

    2023-04-19T21:27:31.282091  / # /lava-3513868/bin/lava-test-runner /lav=
a-3513868/1
    2023-04-19T21:27:31.330516  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405bc6ef94d089dd2e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405bc6ef94d089dd2e8=
5ec
        new failure (last pass: next-20230417) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405c1661c96a20f52e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405c1661c96a20f52e8=
5e7
        new failure (last pass: next-20230417) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6440615857bc7b3c372e8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6440615857bc7b3c372e8=
664
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405b63d4fa7a7de82e860c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405b63d4fa7a7de82e8=
60d
        new failure (last pass: next-20230417) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64405fea729ddfa3482e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405fea729ddfa3482e8=
5ec
        new failure (last pass: next-20230417) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/644062e64a5facf09c2e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644062e64a5facf09c2e8=
619
        new failure (last pass: next-20230417) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64405af4d89be7407d2e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405af4d89be7407d2e8=
609
        failing since 85 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6440615d663ca922592e8600

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6440615d663ca922592e8=
601
        failing since 19 days (last pass: next-20230324, first fail: next-2=
0230331) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64405ae5c4cb74e71d2e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405ae5c4cb74e71d2e8=
628
        failing since 70 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6440615c663ca922592e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6440615c663ca922592e8=
5fe
        failing since 19 days (last pass: next-20230324, first fail: next-2=
0230331) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64405af0d89be7407d2e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405af0d89be7407d2e8=
602
        failing since 70 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8192-asurada-spherion-r0   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/644060f846f43838312e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/644060f846f43838312e8=
5e7
        failing since 5 days (last pass: next-20230411, first fail: v6.3-rc=
6-12018-gd3f2cd248191) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64406094e554b17c4f2e8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64406094e554b17c4f2e8=
652
        failing since 70 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64405f26f00c8264392e86b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405f26f00c8264392e8=
6b3
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64405f938501d6c6a32e8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405f938501d6c6a32e8=
636
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64405f39c65586ba4d2e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405f39c65586ba4d2e8=
5fd
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64405f6b4ffe58a5c22e8614

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405f6b4ffe58a5c22e8=
615
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405bc7ef94d089dd2e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405bc7ef94d089dd2e8=
5f1
        failing since 148 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405aac9037b087f32e861f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405aac9037b087f32e8=
620
        failing since 148 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64405b7e483f54650f2e8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405b7e483f54650f2e8=
635
        failing since 70 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/644063a052e11f3a662e85fa

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/644063a052e11f3=
a662e8651
        failing since 8 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-19T21:56:22.295084  fo:

    2023-04-19T21:56:22.299250  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-19T21:56:22.304254  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-19T21:56:22.308101  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-19T21:56:22.311935  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-19T21:56:22.316802  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-19T21:56:22.320039  kern  :alert : Data abort info:

    2023-04-19T21:56:22.324996  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-19T21:56:22.328234  kern  :alert :   CM =3D 0, WnR =3D 0
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/644063a052e11f3=
a662e8652
        failing since 8 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-19T21:56:22.281684  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-19T21:56:22.294406  kern  :alert : Mem abort in<8>[   19.218251=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64405b979e169c90102e8602

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64405b979e169c9=
0102e8609
        failing since 5 days (last pass: next-20230406, first fail: v6.3-rc=
6-12018-gd3f2cd248191)
        2 lines

    2023-04-19T21:22:18.176254  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP

    2023-04-19T21:22:18.176353  kern  :emerg : Code: 97ec2e87 f9405688 5286=
4a69 72a686c9 (b9400908) =


    2023-04-19T21:22:18.176423  <8>[   21.837331] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-19T21:22:18.176485  + set +x

    2023-04-19T21:22:18.176546  <8>[   21.839072] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10054225_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64405b979e169c9=
0102e860a
        failing since 5 days (last pass: next-20230406, first fail: v6.3-rc=
6-12018-gd3f2cd248191)
        12 lines

    2023-04-19T21:22:18.150304  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-04-19T21:22:18.150441  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-19T21:22:18.150509  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D0000000011bc0800

    2023-04-19T21:22:18.150572  kern  :alert : [0000000000000008] pgd=3D080=
0000014a70003, p4d=3D0800000014a70003, pud=3D0800000014a70003, pmd=3D080000=
00159e0003, pte=3D0000000000000000

    2023-04-19T21:22:18.150634  <8>[   21.813261] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64405a2e0a532fde962e85ec

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64405a2e0a532fd=
e962e85f3
        failing since 8 days (last pass: next-20230406, first fail: next-20=
230411)
        2 lines

    2023-04-19T21:16:18.598412  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-19T21:16:18.598544  kern  :emerg : Code: 97fd2d10 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-19T21:16:18.598610  <8>[   24.003462] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-19T21:16:18.598673  + set +x

    2023-04-19T21:16:18.598733  <8>[   24.005659] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10054173_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64405a2e0a532fd=
e962e85f4
        failing since 8 days (last pass: next-20230406, first fail: next-20=
230411)
        12 lines

    2023-04-19T21:16:18.550899  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-19T21:16:18.550982  kern  :alert : Mem abort info:

    2023-04-19T21:16:18.551048  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-19T21:16:18.551109  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-19T21:16:18.551168  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-19T21:16:18.551225  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-19T21:16:18.551282  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-19T21:16:18.551337  kern  :alert : Data abort info:

    2023-04-19T21:16:18.551391  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-19T21:16:18.551445  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/64405acfecd9bed75f2e85e8

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64405acfecd9bed=
75f2e85ef
        failing since 8 days (last pass: next-20230404, first fail: next-20=
230411)
        2 lines

    2023-04-19T21:18:55.165063  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-19T21:18:55.165624  kern  :emerg : Code: 97fd9110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-19T21:18:55.165964  <8>[   28.448951] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-19T21:18:55.166283  + set +x

    2023-04-19T21:18:55.166590  <8>[   28.451172] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10054188_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64405acfecd9bed=
75f2e85f0
        failing since 8 days (last pass: next-20230404, first fail: next-20=
230411)
        12 lines

    2023-04-19T21:18:55.118223  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-19T21:18:55.118753  kern  :alert : Mem abort info:

    2023-04-19T21:18:55.119087  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-19T21:18:55.119401  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-19T21:18:55.119706  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-19T21:18:55.120003  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-19T21:18:55.120294  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-19T21:18:55.120582  kern  :alert : Data abort info:

    2023-04-19T21:18:55.120865  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-19T21:18:55.121144  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64405c010cecb926502e86c6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64405c010cecb92=
6502e86cd
        failing since 8 days (last pass: next-20230406, first fail: next-20=
230411)
        2 lines

    2023-04-19T21:24:09.868418  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP

    2023-04-19T21:24:09.868907  kern  :emerg : Code: 97eb30be f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-19T21:24:09.869220  <8>[   21.419080] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-19T21:24:09.869540  + set +x

    2023-04-19T21:24:09.869817  <8>[   21.420741] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10054249_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64405c010cecb92=
6502e86ce
        failing since 8 days (last pass: next-20230406, first fail: next-20=
230411)
        12 lines

    2023-04-19T21:24:09.818315  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-19T21:24:09.818812  kern  :alert : Mem abort info:

    2023-04-19T21:24:09.819123  kern  :alert :   ESR =3D 0x0000000096000007

    2023-04-19T21:24:09.819411  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-19T21:24:09.819687  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-19T21:24:09.819959  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-19T21:24:09.820222  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault

    2023-04-19T21:24:09.820482  kern  :alert : Data abort info:

    2023-04-19T21:24:09.820740  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-04-19T21:24:09.820997  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/64405c882417a150f62e8611

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64405c882417a15=
0f62e8618
        failing since 8 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-19T21:26:08.367622  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-19T21:26:08.368166  kern  :emerg : Code: 97fcb510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-19T21:26:08.368513  <8>[   23.996230] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-19T21:26:08.368841  + set +x

    2023-04-19T21:26:08.369151  <8>[   23.998233] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10054266_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64405c882417a15=
0f62e8619
        failing since 8 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-19T21:26:08.342793  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-19T21:26:08.343330  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-19T21:26:08.343675  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000007971b000

    2023-04-19T21:26:08.343999  kern  :alert : [0000000000000008] pgd=3D080=
0000079721003

    2023-04-19T21:26:08.344308  <8>[   23.972972] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6440600c3d7d11ddd72e860b

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6440600c3d7d11d=
dd72e8612
        failing since 8 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-19T21:41:20.808367  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-19T21:41:20.808895  kern  :emerg : Code: 94052110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-19T21:41:20.809239  <8>[   23.400873] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-19T21:41:20.809588  + set +x

    2023-04-19T21:41:20.809902  <8>[   23.402999] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10054530_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6440600c3d7d11d=
dd72e8613
        failing since 8 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-19T21:41:20.782347  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-19T21:41:20.782879  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-19T21:41:20.783220  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000079305000

    2023-04-19T21:41:20.783545  kern  :alert : [0000000000000008] pgd=3D080=
00000792ff003, p4d=3D08000000792ff003, pud=3D08000000792fe003, pmd=3D000000=
0000000000

    2023-04-19T21:41:20.783855  <8>[   23.377172] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64405af2091f8114472e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405af2091f8114472e8=
5f1
        failing since 70 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405eccea40379ac82e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405eccea40379ac82e8=
618
        failing since 1 day (last pass: v6.3-rc6-12018-gd3f2cd248191, first=
 fail: next-20230417) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64406023335ee7b3aa2e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64406023335ee7b3aa2e8=
602
        failing since 1 day (last pass: v6.3-rc6-12018-gd3f2cd248191, first=
 fail: next-20230417) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | clang-17 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405cedd562317e122e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405cedd562317e122e8=
5ed
        failing since 1 day (last pass: v6.3-rc6-12018-gd3f2cd248191, first=
 fail: next-20230417) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405bd66970899a052e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405bd66970899a052e8=
5fd
        new failure (last pass: next-20230418) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64405d481fe35ad7fe2e8664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405d481fe35ad7fe2e8=
665
        failing since 1 day (last pass: v6.3-rc6-12018-gd3f2cd248191, first=
 fail: next-20230417) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64405e557e2894778e2e86a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230419/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64405e557e2894778e2e8=
6a4
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =20
