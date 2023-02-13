Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF826941D8
	for <lists+linux-next@lfdr.de>; Mon, 13 Feb 2023 10:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjBMJsN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Feb 2023 04:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjBMJsL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Feb 2023 04:48:11 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9116715567
        for <linux-next@vger.kernel.org>; Mon, 13 Feb 2023 01:47:47 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id b22so2486321pgw.3
        for <linux-next@vger.kernel.org>; Mon, 13 Feb 2023 01:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kHFlO79y+vN30A04vb4MZqxBXLU0p7x4KOyhKd7mTzA=;
        b=dhlxgr2ZtM7Esbi6IHJnhpl29S+pei1ptOF4ou3lkDNI5y8NSYIH9bH8svEwIe/xm4
         SYnJ96GFx7PMpK5SgqtgNeiazgM7FTozSN5wM829kWw1I/jB0y24/mYl2+6eOI+I3v0f
         2NB5KAHWx/LNWlYO9bGuE8wUubIlo6ddQiqGK9jffZQBO3hOJFHTIoY7R6VIcyuIzgBk
         b/p4Xk6PEKfLWRDmu7tWG3d2B1I1BMsQrZv5zRw2M3xFMUGjZ5VZNpj6W9rMgWVpqEO+
         V2qZErRSFohX54+to+dp6v6xKvdSR8r3H8re9PcLoQb2EHwYKNUlAEFZ/SlarEgfz2z/
         iAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHFlO79y+vN30A04vb4MZqxBXLU0p7x4KOyhKd7mTzA=;
        b=obQjJqgIU2EvMytoLr8X4slJflLqptyMDHPmxQ2OlWBNeQw4JasKufqmb1pd+dJpQQ
         OqO2+G8t7/Vd/a6aCU1Fh4d19/d1rPYdcSpqnrip87vR/PF1iQyKwQROIG/NYMHjOs6S
         HSwnAhc5hQIq5xNHdRdoCNbMSu4UmNvXX/lP9GKzrm78WW8f2u0xKsLk0wmB8YLZ4rHR
         tDVp75AX5mdgQCTuEhEc+8m9VAJpyuL7X5feTYXmAKNeU56ycMRwQjEzoRlpsQsodRhM
         zDzn0nwJGpIzZvAlQdmf1C4K0+CwnFpAFo7rUMcT332SKucqoNPh2L02eg51oHgbgVXT
         jvLw==
X-Gm-Message-State: AO0yUKWqVE2g3tTu2anb6/6VwKdvyI3Pgcga42GIYxmmV0KB86f2RGNH
        gVFrRK/thi05tg7iWRC4Hpu8HhBYs4R3qXPFQBSYrQ==
X-Google-Smtp-Source: AK7set+zrciQcSwlXow8geqWMJvUsJewVnntVM/kOCxwO9z+lVsoHNpdq0TF/gym0rQWajVHF4s6+A==
X-Received: by 2002:a62:1490:0:b0:593:ebc7:a6d2 with SMTP id 138-20020a621490000000b00593ebc7a6d2mr19395025pfu.21.1676281664749;
        Mon, 13 Feb 2023 01:47:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y8-20020a62b508000000b00592de256f2csm7718994pfe.145.2023.02.13.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 01:47:44 -0800 (PST)
Message-ID: <63ea0740.620a0220.5ff47.cb78@mx.google.com>
Date:   Mon, 13 Feb 2023 01:47:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230213
X-Kernelci-Report-Type: test
Subject: next/master baseline: 839 runs, 119 regressions (next-20230213)
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

next/master baseline: 839 runs, 119 regressions (next-20230213)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

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

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230213/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230213
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      09e41676e35ab06e4bce8870ea3bf1f191c3cb90 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9e5875cc21979fd8c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9e5875cc21979fd8c8=
64a
        failing since 149 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9da9f094926380d8c863c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9da9f094926380d8c8645
        failing since 25 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-13T06:36:54.603836  <8>[   15.712119] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3332207_1.5.2.4.1>
    2023-02-13T06:36:54.712374  / # #
    2023-02-13T06:36:54.813778  export SHELL=3D/bin/sh
    2023-02-13T06:36:54.814159  #<3>[   15.806529] Bluetooth: hci0: command=
 0x0c03 tx timeout
    2023-02-13T06:36:54.814387  =

    2023-02-13T06:36:54.915654  / # export SHELL=3D/bin/sh. /lava-3332207/e=
nvironment
    2023-02-13T06:36:54.916017  =

    2023-02-13T06:36:55.017346  / # . /lava-3332207/environment/lava-333220=
7/bin/lava-test-runner /lava-3332207/1
    2023-02-13T06:36:55.017812  =

    2023-02-13T06:36:55.022675  / # /lava-3332207/bin/lava-test-runner /lav=
a-3332207/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d47910f8aff2468c8681

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d47910f8aff2468c868a
        failing since 25 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-13T06:10:51.442237  <8>[   16.735273] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3331903_1.5.2.4.1>
    2023-02-13T06:10:51.554877  / # #
    2023-02-13T06:10:51.657866  export SHELL=3D/bin/sh
    2023-02-13T06:10:51.659216  #
    2023-02-13T06:10:51.761325  / # export SHELL=3D/bin/sh. /lava-3331903/e=
nvironment
    2023-02-13T06:10:51.762378  =

    2023-02-13T06:10:51.864864  / # . /lava-3331903/environment/lava-333190=
3/bin/lava-test-runner /lava-3331903/1
    2023-02-13T06:10:51.866567  =

    2023-02-13T06:10:51.871020  / # /lava-3331903/bin/lava-test-runner /lav=
a-3331903/1
    2023-02-13T06:10:51.968095  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d7646893cd2ef68c86a7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d7646893cd2ef68c86b0
        failing since 26 days (last pass: next-20221219, first fail: next-2=
0230117)

    2023-02-13T06:23:09.675417  <8>[   15.285654] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3332057_1.5.2.4.1>
    2023-02-13T06:23:09.782685  / # #
    2023-02-13T06:23:09.884404  export SHELL=3D/bin/sh
    2023-02-13T06:23:09.884734  #<3>[   15.392593] Bluetooth: hci0: command=
 0xfc18 tx timeout
    2023-02-13T06:23:09.884880  =

    2023-02-13T06:23:09.986109  / # export SHELL=3D/bin/sh. /lava-3332057/e=
nvironment
    2023-02-13T06:23:09.987036  =

    2023-02-13T06:23:10.088843  / # . /lava-3332057/environment/lava-333205=
