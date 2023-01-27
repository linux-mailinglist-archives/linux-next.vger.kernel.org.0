Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B2267E562
	for <lists+linux-next@lfdr.de>; Fri, 27 Jan 2023 13:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbjA0Mg0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Jan 2023 07:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233618AbjA0MgZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Jan 2023 07:36:25 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D961C74A63
        for <linux-next@vger.kernel.org>; Fri, 27 Jan 2023 04:36:13 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so8546097pjq.0
        for <linux-next@vger.kernel.org>; Fri, 27 Jan 2023 04:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nhC/LYNXhIlvXn0kM+t6iXJKK5bd1sxJb2n1K9BWXu8=;
        b=Dh1rDBV7dNrP9xsZErJKGgXMLRUumDoSLeCAXnZF6XXCdLxnNYqrZXKgEDsXkEozu9
         KnKP5Gr1RcrPHZEYRYwdftUbJd8vM1C/c6+I7aoq4rhW1oB/1OkOt5CMSQPj9Ew4LaBQ
         ukf8hrefSdA6UVfILdnkKO3Pepi4BPa3aUVHYmsnuUB/Fn0pyMIIWJGLYKdlj7JBtV2p
         YhoFdm+YDmmTFa+jln9MsJAUHjWOvBr34P5+/DLBylyRe18mt1yNTLwefCC8XnCnq0fp
         1HiDHuD0xu7fwmKTUJ3DHYWbRibivCTu/53U+nVIOqt065TdhhExvwrk+U2O1Og1VTCs
         Bb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhC/LYNXhIlvXn0kM+t6iXJKK5bd1sxJb2n1K9BWXu8=;
        b=oQEGQ6VX3pYAmRn6HO/FY33LlcnSqaRwNFNTWlm9YTMVEyy2mCkvnPV0gUK6ZfXZNk
         wUryFj/trCRULYchB1KpgwXxfw/ANA7p73JB0ZUHXXbVzPUgsn/K0tUQtyOG3mBJ2eL5
         NZqZstAhWH6anOCvTi4LCW1TJnLi21keTY9vDaWRTOqKzhpme3S8/dNOSamRzGb4Er0r
         nEmsXABBmGaKxc2fXDWOKrJhFqtLZgrXHj/Afx9W3CPSceo+bbodEkcIB6pld1H8KNV1
         OGJ/MY1Mn/C5GUOuo0u/zTcHhWUwEbfa1TnR4v/U2bcGPsOpoI3aQesp0gtuo35wW9DM
         N9MA==
X-Gm-Message-State: AO0yUKVkNjLaUHWrivTViFyZIV5S1PZN1Ph3BUjkzWWNpKeibLzWoOr5
        vdVmW4YT1IDn7eUgdnu94tBExCR1gYeSUmFj9Sk=
X-Google-Smtp-Source: AK7set/wp88p7DmTSh4rh289YKfHQL9j1gTGKEr922uRww1L+xAlj0ahQORwkV8z6dGIr6L4VFLFnQ==
X-Received: by 2002:a05:6a21:3288:b0:bc:5262:318e with SMTP id yt8-20020a056a21328800b000bc5262318emr1227520pzb.47.1674822971588;
        Fri, 27 Jan 2023 04:36:11 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b17-20020aa78ed1000000b00580e3917af7sm2528003pfr.117.2023.01.27.04.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 04:36:10 -0800 (PST)
Message-ID: <63d3c53a.a70a0220.50fc4.3d8a@mx.google.com>
Date:   Fri, 27 Jan 2023 04:36:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230127
X-Kernelci-Report-Type: test
Subject: next/master baseline: 913 runs, 91 regressions (next-20230127)
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

next/master baseline: 913 runs, 91 regressions (next-20230127)

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

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =

jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig                    | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 3          =

sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | clang-16 | defcon=
fig                    | 1          =

sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | clang-16 | multi_=
v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230127/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230127
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38d0f8d1faf24e1915ed1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38d0f8d1faf24e1915=
ed2
        failing since 132 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38c222e3b5afb5b915f9f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38c222e3b5afb5b915fa4
        failing since 2 days (last pass: next-20230124, first fail: next-20=
230125)

    2023-01-27T08:32:09.514112  + set +x
    2023-01-27T08:32:09.518981  <8>[   16.885064] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 191391_1.5.2.4.1>
    2023-01-27T08:32:09.629808  / # #
    2023-01-27T08:32:09.732130  export SHELL=3D/bin/sh
    2023-01-27T08:32:09.732756  #
    2023-01-27T08:32:09.834400  / # export SHELL=3D/bin/sh. /lava-191391/en=
vironment
    2023-01-27T08:32:09.835024  =

    2023-01-27T08:32:09.936879  / # . /lava-191391/environment/lava-191391/=
bin/lava-test-runner /lava-191391/1
    2023-01-27T08:32:09.938010  =

    2023-01-27T08:32:09.943687  / # /lava-191391/bin/lava-test-runner /lava=
