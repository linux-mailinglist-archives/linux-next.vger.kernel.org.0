Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C990F6E2C63
	for <lists+linux-next@lfdr.de>; Sat, 15 Apr 2023 00:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjDNWNw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Apr 2023 18:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjDNWNw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Apr 2023 18:13:52 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5DFE42
        for <linux-next@vger.kernel.org>; Fri, 14 Apr 2023 15:13:47 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d15so2589951pll.12
        for <linux-next@vger.kernel.org>; Fri, 14 Apr 2023 15:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681510426; x=1684102426;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKTTIvJY/VVcWhXvTw3ylG9g4gSa1bOlGJDTwgkl43g=;
        b=3BvarxTFTFWSuj0ZDa/VV3NUv/4ogqIrjsAn9o76SOki4GkLGp1oXuzulbbWbqXflQ
         eDG0CzgGRdwcG8CvPsfQONuJPxvdp+DeG62ypavtP3dOA23htU6597FrRU/dx5cVCC2K
         2jeUIuf5yKx4qosnFIsOZO/oZQwz2A21pMYAuM5Hx0iD03n5xvGCiRAN5hGc4YRznBhh
         2y96lQntQmScJbNcxCBEF1EgtBvqg4xfC4LA9vRl+8RwonAn7p5nbqdE706uRyPHEEyK
         HmT3KhLaF+lXbwusxbmFx4605XXAehSUZWMl6rNrZYUcm4XP/N2SXjEo4Hggv/GpswvR
         nTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681510426; x=1684102426;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKTTIvJY/VVcWhXvTw3ylG9g4gSa1bOlGJDTwgkl43g=;
        b=PXe6YZEEUhHzitWsBiuDo3XbBV3+7Na8SP5fh9fM/yn6+I33cMVdG1+uGGx+bg2i/T
         sufYcI2JBLaDnpsipShF4+AxYTFM32nvLy/qCtmJGD37iJLB6deEX9yfitsfiDORC/KS
         f2xMk7UVAhYt7QAuP/3nfjE+0jgP8ag7wY05XuOUqf3qUPGcBFuAHR1+l46W3VnpZtSa
         Y9+f2exMOYGu6sQhuiO73m4YVnnenMYz+Kgl00ptEhloc/pKbcxMcLzt0x8DqnZn7iWl
         /3TW58YT0nDYj65IK4LaZX2KB6hDtn/pSG2iPPvgC6rbe9SgPAA4aX5L2Z/omrW8wAa0
         yeuw==
X-Gm-Message-State: AAQBX9feOncR3SiMqu+r1fTqZtC5FbSROHnw63eA4D0bD1lpeKzacx0Z
        /lujI1L6oHcXq71pPJ+UnAeTBT/hotSgLUylaVj/XFek
X-Google-Smtp-Source: AKy350bR5MaNO3tfpq9nHn8GlU2tCQkJ+WYB5RDOui+wAFMqGrl1qAyIHpLPheQJFMK1KlerZxcJ5A==
X-Received: by 2002:a17:902:dac2:b0:1a6:67e1:4d2c with SMTP id q2-20020a170902dac200b001a667e14d2cmr5661972plx.6.1681510424626;
        Fri, 14 Apr 2023 15:13:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902c20200b001a6a6169d45sm1002404pll.168.2023.04.14.15.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 15:13:44 -0700 (PDT)
Message-ID: <6439d018.170a0220.32c9c.34b1@mx.google.com>
Date:   Fri, 14 Apr 2023 15:13:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-rc6-12018-gd3f2cd248191
X-Kernelci-Report-Type: test
Subject: next/master baseline: 934 runs,
 99 regressions (v6.3-rc6-12018-gd3f2cd248191)
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

next/master baseline: 934 runs, 99 regressions (v6.3-rc6-12018-gd3f2cd24819=
1)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig           | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | omap2p=
lus_defconfig          | 1          =

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

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

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
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig                    | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/v6.3-rc=
6-12018-gd3f2cd248191/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: v6.3-rc6-12018-gd3f2cd248191
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d3f2cd24819158bb70701c3549e586f9df9cee67 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6439aaf0bba0b46d312e86ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6439aaf0bba0b46d312e8=
6eb
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6439ab548276ef52da2e8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/bas=
eline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/bas=
eline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6439ab548276ef52da2e8=
637
        failing since 209 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6439ac0804b48007882e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linar=
