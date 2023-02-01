Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156E9686217
	for <lists+linux-next@lfdr.de>; Wed,  1 Feb 2023 09:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjBAIt6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Feb 2023 03:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbjBAItq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Feb 2023 03:49:46 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671D95085F
        for <linux-next@vger.kernel.org>; Wed,  1 Feb 2023 00:49:37 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id v3so11961659pgh.4
        for <linux-next@vger.kernel.org>; Wed, 01 Feb 2023 00:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OeIRqMSahFo/jJmMc67uJ8Af2zqaAFM8FVURUgNQHbo=;
        b=QahiZaF2RZfezC3LQe7z1sx6hy0v0hOJkfwpx2vFIkZpJYaPzNXWH4k7MKTn8wp8RC
         OIIMBdXi6oMjAgyYO69qO5tutfBoSpHsQhf91C1v1zkEAWpq2AntpIj/LtDcMTsEFjZo
         L9wgwzv1BVOuPVM79mi4ny37o/Ab4QwFgh7OrjWKEGTE65yqpfnO7E/vdgVEa2JPp42n
         5IftLBkcsioKFOGuYfLS0SwTDL+rURO7wZOMeVzSMnOsrUDeDIOaFaTOdzr8gPnrO+iL
         7AP81EoBNWZoMj2wZg0eEx7zeUsqx8vskJCy/ZqiheET42BIEfIu5znOAy+3FqUZeB9Q
         BEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeIRqMSahFo/jJmMc67uJ8Af2zqaAFM8FVURUgNQHbo=;
        b=u1xCg16Nw0HEWvQLWJuE8w1xssGq/lUU2VZj9KwZK51J39Rxu7rxdFeMce9cgsiD7t
         cYFe1qr8Z2a94tchDqJmT8Whz3UrdItAWFlRgMMzCYHTKJzQZP/IAaCbcMD5nP0sU83b
         V7LdnVzmRbMr1pjzqW17rAfggaHltfMYhc3iKvblAjf3SG9VSQGTyt94MlVIQ41bR2WU
         XwZl1DLfKnGU2Unq4LSPp9pLF+NaAum2danABbo1VWHF8OvPok90OGIFkRrkgtaUjfwR
         ZvNL74vRqlvU01GubwzTb5VSKAvwNXZ6Zziyq6RKZOqTVo6UociLO/bV704YvggbF+ml
         XoAw==
X-Gm-Message-State: AO0yUKUkdVfyCiiTZYDw6bTaMtlU+umU2EOzbleCqryyJn4K6gyku5Pq
        ec+GiqVgJjBfaMvBgaRmfvUWXw15ek8vi+TSH8et2Q==
X-Google-Smtp-Source: AK7set9hnfvKiZ/kdP0W/+Y/0ESLK06y6k3ylujlQXc/E46bjz1CC76wMm5vMckgGZyVwpUCEJshNQ==
X-Received: by 2002:a62:1c4f:0:b0:592:ef22:276a with SMTP id c76-20020a621c4f000000b00592ef22276amr1438347pfc.31.1675241375099;
        Wed, 01 Feb 2023 00:49:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z12-20020aa7990c000000b0059252afc069sm10437603pff.64.2023.02.01.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 00:49:34 -0800 (PST)
Message-ID: <63da279e.a70a0220.60f8d.2e9e@mx.google.com>
Date:   Wed, 01 Feb 2023 00:49:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230201
X-Kernelci-Report-Type: test
Subject: next/master baseline: 637 runs, 79 regressions (next-20230201)
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

next/master baseline: 637 runs, 79 regressions (next-20230201)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

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