-191391/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38c6811b6968858915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38c6811b6968858915=
ebc
        failing since 5 days (last pass: next-20230119, first fail: next-20=
230120) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d391f247be9e77e3915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d391f247be9e77e3915=
eba
        failing since 2 days (last pass: next-20230124, first fail: next-20=
230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3920a891761dd37915ec6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3920a891761dd37915ecb
        failing since 8 days (last pass: next-20221219, first fail: next-20=
230118)

    2023-01-27T08:57:21.441593  <8>[   15.550426] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3225824_1.5.2.4.1>
    2023-01-27T08:57:21.547391  / # #
    2023-01-27T08:57:21.649000  export SHELL=3D/bin/sh
    2023-01-27T08:57:21.649413  #
    2023-01-27T08:57:21.750612  / # export SHELL=3D/bin/sh. /lava-3225824/e=
nvironment
    2023-01-27T08:57:21.751394  =

    2023-01-27T08:57:21.751791  <3>[   15.776739] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-01-27T08:57:21.853689  / # . /lava-3225824/environment/lava-322582=
4/bin/lava-test-runner /lava-3225824/1
    2023-01-27T08:57:21.854982  =

    2023-01-27T08:57:21.859841  / # /lava-3225824/bin/lava-test-runner /lav=
a-3225824/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38c8e8944e34a1b915ef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38c8e8944e34a1b915ef8
        failing since 8 days (last pass: next-20221219, first fail: next-20=
230118)

    2023-01-27T08:33:58.629043  <8>[   14.954543] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3225274_1.5.2.4.1>
    2023-01-27T08:33:58.737793  / # #
    2023-01-27T08:33:58.840818  export SHELL=3D/bin/sh
    2023-01-27T08:33:58.841223  #
    2023-01-27T08:33:58.942541  / # export SHELL=3D/bin/sh. /lava-3225274/e=
nvironment
    2023-01-27T08:33:58.942868  =

    2023-01-27T08:33:58.943045  / # <3>[   15.203970] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-01-27T08:33:59.044036  . /lava-3225274/environment/lava-3225274/bi=
n/lava-test-runner /lava-3225274/1
    2023-01-27T08:33:59.044572  =

    2023-01-27T08:33:59.051090  / # /lava-3225274/bin/lava-test-runner /lav=
a-3225274/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38e1d05f92ef5e1915ec7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38e1d05f92ef5e1915ecc
        failing since 8 days (last pass: next-20221219, first fail: next-20=
230118)

    2023-01-27T08:40:50.980816  <8>[   16.598148] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3225362_1.5.2.4.1>
    2023-01-27T08:40:51.090461  / # #
    2023-01-27T08:40:51.193854  export SHELL=3D/bin/sh
    2023-01-27T08:40:51.194910  #
    2023-01-27T08:40:51.296969  / # export SHELL=3D/bin/sh. /lava-3225362/e=
nvironment
    2023-01-27T08:40:51.297976  =

    2023-01-27T08:40:51.400560  / # . /lava-3225362/environment/lava-322536=
2/bin/lava-test-runner /lava-3225362/1
    2023-01-27T08:40:51.401961  =

    2023-01-27T08:40:51.406835  / # /lava-3225362/bin/lava-test-runner /lav=
a-3225362/1
    2023-01-27T08:40:51.489752  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38ea9e2b64c9423915f14

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38ea9e2b64c9423915f19
        failing since 9 days (last pass: next-20221219, first fail: next-20=
230117)

    2023-01-27T08:43:03.961490  + set +x<8>[   15.101446] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3225444_1.5.2.4.1>
    2023-01-27T08:43:03.962322  =

    2023-01-27T08:43:04.071998  / # #
    2023-01-27T08:43:04.175808  export SHELL=3D/bin/sh
    2023-01-27T08:43:04.177016  #<3>[   15.206008] Bluetooth: hci0: command=
 0xfc18 tx timeout
    2023-01-27T08:43:04.177733  =

    2023-01-27T08:43:04.280082  / # export SHELL=3D/bin/sh. /lava-3225444/e=
nvironment
    2023-01-27T08:43:04.280933  =

    2023-01-27T08:43:04.383597  / # . /lava-3225444/environment/lava-322544=
4/bin/lava-test-runner /lava-3225444/1
    2023-01-27T08:43:04.384981   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38cf85cdc189741915eed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38cf85cdc189741915ef0
        failing since 21 days (last pass: next-20221124, first fail: next-2=
0230106)

    2023-01-27T08:35:43.311636  [   17.418908] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1147339_1.5.2.4.1>
    2023-01-27T08:35:43.419804  / # #
    2023-01-27T08:35:43.521743  export SHELL=3D/bin/sh
    2023-01-27T08:35:43.522196  #
    2023-01-27T08:35:43.623553  / # export SHELL=3D/bin/sh. /lava-1147339/e=
nvironment
    2023-01-27T08:35:43.624005  =

    2023-01-27T08:35:43.725373  / # . /lava-1147339/environment/lava-114733=
9/bin/lava-test-runner /lava-1147339/1
    2023-01-27T08:35:43.726099  =

    2023-01-27T08:35:43.728105  / # /lava-1147339/bin/lava-test-runner /lav=
a-1147339/1
    2023-01-27T08:35:43.748762  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3905f282cba2978915ec7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3905f282cba2978915eca
        failing since 21 days (last pass: next-20221125, first fail: next-2=
0230106)

    2023-01-27T08:50:27.526037  [   12.876703] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1147356_1.5.2.4.1>
    2023-01-27T08:50:27.633250  / # #
    2023-01-27T08:50:27.734968  export SHELL=3D/bin/sh
    2023-01-27T08:50:27.735469  #
    2023-01-27T08:50:27.836851  / # export SHELL=3D/bin/sh. /lava-1147356/e=
nvironment
    2023-01-27T08:50:27.837395  =

    2023-01-27T08:50:27.938775  / # . /lava-1147356/environment/lava-114735=
6/bin/lava-test-runner /lava-1147356/1
    2023-01-27T08:50:27.939518  =

    2023-01-27T08:50:27.941429  / # /lava-1147356/bin/lava-test-runner /lav=
a-1147356/1
    2023-01-27T08:50:27.965619  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38dd3921c3b530f915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38dd3921c3b530f915=
eba
        failing since 22 days (last pass: next-20221124, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d393156964c07185915ef0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d393156964c07185915=
ef1
        failing since 21 days (last pass: next-20221125, first fail: next-2=
0230106) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38ffc12f68a6339915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38ffc12f68a6339915=
ebb
        failing since 22 days (last pass: next-20221125, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3918b4f7d975e66915ed4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3918b4f7d975e66915=
ed5
        failing since 22 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39648845967de4291604a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39648845967de42916=
04b
        failing since 22 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d396e92323145f23915f34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d396e92323145f23915=
f35
        failing since 22 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3988cd71365607b915ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3988cd71365607b915=
ee9
        failing since 22 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39929c17e5fee36915ee0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39929c17e5fee36915=
ee1
        failing since 22 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d391f447be9e77e3915ebc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d391f447be9e77e3915=
ebd
        failing since 156 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38e1f05f92ef5e1915ed4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38e1f05f92ef5e1915=
ed5
        failing since 290 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63d38d059851c48f40915efb

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63d38d059851c48f40915f08
        failing since 8 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-27T08:36:05.893050  /lava-257612/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63d=
38d059851c48f40915f0a
        failing since 8 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-27T08:36:07.899292  /lava-257612/1/../bin/lava-test-case
    2023-01-27T08:36:07.899663  <8>[   19.924052] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-01-27T08:36:07.899910  /lava-257612/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63d38ef94c7bd172b3915ec6

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63d38ef94c7bd172b3915ed3
        failing since 8 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-27T08:44:23.396598  /lava-257631/1/../bin/lava-test-case
    2023-01-27T08:44:23.399746  <8>[   17.238383] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63d=
38ef94c7bd172b3915ed5
        failing since 8 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-27T08:44:25.401849  /lava-257631/1/../bin/lava-test-case
    2023-01-27T08:44:25.402248  <8>[   19.312537] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-01-27T08:44:25.402494  /lava-257631/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/63d38f717a0cf825f7915f96

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63d38f717a0cf825f7915fa3
        failing since 8 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-27T08:46:22.460194  /lava-257635/1/../bin/lava-test-case
    2023-01-27T08:46:22.463309  <8>[   17.337410] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63d=
38f717a0cf825f7915fa5
        failing since 8 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-27T08:46:24.472158  /lava-257635/1/../bin/lava-test-case
    2023-01-27T08:46:24.472567  <8>[   19.411574] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-01-27T08:46:24.472820  /lava-257635/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63d3929123d131d13b915eb9

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63d3929223d131d13b915ec6
        failing since 8 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-27T08:59:41.926044  /lava-257662/1/../bin/lava-test-case
    2023-01-27T08:59:41.929226  <8>[   17.209025] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63d=
3929223d131d13b915ec8
        failing since 8 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-27T08:59:43.938337  /lava-257662/1/../bin/lava-test-case
    2023-01-27T08:59:43.938679  <8>[   19.283092] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-01-27T08:59:43.938832  /lava-257662/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3936cb90f1d8411915ebf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3936cb90f1d8411915=
ec0
        new failure (last pass: next-20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39959045ff9e9f3915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39959045ff9e9f3915=
ebc
        new failure (last pass: next-20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38c744725f79ccc915f08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38c744725f79ccc915=
f09
        failing since 2 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38cc480b2e47224915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38cc480b2e47224915=
eba
        failing since 2 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38e53753ff07a68915ec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38e53753ff07a68915=
ec5
        failing since 2 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38c983a107b945f915eeb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38c983a107b945f915ef0
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:34:23.288760  <8>[   18.079745] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3225320_1.5.2.4.1>
    2023-01-27T08:34:23.392997  / # #
    2023-01-27T08:34:23.494791  export SHELL=3D/bin/sh
    2023-01-27T08:34:23.495241  #
    2023-01-27T08:34:23.596618  / # export SHELL=3D/bin/sh. /lava-3225320/e=
nvironment
    2023-01-27T08:34:23.597020  =

    2023-01-27T08:34:23.597248  / # <3>[   18.332519] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:34:23.698631  . /lava-3225320/environment/lava-3225320/bi=
n/lava-test-runner /lava-3225320/1
    2023-01-27T08:34:23.699386  =

    2023-01-27T08:34:23.714413  / # /lava-3225320/bin/lava-test-runner /lav=
a-3225320/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38f3f1c971319f09160cb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38f3f1c971319f09160d0
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:45:39.344856  / # #
    2023-01-27T08:45:39.447431  export SHELL=3D/bin/sh
    2023-01-27T08:45:39.447835  #
    2023-01-27T08:45:39.549224  / # export SHELL=3D/bin/sh. /lava-3225589/e=
nvironment
    2023-01-27T08:45:39.549998  <3>[   18.460640] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:45:39.550688  =

    2023-01-27T08:45:39.652486  / # . /lava-3225589/environment/lava-322558=
9/bin/lava-test-runner /lava-3225589/1
    2023-01-27T08:45:39.653207  =

    2023-01-27T08:45:39.657680  / # /lava-3225589/bin/lava-test-runner /lav=
a-3225589/1
    2023-01-27T08:45:39.731811  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38e9fe2b64c9423915ec8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38e9fe2b64c9423915ecd
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:42:59.693197  / # #
    2023-01-27T08:42:59.794635  export SHELL=3D/bin/sh
    2023-01-27T08:42:59.794991  #
    2023-01-27T08:42:59.896134  / # export SHELL=3D/bin/sh. /lava-3225461/e=
nvironment
    2023-01-27T08:42:59.896517  =

    2023-01-27T08:42:59.896704  / # <3>[   18.234200] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:42:59.997929  . /lava-3225461/environment/lava-3225461/bi=
n/lava-test-runner /lava-3225461/1
    2023-01-27T08:42:59.998459  =

    2023-01-27T08:43:00.012343  / # /lava-3225461/bin/lava-test-runner /lav=
a-3225461/1
    2023-01-27T08:43:00.067200  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38eef918d5de22e915eef

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38eef918d5de22e915ef4
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:44:19.748383  / # #
    2023-01-27T08:44:19.850129  export SHELL=3D/bin/sh
    2023-01-27T08:44:19.850477  #
    2023-01-27T08:44:19.951731  / # export SHELL=3D/bin/sh. /lava-3225550/e=
nvironment
    2023-01-27T08:44:19.952300  =

    2023-01-27T08:44:19.952614  / # <3>[   18.122304] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:44:20.054159  . /lava-3225550/environment/lava-3225550/bi=
n/lava-test-runner /lava-3225550/1
    2023-01-27T08:44:20.055590  =

    2023-01-27T08:44:20.072181  / # /lava-3225550/bin/lava-test-runner /lav=
a-3225550/1
    2023-01-27T08:44:20.130157  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d390e3e282900b9c915ed8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d390e3e282900b9c915edd
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:52:40.454475  / # #
    2023-01-27T08:52:40.557210  export SHELL=3D/bin/sh
    2023-01-27T08:52:40.557928  #
    2023-01-27T08:52:40.558151  / # export SHELL=3D/bin/sh<3>[   18.292577]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:52:40.659440  . /lava-3225688/environment
    2023-01-27T08:52:40.659815  =

    2023-01-27T08:52:40.761249  / # . /lava-3225688/environment/lava-322568=
8/bin/lava-test-runner /lava-3225688/1
    2023-01-27T08:52:40.762491  =

    2023-01-27T08:52:40.773328  / # /lava-3225688/bin/lava-test-runner /lav=
a-3225688/1
    2023-01-27T08:52:40.836434  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3913378ca0c87a8915f32

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3913378ca0c87a8915f37
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:53:59.805787  / # #
    2023-01-27T08:53:59.907998  export SHELL=3D/bin/sh
    2023-01-27T08:53:59.908540  #
    2023-01-27T08:54:00.010101  / # export SHELL=3D/bin/sh. /lava-3225706/e=
nvironment
    2023-01-27T08:54:00.010473  =

    2023-01-27T08:54:00.010711  / # <3>[   18.242759] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:54:00.112007  . /lava-3225706/environment/lava-3225706/bi=
n/lava-test-runner /lava-3225706/1
    2023-01-27T08:54:00.112663  =

    2023-01-27T08:54:00.123632  / # /lava-3225706/bin/lava-test-runner /lav=
a-3225706/1
    2023-01-27T08:54:00.181422  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d391d3c60bb22af3915f30

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d391d3c60bb22af3915f35
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:56:45.067470  / # #
    2023-01-27T08:56:45.169273  export SHELL=3D/bin/sh
    2023-01-27T08:56:45.169718  #
    2023-01-27T08:56:45.271031  / # export SHELL=3D/bin/sh. /lava-3225763/e=
nvironment
    2023-01-27T08:56:45.271463  =

    2023-01-27T08:56:45.271744  / # <3>[  102.111847] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:56:45.373035  . /lava-3225763/environment/lava-3225763/bi=
n/lava-test-runner /lava-3225763/1
    2023-01-27T08:56:45.373780  =

    2023-01-27T08:56:45.379182  / # /lava-3225763/bin/lava-test-runner /lav=
a-3225763/1
    2023-01-27T08:56:45.444111  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3922387d2aecc32915ec3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3922387d2aecc32915ec8
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:57:59.776623  <8>[   17.960606] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3225813_1.5.2.4.1>
    2023-01-27T08:57:59.881003  / # #
    2023-01-27T08:57:59.982831  export SHELL=3D/bin/sh
    2023-01-27T08:57:59.983817  #
    2023-01-27T08:58:00.085225  / # export SHELL=3D/bin/sh. /lava-3225813/e=
nvironment
    2023-01-27T08:58:00.085979  =

    2023-01-27T08:58:00.086460  / # <3>[   18.207368] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:58:00.188276  . /lava-3225813/environment/lava-3225813/bi=
n/lava-test-runner /lava-3225813/1
    2023-01-27T08:58:00.189629  =

    2023-01-27T08:58:00.208117  / # /lava-3225813/bin/lava-test-runner /lav=
a-3225813/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39166ebb453b70e915ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39166ebb453b70e915=
ec9
        failing since 2 days (last pass: next-20230124, first fail: next-20=
230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3915463d1e1b283915f7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3915463d1e1b283915=
f7c
        failing since 2 days (last pass: next-20230124, first fail: next-20=
230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38ff1cb46dca897915f93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38ff1cb46dca897915=
f94
        failing since 2 days (last pass: next-20230124, first fail: next-20=
230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38cbfe2df473f09915ee0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38cbfe2df473f09915ee5
        failing since 9 days (last pass: next-20221130, first fail: next-20=
230118)

    2023-01-27T08:34:37.772975  / # #
    2023-01-27T08:34:37.874916  export SHELL=3D/bin/sh
    2023-01-27T08:34:37.875403  #
    2023-01-27T08:34:37.976514  / # export SHELL=3D/bin/sh. /lava-3225336/e=
nvironment
    2023-01-27T08:34:37.976954  =

    2023-01-27T08:34:38.078354  / # . /lava-3225336/environment/lava-322533=
6/bin/lava-test-runner /lava-3225336/1
    2023-01-27T08:34:38.079009  =

    2023-01-27T08:34:38.084031  / # /lava-3225336/bin/lava-test-runner /lav=
a-3225336/1
    2023-01-27T08:34:38.155839  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T08:34:38.156319  + cd /lava-3225336/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38fbcd119551053915f48

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38fbcd119551053915f4d
        failing since 9 days (last pass: next-20221129, first fail: next-20=
230118)

    2023-01-27T08:47:18.976399  / # #
    2023-01-27T08:47:19.078089  export SHELL=3D/bin/sh
    2023-01-27T08:47:19.078457  #
    2023-01-27T08:47:19.179806  / # export SHELL=3D/bin/sh. /lava-3225573/e=
nvironment
    2023-01-27T08:47:19.180175  =

    2023-01-27T08:47:19.281533  / # . /lava-3225573/environment/lava-322557=
3/bin/lava-test-runner /lava-3225573/1
    2023-01-27T08:47:19.282190  =

    2023-01-27T08:47:19.287815  / # /lava-3225573/bin/lava-test-runner /lav=
a-3225573/1
    2023-01-27T08:47:19.365696  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T08:47:19.366220  + cd /lava-3225573/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38eea00873877f6915ee6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38eea00873877f6915eeb
        failing since 9 days (last pass: next-20221129, first fail: next-20=
230118)

    2023-01-27T08:44:11.842630  <8>[   17.853201] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3225485_1.5.2.4.1>
    2023-01-27T08:44:11.845480  <3>[   17.859879] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:44:11.950070  / # #
    2023-01-27T08:44:12.052112  export SHELL=3D/bin/sh
    2023-01-27T08:44:12.052548  #
    2023-01-27T08:44:12.153995  / # export SHELL=3D/bin/sh. /lava-3225485/e=
nvironment
    2023-01-27T08:44:12.154447  =

    2023-01-27T08:44:12.255944  / # . /lava-3225485/environment/lava-322548=
5/bin/lava-test-runner /lava-3225485/1
    2023-01-27T08:44:12.256746  =

    2023-01-27T08:44:12.274676  / # /lava-3225485/bin/lava-test-runner /lav=
a-3225485/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38f4c3627621e1d915f1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38f4c3627621e1d915f21
        failing since 9 days (last pass: next-20221130, first fail: next-20=
230118)

    2023-01-27T08:45:50.255706  / # #
    2023-01-27T08:45:50.357416  export SHELL=3D/bin/sh
    2023-01-27T08:45:50.357764  #
    2023-01-27T08:45:50.459074  / # export SHELL=3D/bin/sh. /lava-3225533/e=
nvironment
    2023-01-27T08:45:50.459463  =

    2023-01-27T08:45:50.560839  / # . /lava-3225533/environment/lava-322553=
3/bin/lava-test-runner /lava-3225533/1
    2023-01-27T08:45:50.561468  =

    2023-01-27T08:45:50.567070  / # /lava-3225533/bin/lava-test-runner /lav=
a-3225533/1
    2023-01-27T08:45:50.638892  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T08:45:50.639186  + cd /lava-3225533/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d391ba452b5e4a78915ed1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d391ba452b5e4a78915ed6
        failing since 9 days (last pass: next-20221129, first fail: next-20=
230118)

    2023-01-27T08:55:58.613362  / # #
    2023-01-27T08:55:58.715815  export SHELL=3D/bin/sh
    2023-01-27T08:55:58.716546  #
    2023-01-27T08:55:58.818153  / # export SHELL=3D/bin/sh. /lava-3225684/e=
nvironment
    2023-01-27T08:55:58.818849  =

    2023-01-27T08:55:58.920489  / # . /lava-3225684/environment/lava-322568=
4/bin/lava-test-runner /lava-3225684/1
    2023-01-27T08:55:58.921602  =

    2023-01-27T08:55:58.938089  / # /lava-3225684/bin/lava-test-runner /lav=
a-3225684/1
    2023-01-27T08:55:59.003926  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T08:55:59.004730  + cd /lava-3225684/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3923087d2aecc32915efb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3923087d2aecc32915f00
        failing since 9 days (last pass: next-20221130, first fail: next-20=
230118)

    2023-01-27T08:57:56.214233  / # #
    2023-01-27T08:57:56.316022  export SHELL=3D/bin/sh
    2023-01-27T08:57:56.316374  #
    2023-01-27T08:57:56.417680  / # export SHELL=3D/bin/sh. /lava-3225717/e=
nvironment
    2023-01-27T08:57:56.418030  =

    2023-01-27T08:57:56.519344  / # . /lava-3225717/environment/lava-322571=
7/bin/lava-test-runner /lava-3225717/1
    2023-01-27T08:57:56.519950  =

    2023-01-27T08:57:56.525721  / # /lava-3225717/bin/lava-test-runner /lav=
a-3225717/1
    2023-01-27T08:57:56.597527  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T08:57:56.597786  + cd /lava-3225717/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d392a901e718d4ab915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d392a901e718d4ab915ed0
        failing since 9 days (last pass: next-20221130, first fail: next-20=
230118)

    2023-01-27T09:00:06.139185  + set +x<8>[   35.147020] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3225743_1.5.2.4.1>
    2023-01-27T09:00:06.244464  / # #
    2023-01-27T09:00:06.346150  export SHELL=3D/bin/sh
    2023-01-27T09:00:06.346500  #
    2023-01-27T09:00:06.447822  / # export SHELL=3D/bin/sh. /lava-3225743/e=
nvironment
    2023-01-27T09:00:06.448173  =

    2023-01-27T09:00:06.549482  / # . /lava-3225743/environment/lava-322574=
3/bin/lava-test-runner /lava-3225743/1
    2023-01-27T09:00:06.550090  =

    2023-01-27T09:00:06.556993  / # /lava-3225743/bin/lava-test-runner /lav=
a-3225743/1
    2023-01-27T09:00:06.589012  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3930b6964c07185915ed6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3930b6964c07185915edb
        failing since 9 days (last pass: next-20221130, first fail: next-20=
230118)

    2023-01-27T09:01:48.515748  / # #
    2023-01-27T09:01:48.617510  export SHELL=3D/bin/sh
    2023-01-27T09:01:48.617971  #
    2023-01-27T09:01:48.719339  / # export SHELL=3D/bin/sh. /lava-3225811/e=
nvironment
    2023-01-27T09:01:48.719858  =

    2023-01-27T09:01:48.821286  / # . /lava-3225811/environment/lava-322581=
1/bin/lava-test-runner /lava-3225811/1
    2023-01-27T09:01:48.822008  =

    2023-01-27T09:01:48.827304  / # /lava-3225811/bin/lava-test-runner /lav=
a-3225811/1
    2023-01-27T09:01:48.899038  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T09:01:48.899326  + cd /lava-3225811/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d395e15466cc2e67915ed8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d395e15466cc2e67915=
ed9
        new failure (last pass: next-20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39a05c238b3fcd1915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39a05c238b3fcd1915=
ebe
        new failure (last pass: next-20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3a324e85212f3e1915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3a324e85212f3e1915=
ebb
        failing since 2 days (last pass: next-20230124, first fail: next-20=
230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38c968944e34a1b915f13

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38c968944e34a1b915f18
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:34:24.680975  + set +x<8>[   18.009053] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3225293_1.5.2.4.1>
    2023-01-27T08:34:24.785060  / # #
    2023-01-27T08:34:24.886833  export SHELL=3D/bin/sh
    2023-01-27T08:34:24.887283  #
    2023-01-27T08:34:24.988499  / # export SHELL=3D/bin/sh. /lava-3225293/e=
nvironment
    2023-01-27T08:34:24.988824  =

    2023-01-27T08:34:24.989031  / # <3>[   18.249987] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:34:25.090200  . /lava-3225293/environment/lava-3225293/bi=
n/lava-test-runner /lava-3225293/1
    2023-01-27T08:34:25.090715  =

    2023-01-27T08:34:25.109578  / # /lava-3225293/bin/lava-test-runner /lav=
a-3225293/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38ec77adf8852cc915eee

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38ec77adf8852cc915ef3
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:43:44.321738  / # #
    2023-01-27T08:43:44.423455  export SHELL=3D/bin/sh
    2023-01-27T08:43:44.423838  #
    2023-01-27T08:43:44.525223  / # export SHELL=3D/bin/sh. /lava-3225590/e=
nvironment
    2023-01-27T08:43:44.525898  =

    2023-01-27T08:43:44.526311  / # <3>[   18.207788] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:43:44.628022  . /lava-3225590/environment/lava-3225590/bi=
n/lava-test-runner /lava-3225590/1
    2023-01-27T08:43:44.629250  =

    2023-01-27T08:43:44.633971  / # /lava-3225590/bin/lava-test-runner /lav=
a-3225590/1
    2023-01-27T08:43:44.697018  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38d5ff30f0af7ad915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38d5ff30f0af7ad915ebe
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:37:28.094315  + set <8>[   17.738357] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 3225426_1.5.2.4.1>
    2023-01-27T08:37:28.094563  +x
    2023-01-27T08:37:28.198538  / # #
    2023-01-27T08:37:28.300214  export SHELL=3D/bin/sh
    2023-01-27T08:37:28.300572  #
    2023-01-27T08:37:28.401745  / # export SHELL=3D/bin/sh. /lava-3225426/e=
nvironment
    2023-01-27T08:37:28.402094  =

    2023-01-27T08:37:28.503292  / # . /lava-3225426/environment/lava-322542=
6/bin/lava-test-runner /lava-3225426/1
    2023-01-27T08:37:28.503850  <3>[   18.054371] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:37:28.504006   =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38db00db6ad8e1d915ee3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38db00db6ad8e1d915ee8
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:39:06.243041  / # #
    2023-01-27T08:39:06.345400  export SHELL=3D/bin/sh
    2023-01-27T08:39:06.345800  #
    2023-01-27T08:39:06.447189  / # export SHELL=3D/bin/sh. /lava-3225480/e=
nvironment
    2023-01-27T08:39:06.447956  =

    2023-01-27T08:39:06.448442  / # <3>[   18.143526] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:39:06.550019  . /lava-3225480/environment/lava-3225480/bi=
n/lava-test-runner /lava-3225480/1
    2023-01-27T08:39:06.550690  =

    2023-01-27T08:39:06.567898  / # /lava-3225480/bin/lava-test-runner /lav=
a-3225480/1
    2023-01-27T08:39:06.622826  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38e131f5af03fc3915f21

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38e131f5af03fc3915f26
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:40:29.816838  / # #
    2023-01-27T08:40:29.918915  export SHELL=3D/bin/sh
    2023-01-27T08:40:29.919435  #
    2023-01-27T08:40:30.020821  / # export SHELL=3D/bin/sh. /lava-3225549/e=
nvironment
    2023-01-27T08:40:30.021202  =

    2023-01-27T08:40:30.021395  / # <3>[   18.151373] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:40:30.122599  . /lava-3225549/environment/lava-3225549/bi=
n/lava-test-runner /lava-3225549/1
    2023-01-27T08:40:30.123317  =

    2023-01-27T08:40:30.134700  / # /lava-3225549/bin/lava-test-runner /lav=
a-3225549/1
    2023-01-27T08:40:30.194698  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3907f0348aad7e2915ebf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3907f0348aad7e2915ec4
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:51:02.748201  / # #
    2023-01-27T08:51:02.849704  export SHELL=3D/bin/sh
    2023-01-27T08:51:02.850106  #
    2023-01-27T08:51:02.951389  / # export SHELL=3D/bin/sh. /lava-3225661/e=
nvironment
    2023-01-27T08:51:02.951863  =

    2023-01-27T08:51:02.952075  / # <3>[   18.013378] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:51:03.053312  . /lava-3225661/environment/lava-3225661/bi=
n/lava-test-runner /lava-3225661/1
    2023-01-27T08:51:03.053959  =

    2023-01-27T08:51:03.061695  / # /lava-3225661/bin/lava-test-runner /lav=
a-3225661/1
    2023-01-27T08:51:03.119658  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d390cf029da6c509915ef7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d390cf029da6c509915efc
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:52:21.802283  / # #
    2023-01-27T08:52:21.904490  export SHELL=3D/bin/sh
    2023-01-27T08:52:21.904938  #
    2023-01-27T08:52:22.006338  / # export SHELL=3D/bin/sh. /lava-3225703/e=
nvironment
    2023-01-27T08:52:22.006787  =

    2023-01-27T08:52:22.007076  / # <3>[   18.091399] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:52:22.108399  . /lava-3225703/environment/lava-3225703/bi=
n/lava-test-runner /lava-3225703/1
    2023-01-27T08:52:22.109126  =

    2023-01-27T08:52:22.115909  / # /lava-3225703/bin/lava-test-runner /lav=
a-3225703/1
    2023-01-27T08:52:22.178007  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3916f50acf775bf915ed1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3916f50acf775bf915ed6
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:55:05.940546  / # #
    2023-01-27T08:55:06.042388  export SHELL=3D/bin/sh
    2023-01-27T08:55:06.042847  #
    2023-01-27T08:55:06.144203  / # export SHELL=3D/bin/sh. /lava-3225751/e=
nvironment
    2023-01-27T08:55:06.144667  =

    2023-01-27T08:55:06.144898  / # <3>[  103.226127] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:55:06.246257  . /lava-3225751/environment/lava-3225751/bi=
n/lava-test-runner /lava-3225751/1
    2023-01-27T08:55:06.247022  =

    2023-01-27T08:55:06.259763  / # /lava-3225751/bin/lava-test-runner /lav=
a-3225751/1
    2023-01-27T08:55:06.316757  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d391bfbeff65ce00915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d391bfbeff65ce00915ebe
        failing since 9 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-27T08:56:21.019269  / # #
    2023-01-27T08:56:21.121076  export SHELL=3D/bin/sh
    2023-01-27T08:56:21.121516  #
    2023-01-27T08:56:21.222853  / # export SHELL=3D/bin/sh. /lava-3225786/e=
nvironment
    2023-01-27T08:56:21.223338  =

    2023-01-27T08:56:21.223586  / # <3>[   18.351192] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-27T08:56:21.324845  . /lava-3225786/environment/lava-3225786/bi=
n/lava-test-runner /lava-3225786/1
    2023-01-27T08:56:21.325554  =

    2023-01-27T08:56:21.341312  / # /lava-3225786/bin/lava-test-runner /lav=
a-3225786/1
    2023-01-27T08:56:21.396286  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39111405b47131b915edb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39111405b47131b915=
edc
        failing since 2 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39c808902e928319161f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39c808902e92831916=
1f3
        new failure (last pass: next-20230120) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39c33f4a405a580915f37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d39c33f4a405a580915=
f38
        failing since 3 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39cf53ddebda843917624

  Results:     167 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/63d=
39cf53ddebda843917673
        failing since 4 days (last pass: next-20230119, first fail: next-20=
230123)

    2023-01-27T09:43:52.578045  /lava-8901013/1/../bin/lava-test-case
    2023-01-27T09:43:52.581607  =

    2023-01-27T09:43:52.591510  <8>[   22.420399] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38bf1d7b2574c43915f2d

  Results:     167 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/63d=
38bf1d7b2574c43915f7c
        failing since 4 days (last pass: next-20230120, first fail: next-20=
230123)

    2023-01-27T08:31:27.054270  /lava-8899411/1/../bin/lava-test-case
    2023-01-27T08:31:27.064376  <8>[   23.029602] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38f627a1f117f50915f3a

  Results:     167 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/63d=
38f627a1f117f50915f89
        failing since 4 days (last pass: next-20230119, first fail: next-20=
230123)

    2023-01-27T08:45:58.812117  /lava-8899942/1/../bin/lava-test-case
    2023-01-27T08:45:58.851178  <8>[  187.901130] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38b2e598808b81c915ed9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38b2e598808b81c915=
eda
        failing since 157 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38b75a892b843b8915eee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38b75a892b843b8915=
eef
        new failure (last pass: next-20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38d780b7c8ec4c0915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38d780b7c8ec4c0915=
eba
        new failure (last pass: next-20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3905b76fcd9e4f2915f78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3905b76fcd9e4f2915=
f79
        failing since 7 days (last pass: next-20230109, first fail: next-20=
230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3925dd1de2f762c915f02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d3925dd1de2f762c915=
f03
        failing since 65 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d397dcc65030c9a5915efe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d397dcc65030c9a5915=
eff
        new failure (last pass: next-20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 3          =


  Details:     https://kernelci.org/test/plan/id/63d39d7f55c9cf7338915ec6

  Results:     73 PASS, 14 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensorhub-driver-present: https://kernelci.org/=
test/case/id/63d39d7f55c9cf7338915f08
        new failure (last pass: next-20230120)

    2023-01-27T09:46:05.609887  /lava-8900920/1/../bin/lava-test-case
    2023-01-27T09:46:05.623480  <8>[   71.074449] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dblocked>
    2023-01-27T09:46:06.641384  /lava-8900920/1/../bin/lava-test-case
    2023-01-27T09:46:06.652157  <8>[   72.103168] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dblocked>
    2023-01-27T09:46:07.670635  /lava-8900920/1/../bin/lava-test-case
    2023-01-27T09:46:07.681009  <8>[   73.132188] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dblocked>
    2023-01-27T09:46:07.682764  =

    2023-01-27T09:46:08.698878  /lava-8900920/1/../bin/lava-test-case
    2023-01-27T09:46:08.713026  <8>[   74.163928] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensorhub-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/63d39d7f55c9cf7338915f09
        new failure (last pass: next-20230120)

    2023-01-27T09:46:04.561017  /lava-8900920/1/../bin/lava-test-case
    2023-01-27T09:46:04.574606  <8>[   70.025964] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
3d39d7f55c9cf7338915f0a
        new failure (last pass: next-20230120)

    2023-01-27T09:46:03.533989  /lava-8900920/1/../bin/lava-test-case
    2023-01-27T09:46:03.546271  <8>[   68.998504] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38cac905a804b07915edc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/clang-16/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38cac905a804b07915edf
        new failure (last pass: next-20221219)

    2023-01-27T08:34:34.481543  / # #
    2023-01-27T08:34:34.585172  export SHELL=3D/bin/sh
    2023-01-27T08:34:34.585812  #
    2023-01-27T08:34:34.689215  / # export SHELL=3D/bin/sh. /lava-386937/en=
vironment
    2023-01-27T08:34:34.689701  =

    2023-01-27T08:34:34.792203  / # . /lava-386937/environment/lava-386937/=
bin/lava-test-runner /lava-386937/1
    2023-01-27T08:34:34.792912  =

    2023-01-27T08:34:34.807138  / # /lava-386937/bin/lava-test-runner /lava=
-386937/1
    2023-01-27T08:34:34.875264  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T08:34:34.876059  + cd /lava-386937/<8>[   19.653018] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 386937_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38ec8eb524fbfb4915ef5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38ec8eb524fbfb4915ef8
        failing since 2 days (last pass: next-20221219, first fail: next-20=
230125)

    2023-01-27T08:43:37.752473  <8>[   18.972337] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 386956_1.5.2.4.1>
    2023-01-27T08:43:37.857605  / # #
    2023-01-27T08:43:37.959541  export SHELL=3D/bin/sh
    2023-01-27T08:43:37.961236  #
    2023-01-27T08:43:38.070110  / # export SHELL=3D/bin/sh. /lava-386956/en=
vironment
    2023-01-27T08:43:38.070690  =

    2023-01-27T08:43:38.172817  / # . /lava-386956/environment/lava-386956/=
bin/lava-test-runner /lava-386956/1
    2023-01-27T08:43:38.173736  =

    2023-01-27T08:43:38.183365  / # /lava-386956/bin/lava-test-runner /lava=
-386956/1
    2023-01-27T08:43:38.260234  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38f2b1c971319f0915ee6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38f2b1c971319f0915ee9
        failing since 2 days (last pass: next-20221219, first fail: next-20=
230125)

    2023-01-27T08:45:22.644538  <8>[   19.086504] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 386961_1.5.2.4.1>
    2023-01-27T08:45:22.766061  / # #
    2023-01-27T08:45:22.874124  export SHELL=3D/bin/sh
    2023-01-27T08:45:22.874642  #
    2023-01-27T08:45:22.975935  / # export SHELL=3D/bin/sh. /lava-386961/en=
vironment
    2023-01-27T08:45:22.976466  =

    2023-01-27T08:45:23.077799  / # . /lava-386961/environment/lava-386961/=
bin/lava-test-runner /lava-386961/1
    2023-01-27T08:45:23.078574  =

    2023-01-27T08:45:23.091492  / # /lava-386961/bin/lava-test-runner /lava=
-386961/1
    2023-01-27T08:45:23.159636  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d393b566d5c701be915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d393b566d5c701be915ebc
        new failure (last pass: next-20221215)

    2023-01-27T09:04:37.187872  / # #
    2023-01-27T09:04:37.289981  export SHELL=3D/bin/sh
    2023-01-27T09:04:37.290765  #
    2023-01-27T09:04:37.392413  / # export SHELL=3D/bin/sh. /lava-386988/en=
vironment
    2023-01-27T09:04:37.393082  =

    2023-01-27T09:04:37.494499  / # . /lava-386988/environment/lava-386988/=
bin/lava-test-runner /lava-386988/1
    2023-01-27T09:04:37.495540  =

    2023-01-27T09:04:37.499440  / # /lava-386988/bin/lava-test-runner /lava=
-386988/1
    2023-01-27T09:04:37.578361  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T09:04:37.579070  + cd /lava-386988/<8>[   19.654468] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 386988_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3949030e87490ac915ec4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3949030e87490ac915ec7
        failing since 2 days (last pass: next-20221219, first fail: next-20=
230125)

    2023-01-27T09:08:11.062904  <8>[  135.995711] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 386997_1.5.2.4.1>
    2023-01-27T09:08:11.169631  / # #
    2023-01-27T09:08:11.272090  export SHELL=3D/bin/sh
    2023-01-27T09:08:11.272670  #
    2023-01-27T09:08:11.374402  / # export SHELL=3D/bin/sh. /lava-386997/en=
vironment
    2023-01-27T09:08:11.375088  =

    2023-01-27T09:08:11.476809  / # . /lava-386997/environment/lava-386997/=
bin/lava-test-runner /lava-386997/1
    2023-01-27T09:08:11.477880  =

    2023-01-27T09:08:11.493778  / # /lava-386997/bin/lava-test-runner /lava=
-386997/1
    2023-01-27T09:08:11.559816  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-3         | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63d3951ced67588b66915eeb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d3951ced67588b66915eee
        new failure (last pass: next-20221219)

    2023-01-27T09:10:43.727673  / # #
    2023-01-27T09:10:43.829909  export SHELL=3D/bin/sh
    2023-01-27T09:10:43.830585  #
    2023-01-27T09:10:43.932108  / # export SHELL=3D/bin/sh. /lava-387005/en=
vironment
    2023-01-27T09:10:43.932708  =

    2023-01-27T09:10:44.034103  / # . /lava-387005/environment/lava-387005/=
bin/lava-test-runner /lava-387005/1
    2023-01-27T09:10:44.035053  =

    2023-01-27T09:10:44.050119  / # /lava-387005/bin/lava-test-runner /lava=
-387005/1
    2023-01-27T09:10:44.117180  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-27T09:10:44.117594  + cd /lava-387005/<8>[   19.661085] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 387005_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d392253dd532d613915ec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d392253dd532d613915=
ec5
        failing since 8 days (last pass: next-20230118, first fail: next-20=
230119) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d39295da75e90bdb915ee9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63d39295da75e90=
bdb915ef1
        new failure (last pass: next-20230125)
        15 lines

    2023-01-27T08:59:49.054887  kern  :alert : BUG: Bad page map in process=
 udevd  pte:3bc04110 pmd:b8fc8835
    2023-01-27T08:59:49.055538  kern  :alert : addr:befd3000 vm_flags:00100=
173 anon_vma:c4b8b930 mapping:00000000 index:beffb
    2023-01-27T08:59:49.055772  kern  :alert : file:(null) fault:0x0 mmap:0=
x0 read_folio:0x0
    2023-01-27T08:59:49.055970  kern  :alert : BUG: B[  213.542247] <LAVA_S=
IGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D15>
    2023-01-27T08:59:49.056200  ad page map in process udevd  pte:3bc04110 =
pmd:b8fbb835
    2023-01-27T08:59:49.056394  kern  :alert : BUG: Bad page map in process=
 udevd  pte:3bc04110 pmd:b8ffc835   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38df9921c3b530f915f63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-a83t-ban=
anapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-a83t-ban=
anapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38df9921c3b530f915=
f64
        failing since 2 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38f4f7a1f117f50915f0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38f4f7a1f117f50915=
f0e
        failing since 2 days (last pass: next-20230124, first fail: next-20=
230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38a73a36b465829915f1d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63d38a73a36b465829915f22
        failing since 2 days (last pass: next-20230123, first fail: next-20=
230124)

    2023-01-27T08:25:00.767571  <8>[   10.001391] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3225221_1.5.2.4.1>
    2023-01-27T08:25:00.872728  / # #
    2023-01-27T08:25:00.974437  export SHELL=3D/bin/sh
    2023-01-27T08:25:00.974785  #
    2023-01-27T08:25:01.076117  / # export SHELL=3D/bin/sh. /lava-3225221/e=
nvironment
    2023-01-27T08:25:01.076468  =

    2023-01-27T08:25:01.177800  / # . /lava-3225221/environment/lava-322522=
1/bin/lava-test-runner /lava-3225221/1
    2023-01-27T08:25:01.178406  =

    2023-01-27T08:25:01.182304  / # /lava-3225221/bin/lava-test-runner /lav=
a-3225221/1
    2023-01-27T08:25:01.353548  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63d38fb6d119551053915f24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230127/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63d38fb6d119551053915=
f25
        failing since 64 days (last pass: next-20221121, first fail: next-2=
0221123) =

 =20
