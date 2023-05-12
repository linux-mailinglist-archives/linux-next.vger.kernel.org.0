Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 984F870027A
	for <lists+linux-next@lfdr.de>; Fri, 12 May 2023 10:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239936AbjELI2W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 May 2023 04:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239962AbjELI2V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 May 2023 04:28:21 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC86493ED
        for <linux-next@vger.kernel.org>; Fri, 12 May 2023 01:28:10 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1aaf7067647so66868885ad.0
        for <linux-next@vger.kernel.org>; Fri, 12 May 2023 01:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683880090; x=1686472090;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw/ByL9oaOZdsqWK2izVTRZnAhJe2ok4+Es2jROPU0E=;
        b=D28vTA7dW4Yrzz8lYUoLaJAdSr9JPakIB/LZF1MdQjzupQASdw509iPNdav6L/3a2n
         eG3UgI80wvmuUXdQwc65dowTKpGX6lDPLPmqxtAl2J7tfdHyry2vDkn34cy9NPctZXdX
         KnOYt9Dh4zSpiZfYgsUXcpDerx0224gomZtDSZ+ieeHLtSlNNNzszJRZECIvSRiu7xd/
         Fup3XXaxFI640rJfIXE/SoMGbecQ+mI+CDS/j1rmwCRqdn8KTANGm0y/61LDmZd3C7L7
         oKknfDCBVIHzv3CXIvwJ0tf+5JkLBChSqslOhdACzztQy8026wOfsI10aAb9uRCpS/6H
         Ln+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683880090; x=1686472090;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uw/ByL9oaOZdsqWK2izVTRZnAhJe2ok4+Es2jROPU0E=;
        b=FrqKkTgTjSwZ7lAmgCfeWESfIlvx9LollwMXD/lIDlSYrMttsYTFoONk054O8pIiHj
         RJ5v7bfl5qVyBYHksCLcNgoythYq/n+SDVyuvlVacvNYTsdcYHwmasoL35Rb6ldlw8+b
         7qV5eKMmKOwsrDrPRO/gjB3TrXIQ12xrT+3uIBMG/Qh1UHxtnbeOkZ6oKKU6abpRmzqs
         owCroszn6HMRAMV3tMIO80eGYuJn3DvfzZNqq9N1Fj80HbdeTBgdS70qXk+hWKZC2tCY
         DGNy9dhgxxnHG93FORvwk4AtRDvWGNpm1n5Oq6elWaFeDKzyUWvhNFb73CZ8BQTz/MRx
         gXcQ==
X-Gm-Message-State: AC+VfDzY1UdDvLgG2lw5s+TVjkLy1cPKAwPvN8Nb4K08Pp7uE1MVqfBD
        NZeo+urp3vx+6bwfJk2bcPqAeUs7hu797lNAkAQpqg==
X-Google-Smtp-Source: ACHHUZ7s/Xz/xRJAcO7G2mbt9GYvRAai8hOy+08nJUlYwf8SvP3x7o1JYIp9t6eLgp+REKcawtJwJQ==
X-Received: by 2002:a17:902:cec3:b0:1ad:e099:fbf9 with SMTP id d3-20020a170902cec300b001ade099fbf9mr2329056plg.42.1683880088130;
        Fri, 12 May 2023 01:28:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id je6-20020a170903264600b001aaf2e7b06csm7313980plb.132.2023.05.12.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 01:28:07 -0700 (PDT)
Message-ID: <645df897.170a0220.c4350.f1af@mx.google.com>
Date:   Fri, 12 May 2023 01:28:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230512
X-Kernelci-Report-Type: test
Subject: next/master baseline: 785 runs, 123 regressions (next-20230512)
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

next/master baseline: 785 runs, 123 regressions (next-20230512)

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

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

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

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 31         =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

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

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_i386                    | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 3          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230512/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230512
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e922ba281a8d84f640d8c8e18a385d032c19e185 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645dca8424f81d82522e8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dca8424f81d82522e8=
659
        failing since 236 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcc2a26bdc7f0952e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcc2a26bdc7f0952e8=
5e7
        failing since 239 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc5edd402507c3c2e863f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645dc5edd402507c3c2e8644
        failing since 44 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-12T04:51:37.832712  <8>[   10.603239] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10291516_1.4.2.3.1>

    2023-05-12T04:51:37.836195  + set +x

    2023-05-12T04:51:37.940538  / # #

    2023-05-12T04:51:38.042793  export SHELL=3D/bin/sh

    2023-05-12T04:51:38.043504  #

    2023-05-12T04:51:38.144922  / # export SHELL=3D/bin/sh. /lava-10291516/=
