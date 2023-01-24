Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6250467989C
	for <lists+linux-next@lfdr.de>; Tue, 24 Jan 2023 13:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234128AbjAXMw5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Jan 2023 07:52:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234035AbjAXMwh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Jan 2023 07:52:37 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0B43AB6
        for <linux-next@vger.kernel.org>; Tue, 24 Jan 2023 04:52:02 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id k10-20020a17090a590a00b0022ba875a1a4so11448207pji.3
        for <linux-next@vger.kernel.org>; Tue, 24 Jan 2023 04:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=txuV29G6OqTYy8HBfjFvFW0STM9MJLtWgk3XXXtnHIY=;
        b=EIOR003WMMwS0RTrJRLhH1OE0Hp4k519BZ8jBWoKOVQVyEkfu3ND/slkPjlwjZfbn0
         1jmlA7PdGOVQCAysKCM7eTbw2Ehu118dd8PZozRJXh1+Fw5VnOHmv/fy4cPbL/k3x8Dl
         WYd2YNFUXBMhUGfUjb9tUGgw1mxZRE5uUn9F8L5kqfuF/mVR3GY0lBVRjZocXjtqnV8s
         V3p8DkEoxDFLxyUAjEcSZX1AqNnj46Y0bbN6D1iJrAY6Pf+RLZM2QAzoBuGKcfgy0O6H
         4+7GkXYsC5/d2tFGnLfpPXKA5IDpKsaZO3sMX0WVtu11Nu0oSBqFiefOIL2QaOzNyEwu
         tntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txuV29G6OqTYy8HBfjFvFW0STM9MJLtWgk3XXXtnHIY=;
        b=MGo9MdjMr+hp9DiAeoK4VQSdvBj0nKPOqYui6WRUXfNta6ZdSZGb9o+8lRhbYhROJG
         kWtuOidaRthExezCZylDUq+lqcosN2YXZpIarwsTzzHPRiFnCowZi6LFu28OyPCkMrLS
         REhr8SZ7Dw0a+n/38JxXgCAP0MiBI3MXp0OalD+CeBcm8JBDd/JqEclgo+M2fzxUOBL0
         xop/n0f8pMfa44YbwzzdfXGuuh7PFsdqM0sJCerxm3k6HUoVWrxQ3GN/ZKxtzgxMVw80
         KtsmtC32muBNowO8iv7WIzg3/Yj7A8NbNgCPkmTrhUuk68kgED4GoWWwSdvJKm4DqW81
         uYlA==
X-Gm-Message-State: AFqh2kpFxt9H1U1uqJaayFcy6UKW9v5qMfHyZjbOLxLi+Ps3MoYL0jja
        Cv53l0v6YcyF19RoPTajtB+OdpcF3UCd9w9CePk=
X-Google-Smtp-Source: AMrXdXtdlm1KxH8Pe5PLxsXLIacwEpMDN1sbkwK7l3lqW5+Kw6dXWiKU3oU+IamibJUr3RrV98di/Q==
X-Received: by 2002:a17:902:d582:b0:194:8b08:a571 with SMTP id k2-20020a170902d58200b001948b08a571mr29211048plh.2.1674564718407;
        Tue, 24 Jan 2023 04:51:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jj10-20020a170903048a00b001898ee9f723sm1627839plb.2.2023.01.24.04.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 04:51:57 -0800 (PST)
Message-ID: <63cfd46d.170a0220.431fc.2e49@mx.google.com>
Date:   Tue, 24 Jan 2023 04:51:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230124
X-Kernelci-Report-Type: test
Subject: next/master baseline: 960 runs, 99 regressions (next-20230124)
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

next/master baseline: 960 runs, 99 regressions (next-20230124)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

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

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 2          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig                    | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
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

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

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

rk3288-veyron-jaq            | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | clang-16 | multi_=
v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230124/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230124
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a54df7622717a40ddec95fd98086aff8ba7839a6 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9c8134d8e8e6b1915f22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf9c8134d8e8e6b1915=
f23
        failing since 129 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa373621ca44d4b915ed0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa373621ca44d4b915=
ed1
        failing since 132 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9fd8a45ccd4ac8915edb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf9fd8a45ccd4ac8915=
edc
        failing since 2 days (last pass: next-20230119, first fail: next-20=
230120) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa1ea9060cae540915ec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa1ea9060cae540915ec6
        failing since 5 days (last pass: next-20221219, first fail: next-20=
230118)

    2023-01-24T09:16:05.003802  <8>[   13.736631] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3197184_1.5.2.4.1>
    2023-01-24T09:16:05.110640  / # #
    2023-01-24T09:16:05.212300  export SHELL=3D/bin/sh
    2023-01-24T09:16:05.212739  <3>[   13.774185] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-01-24T09:16:05.213001  #
    2023-01-24T09:16:05.314276  / # export SHELL=3D/bin/sh. /lava-3197184/e=
nvironment
    2023-01-24T09:16:05.314653  =

    2023-01-24T09:16:05.415906  / # . /lava-3197184/environment/lava-319718=
4/bin/lava-test-runner /lava-3197184/1
    2023-01-24T09:16:05.416958  =

    2023-01-24T09:16:05.421557  / # /lava-3197184/bin/lava-test-runner /lav=
a-3197184/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9db9cdf9417728915ed8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9dbacdf9417728915edd
        failing since 5 days (last pass: next-20221219, first fail: next-20=
230118)

    2023-01-24T08:58:05.059534  <8>[   14.813804] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3196911_1.5.2.4.1>
    2023-01-24T08:58:05.170928  / # #
    2023-01-24T08:58:05.272399  export SHELL=3D/bin/sh
    2023-01-24T08:58:05.272831  #
    2023-01-24T08:58:05.374716  / # export SHELL=3D/bin/sh. /lava-3196911/e=
nvironment
    2023-01-24T08:58:05.375114  =

    2023-01-24T08:58:05.476281  / # . /lava-3196911/environment/lava-319691=
