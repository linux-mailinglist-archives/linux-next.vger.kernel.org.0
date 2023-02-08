Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D1068EAFA
	for <lists+linux-next@lfdr.de>; Wed,  8 Feb 2023 10:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbjBHJRX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Feb 2023 04:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbjBHJQx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Feb 2023 04:16:53 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB6C4742E
        for <linux-next@vger.kernel.org>; Wed,  8 Feb 2023 01:14:47 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id u9so14287087plf.3
        for <linux-next@vger.kernel.org>; Wed, 08 Feb 2023 01:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mDMATs8UZ5ifsFNZfKxSECWWdvfhuRmYbAC/uVAkfOo=;
        b=iKkZ6EWTdfztXARaRC3Hj9GR3PPCFyOx18CcDS3nAmMH6gyF6VJwyWbxUNWglhxayF
         63VIqIwfqzzfQtxGwe8YIb4Hs3JpvaiH+I1V2XooR+67wGMlFbDv6Fc9BvX83btNV5XF
         ozreimCRbAAYhGaELdrxBfL+ud8u5HJBKlH5oo7I+dsXhwWccHQiNzYfzMUgb+XqH9U+
         tZeJpPtjhPv1rfiaIFx+UbzASmYE/H7FZN82Ldfcu+PVRwGavlBUHV0zrGTlLgGbYLgd
         kO9B8eIYFhJbWFq584369A3ZcS4xp01t+vL8n5sWxj+xnhwiYwWip0K8NjnQUtMY9eKE
         tHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDMATs8UZ5ifsFNZfKxSECWWdvfhuRmYbAC/uVAkfOo=;
        b=5ynqA0w4xpy5mZBpavdDkjAM0EWj890BMoE4KO+YNemE9k3JoW4G4mMhlinbWfCO6n
         RTboRASEgX7397cOQ/zfzkYYw+uqj9l5mN6SL7ggp65clCuLA7B7QHBh1pSovVBY+Qt7
         AMrkXosbQRWNJZvFd2OshJjWNSCo1mND/rVZNHgAuwkD+1zwv9bEUDP3gP6qvanLKiOu
         2QONkEAQBXPh0qhh4wUZ+fm9Bqdmz5QdYX/zlAAeiQ/Moz/5YGIkF3JbhLaALO3CBFDk
         DNS+pinqRPhodHMqGGtkEQtyJlCwyj/gCOEJiPb4aH95kOHApZNV26jWKvUU5zswotp8
         q1cQ==
X-Gm-Message-State: AO0yUKWNHaV1S3h8APVJuBob3jKqhbppbOpZrilVwp1M1oXY1tY+p3P4
        jdylAA4Hv7vGjQL+dXK4F+cewfRDRGnITjhUJULJWw==
X-Google-Smtp-Source: AK7set/vAHy69KCBGG9uxCZwE0mVsvU6GmuaoPAbcVOg2yMuNEamlv0xJUMDMyZzti6uNRkYKdrf5w==
X-Received: by 2002:a17:90a:311:b0:231:6e1:3a8a with SMTP id 17-20020a17090a031100b0023106e13a8amr1649857pje.49.1675847681699;
        Wed, 08 Feb 2023 01:14:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s13-20020a63b40d000000b004e8f7f23c4bsm9321752pgf.76.2023.02.08.01.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 01:14:41 -0800 (PST)
Message-ID: <63e36801.630a0220.8956e.edfa@mx.google.com>
Date:   Wed, 08 Feb 2023 01:14:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230208
X-Kernelci-Report-Type: test
Subject: next/master baseline: 772 runs, 103 regressions (next-20230208)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 772 runs, 103 regressions (next-20230208)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =

jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230208/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230208
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      38d2b86a665b5e86371a1a30228bce259aa6c101 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e341b40915356f468c8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e341b40915356f468c8=
634
        failing since 144 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63e32c2a41b1bd78d58c864f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e32c2a41b1bd78d58c8658
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T04:59:06.315352  + set +x
    2023-02-08T04:59:06.319123  <8>[   18.614556] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 275056_1.5.2.4.1>
    2023-02-08T04:59:06.450800  / # #
    2023-02-08T04:59:06.552118  export SHELL=3D/bin/sh
    2023-02-08T04:59:06.552639  #
    2023-02-08T04:59:06.653903  / # export SHELL=3D/bin/sh. /lava-275056/en=
vironment
    2023-02-08T04:59:06.654544  =

    2023-02-08T04:59:06.756250  / # . /lava-275056/environment/lava-275056/=
bin/lava-test-runner /lava-275056/1
    2023-02-08T04:59:06.757109  =

    2023-02-08T04:59:06.763284  / # /lava-275056/bin/lava-test-runner /lava=
-275056/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e334cdf24eba74da8c86e8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e334cdf24eba74da8c86f1
        failing since 20 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-08T05:36:01.684522  <8>[   14.986872] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3306622_1.5.2.4.1>
    2023-02-08T05:36:01.796843  / # #
    2023-02-08T05:36:01.900212  export SHELL=3D/bin/sh
    2023-02-08T05:36:01.901120  <3>[   15.059806] Bluetooth: hci0: command =
0xfc18 tx timeout
    2023-02-08T05:36:01.901898  #
    2023-02-08T05:36:02.003889  / # export SHELL=3D/bin/sh. /lava-3306622/e=
nvironment
    2023-02-08T05:36:02.004774  =

    2023-02-08T05:36:02.106843  / # . /lava-3306622/environment/lava-330662=
2/bin/lava-test-runner /lava-3306622/1
    2023-02-08T05:36:02.108498  =

    2023-02-08T05:36:02.112601  / # /lava-3306622/bin/lava-test-runner /lav=
a-3306622/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3315226e0c3d0a68c8677

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e3315226e0c3d0a68c8680
        failing since 21 days (last pass: next-20221219, first fail: next-2=
0230117)

    2023-02-08T05:21:00.450164  <8>[   14.896895] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3306386_1.5.2.4.1>
    2023-02-08T05:21:00.560763  / # #
    2023-02-08T05:21:00.664108  export SHELL=3D/bin/sh
    2023-02-08T05:21:00.665126  #
    2023-02-08T05:21:00.768041  / # export SHELL=3D/bin/sh. /lava-3306386/e=