7/bin/lava-test-runner /lava-3332057/1
    2023-02-13T06:23:10.089535  =

    2023-02-13T06:23:10.095793  / # /lava-3332057/bin/lava-test-runner /lav=
a-3332057/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9da1e4508a9c3a08c8693

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9da1e4508a9c3a08c869c
        failing since 25 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-13T06:34:46.327115  <8>[   15.151515] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3332178_1.5.2.4.1>
    2023-02-13T06:34:46.435221  / # #
    2023-02-13T06:34:46.536993  export SHELL=3D/bin/sh
    2023-02-13T06:34:46.537428  #
    2023-02-13T06:34:46.638691  / # export SHELL=3D/bin/sh. /lava-3332178/e=
nvironment
    2023-02-13T06:34:46.639112  =

    2023-02-13T06:34:46.740309  / # . /lava-3332178/environment/lava-333217=
8/bin/lava-test-runner /lava-3332178/1
    2023-02-13T06:34:46.740843  =

    2023-02-13T06:34:46.740997  / # <3>[   15.479759] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-02-13T06:34:46.745728  /lava-3332178/bin/lava-test-runner /lava-33=
32178/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d4aa9d4b67c54a8c8670

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e9d4aa9d4b67c=
54a8c8673
        new failure (last pass: next-20230208)
        30 lines

    2023-02-13T06:11:35.573779  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-02-13T06:11:35.574104  kern  :emerg : Process udevd (pid: 63, stac=
k limit =3D 0x70780cc3)
    2023-02-13T06:11:35.574304  kern  :emerg : Stack: (0xc88d9cf8 to 0xc88d=
a000)
    2023-02-13T06:11:35.574473  kern  :emerg : 9ce0:                       =
                                c4c12200 c076b860
    2023-02-13T06:11:35.574644  kern  :emerg : 9d00: 00000000 c03ab2b8 0000=
0000 b79ca1aa 0000005d b79ca1aa c076b860 bf283220
    2023-02-13T06:11:35.575141  kern  :emerg : 9d20: 00000000 00000000 0000=
0000 00000001 c076b85c bf108424 bf283220 00000000
    2023-02-13T06:11:35.618125  kern  :emerg : 9d40: 00000000 00000000 0000=
0000 bf2c13c8 00000080 bf297270 c4d1e2b8 c0820034
    2023-02-13T06:11:35.618425  kern  :emerg : 9d60: c4d18c00 00000001 c4c3=
0754 00000000 c4c40210 c017fc80 c4c40210 c0820034
    2023-02-13T06:11:35.618617  kern  :emerg : 9d80: c4c40210 c017fe0c c4c3=
0754 00000000 00020000 c017f8fc c4c40210 c4c40160
    2023-02-13T06:11:35.618812  kern  :emerg : 9da0: c08b3580 c06a088c 0000=
0001 b79ca1aa 00000000 00000000 c076b500 bf283024 =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d78c5e21f315e68c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d78c5e21f315e68c8636
        failing since 38 days (last pass: next-20221125, first fail: next-2=
0230106)

    2023-02-13T06:23:47.152574  + [   14.664569] <LAVA_SIGNAL_ENDRUN 0_dmes=
g 1157231_1.5.2.4.1>
    2023-02-13T06:23:47.152882  set +x
    2023-02-13T06:23:47.258591  / # #
    2023-02-13T06:23:47.360471  export SHELL=3D/bin/sh
    2023-02-13T06:23:47.360949  #
    2023-02-13T06:23:47.462302  / # export SHELL=3D/bin/sh. /lava-1157231/e=
nvironment
    2023-02-13T06:23:47.462782  =

    2023-02-13T06:23:47.564178  / # . /lava-1157231/environment/lava-115723=
1/bin/lava-test-runner /lava-1157231/1
    2023-02-13T06:23:47.564945  =

    2023-02-13T06:23:47.566957  / # /lava-1157231/bin/lava-test-runner /lav=