environment

    2023-05-12T04:51:38.145844  =


    2023-05-12T04:51:38.247444  / # . /lava-10291516/environment/lava-10291=
516/bin/lava-test-runner /lava-10291516/1

    2023-05-12T04:51:38.248554  =


    2023-05-12T04:51:38.254866  / # /lava-10291516/bin/lava-test-runner /la=
va-10291516/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc60916fcfdcef12e8627

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645dc60916fcfdcef12e862c
        failing since 44 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-12T04:52:07.195182  + set +x

    2023-05-12T04:52:07.201386  <8>[   10.363365] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10291567_1.4.2.3.1>

    2023-05-12T04:52:07.303091  #

    2023-05-12T04:52:07.303395  =


    2023-05-12T04:52:07.403975  / # #export SHELL=3D/bin/sh

    2023-05-12T04:52:07.404177  =


    2023-05-12T04:52:07.504720  / # export SHELL=3D/bin/sh. /lava-10291567/=
environment

    2023-05-12T04:52:07.504926  =


    2023-05-12T04:52:07.605564  / # . /lava-10291567/environment/lava-10291=
567/bin/lava-test-runner /lava-10291567/1

    2023-05-12T04:52:07.605931  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc5b71900cb4dc02e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645dc5b71900cb4dc02e85eb
        failing since 44 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-12T04:50:47.085026  <8>[   10.482802] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10291477_1.4.2.3.1>

    2023-05-12T04:50:47.088044  + set +x

    2023-05-12T04:50:47.190261  =


    2023-05-12T04:50:47.291012  / # #export SHELL=3D/bin/sh

    2023-05-12T04:50:47.291276  =


    2023-05-12T04:50:47.391898  / # export SHELL=3D/bin/sh. /lava-10291477/=
environment

    2023-05-12T04:50:47.392160  =


    2023-05-12T04:50:47.492797  / # . /lava-10291477/environment/lava-10291=
477/bin/lava-test-runner /lava-10291477/1

    2023-05-12T04:50:47.493221  =


    2023-05-12T04:50:47.498225  / # /lava-10291477/bin/lava-test-runner /la=
va-10291477/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc60722c63f8f102e8668

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645dc60722c63f8f102e866d
        failing since 44 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-12T04:52:08.895443  <8>[   10.450790] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10291591_1.4.2.3.1>

    2023-05-12T04:52:08.898422  + set +x

    2023-05-12T04:52:09.000664  =


    2023-05-12T04:52:09.101426  / # #export SHELL=3D/bin/sh

    2023-05-12T04:52:09.101676  =


    2023-05-12T04:52:09.202301  / # export SHELL=3D/bin/sh. /lava-10291591/=
environment

    2023-05-12T04:52:09.202555  =


    2023-05-12T04:52:09.303196  / # . /lava-10291591/environment/lava-10291=
591/bin/lava-test-runner /lava-10291591/1

    2023-05-12T04:52:09.303609  =


    2023-05-12T04:52:09.307907  / # /lava-10291591/bin/lava-test-runner /la=
va-10291591/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc92f85b1631b8b2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc92f85b1631b8b2e8=
5e7
        new failure (last pass: next-20230510) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc3e21a99ad71f02e8622

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc3e21a99ad71f02e8=
623
        failing since 100 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc8f1e5d4a18a652e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc8f1e5d4a18a652e8=
600
        failing since 44 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc84d2c7506d25f2e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc84d2c7506d25f2e8=