nvironment
    2023-02-08T05:21:00.768918  =

    2023-02-08T05:21:00.872740  / # . /lava-3306386/environment/lava-330638=
6/bin/lava-test-runner /lava-3306386/1
    2023-02-08T05:21:00.874632  =

    2023-02-08T05:21:00.879196  / # /lava-3306386/bin/lava-test-runner /lav=
a-3306386/1
    2023-02-08T05:21:00.978940  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e331e2f297e0c3408c86bc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e331e2f297e0c3408c86c5
        failing since 20 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-08T05:23:26.758555  <8>[   16.698289] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3306437_1.5.2.4.1>
    2023-02-08T05:23:26.869670  / # #
    2023-02-08T05:23:26.973405  export SHELL=3D/bin/sh
    2023-02-08T05:23:26.974327  #
    2023-02-08T05:23:27.076241  / # export SHELL=3D/bin/sh. /lava-3306437/e=
nvironment
    2023-02-08T05:23:27.077187  =

    2023-02-08T05:23:27.179312  / # . /lava-3306437/environment/lava-330643=
7/bin/lava-test-runner /lava-3306437/1
    2023-02-08T05:23:27.180714  =

    2023-02-08T05:23:27.185509  / # /lava-3306437/bin/lava-test-runner /lav=
a-3306437/1
    2023-02-08T05:23:27.278132  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e337f75de6c7096e8c8637

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e337f75de6c7096e8c8640
        failing since 20 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-08T05:49:17.002293  <8>[   14.989859] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3306707_1.5.2.4.1>
    2023-02-08T05:49:17.108448  / # #
    2023-02-08T05:49:17.209743  export SHELL=3D/bin/sh
    2023-02-08T05:49:17.210112  #
    2023-02-08T05:49:17.311246  / # export SHELL=3D/bin/sh. /lava-3306707/e=
nvironment
    2023-02-08T05:49:17.311634  =

    2023-02-08T05:49:17.412822  / # . /lava-3306707/environment/lava-330670=
7/bin/lava-test-runner /lava-3306707/1
    2023-02-08T05:49:17.413450  =

    2023-02-08T05:49:17.417848  / # /lava-3306707/bin/lava-test-runner /lav=
a-3306707/1
    2023-02-08T05:49:17.466291  <3>[   15.433235] Bluetooth: hci0: command =
0x0c03 tx timeout =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e333aa689852d30d8c8654

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e333aa689852d30d8c865b
        failing since 33 days (last pass: next-20221125, first fail: next-2=
0230106)

    2023-02-08T05:30:56.852746  [   13.940319] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1154223_1.5.2.4.1>
    2023-02-08T05:30:56.957649  / # #
    2023-02-08T05:30:57.058980  export SHELL=3D/bin/sh
    2023-02-08T05:30:57.059365  #
    2023-02-08T05:30:57.160407  / # export SHELL=3D/bin/sh. /lava-1154223/e=
nvironment
    2023-02-08T05:30:57.160752  =

    2023-02-08T05:30:57.261827  / # . /lava-1154223/environment/lava-115422=
3/bin/lava-test-runner /lava-1154223/1
    2023-02-08T05:30:57.262537  =

    2023-02-08T05:30:57.264312  / # /lava-1154223/bin/lava-test-runner /lav=
a-1154223/1
    2023-02-08T05:30:57.288254  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e33309695d72956c8c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e33309695d72956c8c8=