a-1157231/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d98c8d3a0ef7cd8c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d98c8d3a0ef7cd8c8=
642
        failing since 20 days (last pass: next-20230120, first fail: next-2=
0230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d94b78ccf1ce928c866f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d94b78ccf1ce928c8678
        failing since 13 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-02-13T06:31:21.902734  + set +x
    2023-02-13T06:31:21.902952  [   13.084642] <LAVA_SIGNAL_ENDRUN 0_dmesg =
904606_1.5.2.3.1>
    2023-02-13T06:31:22.010536  / # #
    2023-02-13T06:31:22.112058  export SHELL=3D/bin/sh
    2023-02-13T06:31:22.112401  #
    2023-02-13T06:31:22.214554  / # export SHELL=3D/bin/sh. /lava-904606/en=
vironment
    2023-02-13T06:31:22.215034  =

    2023-02-13T06:31:22.316685  / # . /lava-904606/environment/lava-904606/=
bin/lava-test-runner /lava-904606/1
    2023-02-13T06:31:22.317328  =

    2023-02-13T06:31:22.320282  / # /lava-904606/bin/lava-test-runner /lava=
-904606/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d44a1111e5cfde8c869a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d44a1111e5cfde8c86a3
        failing since 13 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-02-13T06:10:02.262073  + set +x
    2023-02-13T06:10:02.262252  [   12.125184] <LAVA_SIGNAL_ENDRUN 0_dmesg =
904584_1.5.2.3.1>
    2023-02-13T06:10:02.369469  / # #
    2023-02-13T06:10:02.470995  export SHELL=3D/bin/sh
    2023-02-13T06:10:02.471518  #
    2023-02-13T06:10:02.572993  / # export SHELL=3D/bin/sh. /lava-904584/en=
vironment
    2023-02-13T06:10:02.573408  =

    2023-02-13T06:10:02.674626  / # . /lava-904584/environment/lava-904584/=
bin/lava-test-runner /lava-904584/1
    2023-02-13T06:10:02.675202  =

    2023-02-13T06:10:02.678343  / # /lava-904584/bin/lava-test-runner /lava=
-904584/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d707fe085a7c3d8c88ab

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d707fe085a7c3d8c88b4
        failing since 13 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-02-13T06:21:42.305421  + set +x
    2023-02-13T06:21:42.305580  [   13.047792] <LAVA_SIGNAL_ENDRUN 0_dmesg =
904595_1.5.2.3.1>
    2023-02-13T06:21:42.413941  / # #
    2023-02-13T06:21:42.515998  export SHELL=3D/bin/sh
    2023-02-13T06:21:42.516690  #
    2023-02-13T06:21:42.618027  / # export SHELL=3D/bin/sh. /lava-904595/en=
vironment
    2023-02-13T06:21:42.618661  =

    2023-02-13T06:21:42.719876  / # . /lava-904595/environment/lava-904595/=
bin/lava-test-runner /lava-904595/1
    2023-02-13T06:21:42.720588  =

    2023-02-13T06:21:42.723594  / # /lava-904595/bin/lava-test-runner /lava=
-904595/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d8fdaa291af6e98c863c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d8fdaa291af6e98c8645
        failing since 13 days (last pass: next-20221205, first fail: next-2=
0230130)

    2023-02-13T06:30:02.962691  + set +x
    2023-02-13T06:30:02.962860  [   12.777566] <LAVA_SIGNAL_ENDRUN 0_dmesg =
904601_1.5.2.3.1>
    2023-02-13T06:30:03.070957  / # #
    2023-02-13T06:30:03.173139  export SHELL=3D/bin/sh
    2023-02-13T06:30:03.174012  #
    2023-02-13T06:30:03.285186  / # export SHELL=3D/bin/sh. /lava-904601/en=
vironment
    2023-02-13T06:30:03.285934  =

    2023-02-13T06:30:03.387472  / # . /lava-904601/environment/lava-904601/=
bin/lava-test-runner /lava-904601/1
    2023-02-13T06:30:03.388268  =

    2023-02-13T06:30:03.391541  / # /lava-904601/bin/lava-test-runner /lava=
-904601/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d5e912a5550e728c8673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d5e912a5550e728c8=
674
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d8eaeb9a9041348c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d8eaeb9a9041348c8=
630
        failing since 38 days (last pass: next-20221125, first fail: next-2=
0230106) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d4340075ecb3688c867f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d4340075ecb3688c8=
680
        failing since 39 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d52e94e385469f8c867e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d52e94e385469f8c8=
67f
        failing since 39 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d76950ac40eafb8c86ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d76950ac40eafb8c8=
6ae
        failing since 39 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9dbb6f29ebd95738c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9dbb6f29ebd95738c8=
640
        failing since 39 days (last pass: next-20221125, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9da2dd83285c76a8c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9da2dd83285c76a8c8=
651
        failing since 173 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d4a3241921772f8c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d4a3241921772f8c8=
641
        failing since 307 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d9fcc6ddd5b61d8c8693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d9fcc6ddd5b61d8c8=
694
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63e9d77a91682bbfb38c8645

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d77a91682bbfb38c864c
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208)

    2023-02-13T06:23:28.141684  / # #
    2023-02-13T06:23:28.243649  export SHELL=3D/bin/sh
    2023-02-13T06:23:28.244324  #
    2023-02-13T06:23:28.345680  / # export SHELL=3D/bin/sh. /lava-273754/en=
vironment
    2023-02-13T06:23:28.346369  =

    2023-02-13T06:23:28.447632  / # . /lava-273754/environment/lava-273754/=
bin/lava-test-runner /lava-273754/1
    2023-02-13T06:23:28.448362  =

    2023-02-13T06:23:28.454942  / # /lava-273754/bin/lava-test-runner /lava=
-273754/1
    2023-02-13T06:23:28.579898  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-13T06:23:28.580202  + <8>[   22.714568] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 273754_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e9d77a91682bbfb38c8650
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208)

    2023-02-13T06:23:30.673972  /lava-273754/1/../bin/lava-test-case
    2023-02-13T06:23:30.674270  <8>[   24.820133] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-13T06:23:30.674420  /lava-273754/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e9d77a91682bbfb38c8652
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208)

    2023-02-13T06:23:31.734291  /lava-273754/1/../bin/lava-test-case
    2023-02-13T06:23:31.734583  <8>[   25.858155] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-13T06:23:31.734734  /lava-273754/1/../bin/lava-test-case
    2023-02-13T06:23:31.734874  <8>[   25.876003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-13T06:23:31.735014  /lava-273754/1/../bin/lava-test-case
    2023-02-13T06:23:31.735149  <8>[   25.895535] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-13T06:23:31.735283  /lava-273754/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e9d77a91682bbfb38c8657
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208)

    2023-02-13T06:23:32.809223  /lava-273754/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e9d77a91682bbfb38c8658
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208)

    2023-02-13T06:23:32.822473  <8>[   26.971978] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-13T06:23:33.868107  /lava-273754/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63e9d30737311c98b18c86ad

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d30737311c98b18c86b4
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:04:38.489705  / # #
    2023-02-13T06:04:38.591688  export SHELL=3D/bin/sh
    2023-02-13T06:04:38.592187  #
    2023-02-13T06:04:38.693642  / # export SHELL=3D/bin/sh. /lava-273725/en=
vironment
    2023-02-13T06:04:38.694068  =

    2023-02-13T06:04:38.795564  / # . /lava-273725/environment/lava-273725/=
bin/lava-test-runner /lava-273725/1
    2023-02-13T06:04:38.796336  =

    2023-02-13T06:04:38.802043  / # /lava-273725/bin/lava-test-runner /lava=
-273725/1
    2023-02-13T06:04:38.924977  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-13T06:04:38.925377  + <8>[   22.524963] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 273725_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e9d30737311c98b18c86b8
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:04:41.017163  /lava-273725/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e9d30737311c98b18c86ba
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:04:42.072356  /lava-273725/1/../bin/lava-test-case
    2023-02-13T06:04:42.072760  <8>[   25.665456] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-13T06:04:42.073016  /lava-273725/1/../bin/lava-test-case
    2023-02-13T06:04:42.073244  <8>[   25.681341] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e9d30737311c98b18c86bf
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:04:43.145319  /lava-273725/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e9d30737311c98b18c86c0
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:04:43.148567  <8>[   26.772573] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-13T06:04:44.205768  /lava-273725/1/../bin/lava-test-case
    2023-02-13T06:04:44.206147  <8>[   27.793971] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-13T06:04:44.206388  /lava-273725/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =


  Details:     https://kernelci.org/test/plan/id/63e9d3a53e399f10358c8669

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d3a53e399f10358c8670
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:07:04.132734  / # #
    2023-02-13T06:07:04.234824  export SHELL=3D/bin/sh
    2023-02-13T06:07:04.235318  #
    2023-02-13T06:07:04.336805  / # export SHELL=3D/bin/sh. /lava-273730/en=
vironment
    2023-02-13T06:07:04.337430  =

    2023-02-13T06:07:04.438893  / # . /lava-273730/environment/lava-273730/=