o-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linar=
o-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6439ac0804b48007882e8=
60e
        failing since 3 days (last pass: next-20230330, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6439aac8105da2d0772e8626

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-b=
eagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-b=
eagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6439aac8105da2d0772e8=
627
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6439980016055f80e52e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6439980016055f80e52e85eb
        failing since 17 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-14T18:14:09.254657  + set +x

    2023-04-14T18:14:09.261256  <8>[   10.140864] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9983002_1.4.2.3.1>

    2023-04-14T18:14:09.369280  / # #

    2023-04-14T18:14:09.471989  export SHELL=3D/bin/sh

    2023-04-14T18:14:09.472719  #

    2023-04-14T18:14:09.574756  / # export SHELL=3D/bin/sh. /lava-9983002/e=
nvironment

    2023-04-14T18:14:09.575522  =


    2023-04-14T18:14:09.677566  / # . /lava-9983002/environment/lava-998300=
2/bin/lava-test-runner /lava-9983002/1

    2023-04-14T18:14:09.678801  =


    2023-04-14T18:14:09.685053  / # /lava-9983002/bin/lava-test-runner /lav=
a-9983002/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64399aa989fc9bfba42e85ed

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399aa989fc9bfba42e85f2
        failing since 17 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-14T18:25:24.068069  <8>[   10.481478] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9983313_1.4.2.3.1>

    2023-04-14T18:25:24.071497  + set +x

    2023-04-14T18:25:24.175968  / # #

    2023-04-14T18:25:24.276935  export SHELL=3D/bin/sh

    2023-04-14T18:25:24.277128  #

    2023-04-14T18:25:24.378012  / # export SHELL=3D/bin/sh. /lava-9983313/e=
nvironment

    2023-04-14T18:25:24.378201  =


    2023-04-14T18:25:24.479118  / # . /lava-9983313/environment/lava-998331=
3/bin/lava-test-runner /lava-9983313/1

    2023-04-14T18:25:24.479388  =


    2023-04-14T18:25:24.485884  / # /lava-9983313/bin/lava-test-runner /lav=
a-9983313/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/643995bb91b3a53e7a2e8605

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643995bb91b3a53e7a2e860a
        failing since 14 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-14T18:04:35.756115  + <8>[   15.592080] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9982788_1.4.2.3.1>

    2023-04-14T18:04:35.756232  set +x

    2023-04-14T18:04:35.861566  / # #

    2023-04-14T18:04:35.962797  export SHELL=3D/bin/sh

    2023-04-14T18:04:35.963012  #

    2023-04-14T18:04:36.063934  / # export SHELL=3D/bin/sh. /lava-9982788/e=
nvironment

    2023-04-14T18:04:36.064145  =


    2023-04-14T18:04:36.165153  / # . /lava-9982788/environment/lava-998278=
8/bin/lava-test-runner /lava-9982788/1

    2023-04-14T18:04:36.165456  =


    2023-04-14T18:04:36.170755  / # /lava-9982788/bin/lava-test-runner /lav=
a-9982788/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643995bc91b3a53=
e7a2e860c
        failing since 21 days (last pass: next-20230323, first fail: next-2=
0230324)
        3 lines

    2023-04-14T18:04:35.728643  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-04-14T18:04:35.735653  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-04-14T18:04:35.742046  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-14T18:04:35.748686  <8>[   15.575732] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6439980018b0fed3d52e85fd

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6439980018b0fed3d52e8602
        failing since 17 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-14T18:14:12.901952  + set<8>[   11.684689] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9983024_1.4.2.3.1>

    2023-04-14T18:14:12.902385   +x

    2023-04-14T18:14:13.010711  / # #

    2023-04-14T18:14:13.113148  export SHELL=3D/bin/sh

    2023-04-14T18:14:13.113855  #

    2023-04-14T18:14:13.215541  / # export SHELL=3D/bin/sh. /lava-9983024/e=
nvironment

    2023-04-14T18:14:13.216182  =


    2023-04-14T18:14:13.318015  / # . /lava-9983024/environment/lava-998302=
4/bin/lava-test-runner /lava-9983024/1

    2023-04-14T18:14:13.319130  =


    2023-04-14T18:14:13.324137  / # /lava-9983024/bin/lava-test-runner /lav=
a-9983024/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64399aa7523c259f8d2e863a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399aa7523c259f8d2e863f
        failing since 17 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-14T18:25:28.372252  + set<8>[   11.576131] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9983321_1.4.2.3.1>

    2023-04-14T18:25:28.372344   +x

    2023-04-14T18:25:28.476790  / # #

    2023-04-14T18:25:28.577874  export SHELL=3D/bin/sh

    2023-04-14T18:25:28.578100  #

    2023-04-14T18:25:28.679088  / # export SHELL=3D/bin/sh. /lava-9983321/e=
nvironment

    2023-04-14T18:25:28.679322  =


    2023-04-14T18:25:28.780301  / # . /lava-9983321/environment/lava-998332=
1/bin/lava-test-runner /lava-9983321/1

    2023-04-14T18:25:28.780680  =


    2023-04-14T18:25:28.785930  / # /lava-9983321/bin/lava-test-runner /lav=
a-9983321/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643995a85644ddb8f52e8600

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643995a85644ddb8f52e8605
        failing since 14 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-14T18:04:02.053558  + set +x

    2023-04-14T18:04:02.060138  <8>[   11.933137] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9982759_1.4.2.3.1>

    2023-04-14T18:04:02.168047  / # #

    2023-04-14T18:04:02.270817  export SHELL=3D/bin/sh

    2023-04-14T18:04:02.271582  #

    2023-04-14T18:04:02.373398  / # export SHELL=3D/bin/sh. /lava-9982759/e=
nvironment

    2023-04-14T18:04:02.374288  =


    2023-04-14T18:04:02.476107  / # . /lava-9982759/environment/lava-998275=
9/bin/lava-test-runner /lava-9982759/1

    2023-04-14T18:04:02.477243  =


    2023-04-14T18:04:02.481983  / # /lava-9982759/bin/lava-test-runner /lav=
a-9982759/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64399802efb6d2179a2e85f5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399802efb6d2179a2e85fa
        failing since 17 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-14T18:14:16.592496  <8>[    9.885503] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9982975_1.4.2.3.1>

    2023-04-14T18:14:16.596211  + set +x

    2023-04-14T18:14:16.702601  #

    2023-04-14T18:14:16.704050  =


    2023-04-14T18:14:16.806507  / # #export SHELL=3D/bin/sh

    2023-04-14T18:14:16.807478  =


    2023-04-14T18:14:16.909553  / # export SHELL=3D/bin/sh. /lava-9982975/e=
nvironment

    2023-04-14T18:14:16.910398  =


    2023-04-14T18:14:17.012358  / # . /lava-9982975/environment/lava-998297=
5/bin/lava-test-runner /lava-9982975/1

    2023-04-14T18:14:17.013600  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64399aabba3ca082ad2e8606

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399aabba3ca082ad2e860b
        failing since 17 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-14T18:25:24.474330  <8>[   11.253596] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9983324_1.4.2.3.1>

    2023-04-14T18:25:24.477987  + set +x

    2023-04-14T18:25:24.584011  #

    2023-04-14T18:25:24.585239  =


    2023-04-14T18:25:24.687469  / # #export SHELL=3D/bin/sh

    2023-04-14T18:25:24.688272  =


    2023-04-14T18:25:24.790416  / # export SHELL=3D/bin/sh. /lava-9983324/e=
nvironment

    2023-04-14T18:25:24.791220  =


    2023-04-14T18:25:24.893392  / # . /lava-9983324/environment/lava-998332=
4/bin/lava-test-runner /lava-9983324/1

    2023-04-14T18:25:24.894643  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64399726684ef2f0e32e85e6

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-=
rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-=
rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399726684ef2f0e32e8617
        new failure (last pass: next-20230411)

    2023-04-14T18:10:26.856890  + set +x
    2023-04-14T18:10:26.860714  <8>[   18.305447] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 330424_1.5.2.4.1>
    2023-04-14T18:10:26.992451  / # #
    2023-04-14T18:10:27.094208  export SHELL=3D/bin/sh
    2023-04-14T18:10:27.094682  #
    2023-04-14T18:10:27.195992  / # export SHELL=3D/bin/sh. /lava-330424/en=
vironment
    2023-04-14T18:10:27.196528  =

    2023-04-14T18:10:27.297816  / # . /lava-330424/environment/lava-330424/=
bin/lava-test-runner /lava-330424/1
    2023-04-14T18:10:27.298633  =

    2023-04-14T18:10:27.304695  / # /lava-330424/bin/lava-test-runner /lava=
-330424/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64399c0fe9d7dfcf902e8662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-colla=
bora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-colla=
bora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399c0fe9d7dfcf902e8=
663
        failing since 17 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64399efc4f8388a4db2e863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bayli=
bre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bayli=
bre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399efc4f8388a4db2e8=
640
        failing since 14 days (last pass: next-20230330, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643997c57032675cd82e8625

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643997c57032675cd82e8=
626
        failing since 15 days (last pass: next-20230327, first fail: next-2=
0230330) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64399c2750a16052f32e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baselin=
e-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baselin=
e-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399c2750a16052f32e8=
5f4
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64399c5b0323bdab762e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broon=
ie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broon=
ie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399c5b0323bdab762e8=
5f3
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64399c8b0c314bd7d72e8690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399c8b0c314bd7d72e8=
691
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6439a0b6512ffef1c62e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6439a0b6512ffef1c62e8=
5e7
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6439a8644dd3bb3fdc2e864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-be=
aglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-be=
aglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6439a8644dd3bb3fdc2e8=
64e
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6439ab56a894c3a88d2e8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/b=
aseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/b=
aseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6439ab56a894c3a88d2e8=
664
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643997d67032675cd82e863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-b=
lack.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-b=
lack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643997d67032675cd82e8=
63e
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64399a9e523c259f8d2e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black=
.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399a9e523c259f8d2e8=
60b
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64399d8cb277cf26842e85ec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bayli=
bre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bayli=
bre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399d8cb277cf26842e85f1
        failing since 86 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-04-14T18:37:32.093833  <8>[   14.496434] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3496876_1.5.2.4.1>
    2023-04-14T18:37:32.205224  / # #
    2023-04-14T18:37:32.308111  export SHELL=3D/bin/sh
    2023-04-14T18:37:32.308985  #
    2023-04-14T18:37:32.410868  / # export SHELL=3D/bin/sh. /lava-3496876/e=
nvironment
    2023-04-14T18:37:32.411963  =

    2023-04-14T18:37:32.516332  / # . /lava-3496876/environment/lava-349687=
6/bin/lava-test-runner /lava-3496876/1
    2023-04-14T18:37:32.518147  =

    2023-04-14T18:37:32.523012  / # /lava-3496876/bin/lava-test-runner /lav=
a-3496876/1
    2023-04-14T18:37:32.605915  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/643998d19737326daf2e85ea

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcd=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcd=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643998d19737326=
daf2e85f1
        failing since 60 days (last pass: next-20230208, first fail: next-2=
0230213)
        29 lines

    2023-04-14T18:17:35.026901  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4e65200 pointer offset 4 size 512
    2023-04-14T18:17:35.060989  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-14T18:17:35.061911  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-14T18:17:35.062952  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2b0000 allocated at load_module+0x690/0=
x1a80
    2023-04-14T18:17:35.064726  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-14T18:17:35.168462  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-14T18:17:35.169099  kern  :emerg : Process udevd (pid: 65, stac=
k limit =3D 0x7538e03e)
    2023-04-14T18:17:35.169610  kern  :emerg : Stack: (0xc8901d08 to 0xc890=
2000)
    2023-04-14T18:17:35.170077  kern  :emerg : 1d00:                   c4e6=
5200 c0773860 00000000 c03afa40 00000000 d5f7ec4b
    2023-04-14T18:17:35.170568  kern  :emerg : 1d20: 0000005d d5f7ec4b c077=
3860 bf2b0220 00000000 00000000 00000000 00000001 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64399b82b6015608572e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399b82b6015608572e8=
5e7
        failing since 81 days (last pass: next-20230120, first fail: next-2=
0230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643997ed6a5da52bd72e8615

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
43997ed6a5da52bd72e8624
        new failure (last pass: next-20230411)

    2023-04-14T18:13:47.253883  /usr/bin/tpm2_getcap

    2023-04-14T18:13:57.471075  /lava-9982994/1/../bin/lava-test-case

    2023-04-14T18:13:57.477387  <8>[   18.493540] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643995e246f9d6a4102e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643995e246f9d6a4102e85f9
        failing since 14 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-14T18:05:01.329493  + set +x<8>[   16.240024] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9982773_1.4.2.3.1>

    2023-04-14T18:05:01.329619  =


    2023-04-14T18:05:01.436564  / # #

    2023-04-14T18:05:01.537713  export SHELL=3D/bin/sh

    2023-04-14T18:05:01.537949  #

    2023-04-14T18:05:01.638925  / # export SHELL=3D/bin/sh. /lava-9982773/e=
nvironment

    2023-04-14T18:05:01.639260  =


    2023-04-14T18:05:01.740334  / # . /lava-9982773/environment/lava-998277=
3/bin/lava-test-runner /lava-9982773/1

    2023-04-14T18:05:01.740678  =


    2023-04-14T18:05:01.745741  / # /lava-9982773/bin/lava-test-runner /lav=
a-9982773/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643998da0f7fa4f5162e8606

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643998da0f7fa4f5162e860b
        failing since 17 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-14T18:17:48.639770  + set +x

    2023-04-14T18:17:48.646287  <8>[   10.079335] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9982983_1.4.2.3.1>

    2023-04-14T18:17:48.751042  / # #

    2023-04-14T18:17:48.852017  export SHELL=3D/bin/sh

    2023-04-14T18:17:48.852199  #

    2023-04-14T18:17:48.953134  / # export SHELL=3D/bin/sh. /lava-9982983/e=
nvironment

    2023-04-14T18:17:48.953307  =


    2023-04-14T18:17:49.054232  / # . /lava-9982983/environment/lava-998298=
3/bin/lava-test-runner /lava-9982983/1

    2023-04-14T18:17:49.054494  =


    2023-04-14T18:17:49.059352  / # /lava-9982983/bin/lava-test-runner /lav=
a-9982983/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64399a93b3b9661f252e85ec

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399a93b3b9661f252e85f1
        failing since 17 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-14T18:25:08.490798  + <8>[   10.109864] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9983327_1.4.2.3.1>

    2023-04-14T18:25:08.494265  set +x

    2023-04-14T18:25:08.595659  /#

    2023-04-14T18:25:08.696929   # #export SHELL=3D/bin/sh

    2023-04-14T18:25:08.697136  =


    2023-04-14T18:25:08.798057  / # export SHELL=3D/bin/sh. /lava-9983327/e=
nvironment

    2023-04-14T18:25:08.798270  =


    2023-04-14T18:25:08.899218  / # . /lava-9983327/environment/lava-998332=
7/bin/lava-test-runner /lava-9983327/1

    2023-04-14T18:25:08.899627  =


    2023-04-14T18:25:08.904207  / # /lava-9983327/bin/lava-test-runner /lav=
a-9983327/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643995a7438bbb8e5c2e85f2

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643995a7438bbb8e5c2e85f7
        failing since 14 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-14T18:04:07.463767  + set +x

    2023-04-14T18:04:07.470722  <8>[   14.100796] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9982765_1.4.2.3.1>

    2023-04-14T18:04:07.575673  / # #

    2023-04-14T18:04:07.676759  export SHELL=3D/bin/sh

    2023-04-14T18:04:07.676996  #

    2023-04-14T18:04:07.777954  / # export SHELL=3D/bin/sh. /lava-9982765/e=
nvironment

    2023-04-14T18:04:07.778179  =


    2023-04-14T18:04:07.879155  / # . /lava-9982765/environment/lava-998276=
5/bin/lava-test-runner /lava-9982765/1

    2023-04-14T18:04:07.879523  =


    2023-04-14T18:04:07.884612  / # /lava-9982765/bin/lava-test-runner /lav=
a-9982765/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643997ee8afc137d962e860f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643997ee8afc137d962e8614
        failing since 17 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-14T18:13:51.942678  <8>[   10.214176] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9982997_1.4.2.3.1>

    2023-04-14T18:13:51.945968  + set +x

    2023-04-14T18:13:52.047566  =


    2023-04-14T18:13:52.148560  / # #export SHELL=3D/bin/sh

    2023-04-14T18:13:52.148715  =


    2023-04-14T18:13:52.249491  / # export SHELL=3D/bin/sh. /lava-9982997/e=
nvironment

    2023-04-14T18:13:52.249637  =


    2023-04-14T18:13:52.350609  / # . /lava-9982997/environment/lava-998299=
7/bin/lava-test-runner /lava-9982997/1

    2023-04-14T18:13:52.350856  =


    2023-04-14T18:13:52.355831  / # /lava-9982997/bin/lava-test-runner /lav=
a-9982997/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64399a8046caff53c12e8632

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399a8046caff53c12e8637
        failing since 17 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-14T18:24:49.829902  + set +x<8>[    9.858827] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9983288_1.4.2.3.1>

    2023-04-14T18:24:49.829988  =


    2023-04-14T18:24:49.931871  #

    2023-04-14T18:24:50.032982  / # #export SHELL=3D/bin/sh

    2023-04-14T18:24:50.033196  =


    2023-04-14T18:24:50.134151  / # export SHELL=3D/bin/sh. /lava-9983288/e=
nvironment

    2023-04-14T18:24:50.134337  =


    2023-04-14T18:24:50.235242  / # . /lava-9983288/environment/lava-998328=
8/bin/lava-test-runner /lava-9983288/1

    2023-04-14T18:24:50.235527  =


    2023-04-14T18:24:50.240988  / # /lava-9983288/bin/lava-test-runner /lav=
a-9983288/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643995d04926a988082e8663

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643995d04926a988082e8668
        failing since 14 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-14T18:04:43.344519  + set +x

    2023-04-14T18:04:43.348383  <8>[   12.183304] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9982778_1.4.2.3.1>

    2023-04-14T18:04:43.457556  / # #

    2023-04-14T18:04:43.560428  export SHELL=3D/bin/sh

    2023-04-14T18:04:43.561252  #

    2023-04-14T18:04:43.663283  / # export SHELL=3D/bin/sh. /lava-9982778/e=
nvironment

    2023-04-14T18:04:43.664102  =


    2023-04-14T18:04:43.765803  / # . /lava-9982778/environment/lava-998277=
8/bin/lava-test-runner /lava-9982778/1

    2023-04-14T18:04:43.767007  =


    2023-04-14T18:04:43.772002  / # /lava-9982778/bin/lava-test-runner /lav=
a-9982778/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643997fb18b0fed3d52e85ed

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643997fb18b0fed3d52e85f2
        failing since 17 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-14T18:13:54.499373  + set<8>[   10.560367] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9983042_1.4.2.3.1>

    2023-04-14T18:13:54.499459   +x

    2023-04-14T18:13:54.604309  / # #

    2023-04-14T18:13:54.705326  export SHELL=3D/bin/sh

    2023-04-14T18:13:54.705511  #

    2023-04-14T18:13:54.806443  / # export SHELL=3D/bin/sh. /lava-9983042/e=
nvironment

    2023-04-14T18:13:54.806631  =


    2023-04-14T18:13:54.907538  / # . /lava-9983042/environment/lava-998304=
2/bin/lava-test-runner /lava-9983042/1

    2023-04-14T18:13:54.907797  =


    2023-04-14T18:13:54.912500  / # /lava-9983042/bin/lava-test-runner /lav=
a-9983042/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64399a960a3185d7e22e8686

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399a960a3185d7e22e868b
        failing since 17 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-14T18:25:18.829691  + <8>[    8.815737] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9983312_1.4.2.3.1>

    2023-04-14T18:25:18.829842  set +x

    2023-04-14T18:25:18.934743  / # #

    2023-04-14T18:25:19.035796  export SHELL=3D/bin/sh

    2023-04-14T18:25:19.036031  #

    2023-04-14T18:25:19.136982  / # export SHELL=3D/bin/sh. /lava-9983312/e=
nvironment

    2023-04-14T18:25:19.137186  =


    2023-04-14T18:25:19.238154  / # . /lava-9983312/environment/lava-998331=
2/bin/lava-test-runner /lava-9983312/1

    2023-04-14T18:25:19.238476  =


    2023-04-14T18:25:19.243919  / # /lava-9983312/bin/lava-test-runner /lav=
a-9983312/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64399ac1f67bb145b92e8601

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399ac1f67bb145b92e8606
        failing since 74 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-04-14T18:25:45.783894  + set +x
    2023-04-14T18:25:45.784198  [   13.119318] <LAVA_SIGNAL_ENDRUN 0_dmesg =
926468_1.5.2.3.1>
    2023-04-14T18:25:45.892012  / # #
    2023-04-14T18:25:45.993658  export SHELL=3D/bin/sh
    2023-04-14T18:25:45.994117  #
    2023-04-14T18:25:46.095329  / # export SHELL=3D/bin/sh. /lava-926468/en=
vironment
    2023-04-14T18:25:46.095817  =

    2023-04-14T18:25:46.197096  / # . /lava-926468/environment/lava-926468/=
bin/lava-test-runner /lava-926468/1
    2023-04-14T18:25:46.197695  =

    2023-04-14T18:25:46.201082  / # /lava-926468/bin/lava-test-runner /lava=
-926468/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64399b10dd994fab2f2e8600

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/bas=
eline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399b10dd994fab2f2e8605
        failing since 74 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-04-14T18:27:04.210747  + set +x
    2023-04-14T18:27:04.210911  [   12.154600] <LAVA_SIGNAL_ENDRUN 0_dmesg =
926477_1.5.2.3.1>
    2023-04-14T18:27:04.317892  / # #
    2023-04-14T18:27:04.419630  export SHELL=3D/bin/sh
    2023-04-14T18:27:04.420182  #
    2023-04-14T18:27:04.521531  / # export SHELL=3D/bin/sh. /lava-926477/en=
vironment
    2023-04-14T18:27:04.522060  =

    2023-04-14T18:27:04.623192  / # . /lava-926477/environment/lava-926477/=
bin/lava-test-runner /lava-926477/1
    2023-04-14T18:27:04.623794  =

    2023-04-14T18:27:04.627126  / # /lava-926477/bin/lava-test-runner /lava=
-926477/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64399b613b0417369f2e8603

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengu=
tronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengu=
tronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399b613b0417369f2e8608
        failing since 74 days (last pass: next-20221205, first fail: next-2=
0230130)

    2023-04-14T18:28:24.638249  + set +x
    2023-04-14T18:28:24.638430  [   12.800849] <LAVA_SIGNAL_ENDRUN 0_dmesg =
926482_1.5.2.3.1>
    2023-04-14T18:28:24.746113  / # #
    2023-04-14T18:28:24.847703  export SHELL=3D/bin/sh
    2023-04-14T18:28:24.848187  #
    2023-04-14T18:28:24.949369  / # export SHELL=3D/bin/sh. /lava-926482/en=
vironment
    2023-04-14T18:28:24.949884  =

    2023-04-14T18:28:25.051148  / # . /lava-926482/environment/lava-926482/=
bin/lava-test-runner /lava-926482/1
    2023-04-14T18:28:25.051739  =

    2023-04-14T18:28:25.055177  / # /lava-926482/bin/lava-test-runner /lava=
-926482/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643995f346f9d6a4102e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10=
/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10=
/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643995f346f9d6a4102e8=
60e
        failing since 367 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6439981700efae9a9d2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m=
.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/clang-17/lab-kontron/baseline-kontron-pitx-imx8m=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6439981700efae9a9d2e8=
5f8
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643998679903f7cef92e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/=
baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/=
baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643998679903f7cef92e8=
5fd
        failing since 42 days (last pass: next-20230224, first fail: next-2=
0230303) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6439955bcd0505a9e42e8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/ba=
seline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/ba=
seline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6439955bcd0505a9e42e8=
653
        failing since 42 days (last pass: next-20230222, first fail: next-2=
0230303) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64399bc9f3042d82392e8638

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/bas=
eline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/bas=
eline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399bc9f3042d82392e863b
        new failure (last pass: next-20230412)

    2023-04-14T18:30:20.324786  / # #
    2023-04-14T18:30:20.427455  export SHELL=3D/bin/sh
    2023-04-14T18:30:20.428212  #
    2023-04-14T18:30:20.530153  / # export SHELL=3D/bin/sh. /lava-319132/en=
vironment
    2023-04-14T18:30:20.530912  =

    2023-04-14T18:30:20.632705  / # . /lava-319132/environment/lava-319132/=
bin/lava-test-runner /lava-319132/1
    2023-04-14T18:30:20.633359  =

    2023-04-14T18:30:20.649793  / # /lava-319132/bin/lava-test-runner /lava=
-319132/1
    2023-04-14T18:30:20.704553  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-14T18:30:20.704774  + cd /l<8>[   15.398013] <LAVA_SIGNAL_START=
RUN 1_bootrr 319132_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/643=
99bc9f3042d82392e864b
        new failure (last pass: next-20230412)

    2023-04-14T18:30:23.096840  /lava-319132/1/../bin/lava-test-case
    2023-04-14T18:30:23.097364  <8>[   17.885793] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643995a76f9cf967312e866a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643995a76f9cf967312e866f
        failing since 14 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-04-14T18:04:06.290846  + set +x

    2023-04-14T18:04:06.294193  <8>[   13.995578] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9982772_1.4.2.3.1>

    2023-04-14T18:04:06.400393  / # #

    2023-04-14T18:04:06.501442  export SHELL=3D/bin/sh

    2023-04-14T18:04:06.501677  #

    2023-04-14T18:04:06.602579  / # export SHELL=3D/bin/sh. /lava-9982772/e=
nvironment

    2023-04-14T18:04:06.602782  =


    2023-04-14T18:04:06.703671  / # . /lava-9982772/environment/lava-998277=
2/bin/lava-test-runner /lava-9982772/1

    2023-04-14T18:04:06.703996  =


    2023-04-14T18:04:06.708305  / # /lava-9982772/bin/lava-test-runner /lav=
a-9982772/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643997ea8afc137d962e85f5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/base=
line-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643997ea8afc137d962e85fa
        failing since 17 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-14T18:13:53.503213  + set<8>[   11.761591] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9983019_1.4.2.3.1>

    2023-04-14T18:13:53.503344   +x

    2023-04-14T18:13:53.608079  / # #

    2023-04-14T18:13:53.709089  export SHELL=3D/bin/sh

    2023-04-14T18:13:53.709290  #

    2023-04-14T18:13:53.810181  / # export SHELL=3D/bin/sh. /lava-9983019/e=
nvironment

    2023-04-14T18:13:53.810369  =


    2023-04-14T18:13:53.911108  / # . /lava-9983019/environment/lava-998301=
9/bin/lava-test-runner /lava-9983019/1

    2023-04-14T18:13:53.911386  =


    2023-04-14T18:13:53.916680  / # /lava-9983019/bin/lava-test-runner /lav=
a-9983019/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64399a93b3b9661f252e85f7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabo=
ra/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399a93b3b9661f252e85fc
        failing since 17 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-14T18:25:06.488303  + set<8>[   11.044273] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9983319_1.4.2.3.1>

    2023-04-14T18:25:06.488765   +x

    2023-04-14T18:25:06.596516  / # #

    2023-04-14T18:25:06.699156  export SHELL=3D/bin/sh

    2023-04-14T18:25:06.699836  #

    2023-04-14T18:25:06.801655  / # export SHELL=3D/bin/sh. /lava-9983319/e=
nvironment

    2023-04-14T18:25:06.802384  =


    2023-04-14T18:25:06.904169  / # . /lava-9983319/environment/lava-998331=
9/bin/lava-test-runner /lava-9983319/1

    2023-04-14T18:25:06.905090  =


    2023-04-14T18:25:06.909645  / # /lava-9983319/bin/lava-test-runner /lav=
a-9983319/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6439987fb6d03faaf72e861b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s905d-p=
230.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s905d-p=
230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6439987fb6d03faaf72e8=
61c
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643996fc592eff1c512e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/b=
aseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/b=
aseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643996fc592eff1c512e8=
5ed
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64399c9ca6c4f52d3c2e861c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p23=
0.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p23=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399c9ca6c4f52d3c2e8=
61d
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64399ef75722b1f9b82e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s90=
5d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s90=
5d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399ef75722b1f9b82e8=
5f7
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643997eb6a5da52bd72e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-m=
t8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-m=
t8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643997eb6a5da52bd72e8=
5f9
        failing since 14 days (last pass: next-20230324, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643997b03edcb6d7992e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-m=
t8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-m=
t8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643997b03edcb6d7992e8=
5f9
        failing since 14 days (last pass: next-20230324, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643997b1a53963fabd2e86c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-m=
t8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-m=
t8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643997b1a53963fabd2e8=
6ca
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64399b1e8e5bdfe3132e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399b1f8e5bdfe3132e8=
5fe
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643995d0e4717340bf2e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7=
.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643995d0e4717340bf2e8=
604
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6439993e6e067daba12e8635

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabor=
a/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabor=
a/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
6439993e6e067daba12e8639
        failing since 50 days (last pass: next-20230214, first fail: next-2=
0230222)

    2023-04-14T18:19:23.370742  /lava-9982951/1/../bin/lava-test-case

    2023-04-14T18:19:23.371377  <8>[   35.839606] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>

    2023-04-14T18:19:23.371838  /lava-9982951/1/../bin/lava-test-case

    2023-04-14T18:19:23.372278  <8>[   35.855078] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dskip>

    2023-04-14T18:19:23.372711  + set +x

    2023-04-14T18:19:23.373195  <8>[   35.868191] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 9982951_1.5.2.4.5>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/643999b6c2e7148ca22e860f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
643999b6c2e7148ca22e8613
        failing since 58 days (last pass: next-20230214, first fail: next-2=
0230215)

    2023-04-14T18:21:20.204959  /lava-9983075/1/../bin/lava-test-case

    2023-04-14T18:21:20.205259  <8>[   35.909752] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>

    2023-04-14T18:21:20.205456  /lava-9983075/1/../bin/lava-test-case

    2023-04-14T18:21:20.205646  <8>[   35.925513] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dskip>

    2023-04-14T18:21:20.205832  + set +x

    2023-04-14T18:21:20.206021  <8>[   35.938994] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 9983075_1.5.2.4.5>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/64399a6c26b7c8a9372e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/cla=
ng-13/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/cla=
ng-13/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399a6c26b7c8a9372e8=
5e8
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64399635b3c44277d52e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10=
/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10=
/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399635b3c44277d52e8=
605
        failing since 143 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6439952d9b187b7cbd2e8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10=
/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10=
/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6439952d9b187b7cbd2e8=
637
        failing since 143 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64399a94b3b9661f252e8619

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.c=
onfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.c=
onfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64399a94b3b9661f252e8=
61a
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/643996e8b41c8392a32e861b

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-r=
k3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-r=
k3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643996e8b41c839=
2a32e8672
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:09:17.658453  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-14T18:09:17.663398  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-14T18:09:17.667139  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-14T18:09:17.670800  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-14T18:09:17.676389  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-14T18:09:17.679480  kern  :alert : Data abort info:

    2023-04-14T18:09:17.683686  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-14T18:09:17.687290  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-14T18:09:17.694227  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000000b56e000

    2023-04-14T18:09:17.705831  kern  :alert : [00000000000<8>[   20.355050=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643996e8b41c839=
2a32e8674
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:09:17.640880  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-14T18:09:17.652979  kern  :alert : Mem abort in<8>[   20.302057=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>

    2023-04-14T18:09:17.653604  fo:
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/64399699aa1413e7082e862b

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64399699aa1413e=
7082e8632
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:08:10.348335  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-14T18:08:10.350086  kern  :emerg : Code: 97fdc26e f9405688 5286=
4a69 72a686c9 (b9400908) =

    2023-04-14T18:08:10.362245  <8>[   21.766021] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-14T18:08:10.362542  + set +x
    2023-04-14T18:08:10.362760  <8>[   21.768392] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 424840_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64399699aa1413e=
7082e8633
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:08:10.325814  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-14T18:08:10.326943  kern  :alert : Mem abort info:
    2023-04-14T18:08:10.327297  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-14T18:08:10.328042  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-14T18:08:10.329011  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-14T18:08:10.329471  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-14T18:08:10.330165  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-14T18:08:10.331151  kern  :alert : Data abort info:
    2023-04-14T18:08:10.331944  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-14T18:08:10.332643  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643997b10ac8cd98a32e860a

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/b=
aseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-clabbe/b=
aseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643997b10ac8cd9=
8a32e8611
        failing since 2 days (last pass: next-20230406, first fail: next-20=
230412)
        2 lines

    2023-04-14T18:12:47.975261  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP
    2023-04-14T18:12:47.976768  kern  :emerg : Code: 9414ae16 f9405688 5286=
4a69 72a686c9 (b9400908) =

    2023-04-14T18:12:47.988168  <8>[   19.477368] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-14T18:12:47.988541  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643997b10ac8cd9=
8a32e8612
        failing since 2 days (last pass: next-20230406, first fail: next-20=
230412)
        12 lines

    2023-04-14T18:12:47.954999  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-14T18:12:47.956185  kern  :alert : Mem abort info:
    2023-04-14T18:12:47.956544  kern  :alert :   ESR =3D 0x0000000096000007
    2023-04-14T18:12:47.957247  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-14T18:12:47.958455  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-14T18:12:47.958820  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-14T18:12:47.959455  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-14T18:12:47.960718  kern  :alert : Data abort info:
    2023-04-14T18:12:47.961100  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-14T18:12:47.962205  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6439956dd4426e5c732e8637

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/bas=
eline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/bas=
eline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6439956dd4426e5=
c732e863e
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:03:19.285345  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP
    2023-04-14T18:03:19.285870  kern  :emerg : Code: 97fab055 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-14T18:03:19.295369  <8>[   19.266162] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-14T18:03:19.295969  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6439956dd4426e5=
c732e863f
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:03:19.268352  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-14T18:03:19.270009  kern  :alert : Mem abort info:
    2023-04-14T18:03:19.270579  kern  :alert :   ESR =3D 0x0000000096000007
    2023-04-14T18:03:19.273928  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-14T18:03:19.274712  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-14T18:03:19.275225  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-14T18:03:19.275692  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-14T18:03:19.277324  kern  :alert : Data abort info:
    2023-04-14T18:03:19.277796  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-14T18:03:19.278466  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/643998cf4e58a71f962e86c5

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-p=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-p=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643998cf4e58a71=
f962e86cc
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:17:28.649472  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-14T18:17:28.650824  kern  :emerg : Code: 97fe88a7 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-14T18:17:28.662864  <8>[   21.763078] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-14T18:17:28.663205  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643998cf4e58a71=
f962e86cd
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:17:28.633131  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-14T18:17:28.633731  kern  :alert : Mem abort info:
    2023-04-14T18:17:28.633981  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-14T18:17:28.634200  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-14T18:17:28.639107  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-14T18:17:28.639439  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-14T18:17:28.639648  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-14T18:17:28.640199  kern  :alert : Data abort info:
    2023-04-14T18:17:28.640445  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-14T18:17:28.640641  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6439992ebe867b40262e85f6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6439992ebe867b4=
0262e85fd
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:19:15.224711  kern  :emerg : Code: 97fb40a7 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-14T18:19:15.234130  <8>[   21.692026] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-14T18:19:15.234477  + set +x
    2023-04-14T18:19:15.234682  <8>[   21.694553] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 424865_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6439992ebe867b4=
0262e85fe
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:19:15.199106  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-14T18:19:15.202131  kern  :alert : Mem abort info:
    2023-04-14T18:19:15.202440  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-14T18:19:15.205151  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-14T18:19:15.208356  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-14T18:19:15.211165  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-14T18:19:15.214247  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-14T18:19:15.214549  kern  :alert : Data abort info:
    2023-04-14T18:19:15.218163  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-14T18:19:15.218464  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/643999e2dbd36fb47b2e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643999e2dbd36fb47b2e8=
5f1
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/64399a461d5545523f2e8609

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64399a461d55455=
23f2e8610
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:23:50.107632  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-14T18:23:50.108685  kern  :emerg : Code: 97fd38a7 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-14T18:23:50.120548  <8>[   21.494507] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-14T18:23:50.120917  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64399a461d55455=
23f2e8611
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:23:50.086086  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-14T18:23:50.086901  kern  :alert : Mem abort info:
    2023-04-14T18:23:50.087285  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-14T18:23:50.087664  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-14T18:23:50.088224  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-14T18:23:50.088533  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-14T18:23:50.088889  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-14T18:23:50.089481  kern  :alert : Data abort info:
    2023-04-14T18:23:50.089785  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-14T18:23:50.090809  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64399bfe75925b8aef2e860c

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/base=
line-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/base=
line-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64399bfe75925b8=
aef2e8613
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:31:08.620922  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-04-14T18:31:08.622475  kern  :emerg : Code: 97ff30a7 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-04-14T18:31:08.633603  <8>[   21.697960] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-14T18:31:08.634018  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64399bfe75925b8=
aef2e8614
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:31:08.601067  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-04-14T18:31:08.602442  kern  :alert : Mem abort info:
    2023-04-14T18:31:08.602803  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-14T18:31:08.603381  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-14T18:31:08.604386  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-14T18:31:08.604748  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-14T18:31:08.605351  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-14T18:31:08.606558  kern  :alert : Data abort info:
    2023-04-14T18:31:08.606919  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-14T18:31:08.608182  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/643996c74e08472e7a2e85ea

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643996c74e08472=
e7a2e85f1
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:08:52.214533  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-14T18:08:52.215097  kern  :emerg : Code: 97fe166e f9405688 5286=
4a69 72a686c9 (b9400908) =


    2023-04-14T18:08:52.215469  <8>[   22.013516] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-14T18:08:52.215811  + set +x

    2023-04-14T18:08:52.216146  <8>[   22.015743] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9982867_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643996c74e08472=
e7a2e85f2
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:08:52.159242  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-14T18:08:52.159814  kern  :alert : Mem abort info:

    2023-04-14T18:08:52.160186  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-14T18:08:52.160529  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-14T18:08:52.160862  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-14T18:08:52.161183  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-14T18:08:52.161499  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-14T18:08:52.161846  kern  :alert : Data abort info:

    2023-04-14T18:08:52.162157  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-14T18:08:52.162463  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64399772a25939cd3a2e85e8

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230409071848+d94a=
770f7b05-1~exp1~20230409072028.621))
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabor=
a/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabor=
a/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64399772a25939c=
d3a2e85ef
        new failure (last pass: next-20230406)
        2 lines

    2023-04-14T18:11:57.745394  kern  :emerg : Code: 97eeee16 f9405688 5286=
4a69 72a686c9 (b9400908) =


    2023-04-14T18:11:57.745471  <8>[   19.507197] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-14T18:11:57.745538  + set +x

    2023-04-14T18:11:57.745608  <8>[   19.508734] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9982956_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64399772a25939c=
d3a2e85f0
        new failure (last pass: next-20230406)
        12 lines

    2023-04-14T18:11:57.703987  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-04-14T18:11:57.704107  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-14T18:11:57.704186  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D00000000116b0800

    2023-04-14T18:11:57.704292  kern  :alert : [0000000000000008] pgd=3D080=
0000015840003, p4d=3D0800000015840003, pud=3D0800000015840003, pmd=3D080000=
0015820003, pte=3D0000000000000000

    2023-04-14T18:11:57.704382  <8>[   19.486101] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-04-14T18:11:57.704442  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64399593bfa79737612e85fd

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/=
baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/=
baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64399593bfa7973=
7612e8604
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:03:38.837632  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP

    2023-04-14T18:03:38.838169  kern  :emerg : Code: 97dd7055 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-14T18:03:38.838519  <8>[   23.897554] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-14T18:03:38.838844  + set<8>[   23.898975] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9982743_1.5.2.4.1>

    2023-04-14T18:03:38.839159   +x
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64399593bfa7973=
7612e8605
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:03:38.792089  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-14T18:03:38.792622  kern  :alert : Mem abort info:

    2023-04-14T18:03:38.792970  kern  :alert :   ESR =3D 0x0000000096000007

    2023-04-14T18:03:38.793327  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-14T18:03:38.793652  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-14T18:03:38.793961  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-14T18:03:38.794258  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault

    2023-04-14T18:03:38.794553  kern  :alert : Data abort info:

    2023-04-14T18:03:38.794842  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-04-14T18:03:38.795131  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/643998641390796fc32e8649

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643998641390796=
fc32e8650
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:15:43.417634  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-14T18:15:43.418164  kern  :emerg : Code: 97fd38a7 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-14T18:15:43.418508  <8>[   23.790411] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-14T18:15:43.418833  + set +x

    2023-04-14T18:15:43.419139  <8>[   23.792382] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9983064_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643998641390796=
fc32e8651
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:15:43.368109  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-14T18:15:43.368644  kern  :alert : Mem abort info:

    2023-04-14T18:15:43.368986  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-14T18:15:43.369356  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-14T18:15:43.369690  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-14T18:15:43.369995  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-14T18:15:43.370292  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-14T18:15:43.370585  kern  :alert : Data abort info:

    2023-04-14T18:15:43.370876  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-14T18:15:43.371162  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/643998a5f8a961e0f32e85ee

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.=
txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643998a5f8a961e=
0f32e85f5
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:17:02.662150  kern  :emerg : Code: 97fa28a7 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-14T18:17:02.662708  <8>[   23.203074] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-14T18:17:02.663076  + set +x

    2023-04-14T18:17:02.663420  <8>[   23.205192] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9983085_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643998a5f8a961e=
0f32e85f6
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:17:02.618505  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-14T18:17:02.618965  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-14T18:17:02.619329  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000078e8f000

    2023-04-14T18:17:02.619676  kern  :alert : [0000000000000008] pgd=3D080=
0000078e95003, p4d=3D0800000078e95003, pud=3D0800000078e96003, pmd=3D000000=
0000000000

    2023-04-14T18:17:02.620013  <8>[   23.181399] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-04-14T18:17:02.620345  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/643999466e067daba12e8654

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi=
-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi=
-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643999466e067da=
ba12e865b
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:19:27.754605  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-14T18:19:27.755164  kern  :emerg : Code: 97f924a7 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-14T18:19:27.755529  <8>[   21.674501] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-14T18:19:27.755869  + set +x

    2023-04-14T18:19:27.756195  <8>[   21.676565] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9983131_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643999466e067da=
ba12e865c
        failing since 3 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:19:27.707057  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-14T18:19:27.707582  kern  :alert : Mem abort info:

    2023-04-14T18:19:27.707914  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-14T18:19:27.708221  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-14T18:19:27.708522  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-14T18:19:27.708812  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-14T18:19:27.709115  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-14T18:19:27.709420  kern  :alert : Data abort info:

    2023-04-14T18:19:27.709753  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-14T18:19:27.710058  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64399b8aa290cd064f2e860c

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/b=
aseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/b=
aseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64399b8aa290cd0=
64f2e8613
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        2 lines

    2023-04-14T18:29:20.566744  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-14T18:29:20.566830  kern  :emerg : Code: 97f720a7 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-14T18:29:20.566899  <8>[   21.481109] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-14T18:29:20.566963  + set +x

    2023-04-14T18:29:20.567025  <8>[   21.483209] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9983471_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64399b8aa290cd0=
64f2e8614
        failing since 3 days (last pass: next-20230406, first fail: next-20=
230411)
        12 lines

    2023-04-14T18:29:20.538760  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-14T18:29:20.538846  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-14T18:29:20.538914  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000044b4000

    2023-04-14T18:29:20.538978  kern  :alert : [0000000000000008] pgd=3D080=
0000078c3d003, p4d=3D0800000078c3d003, pud=3D0800000078cb1003, pmd=3D000000=
0000000000

    2023-04-14T18:29:20.539040  <8>[   21.454724] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643998084712c168fa2e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-o=
rangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-o=
rangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643998084712c168fa2e85eb
        failing since 71 days (last pass: next-20221017, first fail: next-2=
0230201)

    2023-04-14T18:14:09.305961  / # #
    2023-04-14T18:14:09.411538  export SHELL=3D/bin/sh
    2023-04-14T18:14:09.413058  #
    2023-04-14T18:14:09.516427  / # export SHELL=3D/bin/sh. /lava-3496556/e=
nvironment
    2023-04-14T18:14:09.518064  =

    2023-04-14T18:14:09.621484  / # . /lava-3496556/environment/lava-349655=
6/bin/lava-test-runner /lava-3496556/1
    2023-04-14T18:14:09.624214  =

    2023-04-14T18:14:09.630829  / # /lava-3496556/bin/lava-test-runner /lav=
a-3496556/1
    2023-04-14T18:14:09.765377  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-14T18:14:09.766535  + cd /lava-3496556/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64399b29a8714a50a22e865a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-o=
rangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-o=
rangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64399b29a8714a50a22e865f
        failing since 48 days (last pass: next-20230224, first fail: next-2=
0230225)

    2023-04-14T18:26:29.944245  / # #
    2023-04-14T18:26:30.049826  export SHELL=3D/bin/sh
    2023-04-14T18:26:30.051335  #
    2023-04-14T18:26:30.154719  / # export SHELL=3D/bin/sh. /lava-3496555/e=
nvironment
    2023-04-14T18:26:30.156227  =

    2023-04-14T18:26:30.259704  / # . /lava-3496555/environment/lava-349655=
5/bin/lava-test-runner /lava-3496555/1
    2023-04-14T18:26:30.262435  =

    2023-04-14T18:26:30.268846  / # /lava-3496555/bin/lava-test-runner /lav=
a-3496555/1
    2023-04-14T18:26:30.416396  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-14T18:26:30.417461  + cd /lava-3496555/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643996c8c8ade963cf2e8615

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libret=
ech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/v6.3-rc6-12018-gd3=
f2cd248191/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libret=
ech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643996c8c8ade963cf2e861a
        failing since 80 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-04-14T18:08:40.436191  <8>[    9.449940] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3496552_1.5.2.4.1>
    2023-04-14T18:08:40.543807  / # #
    2023-04-14T18:08:40.646228  export SHELL=3D/bin/sh
    2023-04-14T18:08:40.646922  #
    2023-04-14T18:08:40.748521  / # export SHELL=3D/bin/sh. /lava-3496552/e=
nvironment
    2023-04-14T18:08:40.749220  =

    2023-04-14T18:08:40.850955  / # . /lava-3496552/environment/lava-349655=
2/bin/lava-test-runner /lava-3496552/1
    2023-04-14T18:08:40.851956  =

    2023-04-14T18:08:40.867973  / # /lava-3496552/bin/lava-test-runner /lav=
a-3496552/1
    2023-04-14T18:08:40.990857  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