1/bin/lava-test-runner /lava-3196911/1
    2023-01-24T08:58:05.476851  =

    2023-01-24T08:58:05.481610  / # /lava-3196911/bin/lava-test-runner /lav=
a-3196911/1
    2023-01-24T08:58:05.528767  <3>[   15.285236] Bluetooth: hci0: command =
0xfc18 tx timeout =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9f204251baae69915ebf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9f204251baae69915ec4
        failing since 5 days (last pass: next-20221219, first fail: next-20=
230118)

    2023-01-24T09:04:06.434081  <8>[   16.594436] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3196977_1.5.2.4.1>
    2023-01-24T09:04:06.540953  / # #
    2023-01-24T09:04:06.642615  export SHELL=3D/bin/sh
    2023-01-24T09:04:06.643454  #
    2023-01-24T09:04:06.744620  / # export SHELL=3D/bin/sh. /lava-3196977/e=
nvironment
    2023-01-24T09:04:06.744960  =

    2023-01-24T09:04:06.846135  / # . /lava-3196977/environment/lava-319697=
7/bin/lava-test-runner /lava-3196977/1
    2023-01-24T09:04:06.846751  =

    2023-01-24T09:04:06.851499  / # /lava-3196977/bin/lava-test-runner /lav=
a-3196977/1
    2023-01-24T09:04:06.936002  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9fad2c59a127bc915ef0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9fad2c59a127bc915ef5
        failing since 6 days (last pass: next-20221219, first fail: next-20=
230117)

    2023-01-24T09:06:39.540151  + set +x
    2023-01-24T09:06:39.549694  <8>[   14.935551] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3197055_1.5.2.4.1>
    2023-01-24T09:06:39.653449  / # #
    2023-01-24T09:06:39.755434  export SHELL=3D/bin/sh
    2023-01-24T09:06:39.755800  #
    2023-01-24T09:06:39.755965  / # export SHELL=3D/bin/sh<3>[   15.133748]=
 Bluetooth: hci0: command 0x0c03 tx timeout
    2023-01-24T09:06:39.856980  . /lava-3197055/environment
    2023-01-24T09:06:39.857342  =

    2023-01-24T09:06:39.958502  / # . /lava-3197055/environment/lava-319705=
5/bin/lava-test-runner /lava-3197055/1
    2023-01-24T09:06:39.959193   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa6ee78d69418ea915ede

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa6ee78d69418ea915ee1
        failing since 18 days (last pass: next-20221124, first fail: next-2=
0230106)

    2023-01-24T09:37:33.470619  [   13.572640] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1144250_1.5.2.4.1>
    2023-01-24T09:37:33.577555  / # #
    2023-01-24T09:37:33.678866  export SHELL=3D/bin/sh
    2023-01-24T09:37:33.679272  #
    2023-01-24T09:37:33.780374  / # export SHELL=3D/bin/sh. /lava-1144250/e=
nvironment
    2023-01-24T09:37:33.780733  =

    2023-01-24T09:37:33.881886  / # . /lava-1144250/environment/lava-114425=
0/bin/lava-test-runner /lava-1144250/1
    2023-01-24T09:37:33.882312  =

    2023-01-24T09:37:33.884199  / # /lava-1144250/bin/lava-test-runner /lav=
a-1144250/1
    2023-01-24T09:37:33.904919  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa145b76e4435c1915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa145b76e4435c1915=