bin/lava-test-runner /lava-273730/1
    2023-02-13T06:07:04.439799  =

    2023-02-13T06:07:04.444563  / # /lava-273730/bin/lava-test-runner /lava=
-273730/1
    2023-02-13T06:07:04.514550  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-13T06:07:04.514896  + <8>[   44.683755] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 273730_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e9d3a53e399f10358c8674
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:07:06.608803  /lava-273730/1/../bin/lava-test-case
    2023-02-13T06:07:06.609193  <8>[   46.788823] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-13T06:07:06.609434  /lava-273730/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e9d3a53e399f10358c8676
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:07:07.664696  /lava-273730/1/../bin/lava-test-case
    2023-02-13T06:07:07.665097  <8>[   47.826319] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-13T06:07:07.665352  /lava-273730/1/../bin/lava-test-case
    2023-02-13T06:07:07.665580  <8>[   47.843263] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e9d3a53e399f10358c867b
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:07:08.738929  /lava-273730/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e9d3a53e399f10358c867c
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:07:08.742085  <8>[   48.936478] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-13T06:07:09.800289  /lava-273730/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/63e9d4e7b434eebea98c8666

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d4e7b434eebea98c866d
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:12:40.778390  / # #
    2023-02-13T06:12:40.880108  export SHELL=3D/bin/sh
    2023-02-13T06:12:40.880647  #
    2023-02-13T06:12:40.981661  / # export SHELL=3D/bin/sh. /lava-273742/en=
vironment
    2023-02-13T06:12:40.982218  =

    2023-02-13T06:12:41.083482  / # . /lava-273742/environment/lava-273742/=
bin/lava-test-runner /lava-273742/1
    2023-02-13T06:12:41.084259  =

    2023-02-13T06:12:41.103862  / # /lava-273742/bin/lava-test-runner /lava=
-273742/1
    2023-02-13T06:12:41.158933  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-13T06:12:41.159217  + <8>[   22.348085] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 273742_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e9d4e7b434eebea98c8671
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:12:43.252130  /lava-273742/1/../bin/lava-test-case
    2023-02-13T06:12:43.252498  <8>[   24.452346] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-13T06:12:43.252801  /lava-273742/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e9d4e7b434eebea98c8673
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:12:44.308236  /lava-273742/1/../bin/lava-test-case
    2023-02-13T06:12:44.308691  <8>[   25.489789] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-13T06:12:44.308944  /lava-273742/1/../bin/lava-test-case
    2023-02-13T06:12:44.309182  <8>[   25.506715] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-13T06:12:44.309532  /lava-273742/1/../bin/lava-test-case
    2023-02-13T06:12:44.309922  <8>[   25.525201] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-13T06:12:44.310158  /lava-273742/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e9d4e7b434eebea98c8678
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:12:45.382251  /lava-273742/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e9d4e7b434eebea98c8679
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:12:45.387070  <8>[   26.599905] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-13T06:12:46.444302  /lava-273742/1/../bin/lava-test-case
    2023-02-13T06:12:46.447369  <8>[   27.620991] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-13T06:12:46.447652  /lava-273742/1/../bin/lava-test-case
    2023-02-13T06:12:46.447793  <8>[   27.638150] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-13T06:12:46.447929  /lava-273742/1/../bin/lava-test-case
    2023-02-13T06:12:46.448060  <8>[   27.658388] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-02-13T06:12:46.448191  /lava-273742/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63e9d64e6c090acaed8c8632

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d64e6c090acaed8c8639
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:18:31.679828  / # #
    2023-02-13T06:18:31.781957  export SHELL=3D/bin/sh
    2023-02-13T06:18:31.782575  #
    2023-02-13T06:18:31.884016  / # export SHELL=3D/bin/sh. /lava-273746/en=
vironment
    2023-02-13T06:18:31.884601  =

    2023-02-13T06:18:31.986175  / # . /lava-273746/environment/lava-273746/=
bin/lava-test-runner /lava-273746/1
    2023-02-13T06:18:31.987083  =

    2023-02-13T06:18:31.993111  / # /lava-273746/bin/lava-test-runner /lava=
-273746/1
    2023-02-13T06:18:32.062403  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-13T06:18:32.062799  + <8>[   22.400184] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 273746_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e9d64e6c090acaed8c863d
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:18:34.158015  /lava-273746/1/../bin/lava-test-case
    2023-02-13T06:18:34.158693  <8>[   24.507848] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-13T06:18:34.158965  /lava-273746/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e9d64e6c090acaed8c863f
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:18:35.216772  /lava-273746/1/../bin/lava-test-case
    2023-02-13T06:18:35.217107  <8>[   25.547398] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-13T06:18:35.217342  /lava-273746/1/../bin/lava-test-case
    2023-02-13T06:18:35.217564  <8>[   25.564230] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-13T06:18:35.217803  /lava-273746/1/../bin/lava-test-case
    2023-02-13T06:18:35.218022  <8>[   25.582801] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-13T06:18:35.218241  /lava-273746/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e9d64e6c090acaed8c8644
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:18:36.290370  /lava-273746/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e9d64e6c090acaed8c8645
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:18:36.293544  <8>[   26.656962] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-13T06:18:37.351215  /lava-273746/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =


  Details:     https://kernelci.org/test/plan/id/63e9d9fdc6ddd5b61d8c8696

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d9fdc6ddd5b61d8c869d
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:33:42.114036  + set +x
    2023-02-13T06:33:42.129913  <8>[   45.845982][  T189] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 273764_1.5.2.4.1>
    2023-02-13T06:33:42.249588  #
    2023-02-13T06:33:42.351879  / # #export SHELL=3D/bin/sh
    2023-02-13T06:33:42.352304  =

    2023-02-13T06:33:42.453776  / # export SHELL=3D/bin/sh. /lava-273764/en=
vironment
    2023-02-13T06:33:42.454325  =

    2023-02-13T06:33:42.555762  / # . /lava-273764/environment/lava-273764/=
bin/lava-test-runner /lava-273764/1
    2023-02-13T06:33:42.556555  =

    2023-02-13T06:33:42.577941  / # /lava-273764/bin/lava-test-runner /lava=