5ea
        failing since 41 days (last pass: next-20230330, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc36d403f0d35b72e8625

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645dc36d403f0d3=
5b72e862c
        failing since 87 days (last pass: next-20230208, first fail: next-2=
0230213)
        30 lines

    2023-05-12T04:40:58.720746  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4d1e200 pointer offset 4 size 512
    2023-05-12T04:40:58.754577  kern  :alert : Register r9 information: non=
-paged memory
    2023-05-12T04:40:58.754814  kern  :alert : Register r10 information: NU=
LL pointer
    2023-05-12T04:40:58.755168  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2c2000 allocated at load_module+0x6b0/0=
x1954
    2023-05-12T04:40:58.757711  kern  :alert : Register r12 information: no=
n-paged memory
    2023-05-12T04:40:58.863192  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-05-12T04:40:58.863913  kern  :emerg : Process udevd (pid: 68, stac=
k limit =3D 0xf61f6c86)
    2023-05-12T04:40:58.864411  kern  :emerg : Stack: (0xc8909cf8 to 0xc890=
a000)
    2023-05-12T04:40:58.864848  kern  :emerg : 9ce0:                       =
                                c4d1e200 c0777880
    2023-05-12T04:40:58.865293  kern  :emerg : 9d00: 00000000 c03b1078 0000=
0000 1d0c2cf9 0000005d 1d0c2cf9 c0777880 bf2c2220 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcb5f86189737882e864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcb5f86189737882e8=
64f
        failing since 108 days (last pass: next-20230120, first fail: next-=
20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dccf8c1a06057b32e85f3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645dccf8c1a06057b32e85f6
        failing since 90 days (last pass: next-20230209, first fail: next-2=
0230210)

    2023-05-12T05:21:21.977142  + set +x
    2023-05-12T05:21:21.978950  [   19.700961] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1219512_1.5.2.4.1>
    2023-05-12T05:21:22.092482  #
    2023-05-12T05:21:22.194599  / # #export SHELL=3D/bin/sh
    2023-05-12T05:21:22.195078  =

    2023-05-12T05:21:22.296438  / # export SHELL=3D/bin/sh. /lava-1219512/e=
nvironment
    2023-05-12T05:21:22.296936  =

    2023-05-12T05:21:22.398359  / # . /lava-1219512/environment/lava-121951=
2/bin/lava-test-runner /lava-1219512/1
    2023-05-12T05:21:22.399361  =

    2023-05-12T05:21:22.401788  / # /lava-1219512/bin/lava-test-runner /lav=
a-1219512/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc607bfb25d512f2e8624

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645dc607bfb25d512f2e8629
        failing since 44 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-12T04:52:07.721641  + set +x

    2023-05-12T04:52:07.728293  <8>[   10.870759] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10291532_1.4.2.3.1>

    2023-05-12T04:52:07.832142  / # #

    2023-05-12T04:52:07.932771  export SHELL=3D/bin/sh

    2023-05-12T04:52:07.932977  #

    2023-05-12T04:52:08.033577  / # export SHELL=3D/bin/sh. /lava-10291532/=
environment

    2023-05-12T04:52:08.033914  =


    2023-05-12T04:52:08.134684  / # . /lava-10291532/environment/lava-10291=
532/bin/lava-test-runner /lava-10291532/1

    2023-05-12T04:52:08.134980  =


    2023-05-12T04:52:08.139606  / # /lava-10291532/bin/lava-test-runner /la=
va-10291532/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc61fe6ccaed71f2e85f5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645dc61fe6ccaed71f2e85fa
        failing since 44 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-12T04:52:31.513522  + <8>[   10.887091] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10291582_1.4.2.3.1>

    2023-05-12T04:52:31.513633  set +x

    2023-05-12T04:52:31.615389  =


    2023-05-12T04:52:31.715998  / # #export SHELL=3D/bin/sh

    2023-05-12T04:52:31.716217  =


    2023-05-12T04:52:31.816725  / # export SHELL=3D/bin/sh. /lava-10291582/=
environment

    2023-05-12T04:52:31.816944  =


    2023-05-12T04:52:31.917465  / # . /lava-10291582/environment/lava-10291=
582/bin/lava-test-runner /lava-10291582/1

    2023-05-12T04:52:31.917784  =


    2023-05-12T04:52:31.922113  / # /lava-10291582/bin/lava-test-runner /la=
va-10291582/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc5a1c36714c8ce2e864b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645dc5a1c36714c8ce2e8650
        failing since 44 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-12T04:50:29.254026  + set +x<8>[   10.327063] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10291479_1.4.2.3.1>

    2023-05-12T04:50:29.254116  =


    2023-05-12T04:50:29.356211  #

    2023-05-12T04:50:29.457103  / # #export SHELL=3D/bin/sh

    2023-05-12T04:50:29.457300  =


    2023-05-12T04:50:29.557840  / # export SHELL=3D/bin/sh. /lava-10291479/=
environment

    2023-05-12T04:50:29.558053  =


    2023-05-12T04:50:29.658567  / # . /lava-10291479/environment/lava-10291=
479/bin/lava-test-runner /lava-10291479/1

    2023-05-12T04:50:29.658902  =


    2023-05-12T04:50:29.663895  / # /lava-10291479/bin/lava-test-runner /la=
va-10291479/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc5f1fb1b5fdf852e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645dc5f1fb1b5fdf852e85eb
        failing since 44 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-12T04:51:55.425462  <8>[   10.341103] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10291544_1.4.2.3.1>

    2023-05-12T04:51:55.429255  + set +x

    2023-05-12T04:51:55.533147  / # #

    2023-05-12T04:51:55.633814  export SHELL=3D/bin/sh

    2023-05-12T04:51:55.633991  #

    2023-05-12T04:51:55.734522  / # export SHELL=3D/bin/sh. /lava-10291544/=
environment

    2023-05-12T04:51:55.734711  =


    2023-05-12T04:51:55.835223  / # . /lava-10291544/environment/lava-10291=
544/bin/lava-test-runner /lava-10291544/1

    2023-05-12T04:51:55.835519  =


    2023-05-12T04:51:55.840381  / # /lava-10291544/bin/lava-test-runner /la=
va-10291544/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcba5f3c23408352e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcba5f3c23408352e8=
600
        failing since 275 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcb7dc42a27de0a2e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcb7dc42a27de0a2e8=
5fd
        failing since 262 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc7bb68f66df5b92e8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc7bb68f66df5b92e8=
652
        failing since 395 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc759952857f7552e85e8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645dc759952857f7552e85ed
        failing since 22 days (last pass: next-20230417, first fail: next-2=
0230419)

    2023-05-12T04:57:29.316971  + set +x
    2023-05-12T04:57:29.320302  <8>[    7.638281] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3579103_1.5.2.4.1>
    2023-05-12T04:57:29.424064  / # #
    2023-05-12T04:57:29.525904  export SHELL=3D/bin/sh
    2023-05-12T04:57:29.526391  #
    2023-05-12T04:57:29.627636  / # export SHELL=3D/bin/sh. /lava-3579103/e=
nvironment
    2023-05-12T04:57:29.628075  =

    2023-05-12T04:57:29.729462  / # . /lava-3579103/environment/lava-357910=
3/bin/lava-test-runner /lava-3579103/1
    2023-05-12T04:57:29.730196  =

    2023-05-12T04:57:29.736077  / # /lava-3579103/bin/lava-test-runner /lav=
a-3579103/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc70fb719b738242e863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc70fb719b738242e8=
63e
        failing since 22 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc4e178652416292e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc4e178652416292e8=
5e7
        failing since 1 day (last pass: v6.3-rc6-12018-gd3f2cd248191, first=
 fail: next-20230511) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc78ee14ed1fd772e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc78ee14ed1fd772e8=
5f4
        failing since 21 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/645dccd51544ed4fb32e86a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dccd51544ed4fb32e8=
6a1
        failing since 21 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dce58e1e954c1ff2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dce58e1e954c1ff2e8=
5e7
        failing since 93 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dce2660afb0ad8f2e861d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dce2660afb0ad8f2e8=
61e
        failing since 106 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcceeee851d5c562e865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcceeee851d5c562e8=
65b
        failing since 106 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dccfdc1a06057b32e861c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dccfdc1a06057b32e8=
61d
        failing since 93 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dd0898ee6c3a49d2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dd0898ee6c3a49d2e8=
5e7
        failing since 94 days (last pass: next-20230203, first fail: next-2=
0230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dce2fe266fbce5f2e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dce2fe266fbce5f2e8=
600
        failing since 93 days (last pass: next-20230203, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dccfb21de33a2652e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dccfb21de33a2652e8=
5f6
        failing since 93 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dd1019a68e3c7782e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dd1019a68e3c7782e8=
5fa
        failing since 93 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcd57e43af33ba12e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcd57e43af33ba12e8=
5f8
        failing since 93 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dccf921de33a2652e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dccf921de33a2652e8=
5eb
        failing since 93 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc7477a99208bc62e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc7477a99208bc62e8=
602
        failing since 107 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc69ead4b0f65002e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc69ead4b0f65002e8=
5ff
        failing since 104 days (last pass: next-20230120, first fail: next-=
20230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc4f957d5c9aaf92e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc4f957d5c9aaf92e8=
5e7
        failing since 107 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc801b37068ea862e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc801b37068ea862e8=
605
        failing since 23 days (last pass: next-20230404, first fail: next-2=
0230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc82a41330db4562e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc82a41330db4562e8=
628
        failing since 92 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 31         =


  Details:     https://kernelci.org/test/plan/id/645dc5df4e2bbf2dcc2e85fe

  Results:     140 PASS, 45 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mt8192-audio-probed: https://kernelci.org/test/case/id/=
645dc5df4e2bbf2dcc2e860f
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:51:15.641749  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:51:15.647806  <8>[   50.621815] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmt8192-audio-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-vcodec-enc-probed: https://kernelci.org/test/case/i=
d/645dc5df4e2bbf2dcc2e8619
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:51:11.464247  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:51:11.470228  <8>[   46.444465] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-vcodec-enc-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-gamma-probed: https://kernelci.org/test/c=
ase/id/645dc5df4e2bbf2dcc2e8632
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:51:05.973908  <8>[   40.943973] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-gamma-driver-present RESULT=3Dpass>

    2023-05-12T04:51:06.988022  /lava-10291341/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-color-probed: https://kernelci.org/test/c=
ase/id/645dc5df4e2bbf2dcc2e8634
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:51:05.947425  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:51:05.954098  <8>[   40.926435] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-color-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ccorr-probed: https://kernelci.org/test/c=
ase/id/645dc5df4e2bbf2dcc2e8636
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:51:04.905490  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:51:04.912177  <8>[   39.885684] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ccorr-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-aal-probed: https://kernelci.org/test/cas=
e/id/645dc5df4e2bbf2dcc2e8638
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:51:03.864113  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:51:03.870865  <8>[   38.844452] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-aal-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-rdma4-probed: https://kernelci.org/test/c=
ase/id/645dc5df4e2bbf2dcc2e863a
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:51:02.821835  /lava-10291341/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-rdma0-probed: https://kernelci.org/test/c=
ase/id/645dc5df4e2bbf2dcc2e863b
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:51:01.798771  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:51:01.805464  <8>[   36.778056] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl2l2-probed: https://kernelci.org/test/=
case/id/645dc5df4e2bbf2dcc2e863d
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:59.742761  <8>[   34.712818] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl2l0-probed RESULT=3Dfail>

    2023-05-12T04:51:00.756329  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:51:00.765926  <8>[   35.736676] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl2l2-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl2l0-probed: https://kernelci.org/test/=
case/id/645dc5df4e2bbf2dcc2e863e
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:59.733131  /lava-10291341/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-ovl0-probed: https://kernelci.org/test/ca=
se/id/645dc5df4e2bbf2dcc2e863f
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:58.709487  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:58.716097  <8>[   33.688674] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-mutex-probed: https://kernelci.org/test/case/i=
d/645dc5df4e2bbf2dcc2e8641
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:57.021913  <6>[   31.999680] Vgpu: disabling

    2023-05-12T04:50:57.035510  <6>[   32.010296] pp3300_mipibrdg: disabling

    2023-05-12T04:50:57.038864  <6>[   32.014337] pp3300_dpbrdg: disabling

    2023-05-12T04:50:57.668228  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:57.674621  <8>[   32.648090] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mutex-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-dsi-probed: https://kernelci.org/test/case/id/645dc=
5df4e2bbf2dcc2e864c
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:54.455408  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:54.461641  <8>[   29.434559] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-dsi-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-iommu-probed: https://kernelci.org/test/case/id/645=
dc5df4e2bbf2dcc2e8663
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:53.018355  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:53.025187  <8>[   27.997703] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-iommu-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb18-probed: https://kernelci.org/test/case/i=
d/645dc5df4e2bbf2dcc2e8665
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:51.977685  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:51.984608  <8>[   26.956510] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb18-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb13-probed: https://kernelci.org/test/case/i=
d/645dc5df4e2bbf2dcc2e8666
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:50.954796  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:50.961148  <8>[   25.933827] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb13-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb11-probed: https://kernelci.org/test/case/i=
d/645dc5df4e2bbf2dcc2e8667
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:49.931594  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:49.938464  <8>[   24.910050] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb11-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb2-probed: https://kernelci.org/test/case/id=
/645dc5df4e2bbf2dcc2e8668
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:48.908265  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:48.914909  <8>[   23.887116] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb2-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb17-probed: https://kernelci.org/test/case/i=
d/645dc5df4e2bbf2dcc2e8669
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:47.885161  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:47.892026  <8>[   22.863387] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb17-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb7-probed: https://kernelci.org/test/case/id=
/645dc5df4e2bbf2dcc2e866a
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:46.862464  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:46.868989  <8>[   21.841165] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb7-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb9-probed: https://kernelci.org/test/case/id=
/645dc5df4e2bbf2dcc2e866b
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:45.839667  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:45.846540  <8>[   20.817456] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb9-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb19-probed: https://kernelci.org/test/case/i=
d/645dc5df4e2bbf2dcc2e866c
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:44.816677  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:44.823195  <8>[   19.794795] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb19-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb16-probed: https://kernelci.org/test/case/i=
d/645dc5df4e2bbf2dcc2e866d
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:43.793770  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:43.800428  <8>[   18.772019] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb16-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb4-probed: https://kernelci.org/test/case/id=
/645dc5df4e2bbf2dcc2e866e
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:42.770678  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:42.777110  <8>[   17.747891] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb4-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb1-probed: https://kernelci.org/test/case/id=
/645dc5df4e2bbf2dcc2e866f
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:41.169852  <6>[   16.142616] platform 14002000.smi: de=
ferred probe pending

    2023-05-12T04:50:41.176258  <6>[   16.148287] platform 14003000.larb: d=
eferred probe pending

    2023-05-12T04:50:41.183233  <4>[   16.148296] rt5682 1-001a: Using defa=
ult DAI clk names: rt5682-dai-wclk, rt5682-dai-bclk

    2023-05-12T04:50:41.189604  <6>[   16.154040] platform 14004000.larb: d=
eferred probe pending

    2023-05-12T04:50:41.196670  <6>[   16.168167] platform 1502e000.larb: d=
eferred probe pending

    2023-05-12T04:50:41.203219  <6>[   16.173913] platform 1582e000.larb: d=
eferred probe pending

    2023-05-12T04:50:41.206143  <6>[   16.179656] platform 1600d000.larb: d=
eferred probe pending

    2023-05-12T04:50:41.213262  <6>[   16.185401] platform 1602e000.larb: d=
eferred probe pending

    2023-05-12T04:50:41.219563  <6>[   16.191144] platform 17010000.larb: d=
eferred probe pending

    2023-05-12T04:50:41.226084  <6>[   16.196888] platform 1a001000.larb: d=
eferred probe pending
 =

    ... (32 line(s) more)  =


  * baseline.bootrr.mtk-smi-larb20-probed: https://kernelci.org/test/case/i=
d/645dc5df4e2bbf2dcc2e8670
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:40.723952  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:40.730166  <8>[   15.700981] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb20-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb14-probed: https://kernelci.org/test/case/i=
d/645dc5df4e2bbf2dcc2e8671
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:39.699615  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:39.706189  <8>[   14.677678] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb14-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb5-probed: https://kernelci.org/test/case/id=
/645dc5df4e2bbf2dcc2e8672
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:38.676118  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:38.682532  <8>[   13.652911] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb5-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb0-probed: https://kernelci.org/test/case/id=
/645dc5df4e2bbf2dcc2e8673
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:37.653180  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:37.659672  <8>[   12.630561] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-common-probed: https://kernelci.org/test/case/i=
d/645dc5df4e2bbf2dcc2e8675
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:36.612458  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:36.619332  <8>[   11.589597] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-common-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-power-controller-probed: https://kernelci.org/test/=
case/id/645dc5df4e2bbf2dcc2e868a
        failing since 6 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-12T04:50:33.187457  /lava-10291341/1/../bin/lava-test-case

    2023-05-12T04:50:33.193803  <8>[    8.163447] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-power-controller-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc43a44d4aff0342e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc43a44d4aff0342e8=
628
        new failure (last pass: next-20230511) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc733208d090cd62e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc733208d090cd62e8=
5eb
        failing since 23 days (last pass: next-20230404, first fail: next-2=
0230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc81079555e3f242e862b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc81079555e3f242e8=
62c
        failing since 92 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645dd988eb9816373b2e8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dd988eb9816373b2e8=
637
        failing since 92 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645deb33151db70b062e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645deb33151db70b062e8=
5f0
        failing since 93 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcbe4967d88edf22e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcbe4967d88edf22e8=
5e8
        failing since 240 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcc94a74f9650382e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcc94a74f9650382e8=
60e
        failing since 240 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcb43615a0eba2f2e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcb43615a0eba2f2e8=
60a
        failing since 240 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcbe12a3c51236d2e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcbe12a3c51236d2e8=
600
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcc7e561e2193b12e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcc7e561e2193b12e8=
5f2
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcb27e6a4df8e7f2e8612

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcb27e6a4df8e7f2e8=
613
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcbe3346bc68a412e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcbe3346bc68a412e8=
5e7
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcc92a74f9650382e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcc92a74f9650382e8=
60b
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcb3d615a0eba2f2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcb3d615a0eba2f2e8=
5e8
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcbe22a3c51236d2e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcbe22a3c51236d2e8=
609
        failing since 240 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcc80296e20f4182e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcc80296e20f4182e8=
611
        failing since 240 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcb3c6ee607d7ef2e861d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcb3c6ee607d7ef2e8=
61e
        failing since 240 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcb10973ece28332e86b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcb10973ece28332e8=
6b8
        new failure (last pass: next-20230510) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcaaf68d74f41ad2e8684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcaaf68d74f41ad2e8=
685
        new failure (last pass: next-20230510) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcb0e973ece28332e86b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcb0e973ece28332e8=
6b5
        new failure (last pass: next-20230510) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645dca9b68d74f41ad2e861a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dca9b68d74f41ad2e8=
61b
        new failure (last pass: next-20230510) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc296ee7cf67d412e862e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645dc296ee7cf67=
d412e8635
        new failure (last pass: next-20230511)
        4 lines

    2023-05-12T04:37:23.054921  kern  :emerg : watchdog: BUG: soft lockup -=
 CPU#0 stuck for 26s! [kworker/u2:0:10]
    2023-05-12T04:37:23.055075  =


    2023-05-12T04:37:23.055474  kern  :emerg : watchdog: BUG: soft lockup -=
 CPU#0 stuck for 22s! [kworker/u2:1:14]
    2023-05-12T04:37:23.055593  =


    2023-05-12T04:37:23.056004  kern  :emerg : watchdog: BUG: soft lockup -=
 CPU#0 stuck for 48s! [kworker/u2:1:14]
    2023-05-12T04:37:23.056073  =


    2023-05-12T04:37:23.056481  kern  :emerg : watchdog: BUG: soft lockup -=
 CPU#0 stuck for 75s! [kworker/u2:1:14]
    2023-05-12T04:37:23.056546  =


    2023-05-12T04:37:23.062257  <8>[  454.616202][  T160] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D4>
    2023-05-12T04:37:23.062341  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc4062d19bcde952e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc4062d19bcde952e8=
5f9
        failing since 3 days (last pass: next-20230505, first fail: next-20=
230508) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc4a54d136ed5972e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc4a54d136ed5972e8=
5e9
        failing since 30 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc6e8ee879e66ba2e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc6e8ee879e66ba2e8=
5f3
        failing since 30 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645dca30568a5cc6362e8682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dca30568a5cc6362e8=
683
        failing since 170 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc83c2397de791b2e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc83c2397de791b2e8=
603
        failing since 170 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc3219afab520b92e8611

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc3219afab520b92e8=
612
        failing since 30 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/645dc659a18b8d07f62e85f3

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645dc659a18b8d0=
7f62e864a
        failing since 23 days (last pass: next-20230404, first fail: next-2=
0230417)
        2 lines

    2023-05-12T04:53:12.744313  fo:

    2023-05-12T04:53:12.748596  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-12T04:53:12.754581  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-12T04:53:12.757861  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-12T04:53:12.761086  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-12T04:53:12.766456  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-12T04:53:12.771431  kern  :alert : Data abort info:

    2023-05-12T04:53:12.774678  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-12T04:53:12.777874  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-12T04:53:12.790490  kern  :alert : user pgtable: 4k pages<8>[  =
 19.393534] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645dc659a18b8d0=
7f62e864b
        failing since 23 days (last pass: next-20230404, first fail: next-2=
0230417)
        12 lines

    2023-05-12T04:53:12.731571  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-12T04:53:12.743657  kern  :alert : Mem abort in<8>[   19.345823=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc7d6c828c24d672e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc7d6c828c24d672e8=
5e8
        failing since 92 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/645dc4ab4d136ed5972e85ff

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645dc4ab4d136ed=
5972e8606
        failing since 30 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-12T04:46:27.595190  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-12T04:46:27.596581  kern  :emerg : Code: 97fde510 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-12T04:46:27.605501  <8>[   21.451878] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-12T04:46:27.605853  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645dc4ab4d136ed=
5972e8607
        failing since 30 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-12T04:46:27.565752  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-12T04:46:27.566444  kern  :alert : Mem abort info:
    2023-05-12T04:46:27.566776  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-12T04:46:27.567386  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-12T04:46:27.568045  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-12T04:46:27.568356  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-12T04:46:27.568764  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-12T04:46:27.569309  kern  :alert : Data abort info:
    2023-05-12T04:46:27.569652  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-12T04:46:27.570287  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/645dc72bd3787885612e86b2

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645dc72bd3787885612e86b7
        failing since 3 days (last pass: next-20230505, first fail: next-20=
230508)

    2023-05-12T04:56:59.848258  <8>[   21.567776] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 429962_1.5.2.4.1>
    2023-05-12T04:56:59.954810  / # #
    2023-05-12T04:57:00.056988  export SHELL=3D/bin/sh
    2023-05-12T04:57:00.057516  #
    2023-05-12T04:57:00.159164  / # export SHELL=3D/bin/sh. /lava-429962/en=
vironment
    2023-05-12T04:57:00.160166  =

    2023-05-12T04:57:00.261558  / # . /lava-429962/environment/lava-429962/=
bin/lava-test-runner /lava-429962/1
    2023-05-12T04:57:00.262548  =

    2023-05-12T04:57:00.268036  / # /lava-429962/bin/lava-test-runner /lava=
-429962/1
    2023-05-12T04:57:00.315641  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645dc72bd378788=
5612e86b9
        failing since 30 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-12T04:56:59.835979  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP
    2023-05-12T04:56:59.837292  kern  :emerg : Code: 97fb70be f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-12T04:56:59.846190  <8>[   21.565741] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-12T04:56:59.846571  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645dc72bd378788=
5612e86ba
        failing since 30 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-12T04:56:59.819085  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-12T04:56:59.821168  kern  :alert : Mem abort info:
    2023-05-12T04:56:59.821542  kern  :alert :   ESR =3D 0x0000000096000007
    2023-05-12T04:56:59.823221  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-12T04:56:59.825269  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-12T04:56:59.825642  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-12T04:56:59.827242  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-05-12T04:56:59.828350  kern  :alert : Data abort info:
    2023-05-12T04:56:59.828748  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-05-12T04:56:59.829319  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc983587005efe92e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc983587005efe92e8=
5fa
        failing since 30 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/645dc9e703c8f158162e85f9

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645dc9e703c8f15=
8162e8600
        failing since 30 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-12T05:08:39.048292  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-12T05:08:39.049619  kern  :emerg : Code: 97fd0510 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-12T05:08:39.061804  <8>[   21.454638] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-12T05:08:39.062164  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645dc9e703c8f15=
8162e8601
        failing since 30 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-12T05:08:39.020069  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-12T05:08:39.021194  kern  :alert : Mem abort info:
    2023-05-12T05:08:39.021509  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-12T05:08:39.022299  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-12T05:08:39.023421  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-12T05:08:39.023734  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-12T05:08:39.024498  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-12T05:08:39.025654  kern  :alert : Data abort info:
    2023-05-12T05:08:39.025953  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-12T05:08:39.026745  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcd0873c92fa82c2e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcd0873c92fa82c2e8=
5f4
        failing since 93 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/645dc7603117754ef82e8630

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645dc7603117754=
ef82e8637
        failing since 30 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-12T04:57:53.652756  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP

    2023-05-12T04:57:53.653279  kern  :emerg : Code: 97ee70be f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-12T04:57:53.653659  <8>[   21.681447] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-12T04:57:53.653981  + set +x

    2023-05-12T04:57:53.654290  <8>[   21.683247] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10291892_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645dc7603117754=
ef82e8638
        failing since 30 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-12T04:57:53.627543  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-05-12T04:57:53.628059  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-12T04:57:53.628397  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D0000000012281200

    2023-05-12T04:57:53.628717  kern  :alert : [0000000000000008] pgd=3D080=
00000160c0003, p4d=3D08000000160c0003, pud=3D08000000160c0003, pmd=3D080000=
0015bf0003, pte=3D0000000000000000

    2023-05-12T04:57:53.629023  <8>[   21.658121] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/645dc9af5de42bb3582e8614

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645dc9af5de42bb=
3582e861b
        failing since 30 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-12T05:07:46.116247  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-12T05:07:46.116349  kern  :emerg : Code: 97fc7510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-12T05:07:46.116449  <8>[   23.979768] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-12T05:07:46.116544  + set +x

    2023-05-12T05:07:46.116638  <8>[   23.981744] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10291979_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645dc9af5de42bb=
3582e861c
        failing since 30 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-12T05:07:46.067264  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-12T05:07:46.067367  kern  :alert : Mem abort info:

    2023-05-12T05:07:46.067466  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-12T05:07:46.067560  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-12T05:07:46.067637  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-12T05:07:46.067727  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-12T05:07:46.067803  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-12T05:07:46.067892  kern  :alert : Data abort info:

    2023-05-12T05:07:46.067951  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-12T05:07:46.068010  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645dcce47661107c142e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dcce47661107c142e8=
5e7
        failing since 93 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc7591d14be299e2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc7591d14be299e2e8=
5e7
        failing since 92 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc82c41330db4562e862a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc82c41330db4562e8=
62b
        new failure (last pass: next-20230511) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc9b35de42bb3582e8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc9b35de42bb3582e8=
635
        failing since 7 days (last pass: next-20230222, first fail: next-20=
230504) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645dca6c8065d726542e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dca6c8065d726542e8=
604
        failing since 204 days (last pass: next-20221011, first fail: next-=
20221019) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc5af2b0d066e162e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc5af2b0d066e162e8=
611
        new failure (last pass: next-20230511) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc86c9bef1bd1e92e8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc86c9bef1bd1e92e8=
638
        new failure (last pass: next-20230510) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645dc46fa15374c77a2e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230512/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230512/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645dc46fa15374c77a2e8=
603
        failing since 1 day (last pass: next-20230510, first fail: next-202=
30511) =

 =20