641
        failing since 15 days (last pass: next-20230120, first fail: next-2=
0230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e33337294c7307ac8c8634

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e33338294c7307ac8c863d
        failing since 8 days (last pass: next-20221206, first fail: next-20=
230130)

    2023-02-08T05:29:09.192733  + set +x
    2023-02-08T05:29:09.192898  [   13.241166] <LAVA_SIGNAL_ENDRUN 0_dmesg =
900881_1.5.2.3.1>
    2023-02-08T05:29:09.300712  / # #
    2023-02-08T05:29:09.402513  export SHELL=3D/bin/sh
    2023-02-08T05:29:09.403151  #
    2023-02-08T05:29:09.504404  / # export SHELL=3D/bin/sh. /lava-900881/en=
vironment
    2023-02-08T05:29:09.504938  =

    2023-02-08T05:29:09.606353  / # . /lava-900881/environment/lava-900881/=
bin/lava-test-runner /lava-900881/1
    2023-02-08T05:29:09.607065  =

    2023-02-08T05:29:09.610898  / # /lava-900881/bin/lava-test-runner /lava=
-900881/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e330666719644c578c863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e330666719644c578c8647
        failing since 8 days (last pass: next-20221206, first fail: next-20=
230130)

    2023-02-08T05:17:09.979517  + set +x
    2023-02-08T05:17:09.979731  [   13.129133] <LAVA_SIGNAL_ENDRUN 0_dmesg =
900871_1.5.2.3.1>
    2023-02-08T05:17:10.087563  / # #
    2023-02-08T05:17:10.189638  export SHELL=3D/bin/sh
    2023-02-08T05:17:10.190014  #
    2023-02-08T05:17:10.291308  / # export SHELL=3D/bin/sh. /lava-900871/en=
vironment
    2023-02-08T05:17:10.291871  =

    2023-02-08T05:17:10.393284  / # . /lava-900871/environment/lava-900871/=
bin/lava-test-runner /lava-900871/1
    2023-02-08T05:17:10.394047  =

    2023-02-08T05:17:10.397164  / # /lava-900871/bin/lava-test-runner /lava=
-900871/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3317e0cbb96fdbd8c8652

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e3317e0cbb96fdbd8c865b
        failing since 8 days (last pass: next-20221206, first fail: next-20=
230130)

    2023-02-08T05:21:49.677363  + set +x
    2023-02-08T05:21:49.677509  [   12.253077] <LAVA_SIGNAL_ENDRUN 0_dmesg =
900875_1.5.2.3.1>
    2023-02-08T05:21:49.784441  / # #
    2023-02-08T05:21:49.886001  export SHELL=3D/bin/sh
    2023-02-08T05:21:49.886451  #
    2023-02-08T05:21:49.987567  / # export SHELL=3D/bin/sh. /lava-900875/en=
vironment
    2023-02-08T05:21:49.988008  =

    2023-02-08T05:21:50.089169  / # . /lava-900875/environment/lava-900875/=
bin/lava-test-runner /lava-900875/1
    2023-02-08T05:21:50.089760  =

    2023-02-08T05:21:50.092789  / # /lava-900875/bin/lava-test-runner /lava=
-900875/1 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e335f212b3288b308c868b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e335f212b3288b308c8694
        failing since 8 days (last pass: next-20221205, first fail: next-20=
230130)

    2023-02-08T05:40:44.552876  + set +x
    2023-02-08T05:40:44.553118  [   12.836930] <LAVA_SIGNAL_ENDRUN 0_dmesg =
900906_1.5.2.3.1>
    2023-02-08T05:40:44.660984  / # #
    2023-02-08T05:40:44.762461  export SHELL=3D/bin/sh
    2023-02-08T05:40:44.763151  #
    2023-02-08T05:40:44.864614  / # export SHELL=3D/bin/sh. /lava-900906/en=
vironment
    2023-02-08T05:40:44.865161  =

    2023-02-08T05:40:44.966635  / # . /lava-900906/environment/lava-900906/=
bin/lava-test-runner /lava-900906/1
    2023-02-08T05:40:44.967285  =

    2023-02-08T05:40:44.971030  / # /lava-900906/bin/lava-test-runner /lava=
-900906/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e335b79973e494aa8c8636

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e335b79973e494aa8c863f
        new failure (last pass: next-20230206)

    2023-02-08T05:39:45.392380  + set[   15.014890] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 900908_1.5.2.3.1>
    2023-02-08T05:39:45.392606   +x
    2023-02-08T05:39:45.498253  / # #
    2023-02-08T05:39:45.600103  export SHELL=3D/bin/sh
    2023-02-08T05:39:45.600722  #
    2023-02-08T05:39:45.702163  / # export SHELL=3D/bin/sh. /lava-900908/en=
vironment
    2023-02-08T05:39:45.702546  =

    2023-02-08T05:39:45.803704  / # . /lava-900908/environment/lava-900908/=
bin/lava-test-runner /lava-900908/1
    2023-02-08T05:39:45.804230  =

    2023-02-08T05:39:45.807391  / # /lava-900908/bin/lava-test-runner /lava=
-900908/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e338236dc2cd7fc28c8682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e338236dc2cd7fc28c8=
683
        failing since 33 days (last pass: next-20221125, first fail: next-2=
0230106) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e330d284c4c654628c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e330d284c4c654628c8=
63f
        failing since 33 days (last pass: next-20221125, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e33359c2a759f23f8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e33359c2a759f23f8c8=
632
        failing since 34 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e334d51227bce4068c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e334d51227bce4068c8=
652
        failing since 33 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e33411eacc5f696d8c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e33411eacc5f696d8c8=
646
        failing since 168 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e33531848fa13aef8c8697

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e33531848fa13aef8c8=
698
        failing since 302 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e32e9c362cdd7ab28c86b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e32e9c362cdd7ab28c8=
6b6
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3344b25d470d8b78c864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3344b25d470d8b78c8=
64c
        new failure (last pass: next-20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63e33381ee101140f78c8674

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e33381ee101140f78c867b
        new failure (last pass: next-20230206)

    2023-02-08T05:30:12.467777  <8>[   22.206954] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 268577_1.5.2.4.1>
    2023-02-08T05:30:12.573184  / # #
    2023-02-08T05:30:12.675119  export SHELL=3D/bin/sh
    2023-02-08T05:30:12.675560  #
    2023-02-08T05:30:12.776892  / # export SHELL=3D/bin/sh. /lava-268577/en=
vironment
    2023-02-08T05:30:12.777321  =

    2023-02-08T05:30:12.878848  / # . /lava-268577/environment/lava-268577/=
bin/lava-test-runner /lava-268577/1
    2023-02-08T05:30:12.879574  =

    2023-02-08T05:30:12.885198  / # /lava-268577/bin/lava-test-runner /lava=
-268577/1
    2023-02-08T05:30:12.953124  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e33381ee101140f78c867f
        new failure (last pass: next-20230206)

    2023-02-08T05:30:15.047410  /lava-268577/1/../bin/lava-test-case
    2023-02-08T05:30:15.047798  <8>[   24.772425] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-08T05:30:15.048025  /lava-268577/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e33381ee101140f78c8681
        new failure (last pass: next-20230206)

    2023-02-08T05:30:16.106548  /lava-268577/1/../bin/lava-test-case
    2023-02-08T05:30:16.106916  <8>[   25.809662] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-08T05:30:16.107168  /lava-268577/1/../bin/lava-test-case
    2023-02-08T05:30:16.107394  <8>[   25.826776] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e33381ee101140f78c8686
        new failure (last pass: next-20230206)

    2023-02-08T05:30:17.179438  /lava-268577/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e33381ee101140f78c8687
        new failure (last pass: next-20230206)

    2023-02-08T05:30:17.183847  <8>[   26.921766] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-08T05:30:18.240762  /lava-268577/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/63e32f5f9faf2224a68c8665

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e32f5f9faf2224a68c866c
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:12:35.992862  / ##
    2023-02-08T05:12:36.094754  export SHELL=3D/bin/sh
    2023-02-08T05:12:36.095174   #
    2023-02-08T05:12:36.196582  / # export SHELL=3D/bin/sh. /lava-268538/en=
vironment
    2023-02-08T05:12:36.197184  =

    2023-02-08T05:12:36.298625  / # . /lava-268538/environment/lava-268538/=
bin/lava-test-runner /lava-268538/1
    2023-02-08T05:12:36.299342  =

    2023-02-08T05:12:36.305449  / # /lava-268538/bin/lava-test-runner /lava=
-268538/1
    2023-02-08T05:12:36.372035  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-08T05:12:36.372354  + <8>[   22.550590] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 268538_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e32f5f9faf2224a68c8670
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:12:38.469793  /lava-268538/1/../bin/lava-test-case
    2023-02-08T05:12:38.470183  <8>[   24.659001] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-08T05:12:38.470536  /lava-268538/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e32f5f9faf2224a68c8672
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:12:39.525035  /lava-268538/1/../bin/lava-test-case
    2023-02-08T05:12:39.525327  <8>[   25.697031] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e32f5f9faf2224a68c8677
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:12:40.600432  /lava-268538/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e32f5f9faf2224a68c8678
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:12:40.603711  <8>[   26.807536] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-08T05:12:41.658109  /lava-268538/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =


  Details:     https://kernelci.org/test/plan/id/63e331ca8d17d4487e8c86e8

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e331ca8d17d4487e8c86ef
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:22:52.353501  / # #
    2023-02-08T05:22:52.455605  export SHELL=3D/bin/sh
    2023-02-08T05:22:52.456105  #
    2023-02-08T05:22:52.557581  / # export SHELL=3D/bin/sh. /lava-268545/en=
vironment
    2023-02-08T05:22:52.558256  =

    2023-02-08T05:22:52.659708  / # . /lava-268545/environment/lava-268545/=
bin/lava-test-runner /lava-268545/1
    2023-02-08T05:22:52.660520  =

    2023-02-08T05:22:52.680442  / # /lava-268545/bin/lava-test-runner /lava=
-268545/1
    2023-02-08T05:22:52.732493  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-08T05:22:52.732824  + <8>[  104.937493] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 268545_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e331ca8d17d4487e8c86f3
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:22:54.827601  /lava-268545/1/../bin/lava-test-case
    2023-02-08T05:22:54.827889  <8>[  107.043726] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-08T05:22:54.828062  /lava-268545/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e331ca8d17d4487e8c86f5
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:22:55.883943  /lava-268545/1/../bin/lava-test-case
    2023-02-08T05:22:55.884277  <8>[  108.081456] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-08T05:22:55.884513  /lava-268545/1/../bin/lava-test-case
    2023-02-08T05:22:55.884739  <8>[  108.098298] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-08T05:22:55.884965  /lava-268545/1/../bin/lava-test-case
    2023-02-08T05:22:55.885184  <8>[  108.116965] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-08T05:22:55.885403  /lava-268545/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e331ca8d17d4487e8c86fa
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:22:56.958813  /lava-268545/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e331ca8d17d4487e8c86fb
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:22:56.961945  <8>[  109.192139] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-08T05:22:58.020247  /lava-268545/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 5          =


  Details:     https://kernelci.org/test/plan/id/63e3322d188f1a9ad78c8698

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e3322d188f1a9ad78c869f
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:24:44.780063  / # #
    2023-02-08T05:24:44.884104  export SHELL=3D/bin/sh
    2023-02-08T05:24:44.884756  #
    2023-02-08T05:24:44.986145  / # export SHELL=3D/bin/sh. /lava-268551/en=
vironment
    2023-02-08T05:24:44.986805  =

    2023-02-08T05:24:45.089208  / # . /lava-268551/environment/lava-268551/=
bin/lava-test-runner /lava-268551/1
    2023-02-08T05:24:45.090081  =

    2023-02-08T05:24:45.103405  / # /lava-268551/bin/lava-test-runner /lava=
-268551/1
    2023-02-08T05:24:45.167931  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-08T05:24:45.168212  + <8>[   22.481434] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 268551_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e3322d188f1a9ad78c86a3
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:24:47.255644  /lava-268551/1/../bin/lava-test-case
    2023-02-08T05:24:47.255948  <8>[   24.586909] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-08T05:24:47.256101  /lava-268551/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e3322d188f1a9ad78c86a5
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:24:48.315756  /lava-268551/1/../bin/lava-test-case
    2023-02-08T05:24:48.316600  <8>[   25.624643] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-08T05:24:48.316865  /lava-268551/1/../bin/lava-test-case
    2023-02-08T05:24:48.317057  <8>[   25.642851] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-08T05:24:48.317299  /lava-268551/1/../bin/lava-test-case
    2023-02-08T05:24:48.317526  <8>[   25.662383] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-08T05:24:48.317775  /lava-268551/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e3322d188f1a9ad78c86aa
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:24:49.389740  /lava-268551/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e3322d188f1a9ad78c86ab
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:24:49.392812  <8>[   26.737423] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-08T05:24:50.445449  /lava-268551/1/../bin/lava-test-case
    2023-02-08T05:24:50.445731  <8>[   27.758641] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-08T05:24:50.445883  /lava-268551/1/../bin/lava-test-case
    2023-02-08T05:24:50.446025  <8>[   27.775738] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-08T05:24:50.446165  /lava-268551/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =


  Details:     https://kernelci.org/test/plan/id/63e33309c2b6ba8a258c8661

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e33309c2b6ba8a258c8668
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:27:44.247010  + set +x
    2023-02-08T05:27:44.250092  <8>[   45.236695][  T187] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 268571_1.5.2.4.1>
    2023-02-08T05:27:44.369445  #
    2023-02-08T05:27:44.471917  / # #export SHELL=3D/bin/sh
    2023-02-08T05:27:44.472379  =

    2023-02-08T05:27:44.573671  / # export SHELL=3D/bin/sh. /lava-268571/en=
vironment
    2023-02-08T05:27:44.574363  =

    2023-02-08T05:27:44.676058  / # . /lava-268571/environment/lava-268571/=
bin/lava-test-runner /lava-268571/1
    2023-02-08T05:27:44.676739  =

    2023-02-08T05:27:44.696959  / # /lava-268571/bin/lava-test-runner /lava=
-268571/1 =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e33309c2b6ba8a258c866c
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:27:48.999084  /lava-268571/1/../bin/lava-test-case
    2023-02-08T05:27:49.115197  <8>[   50.099045][  T256] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e33309c2b6ba8a258c866e
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:27:50.609509  /lava-268571/1/../bin/lava-test-case
    2023-02-08T05:27:50.719499  <8>[   51.704963][  T266] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e33309c2b6ba8a258c8673
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:27:53.392546  /lava-268571/1/../bin/lava-test-case
    2023-02-08T05:27:53.504523  <8>[   54.491718][  T297] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e33309c2b6ba8a258c8674
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:27:54.752176  /lava-268571/1/../bin/lava-test-case
    2023-02-08T05:27:54.870259  <8>[   55.856000][  T303] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63e333f94665d97be68c862f

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e333f94665d97be68c8636
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:32:15.722670  / # #
    2023-02-08T05:32:15.824743  export SHELL=3D/bin/sh
    2023-02-08T05:32:15.825364  #
    2023-02-08T05:32:15.926752  / # export SHELL=3D/bin/sh. /lava-268580/en=
vironment
    2023-02-08T05:32:15.927232  =

    2023-02-08T05:32:16.028682  / # . /lava-268580/environment/lava-268580/=
bin/lava-test-runner /lava-268580/1
    2023-02-08T05:32:16.029458  =

    2023-02-08T05:32:16.035041  / # /lava-268580/bin/lava-test-runner /lava=
-268580/1
    2023-02-08T05:32:16.104001  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-08T05:32:16.104312  + <8>[   22.501351] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 268580_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e333f94665d97be68c863a
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:32:18.193079  /lava-268580/1/../bin/lava-test-case
    2023-02-08T05:32:18.193529  <8>[   24.603305] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-08T05:32:18.193808  /lava-268580/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e333f94665d97be68c863c
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:32:19.252637  /lava-268580/1/../bin/lava-test-case
    2023-02-08T05:32:19.253011  <8>[   25.640518] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-08T05:32:19.253268  /lava-268580/1/../bin/lava-test-case
    2023-02-08T05:32:19.253518  <8>[   25.657329] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-08T05:32:19.253778  /lava-268580/1/../bin/lava-test-case
    2023-02-08T05:32:19.254015  <8>[   25.677519] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-08T05:32:19.254253  /lava-268580/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e333f94665d97be68c8641
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:32:20.329094  /lava-268580/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e333f94665d97be68c8642
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-08T05:32:20.332264  <8>[   26.755165] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-08T05:32:21.389119  /lava-268580/1/../bin/lava-test-case
    2023-02-08T05:32:21.389496  <8>[   27.775720] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-08T05:32:21.389758  /lava-268580/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63e32f5c1056057b0c8c864e

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63e32f5c1056057b0c8c865f
        failing since 19 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-08T05:12:45.201937  /lava-268533/1/../bin/lava-test-case
    2023-02-08T05:12:45.205112  <8>[   17.948503] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
32f5c1056057b0c8c8661
        failing since 19 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-08T05:12:47.207201  /lava-268533/1/../bin/lava-test-case
    2023-02-08T05:12:47.207591  <8>[   20.022692] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-08T05:12:47.207838  /lava-268533/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e32df029baa3341a8c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e32df029baa3341a8c8=
638
        failing since 14 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e32e7ce3309d02708c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e32e7ce3309d02708c8=
646
        failing since 14 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63e330b95df7ebe66f8c86d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e330b95df7ebe66f8c8=
6d4
        failing since 14 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e332637fd0459acc8c867d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e332637fd0459acc8c8686
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-08T05:25:45.631907  / # #
    2023-02-08T05:25:45.733866  export SHELL=3D/bin/sh
    2023-02-08T05:25:45.734363  #
    2023-02-08T05:25:45.835712  / # export SHELL=3D/bin/sh. /lava-3306534/e=
nvironment
    2023-02-08T05:25:45.836280  <3>[   18.369366] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-08T05:25:45.836554  =

    2023-02-08T05:25:45.937872  / # . /lava-3306534/environment/lava-330653=
4/bin/lava-test-runner /lava-3306534/1
    2023-02-08T05:25:45.938791  =

    2023-02-08T05:25:45.949820  / # /lava-3306534/bin/lava-test-runner /lav=
a-3306534/1
    2023-02-08T05:25:46.013678  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e32f2fefbdfb196a8c86a7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e32f2fefbdfb196a8c86b0
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-08T05:11:50.766612  / # #
    2023-02-08T05:11:50.868531  export SHELL=3D/bin/sh
    2023-02-08T05:11:50.868943  #
    2023-02-08T05:11:50.970367  / # export SHELL=3D/bin/sh. /lava-3306150/e=
nvironment
    2023-02-08T05:11:50.971223  =

    2023-02-08T05:11:50.971684  / # <3>[   18.291094] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-08T05:11:51.073491  . /lava-3306150/environment/lava-3306150/bi=
n/lava-test-runner /lava-3306150/1
    2023-02-08T05:11:51.074147  =

    2023-02-08T05:11:51.085796  / # /lava-3306150/bin/lava-test-runner /lav=
a-3306150/1
    2023-02-08T05:11:51.148570  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e331379ac1d946888c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e331379ac1d946888c8638
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-08T05:20:47.165488  / # #
    2023-02-08T05:20:47.268392  export SHELL=3D/bin/sh
    2023-02-08T05:20:47.268789  #
    2023-02-08T05:20:47.370181  / # export SHELL=3D/bin/sh. /lava-3306316/e=
nvironment
    2023-02-08T05:20:47.370931  =

    2023-02-08T05:20:47.371416  / # <3>[  101.296697] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-08T05:20:47.473322  . /lava-3306316/environment/lava-3306316/bi=
n/lava-test-runner /lava-3306316/1
    2023-02-08T05:20:47.474002  =

    2023-02-08T05:20:47.483041  / # /lava-3306316/bin/lava-test-runner /lav=
a-3306316/1
    2023-02-08T05:20:47.543043  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e331891edbb1dcf68c8648

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e331891edbb1dcf68c8651
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-08T05:22:06.092895  <8>[   17.928388] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3306343_1.5.2.4.1>
    2023-02-08T05:22:06.196775  / # #
    2023-02-08T05:22:06.298569  export SHELL=3D/bin/sh
    2023-02-08T05:22:06.298990  #
    2023-02-08T05:22:06.400370  / # export SHELL=3D/bin/sh. /lava-3306343/e=
nvironment
    2023-02-08T05:22:06.401127  =

    2023-02-08T05:22:06.401579  / # <3>[   18.170715] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-08T05:22:06.503420  . /lava-3306343/environment/lava-3306343/bi=
n/lava-test-runner /lava-3306343/1
    2023-02-08T05:22:06.504055  =

    2023-02-08T05:22:06.517548  / # /lava-3306343/bin/lava-test-runner /lav=
a-3306343/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e332b30a71f5d9168c864d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e332b30a71f5d9168c8656
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-08T05:27:04.228413  / # #
    2023-02-08T05:27:04.329833  export SHELL=3D/bin/sh
    2023-02-08T05:27:04.330180  #
    2023-02-08T05:27:04.431334  / # export SHELL=3D/bin/sh. /lava-3306576/e=
nvironment
    2023-02-08T05:27:04.431736  <3>[   18.490340] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-08T05:27:04.431926  =

    2023-02-08T05:27:04.533050  / # . /lava-3306576/environment/lava-330657=
6/bin/lava-test-runner /lava-3306576/1
    2023-02-08T05:27:04.533595  =

    2023-02-08T05:27:04.541571  / # /lava-3306576/bin/lava-test-runner /lav=
a-3306576/1
    2023-02-08T05:27:04.612523  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3333b97b42a48508c8675

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e3333b97b42a48508c867e
        failing since 20 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-08T05:29:12.667541  / # #
    2023-02-08T05:29:12.769403  export SHELL=3D/bin/sh
    2023-02-08T05:29:12.769823  #
    2023-02-08T05:29:12.871122  / # export SHELL=3D/bin/sh. /lava-3306522/e=
nvironment
    2023-02-08T05:29:12.871561  =

    2023-02-08T05:29:12.972918  / # . /lava-3306522/environment/lava-330652=
2/bin/lava-test-runner /lava-3306522/1
    2023-02-08T05:29:12.973588  =

    2023-02-08T05:29:12.978413  / # /lava-3306522/bin/lava-test-runner /lav=
a-3306522/1
    2023-02-08T05:29:13.056219  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-08T05:29:13.056765  + cd /lava-3306522/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e32f3ba34859a8e78c8646

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e32f3ba34859a8e78c864f
        failing since 20 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-08T05:12:14.520969  / # #
    2023-02-08T05:12:14.622842  export SHELL=3D/bin/sh
    2023-02-08T05:12:14.623303  #
    2023-02-08T05:12:14.724669  / # export SHELL=3D/bin/sh. /lava-3306155/e=
nvironment
    2023-02-08T05:12:14.725029  =

    2023-02-08T05:12:14.826414  / # . /lava-3306155/environment/lava-330615=
5/bin/lava-test-runner /lava-3306155/1
    2023-02-08T05:12:14.827047  =

    2023-02-08T05:12:14.832499  / # /lava-3306155/bin/lava-test-runner /lav=
a-3306155/1
    2023-02-08T05:12:14.904149  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-08T05:12:14.904574  + cd /lava-3306155/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3318a1edbb1dcf68c8653

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e3318a1edbb1dcf68c865c
        failing since 20 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-08T05:21:52.420030  / # #
    2023-02-08T05:21:52.521718  export SHELL=3D/bin/sh
    2023-02-08T05:21:52.522072  <3>[   34.360283] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-08T05:21:52.522307  #
    2023-02-08T05:21:52.623621  / # export SHELL=3D/bin/sh. /lava-3306279/e=
nvironment
    2023-02-08T05:21:52.624167  =

    2023-02-08T05:21:52.725531  / # . /lava-3306279/environment/lava-330627=
9/bin/lava-test-runner /lava-3306279/1
    2023-02-08T05:21:52.726189  =

    2023-02-08T05:21:52.743313  / # /lava-3306279/bin/lava-test-runner /lav=
a-3306279/1
    2023-02-08T05:21:52.802263  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e331f4ee6018147c8c8643

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e331f4ee6018147c8c864c
        failing since 20 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-08T05:23:48.579513  / # #
    2023-02-08T05:23:48.681258  export SHELL=3D/bin/sh
    2023-02-08T05:23:48.681721  #
    2023-02-08T05:23:48.783153  / # export SHELL=3D/bin/sh. /lava-3306374/e=
nvironment
    2023-02-08T05:23:48.783573  =

    2023-02-08T05:23:48.884906  / # . /lava-3306374/environment/lava-330637=
4/bin/lava-test-runner /lava-3306374/1
    2023-02-08T05:23:48.885532  =

    2023-02-08T05:23:48.890880  / # /lava-3306374/bin/lava-test-runner /lav=
a-3306374/1
    2023-02-08T05:23:48.962694  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-08T05:23:48.962973  + cd /lava-3306374/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e333af4edf49719e8c863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e333af4edf49719e8c8647
        failing since 20 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-08T05:31:12.228002  / # #
    2023-02-08T05:31:12.330034  export SHELL=3D/bin/sh
    2023-02-08T05:31:12.330457  #
    2023-02-08T05:31:12.431766  / # export SHELL=3D/bin/sh. /lava-3306553/e=
nvironment
    2023-02-08T05:31:12.432218  =

    2023-02-08T05:31:12.533620  / # . /lava-3306553/environment/lava-330655=
3/bin/lava-test-runner /lava-3306553/1
    2023-02-08T05:31:12.534375  =

    2023-02-08T05:31:12.538770  / # /lava-3306553/bin/lava-test-runner /lav=
a-3306553/1
    2023-02-08T05:31:12.618681  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-08T05:31:12.619228  + cd /lava-3306553/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e332512179b166d78c8649

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e332512179b166d78c8652
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-08T05:25:07.185501  / # #
    2023-02-08T05:25:07.287063  export SHELL=3D/bin/sh
    2023-02-08T05:25:07.287440  #
    2023-02-08T05:25:07.388898  / # export SHELL=3D/bin/sh. /lava-3306525/e=
nvironment
    2023-02-08T05:25:07.389271  =

    2023-02-08T05:25:07.389420  / # <3>[   18.388234] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-08T05:25:07.490502  . /lava-3306525/environment/lava-3306525/bi=
n/lava-test-runner /lava-3306525/1
    2023-02-08T05:25:07.491658  =

    2023-02-08T05:25:07.504863  / # /lava-3306525/bin/lava-test-runner /lav=
a-3306525/1
    2023-02-08T05:25:07.559453  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e32fa7ed81631d8d8c8663

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e32fa7ed81631d8d8c866c
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-08T05:13:53.976692  /#
    2023-02-08T05:13:54.078415   # #export SHELL=3D/bin/sh
    2023-02-08T05:13:54.078778  =

    2023-02-08T05:13:54.179990  / # export SHELL=3D/bin/sh. /lava-3306255/e=
nvironment
    2023-02-08T05:13:54.180327  =

    2023-02-08T05:13:54.180502  / # <3>[   17.966298] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-08T05:13:54.281650  . /lava-3306255/environment/lava-3306255/bi=
n/lava-test-runner /lava-3306255/1
    2023-02-08T05:13:54.282206  =

    2023-02-08T05:13:54.298310  / # /lava-3306255/bin/lava-test-runner /lav=
a-3306255/1
    2023-02-08T05:13:54.345233  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e32fb51e9860ad158c8649

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e32fb51e9860ad158c8652
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-08T05:13:51.189288  / # #
    2023-02-08T05:13:51.290763  export SHELL=3D/bin/sh
    2023-02-08T05:13:51.291186  #
    2023-02-08T05:13:51.392297  / # export SHELL=3D/bin/sh. /lava-3306194/e=
nvironment
    2023-02-08T05:13:51.392653  =

    2023-02-08T05:13:51.392814  / # <3>[   18.175395] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-08T05:13:51.493744  . /lava-3306194/environment/lava-3306194/bi=
n/lava-test-runner /lava-3306194/1
    2023-02-08T05:13:51.494314  =

    2023-02-08T05:13:51.507414  / # /lava-3306194/bin/lava-test-runner /lav=
a-3306194/1
    2023-02-08T05:13:51.564342  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e330477faa60626d8c8669

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e330477faa60626d8c8672
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-08T05:16:43.957590  / # #
    2023-02-08T05:16:44.060252  export SHELL=3D/bin/sh
    2023-02-08T05:16:44.060633  #
    2023-02-08T05:16:44.162004  / # export SHELL=3D/bin/sh. /lava-3306292/e=
nvironment
    2023-02-08T05:16:44.162733  =

    2023-02-08T05:16:44.163235  / # <3>[  102.929536] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-08T05:16:44.265018  . /lava-3306292/environment/lava-3306292/bi=
n/lava-test-runner /lava-3306292/1
    2023-02-08T05:16:44.266000  =

    2023-02-08T05:16:44.285327  / # /lava-3306292/bin/lava-test-runner /lav=
a-3306292/1
    2023-02-08T05:16:44.327354  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3304f7ab830e7488c8631

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e3304f7ab830e7488c863a
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-08T05:16:44.521355  / # #
    2023-02-08T05:16:44.624459  export SHELL=3D/bin/sh
    2023-02-08T05:16:44.625279  #
    2023-02-08T05:16:44.727237  / # export SHELL=3D/bin/sh<3>[   18.027219]=
 brcmfmac: brcmf_s. /lava-3306344/environment
    2023-02-08T05:16:44.728031  dio_htclk: HT Avail timeout (1000000): clkc=
tl 0x50
    2023-02-08T05:16:44.728438  =

    2023-02-08T05:16:44.830811  / # . /lava-3306344/environment/lava-330634=
4/bin/lava-test-runner /lava-3306344/1
    2023-02-08T05:16:44.832177  =

    2023-02-08T05:16:44.845633  / # /lava-3306344/bin/lava-test-runner /lav=
a-3306344/1
    2023-02-08T05:16:44.900745  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3328bbd533774448c8652

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e3328bbd533774448c865b
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-08T05:26:14.190412  / # #
    2023-02-08T05:26:14.292208  export SHELL=3D/bin/sh
    2023-02-08T05:26:14.292662  #
    2023-02-08T05:26:14.393884  / # export SHELL=3D/bin/sh. /lava-3306540/e=
nvironment
    2023-02-08T05:26:14.394242  =

    2023-02-08T05:26:14.394470  / # <3>[   18.224968] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-08T05:26:14.495696  . /lava-3306540/environment/lava-3306540/bi=
n/lava-test-runner /lava-3306540/1
    2023-02-08T05:26:14.496354  =

    2023-02-08T05:26:14.503364  / # /lava-3306540/bin/lava-test-runner /lav=
a-3306540/1
    2023-02-08T05:26:14.561334  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3345f688279ddda8c86b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3345f688279ddda8c8=
6b4
        failing since 14 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e337fdc639f1116b8c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e337fdc639f1116b8c8=
64a
        failing since 11 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3398d31b02dc9cd8c879b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3398d31b02dc9cd8c8=
79c
        failing since 14 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e334639b89b304328c8667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e334639b89b304328c8=
668
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3375b85a15473ec8c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3375b85a15473ec8c8=
63c
        new failure (last pass: next-20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/63e332fd6bb8207f448c862f

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/63e332fe6bb8207f448c86e5
        failing since 5 days (last pass: next-20230130, first fail: next-20=
230202)

    2023-02-08T05:28:09.181758  /lava-9061105/1/../bin/lava-test-case

    2023-02-08T05:28:09.188376  <8>[   22.099797] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/63e332fe6bb8207f448c86e6
        failing since 5 days (last pass: next-20230130, first fail: next-20=
230202)

    2023-02-08T05:28:08.162597  /lava-9061105/1/../bin/lava-test-case

    2023-02-08T05:28:08.169238  <8>[   21.080419] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/63e332fe6bb8207f448c86e7
        failing since 5 days (last pass: next-20230130, first fail: next-20=
230202)

    2023-02-08T05:28:06.133241  andles:     0x0

    2023-02-08T05:28:06.133340    rHandle:      0

    2023-02-08T05:28:06.136496    V:            0

    2023-02-08T05:28:06.136594    Res:          0x0

    2023-02-08T05:28:06.139762  TPM2_CC_GetTestResult:

    2023-02-08T05:28:06.139855    value: 0x17C

    2023-02-08T05:28:06.142916    commandIndex: 0x17c

    2023-02-08T05:28:06.143018    reserved1:    0x0

    2023-02-08T05:28:06.146286    nv:           0

    2023-02-08T05:28:06.146380    extensive:    0
 =

    ... (108 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3346378cfebada88c86a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3346378cfebada88c8=
6a6
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e32d129cb9b89fbc8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e32d129cb9b89fbc8c8=
630
        failing since 168 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e346b7133130ae758c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e346b7133130ae758c8=
635
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e33388d4744aeed38c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e33388d4744aeed38c8=
63b
        new failure (last pass: next-20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3338c37d9f5e7c58c8666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3338c37d9f5e7c58c8=
667
        new failure (last pass: next-20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e32f96a2b7d8e2ab8c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e32f96a2b7d8e2ab8c8=
640
        new failure (last pass: next-20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3356f66bf592a8b8c8675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3356f66bf592a8b8c8=
676
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e332a066dbe299708c86ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e332a066dbe299708c8=
6cb
        new failure (last pass: next-20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e33408c44586c9078c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e33408c44586c9078c8=
652
        failing since 19 days (last pass: next-20230109, first fail: next-2=
0230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3388b449144f1e38c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3388b449144f1e38c8=
645
        failing since 77 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e33a731c01de86048c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e33a731c01de86048c8=
64d
        failing since 5 days (last pass: next-20230131, first fail: next-20=
230203) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e334a4e10db3b61b8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e334a4e10db3b61b8c8=
63e
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3333ce51a1c7ba78c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3333ce51a1c7ba78c8=
63f
        failing since 19 days (last pass: next-20230109, first fail: next-2=
0230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3351c443911ed258c8910

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3351c443911ed258c8=
911
        failing since 77 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3368a69beab07eb8c8675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3368a69beab07eb8c8=
676
        failing since 5 days (last pass: next-20230131, first fail: next-20=
230203) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e334649b89b304328c866d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e334649b89b304328c8=
66e
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e333266f132c75818c8647

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e333266f132c75818c8650
        failing since 33 days (last pass: next-20221130, first fail: next-2=
0230105)

    2023-02-08T05:28:41.968769  + set +x
    2023-02-08T05:28:41.970021  <8>[   68.077949][  T196] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 393687_1.5.2.4.1>
    2023-02-08T05:28:42.115581  #
    2023-02-08T05:28:42.217890  / # #export SHELL=3D/bin/sh
    2023-02-08T05:28:42.218546  =

    2023-02-08T05:28:42.319909  / # export SHELL=3D/bin/sh. /lava-393687/en=
vironment
    2023-02-08T05:28:42.320570  =

    2023-02-08T05:28:42.421977  / # . /lava-393687/environment/lava-393687/=
bin/lava-test-runner /lava-393687/1
    2023-02-08T05:28:42.422878  =

    2023-02-08T05:28:42.430498  / # /lava-393687/bin/lava-test-runner /lava=
-393687/1 =

    ... (43 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3344f25d470d8b78c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3344f25d470d8b78c8=
651
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3346677abd763358c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3346677abd763358c8=
640
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3338a37d9f5e7c58c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e3338a37d9f5e7c58c8=
63e
        failing since 111 days (last pass: next-20221011, first fail: next-=
20221019) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e32fcbc235e2f2298c8664

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e32fcbc235e2f2298c866d
        failing since 14 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-02-08T05:14:37.001868  / # #
    2023-02-08T05:14:37.103556  export SHELL=3D/bin/sh
    2023-02-08T05:14:37.103910  #
    2023-02-08T05:14:37.205249  / # export SHELL=3D/bin/sh. /lava-3306331/e=
nvironment
    2023-02-08T05:14:37.205608  =

    2023-02-08T05:14:37.306948  / # . /lava-3306331/environment/lava-330633=
1/bin/lava-test-runner /lava-3306331/1
    2023-02-08T05:14:37.307563  =

    2023-02-08T05:14:37.312953  / # /lava-3306331/bin/lava-test-runner /lav=
a-3306331/1
    2023-02-08T05:14:37.449876  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-08T05:14:37.450372  + cd /lava-3306331/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e33594d1e705cab98c8737

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e33594d1e705cab98c8=
738
        failing since 76 days (last pass: next-20221121, first fail: next-2=
0221123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e3322a188f1a9ad78c868a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230208/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e3322a188f1a9ad78c8691
        failing since 33 days (last pass: next-20221207, first fail: next-2=
0230105)

    2023-02-08T05:24:32.151935  + set +x
    2023-02-08T05:24:32.159070  <8>[   43.227258][  T172] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 844462_1.5.2.4.1>
    2023-02-08T05:24:32.291589  #
    2023-02-08T05:24:32.393688  / # #export SHELL=3D/bin/sh
    2023-02-08T05:24:32.394138  =

    2023-02-08T05:24:32.495551  / # export SHELL=3D/bin/sh. /lava-844462/en=
vironment
    2023-02-08T05:24:32.496062  =

    2023-02-08T05:24:32.597449  / # . /lava-844462/environment/lava-844462/=
bin/lava-test-runner /lava-844462/1
    2023-02-08T05:24:32.598234  =

    2023-02-08T05:24:32.602904  / # /lava-844462/bin/lava-test-runner /lava=
-844462/1 =

    ... (18 line(s) more)  =

 =20