-273764/1 =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e9d9fdc6ddd5b61d8c86a1
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:33:46.932221  /lava-273764/1/../bin/lava-test-case
    2023-02-13T06:33:47.050293  <8>[   50.764467][  T258] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e9d9fdc6ddd5b61d8c86a3
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:33:48.549613  /lava-273764/1/../bin/lava-test-case
    2023-02-13T06:33:48.669471  <8>[   52.384070][  T268] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e9d9fdc6ddd5b61d8c86a8
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:33:51.418240  /lava-273764/1/../bin/lava-test-case
    2023-02-13T06:33:51.534299  <8>[   55.248817][  T299] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e9d9fdc6ddd5b61d8c86a9
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:33:52.782792  /lava-273764/1/../bin/lava-test-case
    2023-02-13T06:33:52.899811  <8>[   56.612370][  T305] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/63e9da742b610bb5dc8c8636

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9da742b610bb5dc8c863d
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:36:21.660150  <8>[   21.931095] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 273777_1.5.2.4.1>
    2023-02-13T06:36:21.768065  / # #
    2023-02-13T06:36:21.869973  export SHELL=3D/bin/sh
    2023-02-13T06:36:21.870438  #
    2023-02-13T06:36:21.971884  / # export SHELL=3D/bin/sh. /lava-273777/en=
vironment
    2023-02-13T06:36:21.972444  =

    2023-02-13T06:36:22.073695  / # . /lava-273777/environment/lava-273777/=
bin/lava-test-runner /lava-273777/1
    2023-02-13T06:36:22.074696  =

    2023-02-13T06:36:22.091823  / # /lava-273777/bin/lava-test-runner /lava=
-273777/1
    2023-02-13T06:36:22.149844  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e9da742b610bb5dc8c8641
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:36:24.243834  /lava-273777/1/../bin/lava-test-case
    2023-02-13T06:36:24.244129  <8>[   24.503739] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-13T06:36:24.244278  /lava-273777/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e9da742b610bb5dc8c8643
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:36:25.303505  /lava-273777/1/../bin/lava-test-case
    2023-02-13T06:36:25.303904  <8>[   25.541429] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-13T06:36:25.304157  /lava-273777/1/../bin/lava-test-case
    2023-02-13T06:36:25.304382  <8>[   25.559593] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e9da742b610bb5dc8c8648
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:36:26.379140  /lava-273777/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e9da742b610bb5dc8c8649
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-13T06:36:26.382327  <8>[   26.655768] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-13T06:36:27.440678  /lava-273777/1/../bin/lava-test-case
    2023-02-13T06:36:27.441083  <8>[   27.676942] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-13T06:36:27.441272  /lava-273777/1/../bin/lava-test-case
    2023-02-13T06:36:27.441409  <8>[   27.695158] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-13T06:36:27.441546  /lava-273777/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/63e9d52494e385469f8c8630

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63e9d52494e385469f8c8641
        failing since 24 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-13T06:13:31.885629  /lava-273739/1/../bin/lava-test-case
    2023-02-13T06:13:31.888811  <8>[   17.773476] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
9d52494e385469f8c8643
        failing since 24 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-13T06:13:33.897905  /lava-273739/1/../bin/lava-test-case
    2023-02-13T06:13:33.898212  <8>[   19.846977] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-13T06:13:33.898389  /lava-273739/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63e9d676f3ca5dccba8c86a4

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63e9d676f3ca5dccba8c86b5
        failing since 24 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-13T06:19:25.423212  /lava-273744/1/../bin/lava-test-case
    2023-02-13T06:19:25.426338  <8>[   17.648259] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