imx6dl-riotboard             | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 3          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 3          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230201/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230201
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      66eee64b235411d512bed4d672c2d00683239daf =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f2aa2dca98711d915f09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f2aa2dca98711d915=
f0a
        failing since 0 day (last pass: next-20230125, first fail: next-202=
30131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f2ccad69a18326915ed2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f2ccad69a18326915ed7
        failing since 7 days (last pass: next-20230124, first fail: next-20=
230125)

    2023-02-01T05:03:59.693597  + set +x
    2023-02-01T05:03:59.697228  <8>[   17.362582] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 227370_1.5.2.4.1>
    2023-02-01T05:03:59.811173  / # #
    2023-02-01T05:03:59.913752  export SHELL=3D/bin/sh
    2023-02-01T05:03:59.914350  #
    2023-02-01T05:04:00.016183  / # export SHELL=3D/bin/sh. /lava-227370/en=
vironment
    2023-02-01T05:04:00.017193  =

    2023-02-01T05:04:00.118848  / # . /lava-227370/environment/lava-227370/=
bin/lava-test-runner /lava-227370/1
    2023-02-01T05:04:00.119859  =

    2023-02-01T05:04:00.126875  / # /lava-227370/bin/lava-test-runner /lava=
-227370/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63da01db396662f982915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63da01db396662f982915ebe
        failing since 13 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-01T06:08:19.668061  <8>[   15.490206] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3261645_1.5.2.4.1>
    2023-02-01T06:08:19.777445  / # #
    2023-02-01T06:08:19.881401  export SHELL=3D/bin/sh
    2023-02-01T06:08:19.882570  #
    2023-02-01T06:08:19.883063  / # <3>[   15.618034] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-02-01T06:08:19.985234  export SHELL=3D/bin/sh. /lava-3261645/envir=
onment
    2023-02-01T06:08:19.986839  =

    2023-02-01T06:08:20.089617  / # . /lava-3261645/environment/lava-326164=
5/bin/lava-test-runner /lava-3261645/1
    2023-02-01T06:08:20.091709  =

    2023-02-01T06:08:20.096807  / # /lava-3261645/bin/lava-test-runner /lav=
a-3261645/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63da014facd9472d6d915ece

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63da014facd9472d6d915ed3
        failing since 14 days (last pass: next-20221219, first fail: next-2=
0230117)

    2023-02-01T06:05:58.650519  <8>[   15.030118] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3261597_1.5.2.4.1>
    2023-02-01T06:05:58.760506  / # #
    2023-02-01T06:05:58.864548  export SHELL=3D/bin/sh
    2023-02-01T06:05:58.865930  #
    2023-02-01T06:05:58.968459  / # export SHELL=3D/bin/sh. /lava-3261597/e=
nvironment
    2023-02-01T06:05:58.969793  =

    2023-02-01T06:05:58.970455  / # <3>[   15.292385] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-02-01T06:05:59.072737  . /lava-3261597/environment/lava-3261597/bi=
n/lava-test-runner /lava-3261597/1
    2023-02-01T06:05:59.074639  =

    2023-02-01T06:05:59.081078  / # /lava-3261597/bin/lava-test-runner /lav=
a-3261597/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63da02675471ac51ac915ef1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63da02675471ac51ac915ef6
        failing since 13 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-01T06:10:39.209278  <8>[   16.712271] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3261692_1.5.2.4.1>
    2023-02-01T06:10:39.322006  / # #
    2023-02-01T06:10:39.425932  export SHELL=3D/bin/sh
    2023-02-01T06:10:39.427238  #
    2023-02-01T06:10:39.529804  / # export SHELL=3D/bin/sh. /lava-3261692/e=
nvironment
    2023-02-01T06:10:39.530828  =

    2023-02-01T06:10:39.632977  / # . /lava-3261692/environment/lava-326169=
2/bin/lava-test-runner /lava-3261692/1
    2023-02-01T06:10:39.634726  =

    2023-02-01T06:10:39.639208  / # /lava-3261692/bin/lava-test-runner /lav=
a-3261692/1
    2023-02-01T06:10:39.720394  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9fa72b7ee7909d2915edf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9fa72b7ee7909d2915ee2
        failing since 26 days (last pass: next-20221125, first fail: next-2=
0230106)

    2023-02-01T05:36:32.342583  + set +x[   14.294130] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1150599_1.5.2.4.1>
    2023-02-01T05:36:32.342867  =

    2023-02-01T05:36:32.448516  / # #
    2023-02-01T05:36:32.550333  export SHELL=3D/bin/sh
    2023-02-01T05:36:32.550776  #
    2023-02-01T05:36:32.652170  / # export SHELL=3D/bin/sh. /lava-1150599/e=
nvironment
    2023-02-01T05:36:32.652612  =

    2023-02-01T05:36:32.754038  / # . /lava-1150599/environment/lava-115059=
9/bin/lava-test-runner /lava-1150599/1
    2023-02-01T05:36:32.754771  =

    2023-02-01T05:36:32.756764  / # /lava-1150599/bin/lava-test-runner /lav=
a-1150599/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f9480ebe1770eb915ebc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f9480ebe1770eb915=
ebd
        failing since 8 days (last pass: next-20230120, first fail: next-20=
230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f5e20f5d2db744915ef0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f5e20f5d2db744915ef5
        failing since 1 day (last pass: next-20221206, first fail: next-202=
30130)

    2023-02-01T05:17:01.403314  + set +x
    2023-02-01T05:17:01.403495  [   13.225332] <LAVA_SIGNAL_ENDRUN 0_dmesg =
894400_1.5.2.3.1>
    2023-02-01T05:17:01.511275  / # #
    2023-02-01T05:17:01.612888  export SHELL=3D/bin/sh
    2023-02-01T05:17:01.613216  #
    2023-02-01T05:17:01.714390  / # export SHELL=3D/bin/sh. /lava-894400/en=
vironment
    2023-02-01T05:17:01.714718  =

    2023-02-01T05:17:01.815874  / # . /lava-894400/environment/lava-894400/=
bin/lava-test-runner /lava-894400/1
    2023-02-01T05:17:01.816364  =

    2023-02-01T05:17:01.819700  / # /lava-894400/bin/lava-test-runner /lava=
-894400/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f51a444f62d0a7915ebc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f51a444f62d0a7915ec1
        failing since 1 day (last pass: next-20221206, first fail: next-202=
30130)

    2023-02-01T05:13:40.501888  + set +x
    2023-02-01T05:13:40.502128  [   13.103925] <LAVA_SIGNAL_ENDRUN 0_dmesg =
894392_1.5.2.3.1>
    2023-02-01T05:13:40.609954  / # #
    2023-02-01T05:13:40.711676  export SHELL=3D/bin/sh
    2023-02-01T05:13:40.712284  #
    2023-02-01T05:13:40.813909  / # export SHELL=3D/bin/sh. /lava-894392/en=
vironment
    2023-02-01T05:13:40.814452  =

    2023-02-01T05:13:40.915858  / # . /lava-894392/environment/lava-894392/=
bin/lava-test-runner /lava-894392/1
    2023-02-01T05:13:40.916522  =

    2023-02-01T05:13:40.919675  / # /lava-894392/bin/lava-test-runner /lava=
-894392/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f75db43a993d2e915ec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f75db43a993d2e915ec6
        failing since 1 day (last pass: next-20221206, first fail: next-202=
30130)

    2023-02-01T05:23:19.207768  + set +x
    2023-02-01T05:23:19.208044  [   12.159046] <LAVA_SIGNAL_ENDRUN 0_dmesg =
894406_1.5.2.3.1>
    2023-02-01T05:23:19.314637  / # #
    2023-02-01T05:23:19.416441  export SHELL=3D/bin/sh
    2023-02-01T05:23:19.417004  #
    2023-02-01T05:23:19.518196  / # export SHELL=3D/bin/sh. /lava-894406/en=
vironment
    2023-02-01T05:23:19.518772  =

    2023-02-01T05:23:19.620157  / # . /lava-894406/environment/lava-894406/=
bin/lava-test-runner /lava-894406/1
    2023-02-01T05:23:19.620739  =

    2023-02-01T05:23:19.623864  / # /lava-894406/bin/lava-test-runner /lava=
-894406/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f681775408844b915ef6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f681775408844b915efb
        new failure (last pass: next-20230130)

    2023-02-01T05:19:37.401396  [   15.020464] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-02-01T05:19:37.408992  + set[   15.030244] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 894399_1.5.2.3.1>
    2023-02-01T05:19:37.409099   +x
    2023-02-01T05:19:37.513898  / # #
    2023-02-01T05:19:37.615557  export SHELL=3D/bin/sh
    2023-02-01T05:19:37.616255  #
    2023-02-01T05:19:37.717474  / # export SHELL=3D/bin/sh. /lava-894399/en=
vironment
    2023-02-01T05:19:37.718005  =

    2023-02-01T05:19:37.819251  / # . /lava-894399/environment/lava-894399/=
bin/lava-test-runner /lava-894399/1
    2023-02-01T05:19:37.819955   =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f785ed70f2fa0a915ebd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f785ed70f2fa0a915ec2
        new failure (last pass: next-20230131)

    2023-02-01T05:24:00.208391  + set[   14.398205] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 894409_1.5.2.3.1>
    2023-02-01T05:24:00.208622   +x
    2023-02-01T05:24:00.314065  / # #
    2023-02-01T05:24:00.417724  export SHELL=3D/bin/sh
    2023-02-01T05:24:00.419984  #
    2023-02-01T05:24:00.521503  / # export SHELL=3D/bin/sh. /lava-894409/en=
vironment
    2023-02-01T05:24:00.522201  =

    2023-02-01T05:24:00.623513  / # . /lava-894409/environment/lava-894409/=
bin/lava-test-runner /lava-894409/1
    2023-02-01T05:24:00.624162  =

    2023-02-01T05:24:00.626977  / # /lava-894409/bin/lava-test-runner /lava=
-894409/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9fd1de9b9470db8915ec6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9fd1de9b9470db8915=
ec7
        new failure (last pass: next-20230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9fe53cd8e15ce40915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9fe53cd8e15ce40915=
ebe
        failing since 26 days (last pass: next-20221125, first fail: next-2=
0230106) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f433c855251b88915ec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f433c855251b88915=
ec5
        failing since 26 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f640775408844b915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f640775408844b915=
eba
        failing since 26 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f8eb0cbc311b6e915ec9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f8eb0cbc311b6e915=
eca
        failing since 27 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9fcc72a859dacfb915ecc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9fcc72a859dacfb915=
ecd
        failing since 27 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f689fc82ce3f76915fac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f689fc82ce3f76915=
fad
        failing since 161 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f874f0b2c7a777915ed0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f874f0b2c7a777915=
ed1
        failing since 295 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9fbc742b4abb5b4915eb9

  Results:     49 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/63d9fbc742b4abb5b4915ede
        new failure (last pass: next-20230127)

    2023-02-01T05:42:08.757537  /lava-262382/1/../bin/lava-test-case
    2023-02-01T05:42:08.757955  <8>[   27.575951] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 3          =


  Details:     https://kernelci.org/test/plan/id/63d9f3a38a75a6125b915ebc

  Results:     49 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63d9f3a38a75a6125b915ec9
        failing since 12 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-01T05:07:38.745429  /lava-262328/1/../bin/lava-test-case
    2023-02-01T05:07:38.750743  <8>[   25.330336] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63d=
9f3a38a75a6125b915ecb
        failing since 12 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-01T05:07:40.757663  /lava-262328/1/../bin/lava-test-case
    2023-02-01T05:07:40.757930  <8>[   27.403894] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-01T05:07:40.758077  /lava-262328/1/../bin/lava-test-case   =


  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/63d9f3a38a75a6125b915ee1
        new failure (last pass: next-20230130)

    2023-02-01T05:07:42.223347  /lava-262328/1/../bin/lava-test-case
    2023-02-01T05:07:42.223727  <8>[   28.927248] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>
    2023-02-01T05:07:42.223965  /lava-262328/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f6604055bb4cf7915efa

  Results:     49 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/63d9f6604055bb4cf7915f1f
        new failure (last pass: next-20230130)

    2023-02-01T05:19:21.069894  /lava-262345/1/../bin/lava-test-case
    2023-02-01T05:19:21.070238  <8>[   29.117574] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>
    2023-02-01T05:19:21.070430  /lava-262345/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f804ec98b5afee915ef5

  Results:     1 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
63d9f804ec98b5afee915ef8
        new failure (last pass: next-20230131)

    2023-02-01T05:26:00.670953  <1>[  156.816866] [0000000000000108] pgd=3D=
0800000106c31003, p4d=3D0800000106c31003, pud=3D0800000106d93003, pmd=3D000=
00000
    2023-02-01T05:26:00.775371  #
    2023-02-01T05:26:00.877397  export SHELL=3D/bin/sh
    2023-02-01T05:26:00.978867  . /lava-262364/environment
    2023-02-01T05:26:01.080373  /lava-262364/bin/lava-test-runner /lava-262=
364/0
    2023-02-01T05:26:01.081980  00000000
    2023-02-01T05:26:01.082251  <0>[  156.828221] Internal error: Oops: 000=
0000096000006 [#4] PREEMPT SMP
    2023-02-01T05:26:01.082490  <4>[  156.835026] Modules linked in: ipv6 c=
aam_jr(+) caamhash_desc caamalg_desc crypto_engine rng_core tpm_tis_spi tpm=
_tis_core hantro_vpu v4l2_vp9 v4l2_h264 v4l2_mem2mem videobuf2_dma_contig v=
ideobuf2_memops videobuf2_v4l2 fsl_imx8_ddr_perf videodev videobuf2_common =
mc at24 onboard_usb_hub lm75 rtc_rv8803 imx8mq_interconnect rtc_snvs snvs_p=
wrkey caam error spi_imx imx_sdma qoriq_thermal etnaviv gpu_sched drm crct1=
0dif_ce imx_cpufreq_dt ghash_generic gcm ctr cmac ccm
    2023-02-01T05:26:01.082737  <4>[  156.878005] CPU: 3 PID: 308 Comm: dro=
pbear Tainted: G      D W          6.2.0-rc6-next-20230201 #1
    2023-02-01T05:26:01.082969  <4>[  156.887613] Hardware name: Kontron pI=
TX-imx8m (DT) =

    ... (423 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/63d9fb383990a55d94915edd

  Results:     49 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63d9fb383990a55d94915eea
        failing since 12 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-01T05:39:51.845488  /lava-262375/1/../bin/lava-test-case
    2023-02-01T05:39:51.848600  <8>[   25.267085] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63d=
9fb383990a55d94915eec
        failing since 12 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-01T05:39:53.856998  /lava-262375/1/../bin/lava-test-case
    2023-02-01T05:39:53.857400  <8>[   27.340681] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-01T05:39:53.857659  /lava-262375/1/../bin/lava-test-case   =


  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/63d9fb383990a55d94915f02
        new failure (last pass: next-20230130)

    2023-02-01T05:39:54.318982  <8>[   27.836016] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-driver-present RESULT=3Dpass>
    2023-02-01T05:39:55.319425  /lava-262375/1/../bin/lava-test-case
    2023-02-01T05:39:55.319823  <8>[   28.863239] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f36903614dc80e915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f36903614dc80e915=
ebe
        failing since 7 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f4673997f412d3915ec9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f4673997f412d3915=
eca
        failing since 7 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f5308ba1341a1d915f07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f5308ba1341a1d915=
f08
        failing since 7 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f981e44e5c7e3d915ec9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f981e44e5c7e3d915ece
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-01T05:32:37.551054  / # #
    2023-02-01T05:32:37.652909  export SHELL=3D/bin/sh
    2023-02-01T05:32:37.653290  #
    2023-02-01T05:32:37.754661  / # export SHELL=3D/bin/sh. /lava-3261881/e=
nvironment
    2023-02-01T05:32:37.755469  <3>[   18.209654] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-01T05:32:37.755925  =

    2023-02-01T05:32:37.857781  / # . /lava-3261881/environment/lava-326188=
1/bin/lava-test-runner /lava-3261881/1
    2023-02-01T05:32:37.860161  =

    2023-02-01T05:32:37.869246  / # /lava-3261881/bin/lava-test-runner /lav=
a-3261881/1
    2023-02-01T05:32:37.911192  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f309977ca4c52a915f18

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f309977ca4c52a915f1d
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-01T05:04:49.653392  / # #
    2023-02-01T05:04:49.755127  export SHELL=3D/bin/sh
    2023-02-01T05:04:49.755620  #
    2023-02-01T05:04:49.856991  / # export SHELL=3D/bin/sh. /lava-3261457/e=
nvironment
    2023-02-01T05:04:49.857520  =

    2023-02-01T05:04:49.857790  / # <3>[   18.188723] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-01T05:04:49.959270  . /lava-3261457/environment/lava-3261457/bi=
n/lava-test-runner /lava-3261457/1
    2023-02-01T05:04:49.960079  =

    2023-02-01T05:04:49.964854  / # /lava-3261457/bin/lava-test-runner /lav=
a-3261457/1
    2023-02-01T05:04:50.029901  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f599bfd3ed490b915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f599bfd3ed490b915ebe
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-01T05:16:01.249665  / # #
    2023-02-01T05:16:01.351627  export SHELL=3D/bin/sh
    2023-02-01T05:16:01.352172  #
    2023-02-01T05:16:01.453390  / # export SHELL=3D/bin/sh. /lava-3261573/e=
nvironment
    2023-02-01T05:16:01.453753  =

    2023-02-01T05:16:01.453954  / # <3>[   18.184521] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-01T05:16:01.555050  . /lava-3261573/environment/lava-3261573/bi=
n/lava-test-runner /lava-3261573/1
    2023-02-01T05:16:01.555729  =

    2023-02-01T05:16:01.562499  / # /lava-3261573/bin/lava-test-runner /lav=
a-3261573/1
    2023-02-01T05:16:01.625352  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f7a378987a1532915f00

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f7a378987a1532915f05
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-01T05:24:32.283441  <8>[  103.607068] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3261713_1.5.2.4.1>
    2023-02-01T05:24:32.387461  / # #
    2023-02-01T05:24:32.490162  export SHELL=3D/bin/sh
    2023-02-01T05:24:32.490599  #
    2023-02-01T05:24:32.592011  / # export SHELL=3D/bin/sh. /lava-3261713/e=
nvironment
    2023-02-01T05:24:32.592449  =

    2023-02-01T05:24:32.592706  / # <3>[  103.848431] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-01T05:24:32.694113  . /lava-3261713/environment/lava-3261713/bi=
n/lava-test-runner /lava-3261713/1
    2023-02-01T05:24:32.695183  =

    2023-02-01T05:24:32.713086  / # /lava-3261713/bin/lava-test-runner /lav=
a-3261713/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f93276669f0291915ed9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f93276669f0291915ede
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-01T05:31:18.777356  / # #
    2023-02-01T05:31:18.879085  export SHELL=3D/bin/sh
    2023-02-01T05:31:18.879537  #
    2023-02-01T05:31:18.980903  / # export SHELL=3D/bin/sh. /lava-3261812/e=
nvironment
    2023-02-01T05:31:18.981326  =

    2023-02-01T05:31:18.981561  / # <3>[   18.228699] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-01T05:31:19.082891  . /lava-3261812/environment/lava-3261812/bi=
n/lava-test-runner /lava-3261812/1
    2023-02-01T05:31:19.083621  =

    2023-02-01T05:31:19.096246  / # /lava-3261812/bin/lava-test-runner /lav=
a-3261812/1
    2023-02-01T05:31:19.152079  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9fcee80f2ef35fd915ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9fcee80f2ef35fd915=
ec9
        failing since 7 days (last pass: next-20230124, first fail: next-20=
230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9fa4e67274d9920915ef8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9fa4e67274d9920915efd
        failing since 13 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-01T05:35:43.865766  / # #
    2023-02-01T05:35:43.967607  export SHELL=3D/bin/sh
    2023-02-01T05:35:43.968109  #
    2023-02-01T05:35:44.069391  / # export SHELL=3D/bin/sh. /lava-3261863/e=
nvironment
    2023-02-01T05:35:44.069842  =

    2023-02-01T05:35:44.171191  / # . /lava-3261863/environment/lava-326186=
3/bin/lava-test-runner /lava-3261863/1
    2023-02-01T05:35:44.171858  =

    2023-02-01T05:35:44.177029  / # /lava-3261863/bin/lava-test-runner /lav=
a-3261863/1
    2023-02-01T05:35:44.255941  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-01T05:35:44.256444  + cd /lava-3261863/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f323b1365a73bc915ed3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f323b1365a73bc915ed8
        failing since 13 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-01T05:05:12.773536  <8>[   18.310433] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3261455_1.5.2.4.1>
    2023-02-01T05:05:12.879295  / # #
    2023-02-01T05:05:12.981169  export SHELL=3D/bin/sh
    2023-02-01T05:05:12.981653  #
    2023-02-01T05:05:13.083114  / # export SHELL=3D/bin/sh. /lava-3261455/e=
nvironment
    2023-02-01T05:05:13.083600  =

    2023-02-01T05:05:13.185226  / # . /lava-3261455/environment/lava-326145=
5/bin/lava-test-runner /lava-3261455/1
    2023-02-01T05:05:13.186015  =

    2023-02-01T05:05:13.190752  / # /lava-3261455/bin/lava-test-runner /lav=
a-3261455/1
    2023-02-01T05:05:13.261594  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f60a9c955268b3915ec4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f60a9c955268b3915ec7
        failing since 13 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-01T05:17:14.402491  + set +x<8>[   18.281821] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3261587_1.5.2.4.1>
    2023-02-01T05:17:14.507538  / # #
    2023-02-01T05:17:14.609222  export SHELL=3D/bin/sh
    2023-02-01T05:17:14.609565  #
    2023-02-01T05:17:14.710873  / # export SHELL=3D/bin/sh. /lava-3261587/e=
nvironment
    2023-02-01T05:17:14.711243  =

    2023-02-01T05:17:14.812566  / # . /lava-3261587/environment/lava-326158=
7/bin/lava-test-runner /lava-3261587/1
    2023-02-01T05:17:14.813182  =

    2023-02-01T05:17:14.832672  / # /lava-3261587/bin/lava-test-runner /lav=
a-3261587/1
    2023-02-01T05:17:14.888520  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f78c78987a1532915ecd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f78c78987a1532915ed2
        failing since 13 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-01T05:24:03.861370  / # #
    2023-02-01T05:24:03.963039  export SHELL=3D/bin/sh
    2023-02-01T05:24:03.963392  #
    2023-02-01T05:24:04.064706  / # export SHELL=3D/bin/sh. /lava-3261730/e=
nvironment
    2023-02-01T05:24:04.065058  =

    2023-02-01T05:24:04.166385  / # . /lava-3261730/environment/lava-326173=
0/bin/lava-test-runner /lava-3261730/1
    2023-02-01T05:24:04.167012  =

    2023-02-01T05:24:04.172710  / # /lava-3261730/bin/lava-test-runner /lav=
a-3261730/1
    2023-02-01T05:24:04.244555  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-01T05:24:04.244812  + cd /lava-3261730/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f9bc1a6ad84859915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f9bc1a6ad84859915ed0
        failing since 13 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-01T05:33:21.764043  + set +x<8>[   18.199080] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3261821_1.5.2.4.1>
    2023-02-01T05:33:21.869384  / # #
    2023-02-01T05:33:21.971192  export SHELL=3D/bin/sh
    2023-02-01T05:33:21.971585  #
    2023-02-01T05:33:22.072946  / # export SHELL=3D/bin/sh. /lava-3261821/e=
nvironment
    2023-02-01T05:33:22.073423  =

    2023-02-01T05:33:22.174797  / # . /lava-3261821/environment/lava-326182=
1/bin/lava-test-runner /lava-3261821/1
    2023-02-01T05:33:22.175438  =

    2023-02-01T05:33:22.180826  / # /lava-3261821/bin/lava-test-runner /lav=
a-3261821/1
    2023-02-01T05:33:22.252639  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63da1883b7e50d3d42915f92

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63da1883b7e50d3d42915=
f93
        failing since 4 days (last pass: next-20230125, first fail: next-20=
230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f95b0ebe1770eb915ee2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f95b0ebe1770eb915ee7
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-01T05:31:45.788343  / # #
    2023-02-01T05:31:45.890029  export SHELL=3D/bin/sh
    2023-02-01T05:31:45.890706  #
    2023-02-01T05:31:45.992054  / # export SHELL=3D/bin/sh. /lava-3261884/e=
nvironment
    2023-02-01T05:31:45.992499  =

    2023-02-01T05:31:45.992725  / # <3>[   18.149537] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-01T05:31:46.094095  . /lava-3261884/environment/lava-3261884/bi=
n/lava-test-runner /lava-3261884/1
    2023-02-01T05:31:46.094708  =

    2023-02-01T05:31:46.098729  / # /lava-3261884/bin/lava-test-runner /lav=
a-3261884/1
    2023-02-01T05:31:46.160853  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f307977ca4c52a915f0d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f307977ca4c52a915f12
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-01T05:04:50.247426  / # #
    2023-02-01T05:04:50.348819  export SHELL=3D/bin/sh
    2023-02-01T05:04:50.349296  #
    2023-02-01T05:04:50.450692  / # export SHELL=3D/bin/sh. /lava-3261450/e=
nvironment
    2023-02-01T05:04:50.451193  =

    2023-02-01T05:04:50.451469  / # <3>[   18.062279] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-01T05:04:50.552889  . /lava-3261450/environment/lava-3261450/bi=
n/lava-test-runner /lava-3261450/1
    2023-02-01T05:04:50.553629  =

    2023-02-01T05:04:50.561377  / # /lava-3261450/bin/lava-test-runner /lav=
a-3261450/1
    2023-02-01T05:04:50.623272  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f4596b0e4c0e76915f03

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f4596b0e4c0e76915f08
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-01T05:10:26.849855  + set <8>[   17.803758] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 3261511_1.5.2.4.1>
    2023-02-01T05:10:26.850134  +x
    2023-02-01T05:10:26.954161  / # #
    2023-02-01T05:10:27.056032  export SHELL=3D/bin/sh
    2023-02-01T05:10:27.056577  #
    2023-02-01T05:10:27.157986  / # export SHELL=3D/bin/sh. /lava-3261511/e=
nvironment
    2023-02-01T05:10:27.158504  =

    2023-02-01T05:10:27.260036  / # . /lava-3261511/environment<3>[   18.12=
0207] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (/lava-3261511/bin/lava-=
test-runner /lava-3261511/1
    2023-02-01T05:10:27.260853  1000000): clkctl 0x50
    2023-02-01T05:10:27.261079   =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f4d2381276fc22915ed2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f4d2381276fc22915ed7
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-01T05:12:28.205100  / # #
    2023-02-01T05:12:28.307039  export SHELL=3D/bin/sh
    2023-02-01T05:12:28.307393  #
    2023-02-01T05:12:28.408586  / # export SHELL=3D/bin/sh. /lava-3261548/e=
nvironment
    2023-02-01T05:12:28.408934  =

    2023-02-01T05:12:28.409118  / # <3>[   18.210684] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-01T05:12:28.510269  . /lava-3261548/environment/lava-3261548/bi=
n/lava-test-runner /lava-3261548/1
    2023-02-01T05:12:28.510872  =

    2023-02-01T05:12:28.517369  / # /lava-3261548/bin/lava-test-runner /lav=
a-3261548/1
    2023-02-01T05:12:28.580384  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f7a2c186aa759a915ed8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f7a2c186aa759a915edd
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-01T05:24:33.334100  / # #
    2023-02-01T05:24:33.436743  export SHELL=3D/bin/sh
    2023-02-01T05:24:33.437268  #
    2023-02-01T05:24:33.538844  / # export SHELL=3D/bin/sh. /lava-3261704/e=
nvironment
    2023-02-01T05:24:33.539487  =

    2023-02-01T05:24:33.539784  / # <3>[  103.873425] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-01T05:24:33.641312  . /lava-3261704/environment/lava-3261704/bi=
n/lava-test-runner /lava-3261704/1
    2023-02-01T05:24:33.642068  =

    2023-02-01T05:24:33.661182  / # /lava-3261704/bin/lava-test-runner /lav=
a-3261704/1
    2023-02-01T05:24:33.703154  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f76eb43a993d2e915ee9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f76eb43a993d2e915=
eea
        failing since 7 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 3          =


  Details:     https://kernelci.org/test/plan/id/63d9f73819ccc21bbe915eb9

  Results:     165 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/63d=
9f73819ccc21bbe915f08
        failing since 8 days (last pass: next-20230119, first fail: next-20=
230123)

    2023-02-01T05:22:42.849223  /lava-8964424/1/../bin/lava-test-case
    2023-02-01T05:22:42.885816  <8>[  199.995115] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/63d9f73819ccc21bbe915f5a
        new failure (last pass: next-20230127)

    2023-02-01T05:22:33.365758  /lava-8964424/1/../bin/lava-test-case
    2023-02-01T05:22:33.408718  <8>[  190.518163] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/63d9f73819ccc21bbe915f5b
        new failure (last pass: next-20230127)

    2023-02-01T05:22:32.236690  /lava-8964424/1/../bin/lava-test-case
    2023-02-01T05:22:32.240093  =

    2023-02-01T05:22:32.273951  <8>[  189.383341] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f778deb027397a915f00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f778deb027397a915=
f01
        new failure (last pass: next-20230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f355b0490f8723915ef6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f355b0490f8723915=
ef7
        failing since 161 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9faabb62d834d49915ec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9faabb62d834d49915=
ec5
        new failure (last pass: next-20230130) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f9faef6f625b99915f23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f9faef6f625b99915=
f24
        new failure (last pass: next-20230130) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f8bbe82d578a57915ed3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f8bbe82d578a57915=
ed4
        new failure (last pass: next-20230130) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f75ab43a993d2e915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f75ab43a993d2e915=
ebc
        failing since 4 days (last pass: next-20230125, first fail: next-20=
230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9fa22c02a5daee8915eeb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9fa22c02a5daee8915=
eec
        failing since 12 days (last pass: next-20230109, first fail: next-2=
0230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9fb85feb892ea78915ebc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9fb85feb892ea78915=
ebd
        failing since 70 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f8e4b4300a39e5915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f8e4b4300a39e5915=
eba
        failing since 12 days (last pass: next-20230116, first fail: next-2=
0230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f8110fb4f48c79915ec6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f8110fb4f48c79915=
ec7
        new failure (last pass: next-20230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f92d1b2841c69a915f5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f92d1b2841c69a915=
f60
        failing since 70 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f96b038dc3c307915efa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f96b038dc3c307915=
efb
        failing since 12 days (last pass: next-20230109, first fail: next-2=
0230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f9bf1a6ad84859915ed9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f9bf1a6ad84859915ede
        new failure (last pass: next-20221012)

    2023-02-01T05:33:26.728422  [   28.878284] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3261860_1.5.2.4.1>
    2023-02-01T05:33:26.833087  =

    2023-02-01T05:33:26.934796  / # #export SHELL=3D/bin/sh
    2023-02-01T05:33:26.935397  =

    2023-02-01T05:33:27.037124  / # export SHELL=3D/bin/sh. /lava-3261860/e=
nvironment
    2023-02-01T05:33:27.037543  =

    2023-02-01T05:33:27.139009  / # . /lava-3261860/environment/lava-326186=
0/bin/lava-test-runner /lava-3261860/1
    2023-02-01T05:33:27.140045  =

    2023-02-01T05:33:27.143224  / # /lava-3261860/bin/lava-test-runner /lav=
a-3261860/1
    2023-02-01T05:33:27.179874  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f305977ca4c52a915ee9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f305977ca4c52a915eee
        new failure (last pass: next-20221012)

    2023-02-01T05:04:58.940075  [   29.747830] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3261432_1.5.2.4.1>
    2023-02-01T05:04:59.044744  =

    2023-02-01T05:04:59.146506  / # #export SHELL=3D/bin/sh
    2023-02-01T05:04:59.147120  =

    2023-02-01T05:04:59.248854  / # export SHELL=3D/bin/sh. /lava-3261432/e=
nvironment
    2023-02-01T05:04:59.249502  =

    2023-02-01T05:04:59.351064  / # . /lava-3261432/environment/lava-326143=
2/bin/lava-test-runner /lava-3261432/1
    2023-02-01T05:04:59.351909  =

    2023-02-01T05:04:59.355308  / # /lava-3261432/bin/lava-test-runner /lav=
a-3261432/1
    2023-02-01T05:04:59.389427  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f5aebfd3ed490b915f1d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f5aebfd3ed490b915f22
        new failure (last pass: next-20221012)

    2023-02-01T05:16:11.033215  [   29.465069] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3261575_1.5.2.4.1>
    2023-02-01T05:16:11.137667  =

    2023-02-01T05:16:11.239365  / # #export SHELL=3D/bin/sh
    2023-02-01T05:16:11.239766  =

    2023-02-01T05:16:11.341229  / # export SHELL=3D/bin/sh. /lava-3261575/e=
nvironment
    2023-02-01T05:16:11.341678  =

    2023-02-01T05:16:11.443026  / # . /lava-3261575/environment/lava-326157=
5/bin/lava-test-runner /lava-3261575/1
    2023-02-01T05:16:11.443579  =

    2023-02-01T05:16:11.447051  / # /lava-3261575/bin/lava-test-runner /lav=
a-3261575/1
    2023-02-01T05:16:11.481854  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f7c97ac2f45df9915ee1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f7c97ac2f45df9915ee6
        new failure (last pass: next-20221012)

    2023-02-01T05:25:06.650262  [  106.807230] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3261718_1.5.2.4.1>
    2023-02-01T05:25:06.755406  =

    2023-02-01T05:25:06.857725  / # #export SHELL=3D/bin/sh
    2023-02-01T05:25:06.858203  =

    2023-02-01T05:25:06.959536  / # export SHELL=3D/bin/sh. /lava-3261718/e=
nvironment
    2023-02-01T05:25:06.959941  =

    2023-02-01T05:25:07.061399  / # . /lava-3261718/environment/lava-326171=
8/bin/lava-test-runner /lava-3261718/1
    2023-02-01T05:25:07.062834  =

    2023-02-01T05:25:07.066142  / # /lava-3261718/bin/lava-test-runner /lav=
a-3261718/1
    2023-02-01T05:25:07.100808  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f95a038dc3c307915ec3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f95a038dc3c307915ec8
        new failure (last pass: next-20221012)

    2023-02-01T05:31:49.385843  [   29.735796] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3261818_1.5.2.4.1>
    2023-02-01T05:31:49.490715  =

    2023-02-01T05:31:49.592920  / # #export SHELL=3D/bin/sh
    2023-02-01T05:31:49.593299  =

    2023-02-01T05:31:49.694648  / # export SHELL=3D/bin/sh. /lava-3261818/e=
nvironment
    2023-02-01T05:31:49.695217  =

    2023-02-01T05:31:49.796880  / # . /lava-3261818/environment/lava-326181=
8/bin/lava-test-runner /lava-3261818/1
    2023-02-01T05:31:49.797920  =

    2023-02-01T05:31:49.801226  / # /lava-3261818/bin/lava-test-runner /lav=
a-3261818/1
    2023-02-01T05:31:49.835411  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f84773e07cf796915f09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f84773e07cf796915=
f0a
        new failure (last pass: next-20230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9fc2e1bbc1987c8915f2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9fc2e1bbc1987c8915=
f2d
        new failure (last pass: next-20230130) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f5d69f402eec9b915f09

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f5d69f402eec9b915f0e
        new failure (last pass: next-20221012)

    2023-02-01T05:16:47.520746  <8>[   15.907545] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3261641_1.5.2.4.1>
    2023-02-01T05:16:47.625096  / # #
    2023-02-01T05:16:47.727010  export SHELL=3D/bin/sh
    2023-02-01T05:16:47.727499  #
    2023-02-01T05:16:47.828837  / # export SHELL=3D/bin/sh. /lava-3261641/e=
nvironment
    2023-02-01T05:16:47.829268  =

    2023-02-01T05:16:47.930657  / # . /lava-3261641/environment/lava-326164=
1/bin/lava-test-runner /lava-3261641/1
    2023-02-01T05:16:47.931369  =

    2023-02-01T05:16:47.935812  / # /lava-3261641/bin/lava-test-runner /lav=
a-3261641/1
    2023-02-01T05:16:48.013752  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f4d45a1e970466915ec8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f4d45a1e970466915ecd
        new failure (last pass: next-20221012)

    2023-02-01T05:12:38.590918  <8>[   17.008420] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3261610_1.5.2.4.1>
    2023-02-01T05:12:38.695768  / # #
    2023-02-01T05:12:38.798257  export SHELL=3D/bin/sh
    2023-02-01T05:12:38.799231  #
    2023-02-01T05:12:38.900944  / # export SHELL=3D/bin/sh. /lava-3261610/e=
nvironment
    2023-02-01T05:12:38.901416  =

    2023-02-01T05:12:39.002877  / # . /lava-3261610/environment/lava-326161=
0/bin/lava-test-runner /lava-3261610/1
    2023-02-01T05:12:39.003687  =

    2023-02-01T05:12:39.007947  / # /lava-3261610/bin/lava-test-runner /lav=
a-3261610/1
    2023-02-01T05:12:39.081888  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f718da889616c1915ec6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-stm32mp157c-=
dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-stm32mp157c-=
dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f718da889616c1915ecb
        new failure (last pass: next-20221012)

    2023-02-01T05:22:07.271311  <8>[   15.287863] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3261688_1.5.2.4.1>
    2023-02-01T05:22:07.377454  / # #
    2023-02-01T05:22:07.479198  export SHELL=3D/bin/sh
    2023-02-01T05:22:07.479784  #
    2023-02-01T05:22:07.581309  / # export SHELL=3D/bin/sh. /lava-3261688/e=
nvironment
    2023-02-01T05:22:07.581765  =

    2023-02-01T05:22:07.683192  / # . /lava-3261688/environment/lava-326168=
8/bin/lava-test-runner /lava-3261688/1
    2023-02-01T05:22:07.683881  =

    2023-02-01T05:22:07.688469  / # /lava-3261688/bin/lava-test-runner /lav=
a-3261688/1
    2023-02-01T05:22:07.757425  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f90d2d3b4a5fb0915f91

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f90d2d3b4a5fb0915=
f92
        failing since 104 days (last pass: next-20221011, first fail: next-=
20221019) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f1b0806420cfd4915ef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d9f1b0806420cfd4915ef8
        failing since 7 days (last pass: next-20230123, first fail: next-20=
230124)

    2023-02-01T04:59:05.975754  / # #
    2023-02-01T04:59:06.077753  export SHELL=3D/bin/sh
    2023-02-01T04:59:06.078202  #
    2023-02-01T04:59:06.179687  / # export SHELL=3D/bin/sh. /lava-3261395/e=
nvironment
    2023-02-01T04:59:06.180215  =

    2023-02-01T04:59:06.281719  / # . /lava-3261395/environment/lava-326139=
5/bin/lava-test-runner /lava-3261395/1
    2023-02-01T04:59:06.282437  =

    2023-02-01T04:59:06.287365  / # /lava-3261395/bin/lava-test-runner /lav=
a-3261395/1
    2023-02-01T04:59:06.440247  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-01T04:59:06.440583  + cd /lava-3261395/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d9f88f80d58c0a8c915ec5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d9f88f80d58c0a8c915=
ec6
        failing since 69 days (last pass: next-20221121, first fail: next-2=
0221123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63da18396c3a70331a915ecc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230201/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63da18396c3a70331a915ecf
        failing since 27 days (last pass: next-20221207, first fail: next-2=
0230105)

    2023-02-01T07:43:38.365249  + set +x
    2023-02-01T07:43:38.372396  <8>[   43.057051][  T171] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 838433_1.5.2.4.1>
    2023-02-01T07:43:38.503945  #
    2023-02-01T07:43:38.606067  / # #export SHELL=3D/bin/sh
    2023-02-01T07:43:38.606531  =

    2023-02-01T07:43:38.707899  / # export SHELL=3D/bin/sh. /lava-838433/en=
vironment
    2023-02-01T07:43:38.708347  =

    2023-02-01T07:43:38.809720  / # . /lava-838433/environment/lava-838433/=
bin/lava-test-runner /lava-838433/1
    2023-02-01T07:43:38.810468  =

    2023-02-01T07:43:38.814214  / # /lava-838433/bin/lava-test-runner /lava=
-838433/1 =

    ... (18 line(s) more)  =

 =20