eba
        failing since 1 day (last pass: next-20230120, first fail: next-202=
30123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9fe8a45ccd4ac8915ef9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9fe8a45ccd4ac8915efe
        new failure (last pass: next-20230118)

    2023-01-24T09:07:36.150851  + set[   15.118973] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 885971_1.5.2.3.1>
    2023-01-24T09:07:36.151159   +x
    2023-01-24T09:07:36.257351  / # #
    2023-01-24T09:07:36.358909  export SHELL=3D/bin/sh
    2023-01-24T09:07:36.359328  #
    2023-01-24T09:07:36.460597  / # export SHELL=3D/bin/sh. /lava-885971/en=
vironment
    2023-01-24T09:07:36.461007  =

    2023-01-24T09:07:36.562026  / # . /lava-885971/environment/lava-885971/=
bin/lava-test-runner /lava-885971/1
    2023-01-24T09:07:36.562739  =

    2023-01-24T09:07:36.565636  / # /lava-885971/bin/lava-test-runner /lava=
-885971/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa3944dc33ae8a6915ec7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa3944dc33ae8a6915=
ec8
        failing since 167 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa36c5f62f4dbf6915ef8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa36c5f62f4dbf6915=
ef9
        failing since 154 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa8ae433ad39aa8915ee4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa8ae433ad39aa8915=
ee5
        new failure (last pass: next-20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/63cf9ff086c8289896915ef4

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63cf9ff086c8289=
896915efc
        failing since 6 days (last pass: next-20230116, first fail: next-20=
230118)
        12 lines

    2023-01-24T09:07:46.436857  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[  131.261796] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2023-01-24T09:07:46.437184  0000
    2023-01-24T09:07:46.437436  kern  :alert : Mem abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63cf9ff086c8289=
896915efd
        failing since 6 days (last pass: next-20230116, first fail: next-20=
230118)
        2 lines

    2023-01-24T09:07:46.438745  kern  :alert :   ESR =3D 0x0000000096000006
    2023-01-24T09:07:46.439038  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-01-24T09:07:46.439276  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-01-24T09:07:46.439505  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-01-24T09:07:46.480094  kern  <8>[  131.289524] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-01-24T09:07:46.480421  :alert :   FSC =3D 0x06: level 2 tr<8>[  13=
1.301304] <LAVA_SIGNAL_ENDRUN 0_dmesg 1144202_1.5.2.4.1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa93531202bce5c915efe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa93531202bce5c915=
eff
        failing since 18 days (last pass: next-20221125, first fail: next-2=
0230106) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfaf5fee6b2393c4915ec3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfaf5fee6b2393c4915=
ec4
        failing since 19 days (last pass: next-20221124, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9db43e7129653e915eff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf9db43e7129653e915=
f00
        failing since 19 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa01786702fb78e915f36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa01786702fb78e915=
f37
        failing since 19 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa2ba9b573373b9915f01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa2ba9b573373b9915=
f02
        failing since 19 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa7c88e956d6dfa915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa7c88e956d6dfa915=
ebe
        failing since 19 days (last pass: next-20221125, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfaae515f73f6bde915ef4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfaae515f73f6bde915=
ef5
        failing since 19 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa1ae810a0a1630915fa9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa1ae810a0a1630915=
faa
        failing since 153 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9f81f49bb36496915f05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf9f81f49bb36496915=
f06
        failing since 287 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63cfa6976ff3fee054915ee8

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63cfa6976ff3fee054915ef5
        failing since 5 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-24T09:36:13.508678  /lava-254065/1/../bin/lava-test-case
    2023-01-24T09:36:13.530674  <8>[   17.088931] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63c=
fa6976ff3fee054915ef7
        failing since 5 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-24T09:36:15.536794  /lava-254065/1/../bin/lava-test-case
    2023-01-24T09:36:15.537176  <8>[   19.163932] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-01-24T09:36:15.537418  /lava-254065/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63cf9aa1b3c3cf0ac3915ecb

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63cf9aa1b3c3cf0ac3915ed8
        failing since 5 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-24T08:45:05.653052  /lava-253955/1/../bin/lava-test-case
    2023-01-24T08:45:05.656142  <8>[   17.760286] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63c=
f9aa1b3c3cf0ac3915eda
        failing since 5 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-24T08:45:07.658478  /lava-253955/1/../bin/lava-test-case
    2023-01-24T08:45:07.658847  <8>[   19.834475] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/63cf9c6d34d8e8e6b1915ed7

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63cf9c6d34d8e8e6b1915ee4
        failing since 5 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-24T08:52:46.033928  /lava-253977/1/../bin/lava-test-case
    2023-01-24T08:52:46.037107  <8>[   17.869637] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63c=
f9c6d34d8e8e6b1915ee6
        failing since 5 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-24T08:52:48.039197  /lava-253977/1/../bin/lava-test-case
    2023-01-24T08:52:48.039930  <8>[   19.943593] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-01-24T08:52:48.040195  /lava-253977/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/63cf9edb9d1ad8b815915f3c

  Results:     48 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63cf9edb9d1ad8b=
815915f70
        failing since 1 day (last pass: next-20230120, first fail: next-202=
30123)
        12 lines

    2023-01-24T09:02:53.634084  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[  151.852730] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2023-01-24T09:02:53.634527  0000
    2023-01-24T09:02:53.634778  kern  :alert : Mem abort info:
    2023-01-24T09:02:53.635013  kern  :alert :   ESR =3D 0x0000000096000006
    2023-01-24T09:02:53.635245  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-01-24T09:02:53.635476  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-01-24T09:02:53.635700  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63cf9edb9d1ad8b=
815915f71
        failing since 1 day (last pass: next-20230120, first fail: next-202=
30123)
        2 lines

    2023-01-24T09:02:53.677044  kern  :alert :   FSC =3D 0x06: level 2 <8>[=
  151.884006] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNIT=
S=3Dlines MEASUREMENT=3D2>
    2023-01-24T09:02:53.677353  translation fault
    2023-01-24T09:02:53.677598  kern  :alert :<8>[  151.896511] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 254000_1.5.2.4.1>
    2023-01-24T09:02:53.677849   Data abort info:
    2023-01-24T09:02:53.678076  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-01-24T09:02:53.678302  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-01-24T09:02:53.678524  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000001065e3000
    2023-01-24T09:02:53.678746  kern  :alert : [0000000000000000] pgd=3D080=
0000107c8c003, p4d=3D0800000107c8c003, pud=3D0800000107c90003, pmd=3D000000=
0000000000   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63cfa2c2fafb831d75915ec7

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63cfa2c2fafb831d75915ed4
        failing since 5 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-24T09:19:46.656670  /lava-254031/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63c=
fa2c2fafb831d75915ed6
        failing since 5 days (last pass: next-20230118, first fail: next-20=
230119)

    2023-01-24T09:19:48.662278  /lava-254031/1/../bin/lava-test-case
    2023-01-24T09:19:48.662670  <8>[   19.827449] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-01-24T09:19:48.662908  /lava-254031/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf99084a7b3ea27e915ebc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf99084a7b3ea27e915=
ebd
        new failure (last pass: next-20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9b3911361edcda915ec7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf9b3911361edcda915=
ec8
        new failure (last pass: next-20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9c16d9e07da704915edb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf9c16d9e07da704915=
edc
        new failure (last pass: next-20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa1adf60a7e186c915eba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa1adf60a7e186c915ebf
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T09:15:12.108502  + set <8>[   18.123606] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 3197376_1.5.2.4.1>
    2023-01-24T09:15:12.108662  +x
    2023-01-24T09:15:12.213208  / # #
    2023-01-24T09:15:12.314677  export SHELL=3D/bin/sh
    2023-01-24T09:15:12.315081  #
    2023-01-24T09:15:12.416196  / # export SHELL=3D/bin/sh. /lava-3197376/e=
nvironment
    2023-01-24T09:15:12.416534  <3>[   18.349099] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T09:15:12.416693  =

    2023-01-24T09:15:12.517810  / # . /lava-3197376/environment/lava-319737=
6/bin/lava-test-runner /lava-3197376/1
    2023-01-24T09:15:12.518332   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa3b50c84375e84915eba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa3b50c84375e84915ebf
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T09:23:52.970824  =

    2023-01-24T09:23:53.072251  / # #export SHELL=3D/bin/sh
    2023-01-24T09:23:53.072662  =

    2023-01-24T09:23:53.173956  / # export SHELL=3D/bin/sh. /lava-3197495/e=
nvironment
    2023-01-24T09:23:53.174397  =

    2023-01-24T09:23:53.174590  / # <3>[   18.206904] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T09:23:53.275864  . /lava-3197495/environment/lava-3197495/bi=
n/lava-test-runner /lava-3197495/1
    2023-01-24T09:23:53.276517  =

    2023-01-24T09:23:53.294511  / # /lava-3197495/bin/lava-test-runner /lav=
a-3197495/1
    2023-01-24T09:23:53.349383  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9b581dca921674915f33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9b581dca921674915f38
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T08:48:12.601356  / # #
    2023-01-24T08:48:12.702728  export SHELL=3D/bin/sh
    2023-01-24T08:48:12.703083  #
    2023-01-24T08:48:12.804230  / # export SHELL=3D/bin/sh. /lava-3196800/e=
nvironment
    2023-01-24T08:48:12.804571  =

    2023-01-24T08:48:12.804746  / # <3>[   18.462702] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T08:48:12.905915  . /lava-3196800/environment/lava-3196800/bi=
n/lava-test-runner /lava-3196800/1
    2023-01-24T08:48:12.906479  =

    2023-01-24T08:48:12.919468  / # /lava-3196800/bin/lava-test-runner /lav=
a-3196800/1
    2023-01-24T08:48:12.976448  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9c5c22935a9029915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9c5c22935a9029915ebe
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T08:52:23.937876  / # #
    2023-01-24T08:52:24.039735  export SHELL=3D/bin/sh
    2023-01-24T08:52:24.040110  #
    2023-01-24T08:52:24.141387  / # export SHELL=3D/bin/sh. /lava-3196926/e=
nvironment
    2023-01-24T08:52:24.141894  =

    2023-01-24T08:52:24.142163  / # <3>[   18.432568] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T08:52:24.243527  . /lava-3196926/environment/lava-3196926/bi=
n/lava-test-runner /lava-3196926/1
    2023-01-24T08:52:24.244298  =

    2023-01-24T08:52:24.262482  / # /lava-3196926/bin/lava-test-runner /lav=
a-3196926/1
    2023-01-24T08:52:24.303173  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9dc566ba2a47dd915f01

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9dc566ba2a47dd915f06
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T08:58:36.160124  / # #
    2023-01-24T08:58:36.262324  export SHELL=3D/bin/sh
    2023-01-24T08:58:36.262758  #
    2023-01-24T08:58:36.364146  / # export SHELL=3D/bin/sh. /lava-3197026/e=
nvironment
    2023-01-24T08:58:36.364876  =

    2023-01-24T08:58:36.365305  / # <3>[   18.235834] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T08:58:36.466879  . /lava-3197026/environment/lava-3197026/bi=
n/lava-test-runner /lava-3197026/1
    2023-01-24T08:58:36.468218  =

    2023-01-24T08:58:36.480379  / # /lava-3197026/bin/lava-test-runner /lav=
a-3197026/1
    2023-01-24T08:58:36.537027  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9e8e03d6f12cf2915efb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9e8e03d6f12cf2915f00
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T09:01:43.435591  / # #
    2023-01-24T09:01:43.537792  export SHELL=3D/bin/sh
    2023-01-24T09:01:43.538271  #
    2023-01-24T09:01:43.639859  / # export SHELL=3D/bin/sh. /lava-3197069/e=
nvironment
    2023-01-24T09:01:43.640633  =

    2023-01-24T09:01:43.640891  / # <3>[  103.153747] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T09:01:43.742295  . /lava-3197069/environment/lava-3197069/bi=
n/lava-test-runner /lava-3197069/1
    2023-01-24T09:01:43.742979  =

    2023-01-24T09:01:43.757590  / # /lava-3197069/bin/lava-test-runner /lav=
a-3197069/1
    2023-01-24T09:01:43.814688  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa15dc6c1b9dc25915ebf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa15dc6c1b9dc25915ec4
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T09:13:53.324973  <8>[   18.120380] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3197324_1.5.2.4.1>
    2023-01-24T09:13:53.429210  / # #
    2023-01-24T09:13:53.531047  export SHELL=3D/bin/sh
    2023-01-24T09:13:53.531599  #
    2023-01-24T09:13:53.632882  / # export SHELL=3D/bin/sh. /lava-3197324/e=
nvironment
    2023-01-24T09:13:53.633407  =

    2023-01-24T09:13:53.633661  / # <3>[   18.368517] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T09:13:53.734928  . /lava-3197324/environment/lava-3197324/bi=
n/lava-test-runner /lava-3197324/1
    2023-01-24T09:13:53.735822  =

    2023-01-24T09:13:53.745278  / # /lava-3197324/bin/lava-test-runner /lav=
a-3197324/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa1fd74b07bc37f915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa1fd74b07bc37f915ed0
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T09:16:33.335855  / # #
    2023-01-24T09:16:33.438709  export SHELL=3D/bin/sh
    2023-01-24T09:16:33.439118  #
    2023-01-24T09:16:33.540518  / # export SHELL=3D/bin/sh<3>[   18.14. /la=
va-3197396/environment
    2023-01-24T09:16:33.541071  0969] brcmfmac: brcmf_sdio_htclk: HT Avail =
timeout (1000000): clkctl 0x50
    2023-01-24T09:16:33.541421  =

    2023-01-24T09:16:33.643146  / # . /lava-3197396/environment/lava-319739=
6/bin/lava-test-runner /lava-3197396/1
    2023-01-24T09:16:33.644298  =

    2023-01-24T09:16:33.653654  / # /lava-3197396/bin/lava-test-runner /lav=
a-3197396/1
    2023-01-24T09:16:33.695159  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa296a1d6bf8ba9915ebb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa296a1d6bf8ba9915ec0
        failing since 6 days (last pass: next-20221129, first fail: next-20=
230118)

    2023-01-24T09:18:51.622651  / # #
    2023-01-24T09:18:51.724385  export SHELL=3D/bin/sh
    2023-01-24T09:18:51.724784  #
    2023-01-24T09:18:51.826099  / # export SHELL=3D/bin/sh. /lava-3197342/e=
nvironment
    2023-01-24T09:18:51.826467  =

    2023-01-24T09:18:51.927793  / # . /lava-3197342/environment/lava-319734=
2/bin/lava-test-runner /lava-3197342/1
    2023-01-24T09:18:51.928429  =

    2023-01-24T09:18:51.934358  / # /lava-3197342/bin/lava-test-runner /lav=
a-3197342/1
    2023-01-24T09:18:52.010777  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T09:18:52.011411  + cd /lava-3197342/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa4b52738b36938915ed0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa4b52738b36938915ed5
        failing since 6 days (last pass: next-20221130, first fail: next-20=
230118)

    2023-01-24T09:28:07.930017  / # #
    2023-01-24T09:28:08.031961  export SHELL=3D/bin/sh
    2023-01-24T09:28:08.032483  #
    2023-01-24T09:28:08.134016  / # export SHELL=3D/bin/sh. /lava-3197484/e=
nvironment
    2023-01-24T09:28:08.134461  =

    2023-01-24T09:28:08.235857  / # . /lava-3197484/environment/lava-319748=
4/bin/lava-test-runner /lava-3197484/1
    2023-01-24T09:28:08.236593  =

    2023-01-24T09:28:08.256193  / # /lava-3197484/bin/lava-test-runner /lav=
a-3197484/1
    2023-01-24T09:28:08.312139  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T09:28:08.312488  + cd /lava-3197484/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9b960c6ff747e2915f41

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9b960c6ff747e2915f46
        failing since 6 days (last pass: next-20221130, first fail: next-20=
230118)

    2023-01-24T08:49:12.742819  / # #
    2023-01-24T08:49:12.844555  export SHELL=3D/bin/sh
    2023-01-24T08:49:12.844914  #
    2023-01-24T08:49:12.946262  / # export SHELL=3D/bin/sh. /lava-3196802/e=
nvironment
    2023-01-24T08:49:12.946624  =

    2023-01-24T08:49:13.048061  / # . /lava-3196802/environment/lava-319680=
2/bin/lava-test-runner /lava-3196802/1
    2023-01-24T08:49:13.048774  =

    2023-01-24T08:49:13.054198  / # /lava-3196802/bin/lava-test-runner /lav=
a-3196802/1
    2023-01-24T08:49:13.126116  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T08:49:13.126417  + cd /lava-3196802/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9cc3e46db61a42915f30

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9cc3e46db61a42915f35
        failing since 6 days (last pass: next-20221130, first fail: next-20=
230118)

    2023-01-24T08:53:43.861018  / # #
    2023-01-24T08:53:43.962675  export SHELL=3D/bin/sh
    2023-01-24T08:53:43.963015  #
    2023-01-24T08:53:44.064343  / # export SHELL=3D/bin/sh. /lava-3196928/e=
nvironment
    2023-01-24T08:53:44.064685  =

    2023-01-24T08:53:44.166001  / # . /lava-3196928/environment/lava-319692=
8/bin/lava-test-runner /lava-3196928/1
    2023-01-24T08:53:44.166590  =

    2023-01-24T08:53:44.172374  / # /lava-3196928/bin/lava-test-runner /lav=
a-3196928/1
    2023-01-24T08:53:44.244163  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T08:53:44.244417  + cd /lava-3196928/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9dfbb2faa797dc915f36

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9dfbb2faa797dc915f3b
        failing since 6 days (last pass: next-20221130, first fail: next-20=
230118)

    2023-01-24T08:59:00.586199  / # #
    2023-01-24T08:59:00.688014  export SHELL=3D/bin/sh
    2023-01-24T08:59:00.688359  #
    2023-01-24T08:59:00.789692  / # export SHELL=3D/bin/sh. /lava-3197023/e=
nvironment
    2023-01-24T08:59:00.790180  =

    2023-01-24T08:59:00.891507  / # . /lava-3197023/environment/lava-319702=
3/bin/lava-test-runner /lava-3197023/1
    2023-01-24T08:59:00.892105  =

    2023-01-24T08:59:00.897669  / # /lava-3197023/bin/lava-test-runner /lav=
a-3197023/1
    2023-01-24T08:59:00.968873  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T08:59:00.969130  + cd /lava-3197023/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9e7d13316240be915ef0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9e7d13316240be915ef5
        failing since 6 days (last pass: next-20221130, first fail: next-20=
230118)

    2023-01-24T09:01:20.208201  / # #
    2023-01-24T09:01:20.309881  export SHELL=3D/bin/sh
    2023-01-24T09:01:20.310470  #
    2023-01-24T09:01:20.411835  / # export SHELL=3D/bin/sh. /lava-3197037/e=
nvironment
    2023-01-24T09:01:20.412340  =

    2023-01-24T09:01:20.513475  / # . /lava-3197037/environment/lava-319703=
7/bin/lava-test-runner /lava-3197037/1
    2023-01-24T09:01:20.514376  =

    2023-01-24T09:01:20.519662  / # /lava-3197037/bin/lava-test-runner /lav=
a-3197037/1
    2023-01-24T09:01:20.591451  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T09:01:20.591784  + cd /lava-3197037/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9f08b7d123acf7915ebc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9f08b7d123acf7915ec1
        failing since 6 days (last pass: next-20221130, first fail: next-20=
230118)

    2023-01-24T09:03:49.280846  <8>[   35.412686] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-01-24T09:03:49.283266  + set +x<8>[   35.416515] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3197093_1.5.2.4.1>
    2023-01-24T09:03:49.283528  =

    2023-01-24T09:03:49.388582  / # #
    2023-01-24T09:03:49.490289  export SHELL=3D/bin/sh
    2023-01-24T09:03:49.490820  #
    2023-01-24T09:03:49.491072  / # export SHELL=3D/bin/sh<3>[   35.629889]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T09:03:49.592404  . /lava-3197093/environment
    2023-01-24T09:03:49.592765  =

    2023-01-24T09:03:49.694106  / # . /lava-3197093/environment/lava-319709=
3/bin/lava-test-runner /lava-3197093/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa21ac7d2829047915ebe

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa21ac7d2829047915ec3
        failing since 6 days (last pass: next-20221129, first fail: next-20=
230118)

    2023-01-24T09:17:01.581128  / # #
    2023-01-24T09:17:01.682830  export SHELL=3D/bin/sh
    2023-01-24T09:17:01.683202  #
    2023-01-24T09:17:01.784524  / # export SHELL=3D/bin/sh. /lava-3197321/e=
nvironment
    2023-01-24T09:17:01.784880  =

    2023-01-24T09:17:01.886226  / # . /lava-3197321/environment/lava-319732=
1/bin/lava-test-runner /lava-3197321/1
    2023-01-24T09:17:01.886840  =

    2023-01-24T09:17:01.906014  / # /lava-3197321/bin/lava-test-runner /lav=
a-3197321/1
    2023-01-24T09:17:01.963937  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T09:17:01.964416  + cd /lava-3197321/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa2f57d0b530ed7915f02

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa2f57d0b530ed7915f07
        failing since 6 days (last pass: next-20221129, first fail: next-20=
230118)

    2023-01-24T09:20:43.391074  / # #
    2023-01-24T09:20:43.492983  export SHELL=3D/bin/sh
    2023-01-24T09:20:43.493477  #
    2023-01-24T09:20:43.594833  / # export SHELL=3D/bin/sh. /lava-3197420/e=
nvironment
    2023-01-24T09:20:43.595328  =

    2023-01-24T09:20:43.696743  / # . /lava-3197420/environment/lava-319742=
0/bin/lava-test-runner /lava-3197420/1
    2023-01-24T09:20:43.697470  =

    2023-01-24T09:20:43.701943  / # /lava-3197420/bin/lava-test-runner /lav=
a-3197420/1
    2023-01-24T09:20:43.778778  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T09:20:43.779275  + cd /lava-3197420/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa10e0e3f9b8710915ec7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa10e0e3f9b8710915ecc
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T09:12:33.765998  / # #
    2023-01-24T09:12:33.867736  export SHELL=3D/bin/sh
    2023-01-24T09:12:33.868402  #
    2023-01-24T09:12:33.970054  / # export SHELL=3D/bin/sh. /lava-3197357/e=
nvironment
    2023-01-24T09:12:33.970495  =

    2023-01-24T09:12:33.971038  / # <3>[   18.167719] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T09:12:34.072790  . /lava-3197357/environment/lava-3197357/bi=
n/lava-test-runner /lava-3197357/1
    2023-01-24T09:12:34.073437  =

    2023-01-24T09:12:34.084174  / # /lava-3197357/bin/lava-test-runner /lav=
a-3197357/1
    2023-01-24T09:12:34.142184  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa261fdab46fad2915ec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa261fdab46fad2915ec6
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T09:18:02.017227  + set +x<8>[   17.924512] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3197511_1.5.2.4.1>
    2023-01-24T09:18:02.121858  / # #
    2023-01-24T09:18:02.223643  export SHELL=3D/bin/sh
    2023-01-24T09:18:02.224081  #
    2023-01-24T09:18:02.325359  / # export SHELL=3D/bin/sh. /lava-3197511/e=
nvironment
    2023-01-24T09:18:02.325921  =

    2023-01-24T09:18:02.326182  / # <3>[   18.169825] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T09:18:02.427501  . /lava-3197511/environment/lava-3197511/bi=
n/lava-test-runner /lava-3197511/1
    2023-01-24T09:18:02.428224  =

    2023-01-24T09:18:02.433097  / # /lava-3197511/bin/lava-test-runner /lav=
a-3197511/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9a9284ca62bb1e915ec8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9a9284ca62bb1e915ecd
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T08:44:41.110096  / # #
    2023-01-24T08:44:41.211808  export SHELL=3D/bin/sh
    2023-01-24T08:44:41.212542  #
    2023-01-24T08:44:41.314389  / # export SHELL=3D/bin/sh. /lava-3196780/e=
nvironment
    2023-01-24T08:44:41.314762  =

    2023-01-24T08:44:41.315015  / # <3>[   18.180047] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T08:44:41.416299  . /lava-3196780/environment/lava-3196780/bi=
n/lava-test-runner /lava-3196780/1
    2023-01-24T08:44:41.416915  =

    2023-01-24T08:44:41.428012  / # /lava-3196780/bin/lava-test-runner /lav=
a-3196780/1
    2023-01-24T08:44:41.486096  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9ccd6d3c3af2d1915ed5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9ccd6d3c3af2d1915eda
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T08:54:24.294644  / # #
    2023-01-24T08:54:24.398684  export SHELL=3D/bin/sh
    2023-01-24T08:54:24.399367  #
    2023-01-24T08:54:24.399603  / # export SHELL=3D/bin/sh<3>[   18.024256]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T08:54:24.505135  . /lava-3196948/environment
    2023-01-24T08:54:24.505549  =

    2023-01-24T08:54:24.610647  / # . /lava-3196948/environment/lava-319694=
8/bin/lava-test-runner /lava-3196948/1
    2023-01-24T08:54:24.611256  =

    2023-01-24T08:54:24.621999  / # /lava-3196948/bin/lava-test-runner /lav=
a-3196948/1
    2023-01-24T08:54:24.682007  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9dc43e7129653e915f6e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9dc43e7129653e915f73
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T08:58:37.750275  + set +x<8>[   17.892397] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3197001_1.5.2.4.1>
    2023-01-24T08:58:37.853764  / # #
    2023-01-24T08:58:37.955223  export SHELL=3D/bin/sh
    2023-01-24T08:58:37.955678  #
    2023-01-24T08:58:38.057053  / # export SHELL=3D/bin/sh. /lava-3197001/e=
nvironment
    2023-01-24T08:58:38.057521  =

    2023-01-24T08:58:38.057781  / # <3>[   18.143628] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T08:58:38.159150  . /lava-3197001/environment/lava-3197001/bi=
n/lava-test-runner /lava-3197001/1
    2023-01-24T08:58:38.159895  =

    2023-01-24T08:58:38.174300  / # /lava-3197001/bin/lava-test-runner /lav=
a-3197001/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9e8f03d6f12cf2915f06

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9e8f03d6f12cf2915f0b
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T09:01:45.724371  / # #
    2023-01-24T09:01:45.826596  export SHELL=3D/bin/sh
    2023-01-24T09:01:45.827061  #
    2023-01-24T09:01:45.928380  / # export SHELL=3D/bin/sh. /lava-3197096/e=
nvironment
    2023-01-24T09:01:45.928725  =

    2023-01-24T09:01:45.928877  / # <3>[  102.938834] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T09:01:46.030060  . /lava-3197096/environment/lava-3197096/bi=
n/lava-test-runner /lava-3197096/1
    2023-01-24T09:01:46.030650  =

    2023-01-24T09:01:46.038655  / # /lava-3197096/bin/lava-test-runner /lav=
a-3197096/1
    2023-01-24T09:01:46.100627  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa0f55ee6829008915edd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa0f55ee6829008915ee2
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T09:11:49.981642  / # #
    2023-01-24T09:11:50.083227  export SHELL=3D/bin/sh
    2023-01-24T09:11:50.083639  #
    2023-01-24T09:11:50.184968  / # export SHELL=3D/bin/sh. /lava-3197332/e=
nvironment
    2023-01-24T09:11:50.185435  =

    2023-01-24T09:11:50.185680  / # <3>[   18.114293] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T09:11:50.286937  . /lava-3197332/environment/lava-3197332/bi=
n/lava-test-runner /lava-3197332/1
    2023-01-24T09:11:50.287600  =

    2023-01-24T09:11:50.304260  / # /lava-3197332/bin/lava-test-runner /lav=
a-3197332/1
    2023-01-24T09:11:50.359480  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa1800088ce3778915eda

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa1800088ce3778915edf
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T09:14:17.731652  / # #
    2023-01-24T09:14:17.833760  export SHELL=3D/bin/sh
    2023-01-24T09:14:17.834343  #
    2023-01-24T09:14:17.935866  / # export SHELL=3D/bin/sh. /lava-3197407/e=
nvironment
    2023-01-24T09:14:17.936440  =

    2023-01-24T09:14:17.936693  / # <3>[   17.901239] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T09:14:18.038316  . /lava-3197407/environment/lava-3197407/bi=
n/lava-test-runner /lava-3197407/1
    2023-01-24T09:14:18.039347  =

    2023-01-24T09:14:18.057214  / # /lava-3197407/bin/lava-test-runner /lav=
a-3197407/1
    2023-01-24T09:14:18.099082  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa1d89073888810915ebf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa1d89073888810915ec4
        failing since 6 days (last pass: next-20230109, first fail: next-20=
230118)

    2023-01-24T09:15:41.572942  + set <8>[   17.916391] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 3197431_1.5.2.4.1>
    2023-01-24T09:15:41.573188  +x
    2023-01-24T09:15:41.676806  / # #
    2023-01-24T09:15:41.779210  export SHELL=3D/bin/sh
    2023-01-24T09:15:41.779592  #
    2023-01-24T09:15:41.881027  / # export SHELL=3D/bin/sh. /lava-3197431/e=
nvironment
    2023-01-24T09:15:41.881846  =

    2023-01-24T09:15:41.882286  / # <3>[   18.184730] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-24T09:15:41.984240  . /lava-3197431/environment/lava-3197431/bi=
n/lava-test-runner /lava-3197431/1
    2023-01-24T09:15:41.984911   =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfadaeb1ac5ceaf6915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfadaeb1ac5ceaf6915=
ebe
        new failure (last pass: next-20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa065bf5ee7ecc0915f23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa065bf5ee7ecc0915=
f24
        new failure (last pass: next-20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa0f56eb4f18447915ed2

  Results:     167 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/63c=
fa0f66eb4f18447915f21
        failing since 1 day (last pass: next-20230119, first fail: next-202=
30123)

    2023-01-24T09:11:54.765906  /lava-8851301/1/../bin/lava-test-case
    2023-01-24T09:11:54.775570  <8>[   22.979105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9e9f9adf3ad723915f00

  Results:     167 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/63c=
f9e9f9adf3ad723915f4f
        failing since 1 day (last pass: next-20230120, first fail: next-202=
30123)

    2023-01-24T09:02:03.892523  /lava-8851056/1/../bin/lava-test-case
    2023-01-24T09:02:03.895697  =

    2023-01-24T09:02:03.905601  <8>[   23.232734] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa4c2362ab19c9d915f6e

  Results:     167 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/63c=
fa4c3362ab19c9d915fbd
        failing since 1 day (last pass: next-20230119, first fail: next-202=
30123)

    2023-01-24T09:28:18.731051  /lava-8851651/1/../bin/lava-test-case
    2023-01-24T09:28:18.769716  <8>[  186.658686] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa452ec225d6754915ec2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa452ec225d6754915=
ec3
        failing since 1 day (last pass: next-20230119, first fail: next-202=
30123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa0a3a73693b198915ef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa0a3a73693b198915=
ef4
        new failure (last pass: next-20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9c0cdc61be3c60915ed1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf9c0cdc61be3c60915=
ed2
        failing since 154 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa48eec225d6754915ed9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa48eec225d6754915=
eda
        failing since 133 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfc6792fcd08e429915ecf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfc6792fcd08e429915=
ed0
        failing since 133 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa4cbc5d668f07e915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa4cbc5d668f07e915=
eba
        failing since 131 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfc6cac2e4648ff7915ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfc6cac2e4648ff7915=
ec9
        failing since 131 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa36c37955af3bf915f1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa36c37955af3bf915=
f1f
        failing since 131 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa4e341981407d7915ed5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa4e341981407d7915=
ed6
        failing since 133 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfc8326f46ffe29b915ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfc8326f46ffe29b915=
ee9
        failing since 133 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa4e141981407d7915ed0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa4e141981407d7915=
ed1
        failing since 132 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfc7e2abce451b5a915ebc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfc7e2abce451b5a915=
ebd
        failing since 132 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa36e265c9e79ae915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa36e265c9e79ae915=
ebe
        failing since 132 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9ab11976a0fa34915f10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf9ab11976a0fa34915=
f11
        new failure (last pass: next-20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfb19d50788e4315915ef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfb19d50788e4315915=
ef4
        failing since 2 days (last pass: next-20230119, first fail: next-20=
230120) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfb39182d8ad1e3a915ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfb39182d8ad1e3a915=
ec9
        failing since 4 days (last pass: next-20230109, first fail: next-20=
230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfb4e17ab9498274915ee6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfb4e17ab9498274915=
ee7
        failing since 63 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfb932889989ecdd915ee9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfb932889989ecdd915=
eea
        new failure (last pass: next-20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfcb971a49a2fa6d915ec1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfcb971a49a2fa6d915=
ec2
        failing since 4 days (last pass: next-20230116, first fail: next-20=
230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfb36db3a08c05df915ecb

  Results:     65 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63cfb36db3a08c0=
5df915f13
        new failure (last pass: next-20230123)
        9 lines

    2023-01-24T10:30:26.933510  kern  :alert : BUG: Bad page map in process=
 udevd  pte:27b84910 <8>[    9.845394] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfb79f34899f5296915f3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfb79f34899f5296915=
f3e
        failing since 4 days (last pass: next-20230109, first fail: next-20=
230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfb8085efbbcbe86915ee2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfb8085efbbcbe86915=
ee3
        failing since 63 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfbaec0c0bc9d5ad915ecf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfbaec0c0bc9d5ad915=
ed0
        failing since 1 day (last pass: next-20230120, first fail: next-202=
30123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa026650a84a86b915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cfa026650a84a86b915ece
        failing since 19 days (last pass: next-20221130, first fail: next-2=
0230105)

    2023-01-24T09:08:37.208096  + set +x
    2023-01-24T09:08:37.209545  <8>[   66.260803][  T196] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 384569_1.5.2.4.1>
    2023-01-24T09:08:37.339438  #
    2023-01-24T09:08:37.441995  / # #export SHELL=3D/bin/sh
    2023-01-24T09:08:37.442431  =

    2023-01-24T09:08:37.543900  / # export SHELL=3D/bin/sh. /lava-384569/en=
vironment
    2023-01-24T09:08:37.544532  =

    2023-01-24T09:08:37.646098  / # . /lava-384569/environment/lava-384569/=
bin/lava-test-runner /lava-384569/1
    2023-01-24T09:08:37.647087  =

    2023-01-24T09:08:37.654411  / # /lava-384569/bin/lava-test-runner /lava=
-384569/1 =

    ... (43 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9fa08b75df7491915ebe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf9fa08b75df7491915=
ebf
        failing since 96 days (last pass: next-20221011, first fail: next-2=
0221019) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa0c8cea5ebac81915f2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa0c8cea5ebac81915=
f30
        failing since 5 days (last pass: next-20230118, first fail: next-20=
230119) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfa01086702fb78e915ec1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfa01086702fb78e915=
ec2
        new failure (last pass: next-20230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9e5826f6170932915ef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-a83t-ban=
anapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-a83t-ban=
anapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf9e5826f6170932915=
ef4
        new failure (last pass: next-20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9c700fd5058888915ee2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9c700fd5058888915ee7
        new failure (last pass: next-20230123)

    2023-01-24T08:52:26.447716  <8>[    9.656913] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3196919_1.5.2.4.1>
    2023-01-24T08:52:26.552803  / # #
    2023-01-24T08:52:26.654476  export SHELL=3D/bin/sh
    2023-01-24T08:52:26.654830  #
    2023-01-24T08:52:26.756103  / # export SHELL=3D/bin/sh. /lava-3196919/e=
nvironment
    2023-01-24T08:52:26.756512  =

    2023-01-24T08:52:26.858027  / # . /lava-3196919/environment/lava-319691=
9/bin/lava-test-runner /lava-3196919/1
    2023-01-24T08:52:26.858634  =

    2023-01-24T08:52:26.862419  / # /lava-3196919/bin/lava-test-runner /lav=
a-3196919/1
    2023-01-24T08:52:26.990460  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cfae8b669f1b33da915ecc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cfae8b669f1b33da915=
ecd
        failing since 61 days (last pass: next-20221121, first fail: next-2=
0221123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf9f436f6078999f915f62

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230124/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf9f436f6078999f915f65
        failing since 19 days (last pass: next-20221207, first fail: next-2=
0230105)

    2023-01-24T09:04:57.272444  + set +x
    2023-01-24T09:04:57.280467  <8>[   43.675264][  T171] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 831685_1.5.2.4.1>
    2023-01-24T09:04:57.412995  #
    2023-01-24T09:04:57.515114  / # #export SHELL=3D/bin/sh
    2023-01-24T09:04:57.515564  =

    2023-01-24T09:04:57.616954  / # export SHELL=3D/bin/sh. /lava-831685/en=
vironment
    2023-01-24T09:04:57.617404  =

    2023-01-24T09:04:57.718825  / # . /lava-831685/environment/lava-831685/=
bin/lava-test-runner /lava-831685/1
    2023-01-24T09:04:57.719579  =

    2023-01-24T09:04:57.724338  / # /lava-831685/bin/lava-test-runner /lava=
-831685/1 =

    ... (18 line(s) more)  =

 =20