9d676f3ca5dccba8c86b7
        failing since 24 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-13T06:19:27.434497  /lava-273744/1/../bin/lava-test-case
    2023-02-13T06:19:27.434889  <8>[   19.721870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-13T06:19:27.435132  /lava-273744/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63e9daecc186a8e5968c8654

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63e9daecc186a8e5968c8665
        failing since 24 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-13T06:38:20.657748  /lava-273781/1/../bin/lava-test-case
    2023-02-13T06:38:20.658662  <8>[   17.532011] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
9daecc186a8e5968c8667
        failing since 24 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-13T06:38:22.666801  /lava-273781/1/../bin/lava-test-case
    2023-02-13T06:38:22.667096  <8>[   19.605595] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-13T06:38:22.667245  /lava-273781/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9ceb910bb541ce88c874f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9ceb910bb541ce88c8=
750
        failing since 16 days (last pass: next-20230123, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d39569c02530a18c8688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d39569c02530a18c8=
689
        failing since 19 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d4310075ecb3688c8671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d4310075ecb3688c8=
672
        failing since 19 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d4e5b56d0b3a4a8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d4e5b56d0b3a4a8c8=
630
        failing since 19 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d7b128fcd028e98c867f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d7b128fcd028e98c8688
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:24:34.746525  / # #
    2023-02-13T06:24:34.848407  export SHELL=3D/bin/sh
    2023-02-13T06:24:34.848884  #
    2023-02-13T06:24:34.849143  / # <3>[   18.148768] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:24:34.950481  export SHELL=3D/bin/sh. /lava-3332069/envir=
onment
    2023-02-13T06:24:34.950986  =

    2023-02-13T06:24:35.052380  / # . /lava-3332069/environment/lava-333206=
9/bin/lava-test-runner /lava-3332069/1
    2023-02-13T06:24:35.053135  =

    2023-02-13T06:24:35.058587  / # /lava-3332069/bin/lava-test-runner /lav=
a-3332069/1
    2023-02-13T06:24:35.201412  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d2db82afe6a3968c8634

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d2db82afe6a3968c863d
        failing since 25 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:03:58.954426  / # #
    2023-02-13T06:03:59.056140  export SHELL=3D/bin/sh
    2023-02-13T06:03:59.056586  #
    2023-02-13T06:03:59.056833  / # <3>[   18.185535] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:03:59.158175  export SHELL=3D/bin/sh. /lava-3331809/envir=
onment
    2023-02-13T06:03:59.158644  =

    2023-02-13T06:03:59.260251  / # . /lava-3331809/environment/lava-333180=
9/bin/lava-test-runner /lava-3331809/1
    2023-02-13T06:03:59.261728  =

    2023-02-13T06:03:59.273425  / # /lava-3331809/bin/lava-test-runner /lav=
a-3331809/1
    2023-02-13T06:03:59.409327  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d38e69c02530a18c8677

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d38e69c02530a18c8680
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:07:02.190501  / # #
    2023-02-13T06:07:02.292297  export SHELL=3D/bin/sh
    2023-02-13T06:07:02.293061  #
    2023-02-13T06:07:02.394862  / # export SHELL=3D/bin/sh. /lava-3331854/e=
nvironment
    2023-02-13T06:07:02.395275  =

    2023-02-13T06:07:02.395509  / # <3>[  102.571126] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:07:02.496911  . /lava-3331854/environment/lava-3331854/bi=
n/lava-test-runner /lava-3331854/1
    2023-02-13T06:07:02.498118  =

    2023-02-13T06:07:02.511918  / # /lava-3331854/bin/lava-test-runner /lav=
a-3331854/1
    2023-02-13T06:07:02.571964  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d4bacea83cfbff8c865c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d4bacea83cfbff8c8665
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:11:58.578440  <8>[   17.923648] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3331915_1.5.2.4.1>
    2023-02-13T06:11:58.681698  / # #
    2023-02-13T06:11:58.783129  export SHELL=3D/bin/sh
    2023-02-13T06:11:58.783509  #
    2023-02-13T06:11:58.884903  / # export SHELL=3D/bin/sh. /lava-3331915/e=
nvironment
    2023-02-13T06:11:58.885367  <3>[   18.159457] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:11:58.885629  =

    2023-02-13T06:11:58.987034  / # . /lava-3331915/environment/lava-333191=
5/bin/lava-test-runner /lava-3331915/1
    2023-02-13T06:11:58.987772  =

    2023-02-13T06:11:58.999213  / # /lava-3331915/bin/lava-test-runner /lav=
a-3331915/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d73a56666cad488c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d73a56666cad488c8639
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:22:37.981467  + set +x<8>[   17.911197] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3332034_1.5.2.4.1>
    2023-02-13T06:22:38.084822  / # #
    2023-02-13T06:22:38.186633  export SHELL=3D/bin/sh
    2023-02-13T06:22:38.187109  #
    2023-02-13T06:22:38.288481  / # export SHELL=3D/bin/sh. /lava-3332034/e=
nvironment
    2023-02-13T06:22:38.288968  =

    2023-02-13T06:22:38.289210  / # <3>[   18.155790] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:22:38.390493  . /lava-3332034/environment/lava-3332034/bi=
n/lava-test-runner /lava-3332034/1
    2023-02-13T06:22:38.391272  =

    2023-02-13T06:22:38.397803  / # /lava-3332034/bin/lava-test-runner /lav=
a-3332034/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9da1d4508a9c3a08c8687

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9da1d4508a9c3a08c8690
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:34:58.588862  / # #
    2023-02-13T06:34:58.690593  export SHELL=3D/bin/sh
    2023-02-13T06:34:58.691426  #
    2023-02-13T06:34:58.792765  / # export SHELL=3D/bin/sh. /lava-3332238/e=
nvironment
    2023-02-13T06:34:58.793217  =

    2023-02-13T06:34:58.793440  / # <3>[   18.241774] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:34:58.894752  . /lava-3332238/environment/lava-3332238/bi=
n/lava-test-runner /lava-3332238/1
    2023-02-13T06:34:58.895438  =

    2023-02-13T06:34:58.913991  / # /lava-3332238/bin/lava-test-runner /lav=
a-3332238/1
    2023-02-13T06:34:58.971912  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d7db77091ae74d8c86c4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d7db77091ae74d8c86cd
        failing since 26 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-13T06:24:54.558239  / # #
    2023-02-13T06:24:54.660670  export SHELL=3D/bin/sh
    2023-02-13T06:24:54.661394  #
    2023-02-13T06:24:54.763018  / # export SHELL=3D/bin/sh. /lava-3332098/e=
nvironment
    2023-02-13T06:24:54.763717  =

    2023-02-13T06:24:54.865400  / # . /lava-3332098/environment/lava-333209=
8/bin/lava-test-runner /lava-3332098/1
    2023-02-13T06:24:54.866500  =

    2023-02-13T06:24:54.882745  / # /lava-3332098/bin/lava-test-runner /lav=
a-3332098/1
    2023-02-13T06:24:55.025652  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-13T06:24:55.026428  + cd /lava-3332098/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d2fe37311c98b18c863f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d2fe37311c98b18c8648
        failing since 25 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-13T06:04:18.248399  / # #
    2023-02-13T06:04:18.350314  export SHELL=3D/bin/sh
    2023-02-13T06:04:18.350866  #
    2023-02-13T06:04:18.452234  / # export SHELL=3D/bin/sh. /lava-3331814/e=
nvironment
    2023-02-13T06:04:18.452787  =

    2023-02-13T06:04:18.554228  / # . /lava-3331814/environment/lava-333181=
4/bin/lava-test-runner /lava-3331814/1
    2023-02-13T06:04:18.555021  =

    2023-02-13T06:04:18.559676  / # /lava-3331814/bin/lava-test-runner /lav=
a-3331814/1
    2023-02-13T06:04:18.687699  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-13T06:04:18.722451  + cd /lava-3331814/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d37192032b7c458c871b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d37192032b7c458c8724
        failing since 26 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-13T06:06:16.577335  / # #
    2023-02-13T06:06:16.679148  export SHELL=3D/bin/sh
    2023-02-13T06:06:16.679655  #
    2023-02-13T06:06:16.780981  / # export SHELL=3D/bin/sh. /lava-3331830/e=
nvironment
    2023-02-13T06:06:16.781431  =

    2023-02-13T06:06:16.882837  / # . /lava-3331830/environment/lava-333183=
0/bin/lava-test-runner /lava-3331830/1
    2023-02-13T06:06:16.883512  =

    2023-02-13T06:06:16.888714  / # /lava-3331830/bin/lava-test-runner /lav=
a-3331830/1
    2023-02-13T06:06:16.965611  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-13T06:06:16.966216  + cd /lava-3331830/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d4e9b56d0b3a4a8c8638

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d4e9b56d0b3a4a8c8641
        failing since 26 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-13T06:12:13.655538  / # #
    2023-02-13T06:12:13.757635  export SHELL=3D/bin/sh
    2023-02-13T06:12:13.758161  #
    2023-02-13T06:12:13.859610  / # export SHELL=3D/bin/sh. /lava-3331942/e=
nvironment
    2023-02-13T06:12:13.860155  =

    2023-02-13T06:12:13.961644  / # . /lava-3331942/environment/lava-333194=
2/bin/lava-test-runner /lava-3331942/1
    2023-02-13T06:12:13.962522  =

    2023-02-13T06:12:13.979591  / # /lava-3331942/bin/lava-test-runner /lav=
a-3331942/1
    2023-02-13T06:12:14.041365  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-13T06:12:14.041950  + cd /lava-3331942/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d75e6893cd2ef68c8661

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d75e6893cd2ef68c866a
        failing since 26 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-13T06:23:03.388797  / # #
    2023-02-13T06:23:03.490887  export SHELL=3D/bin/sh
    2023-02-13T06:23:03.491415  #
    2023-02-13T06:23:03.592522  / # export SHELL=3D/bin/sh. /lava-3332037/e=
nvironment
    2023-02-13T06:23:03.593032  =

    2023-02-13T06:23:03.694396  / # . /lava-3332037/environment/lava-333203=
7/bin/lava-test-runner /lava-3332037/1
    2023-02-13T06:23:03.695215  =

    2023-02-13T06:23:03.699968  / # /lava-3332037/bin/lava-test-runner /lav=
a-3332037/1
    2023-02-13T06:23:03.777883  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-13T06:23:03.778253  + cd /lava-3332037/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9da4349e9aa924d8c8670

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9da4349e9aa924d8c8679
        failing since 26 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-13T06:35:31.350882  + set +x<8>[   18.383683] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3332282_1.5.2.4.1>
    2023-02-13T06:35:31.456095  / # #
    2023-02-13T06:35:31.557909  export SHELL=3D/bin/sh
    2023-02-13T06:35:31.558309  #
    2023-02-13T06:35:31.659602  / # export SHELL=3D/bin/sh. /lava-3332282/e=
nvironment
    2023-02-13T06:35:31.659994  =

    2023-02-13T06:35:31.761330  / # . /lava-3332282/environment/lava-333228=
2/bin/lava-test-runner /lava-3332282/1
    2023-02-13T06:35:31.762058  =

    2023-02-13T06:35:31.765968  / # /lava-3332282/bin/lava-test-runner /lav=
a-3332282/1
    2023-02-13T06:35:31.841895  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d8c7f1bcf328548c86b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d8c7f1bcf328548c8=
6b1
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d7b21010ae809a8c86b0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d7b21010ae809a8c86b9
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:24:36.089847  / # #
    2023-02-13T06:24:36.191585  export SHELL=3D/bin/sh
    2023-02-13T06:24:36.192028  #
    2023-02-13T06:24:36.192250  / # export SHELL=3D/bin/sh<3>[   18.495278]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:24:36.293479  . /lava-3332090/environment
    2023-02-13T06:24:36.293822  =

    2023-02-13T06:24:36.395029  / # . /lava-3332090/environment/lava-333209=
0/bin/lava-test-runner /lava-3332090/1
    2023-02-13T06:24:36.395491  =

    2023-02-13T06:24:36.399651  / # /lava-3332090/bin/lava-test-runner /lav=
a-3332090/1
    2023-02-13T06:24:36.523622  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d2d99a59db027f8c8651

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d2d99a59db027f8c865a
        failing since 25 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:04:00.651161  =

    2023-02-13T06:04:00.752401  / # #export SHELL=3D/bin/sh
    2023-02-13T06:04:00.752762  =

    2023-02-13T06:04:00.752917  / # export SHELL=3D/bin/sh<3>[   18.102313]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:04:00.854061  . /lava-3331800/environment
    2023-02-13T06:04:00.854516  =

    2023-02-13T06:04:00.955914  / # . /lava-3331800/environment/lava-333180=
0/bin/lava-test-runner /lava-3331800/1
    2023-02-13T06:04:00.956922  =

    2023-02-13T06:04:00.962924  / # /lava-3331800/bin/lava-test-runner /lav=
a-3331800/1
    2023-02-13T06:04:01.083538  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d38c69c02530a18c8669

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d38c69c02530a18c8672
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:06:44.444751  / # #
    2023-02-13T06:06:44.546744  export SHELL=3D/bin/sh
    2023-02-13T06:06:44.547620  #
    2023-02-13T06:06:44.649095  / # export SHELL=3D/bin/sh. /lava-3331842/e=
nvironment
    2023-02-13T06:06:44.649952  =

    2023-02-13T06:06:44.650384  / # <3>[  103.313094] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:06:44.752277  . /lava-3331842/environment/lava-3331842/bi=
n/lava-test-runner /lava-3331842/1
    2023-02-13T06:06:44.752953  =

    2023-02-13T06:06:44.757456  / # /lava-3331842/bin/lava-test-runner /lav=
a-3331842/1
    2023-02-13T06:06:44.829480  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d4bc7965981f418c8631

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d4bc7965981f418c863a
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:12:00.576431  / # #
    2023-02-13T06:12:00.678054  export SHELL=3D/bin/sh
    2023-02-13T06:12:00.678613  #
    2023-02-13T06:12:00.780071  / # export SHELL=3D/bin/sh. /lava-3331926/e=
nvironment
    2023-02-13T06:12:00.780987  =

    2023-02-13T06:12:00.781474  / # <3>[   18.236251] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:12:00.883455  . /lava-3331926/environment/lava-3331926/bi=
n/lava-test-runner /lava-3331926/1
    2023-02-13T06:12:00.884824  =

    2023-02-13T06:12:00.894585  / # /lava-3331926/bin/lava-test-runner /lav=
a-3331926/1
    2023-02-13T06:12:00.959584  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d739d2016c19ee8c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d739d2016c19ee8c8638
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:22:39.538914  + set +x<8>[   18.001262] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3332012_1.5.2.4.1>
    2023-02-13T06:22:39.642724  / # #
    2023-02-13T06:22:39.744200  export SHELL=3D/bin/sh
    2023-02-13T06:22:39.744699  #
    2023-02-13T06:22:39.845907  / # export SHELL=3D/bin/sh. /lava-3332012/e=
nvironment
    2023-02-13T06:22:39.846251  =

    2023-02-13T06:22:39.846423  / # <3>[   18.244115] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:22:39.947619  . /lava-3332012/environment/lava-3332012/bi=
n/lava-test-runner /lava-3332012/1
    2023-02-13T06:22:39.948897  =

    2023-02-13T06:22:39.952801  / # /lava-3332012/bin/lava-test-runner /lav=
a-3332012/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9da1eff3b5b88308c871d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9da1eff3b5b88308c8726
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-13T06:34:59.772278  =

    2023-02-13T06:34:59.875249  / # #
    2023-02-13T06:34:59.977162  export SHELL=3D/bin/sh
    2023-02-13T06:34:59.977914  #
    2023-02-13T06:35:00.079296  / # export SHELL=3D/bin/sh. /lava-3332243/e=
nvironment
    2023-02-13T06:35:00.079611  =

    2023-02-13T06:35:00.079745  / # <3>[   18.148636] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-13T06:35:00.180826  . /lava-3332243/environment/lava-3332243/bi=
n/lava-test-runner /lava-3332243/1
    2023-02-13T06:35:00.181329  =

    2023-02-13T06:35:00.187815  / # /lava-3332243/bin/lava-test-runner /lav=
a-3332243/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d943141561bb3f8c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d943141561bb3f8c8=
64e
        failing since 19 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d714fe085a7c3d8c8903

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d714fe085a7c3d8c8=
904
        failing since 16 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d409cf5626a1c38c8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d409cf5626a1c38c8=
664
        failing since 19 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d94678ccf1ce928c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d94678ccf1ce928c8=
638
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/63e9d53694e385469f8c8685

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/63e9d53694e385469f8c873b
        failing since 11 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-13T06:13:51.880331  /lava-9140225/1/../bin/lava-test-case

    2023-02-13T06:13:51.886612  <8>[   22.682037] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/63e9d53694e385469f8c873c
        failing since 11 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-13T06:13:50.861191  /lava-9140225/1/../bin/lava-test-case

    2023-02-13T06:13:50.867451  <8>[   21.662567] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/63e9d53694e385469f8c873d
        failing since 11 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-13T06:13:48.832339  TPM2_CC_TestParms:

    2023-02-13T06:13:48.832427    value: 0x18A

    2023-02-13T06:13:48.835842    commandIndex: 0x18a

    2023-02-13T06:13:48.839284    reserved1:    0x0

    2023-02-13T06:13:48.839370    nv:           0

    2023-02-13T06:13:48.842195    extensive:    0

    2023-02-13T06:13:48.842281    flushed:      0

    2023-02-13T06:13:48.845575    cHandles:     0x0

    2023-02-13T06:13:48.845660    rHandle:      0

    2023-02-13T06:13:48.849238    V:            0
 =

    ... (49 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d94683051b4bf18c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d94683051b4bf18c8=
648
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d4cc7965981f418c866e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d4cc7965981f418c8=
66f
        failing since 173 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9f16996d5a68fa28c8662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9f16996d5a68fa28c8=
663
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9da5a6d8b1886608c86d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9da5a6d8b1886608c8=
6da
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9da669174f618128c865f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9da669174f618128c8=
660
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9da586d8b1886608c86c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9da586d8b1886608c8=
6c8
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9da7a2b610bb5dc8c86a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9da7a2b610bb5dc8c8=
6a3
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d27fe721585a778c866d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d27fe721585a778c8=
66e
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d2a65be51657b18c8665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d2a65be51657b18c8=
666
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d7921010ae809a8c8669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d7921010ae809a8c8=
66a
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d36e92032b7c458c870d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d36e92032b7c458c8=
70e
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d3e692446f05fe8c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d3e692446f05fe8c8=
633
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d4ff10cc3069088c865b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d4ff10cc3069088c8=
65c
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d5c6d784dfe1078c86d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d5c6d784dfe1078c8=
6d6
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d6663832896a718c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d6663832896a718c8=
63f
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d85a933f0454c78c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d85a933f0454c78c8=
64a
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9db525f6732c29f8c8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9db525f6732c29f8c8=
639
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d5d31eeece94bd8c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d5d31eeece94bd8c8=
64b
        failing since 82 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d4a79d4b67c54a8c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d4a79d4b67c54a8c8=
636
        failing since 82 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d959454bc242e28c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d959454bc242e28c8=
650
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d98e8d3a0ef7cd8c8668

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d98e8d3a0ef7cd8c866f
        failing since 39 days (last pass: next-20221130, first fail: next-2=
0230105)

    2023-02-13T06:32:30.656893  + set +x
    2023-02-13T06:32:30.658381  <8>[   69.008458][  T195] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 397577_1.5.2.4.1>
    2023-02-13T06:32:30.788447  #
    2023-02-13T06:32:30.891334  / # #export SHELL=3D/bin/sh
    2023-02-13T06:32:30.891928  =

    2023-02-13T06:32:30.993445  / # export SHELL=3D/bin/sh. /lava-397577/en=
vironment
    2023-02-13T06:32:30.994146  =

    2023-02-13T06:32:31.095884  / # . /lava-397577/environment/lava-397577/=
bin/lava-test-runner /lava-397577/1
    2023-02-13T06:32:31.096844  =

    2023-02-13T06:32:31.106168  / # /lava-397577/bin/lava-test-runner /lava=
-397577/1 =

    ... (43 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d94978ccf1ce928c866a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d94978ccf1ce928c8=
66b
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d94abb234302028c8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d94abb234302028c8=
661
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d643294e2623d28c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d643294e2623d28c8=
636
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d96607251512038c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e9d96607251512038c8=
652
        failing since 116 days (last pass: next-20221011, first fail: next-=
20221019) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d532401798c4dd8c8657

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d532401798c4dd8c8660
        failing since 19 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-02-13T06:13:45.960829  / # #
    2023-02-13T06:13:46.062764  export SHELL=3D/bin/sh
    2023-02-13T06:13:46.063457  #
    2023-02-13T06:13:46.165053  / # export SHELL=3D/bin/sh. /lava-3332000/e=
nvironment
    2023-02-13T06:13:46.165578  =

    2023-02-13T06:13:46.266968  / # . /lava-3332000/environment/lava-333200=
0/bin/lava-test-runner /lava-3332000/1
    2023-02-13T06:13:46.267739  =

    2023-02-13T06:13:46.271986  / # /lava-3332000/bin/lava-test-runner /lav=
a-3332000/1
    2023-02-13T06:13:46.414901  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-13T06:13:46.415700  + cd /lava-3332000/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e9d95507251512038c8631

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230213/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e9d95507251512038c8638
        failing since 39 days (last pass: next-20221207, first fail: next-2=
0230105)

    2023-02-13T06:31:25.803728  + set +x
    2023-02-13T06:31:25.810879  <8>[   43.701509][  T170] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 849164_1.5.2.4.1>
    2023-02-13T06:31:25.944403  #
    2023-02-13T06:31:26.046519  / # #export SHELL=3D/bin/sh
    2023-02-13T06:31:26.046995  =

    2023-02-13T06:31:26.148385  / # export SHELL=3D/bin/sh. /lava-849164/en=
vironment
    2023-02-13T06:31:26.148844  =

    2023-02-13T06:31:26.250301  / # . /lava-849164/environment/lava-849164/=
bin/lava-test-runner /lava-849164/1
    2023-02-13T06:31:26.251118  =

    2023-02-13T06:31:26.255715  / # /lava-849164/bin/lava-test-runner /lava=
-849164/1 =

    ... (18 line(s) more)  =

 =20
