Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82D366FD8E9
	for <lists+linux-next@lfdr.de>; Wed, 10 May 2023 10:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236468AbjEJIKt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 May 2023 04:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236424AbjEJIKs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 May 2023 04:10:48 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163D430D8
        for <linux-next@vger.kernel.org>; Wed, 10 May 2023 01:10:44 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1aae46e62e9so49797515ad.2
        for <linux-next@vger.kernel.org>; Wed, 10 May 2023 01:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683706243; x=1686298243;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rvMoRLoVqWcsmcPn8uFx4mg5FPOnlXi5O6uTRrtbSkQ=;
        b=SPvB2G8D7NA/XKdIA5B9uDswj+b1J+8sCK7z9NS8M2wfln8PXXtGlzR1hrTSDOEtDH
         pmu7wUK7P9hPnKZ91+4Jt+TJnDVCfeFOHqvI4VzhxyIUEvtOqbqDLAUPD537jpOjVQsf
         g5QiSA+FgWC2FRf9xv2x1nDXC3FPbi2mjMTxC8N89DBOCcRerOAHqLwkgmnpEMwSh4dJ
         0meog+QnxBqDwkc7muLyWAUIBZ46LAXwuXrWPldoG5elBQzJpBgWG0d9SpjfOImbrI7I
         +ZAWSut60uukVJgZVJt2LP0hBQCx5Ub12brv2kl4FnfXX+Lbf5RKemhKEWMnCYs7Fs2B
         oQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683706243; x=1686298243;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvMoRLoVqWcsmcPn8uFx4mg5FPOnlXi5O6uTRrtbSkQ=;
        b=ko+r0767v+U2vIZgoj1JZxTW5JpyKSFbijGES6MIaw5jjm9+jsfi6NUV/UIAkpKFcm
         +fWAR2xwjSft5nwZJNrqyTrxagYbzIz1qYjqRp0xlkc//fi9sjEXTEi6CALPHd81izfN
         GKuPleY3WHfOw66woYoDTDMi09hsckFDfdRQtvjhYsT0759XtaAIZ+aMh2DQo9YDCad1
         KyUhMCVEN3K5yi8xqKgN+Pt0hbES5Wb6R4j6Xm9Cv9AUdt2SFA3Tlf+TXUPGVZeUjx+A
         7g7+hqAIpGsi4N5XlbRZGlasfkZXetmgbaQrUCVJprK1PNqrwD7LC4Rf5EcQzxRNuWsu
         ND0w==
X-Gm-Message-State: AC+VfDy8vVgKhzsI4UFRtw8kYm8uewxM8BwB69X+7Ds8c5AzUFdVF1va
        4+ulyhjn7alecgAvf9kTgPSoj9dkXsNakrjiAKweaA==
X-Google-Smtp-Source: ACHHUZ6WzO4itEdqg9V3xHaE4w6Jzbwn/53vltSSUlbpbD75VlMdDfzJ4J0kfnjX0LmUKoOtP9+sEA==
X-Received: by 2002:a17:902:9a96:b0:1a9:2b7f:a594 with SMTP id w22-20020a1709029a9600b001a92b7fa594mr14995227plp.29.1683706241359;
        Wed, 10 May 2023 01:10:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902c20500b001a051eb014bsm3061890pll.219.2023.05.10.01.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:10:40 -0700 (PDT)
Message-ID: <645b5180.170a0220.9063f.639c@mx.google.com>
Date:   Wed, 10 May 2023 01:10:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230510
X-Kernelci-Report-Type: test
Subject: next/master baseline: 789 runs, 107 regressions (next-20230510)
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

next/master baseline: 789 runs, 107 regressions (next-20230510)

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
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+debug              | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 31         =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

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

rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig                    | 3          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 3          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230510/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230510
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      578215f3e21c472c08d70b8796edf1ac58f88578 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2db9ea51bed3d02e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2db9ea51bed3d02e8=
5e7
        failing since 234 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2eea32910712152e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2eea32910712152e8=
5f8
        failing since 237 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1840b7376f92562e8606

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1840b7376f92562e860b
        failing since 42 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-10T04:06:02.663572  <8>[   10.217119] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10264904_1.4.2.3.1>

    2023-05-10T04:06:02.666784  + set +x

    2023-05-10T04:06:02.771129  / # #

    2023-05-10T04:06:02.871733  export SHELL=3D/bin/sh

    2023-05-10T04:06:02.871928  #

    2023-05-10T04:06:02.972405  / # export SHELL=3D/bin/sh. /lava-10264904/=
environment

    2023-05-10T04:06:02.972609  =


    2023-05-10T04:06:03.073109  / # . /lava-10264904/environment/lava-10264=
904/bin/lava-test-runner /lava-10264904/1

    2023-05-10T04:06:03.073418  =


    2023-05-10T04:06:03.079393  / # /lava-10264904/bin/lava-test-runner /la=
va-10264904/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b18bbe97a8b6e3a2e85ed

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b18bbe97a8b6e3a2e85f2
        failing since 42 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-10T04:08:08.364862  <8>[   10.552134] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265035_1.4.2.3.1>

    2023-05-10T04:08:08.368402  + set +x

    2023-05-10T04:08:08.472901  / # #

    2023-05-10T04:08:08.573600  export SHELL=3D/bin/sh

    2023-05-10T04:08:08.573802  #

    2023-05-10T04:08:08.674343  / # export SHELL=3D/bin/sh. /lava-10265035/=
environment

    2023-05-10T04:08:08.674556  =


    2023-05-10T04:08:08.775162  / # . /lava-10265035/environment/lava-10265=
035/bin/lava-test-runner /lava-10265035/1

    2023-05-10T04:08:08.775456  =


    2023-05-10T04:08:08.780757  / # /lava-10265035/bin/lava-test-runner /la=
va-10265035/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b18c53540bf273b2e8624

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b18c53540bf273b2e8629
        failing since 39 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-10T04:08:19.231077  + set +x

    2023-05-10T04:08:19.237391  <8>[   20.696455] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10264962_1.4.2.3.1>

    2023-05-10T04:08:19.345860  / # #

    2023-05-10T04:08:19.447971  export SHELL=3D/bin/sh

    2023-05-10T04:08:19.448752  #

    2023-05-10T04:08:19.550252  / # export SHELL=3D/bin/sh. /lava-10264962/=
environment

    2023-05-10T04:08:19.551046  =


    2023-05-10T04:08:19.652514  / # . /lava-10264962/environment/lava-10264=
962/bin/lava-test-runner /lava-10264962/1

    2023-05-10T04:08:19.653752  =


    2023-05-10T04:08:19.658935  / # /lava-10264962/bin/lava-test-runner /la=
va-10264962/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1832d5dbdc0cae2e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1832d5dbdc0cae2e85eb
        failing since 42 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-10T04:05:53.106363  <8>[   10.844731] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10264914_1.4.2.3.1>

    2023-05-10T04:05:53.109533  + set +x

    2023-05-10T04:05:53.213655  / # #

    2023-05-10T04:05:53.314432  export SHELL=3D/bin/sh

    2023-05-10T04:05:53.315178  #

    2023-05-10T04:05:53.416476  / # export SHELL=3D/bin/sh. /lava-10264914/=
environment

    2023-05-10T04:05:53.417077  =


    2023-05-10T04:05:53.518323  / # . /lava-10264914/environment/lava-10264=
914/bin/lava-test-runner /lava-10264914/1

    2023-05-10T04:05:53.519105  =


    2023-05-10T04:05:53.524152  / # /lava-10264914/bin/lava-test-runner /la=
va-10264914/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1877ea875cbe2a2e8625

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1877ea875cbe2a2e862a
        failing since 39 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-10T04:06:58.805352  <8>[   12.358782] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10264937_1.4.2.3.1>

    2023-05-10T04:06:58.809240  + set +x

    2023-05-10T04:06:58.914694  #

    2023-05-10T04:06:58.915883  =


    2023-05-10T04:06:59.017848  / # #export SHELL=3D/bin/sh

    2023-05-10T04:06:59.018630  =


    2023-05-10T04:06:59.120091  / # export SHELL=3D/bin/sh. /lava-10264937/=
environment

    2023-05-10T04:06:59.120908  =


    2023-05-10T04:06:59.222458  / # . /lava-10264937/environment/lava-10264=
937/bin/lava-test-runner /lava-10264937/1

    2023-05-10T04:06:59.222877  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b18892eb611abad2e85ea

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b18892eb611abad2e85ef
        failing since 42 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-10T04:07:13.257526  <8>[   11.521071] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265069_1.4.2.3.1>

    2023-05-10T04:07:13.261365  + set +x

    2023-05-10T04:07:13.366506  #

    2023-05-10T04:07:13.367682  =


    2023-05-10T04:07:13.469367  / # #export SHELL=3D/bin/sh

    2023-05-10T04:07:13.470289  =


    2023-05-10T04:07:13.571731  / # export SHELL=3D/bin/sh. /lava-10265069/=
environment

    2023-05-10T04:07:13.572583  =


    2023-05-10T04:07:13.674042  / # . /lava-10265069/environment/lava-10265=
069/bin/lava-test-runner /lava-10265069/1

    2023-05-10T04:07:13.675226  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1b98dc4e77e0362e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1b98dc4e77e0362e8=
5e7
        failing since 42 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b206cdf6ea6e2a62e8619

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b206cdf6ea6e2a62e8=
61a
        failing since 106 days (last pass: next-20230120, first fail: next-=
20230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b22e6592a8868722e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b22e6592a8868722e8605
        failing since 88 days (last pass: next-20230209, first fail: next-2=
0230210)

    2023-05-10T04:51:25.831810  + set +x
    2023-05-10T04:51:25.833611  [   20.538411] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1217739_1.5.2.4.1>
    2023-05-10T04:51:25.943981  #
    2023-05-10T04:51:26.046240  / # #export SHELL=3D/bin/sh
    2023-05-10T04:51:26.046929  =

    2023-05-10T04:51:26.148397  / # export SHELL=3D/bin/sh. /lava-1217739/e=
nvironment
    2023-05-10T04:51:26.148785  =

    2023-05-10T04:51:26.250001  / # . /lava-1217739/environment/lava-121773=
9/bin/lava-test-runner /lava-1217739/1
    2023-05-10T04:51:26.250898  =

    2023-05-10T04:51:26.253309  / # /lava-1217739/bin/lava-test-runner /lav=
a-1217739/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1816ebc8171d242e8604

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1816ebc8171d242e8609
        failing since 42 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-10T04:05:35.180689  + <8>[   10.656891] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10264885_1.4.2.3.1>

    2023-05-10T04:05:35.180790  set +x

    2023-05-10T04:05:35.282200  #

    2023-05-10T04:05:35.383047  / # #export SHELL=3D/bin/sh

    2023-05-10T04:05:35.383268  =


    2023-05-10T04:05:35.483800  / # export SHELL=3D/bin/sh. /lava-10264885/=
environment

    2023-05-10T04:05:35.484022  =


    2023-05-10T04:05:35.584568  / # . /lava-10264885/environment/lava-10264=
885/bin/lava-test-runner /lava-10264885/1

    2023-05-10T04:05:35.584890  =


    2023-05-10T04:05:35.589447  / # /lava-10264885/bin/lava-test-runner /la=
va-10264885/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b188e25658763c02e860c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b188e25658763c02e8611
        failing since 39 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-10T04:07:19.396767  + set +x

    2023-05-10T04:07:19.403328  <8>[   19.383115] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10264978_1.4.2.3.1>

    2023-05-10T04:07:19.509559  / # #

    2023-05-10T04:07:19.610162  export SHELL=3D/bin/sh

    2023-05-10T04:07:19.610351  #

    2023-05-10T04:07:19.710905  / # export SHELL=3D/bin/sh. /lava-10264978/=
environment

    2023-05-10T04:07:19.711143  =


    2023-05-10T04:07:19.811741  / # . /lava-10264978/environment/lava-10264=
978/bin/lava-test-runner /lava-10264978/1

    2023-05-10T04:07:19.812014  =


    2023-05-10T04:07:19.817559  / # /lava-10264978/bin/lava-test-runner /la=
va-10264978/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b189fe9a37b0fa52e85ec

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b189fe9a37b0fa52e85f1
        failing since 42 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-10T04:07:51.927627  + <8>[   10.507198] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10265005_1.4.2.3.1>

    2023-05-10T04:07:51.928050  set +x

    2023-05-10T04:07:52.032834  #

    2023-05-10T04:07:52.034050  =


    2023-05-10T04:07:52.135856  / # #export SHELL=3D/bin/sh

    2023-05-10T04:07:52.136647  =


    2023-05-10T04:07:52.238269  / # export SHELL=3D/bin/sh. /lava-10265005/=
environment

    2023-05-10T04:07:52.239049  =


    2023-05-10T04:07:52.340703  / # . /lava-10265005/environment/lava-10265=
005/bin/lava-test-runner /lava-10265005/1

    2023-05-10T04:07:52.341933  =

 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645b18244f468ed5602e85e8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b18244f468ed5602e85ed
        failing since 42 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-05-10T04:05:44.291340  <8>[   10.088932] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10264917_1.4.2.3.1>

    2023-05-10T04:05:44.295228  + set +x

    2023-05-10T04:05:44.397491  =


    2023-05-10T04:05:44.498309  / # #export SHELL=3D/bin/sh

    2023-05-10T04:05:44.498508  =


    2023-05-10T04:05:44.599060  / # export SHELL=3D/bin/sh. /lava-10264917/=
environment

    2023-05-10T04:05:44.599346  =


    2023-05-10T04:05:44.699994  / # . /lava-10264917/environment/lava-10264=
917/bin/lava-test-runner /lava-10264917/1

    2023-05-10T04:05:44.700438  =


    2023-05-10T04:05:44.705599  / # /lava-10264917/bin/lava-test-runner /la=
va-10264917/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1864efd4e9553a2e85f5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1864efd4e9553a2e85fa
        failing since 39 days (last pass: next-20230324, first fail: next-2=
0230331)

    2023-05-10T04:06:39.619001  + set +x

    2023-05-10T04:06:39.625964  <8>[   14.101228] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10264961_1.4.2.3.1>

    2023-05-10T04:06:39.730580  / # #

    2023-05-10T04:06:39.831224  export SHELL=3D/bin/sh

    2023-05-10T04:06:39.831436  #

    2023-05-10T04:06:39.931976  / # export SHELL=3D/bin/sh. /lava-10264961/=
environment

    2023-05-10T04:06:39.932210  =


    2023-05-10T04:06:40.032761  / # . /lava-10264961/environment/lava-10264=
961/bin/lava-test-runner /lava-10264961/1

    2023-05-10T04:06:40.033072  =


    2023-05-10T04:06:40.037842  / # /lava-10264961/bin/lava-test-runner /la=
va-10264961/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b18743c8a82e2b32e85ee

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b18743c8a82e2b32e85f3
        failing since 42 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-05-10T04:07:05.317382  + set +x

    2023-05-10T04:07:05.323838  <8>[   10.769980] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265059_1.4.2.3.1>

    2023-05-10T04:07:05.426755  #

    2023-05-10T04:07:05.427156  =


    2023-05-10T04:07:05.527926  / # #export SHELL=3D/bin/sh

    2023-05-10T04:07:05.528124  =


    2023-05-10T04:07:05.628670  / # export SHELL=3D/bin/sh. /lava-10265059/=
environment

    2023-05-10T04:07:05.628863  =


    2023-05-10T04:07:05.729367  / # . /lava-10265059/environment/lava-10265=
059/bin/lava-test-runner /lava-10265059/1

    2023-05-10T04:07:05.729805  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1a6056e546c17a2e8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1a6056e546c17a2e8=
644
        failing since 273 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1a6356e546c17a2e8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1a6356e546c17a2e8=
661
        failing since 260 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1c4157aa40f27b2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+debug/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1c4157aa40f27b2e8=
5f8
        new failure (last pass: next-20230425) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e0dc57c35601c2e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1e0dc57c35601c2e8=
5f6
        new failure (last pass: next-20230508) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1bfdad06d2b73f2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230508111034+14f0=
776550b5-1~exp1~20230508111157.654))
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1bfdad06d2b73f2e8=
5e7
        new failure (last pass: next-20230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b198400327d4b952e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b198400327d4b952e8=
5ec
        failing since 20 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1ebb3bbcb078672e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1ebb3bbcb078672e8=
5f3
        failing since 104 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2040a1e1d20a8a2e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2040a1e1d20a8a2e8=
600
        failing since 92 days (last pass: next-20230203, first fail: next-2=
0230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1f01a014f0827e2e8621

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1f01a014f0827e2e8=
622
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2c96a64a6b35f32e8616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2c96a64a6b35f32e8=
617
        failing since 92 days (last pass: next-20230203, first fail: next-2=
0230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1eff7ad41466c12e860c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1eff7ad41466c12e8=
60d
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1eaa1eaf16a8642e861a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1eaa1eaf16a8642e8=
61b
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1edf3bef2415c32e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1edf3bef2415c32e8=
5f5
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2012b814f259e22e860e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2012b814f259e22e8=
60f
        failing since 102 days (last pass: next-20230120, first fail: next-=
20230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b217be9992546aa2e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b217be9992546aa2e8=
5f7
        failing since 105 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 31         =


  Details:     https://kernelci.org/test/plan/id/645b1f6f26a75216802e8673

  Results:     140 PASS, 45 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mt8192-audio-probed: https://kernelci.org/test/case/id/=
645b1f6f26a75216802e8686
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:37.959774  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:37.966909  <8>[   50.792551] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmt8192-audio-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-vcodec-enc-probed: https://kernelci.org/test/case/i=
d/645b1f6f26a75216802e868e
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:33.781046  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:33.787869  <8>[   46.613258] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-vcodec-enc-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-gamma-probed: https://kernelci.org/test/c=
ase/id/645b1f6f26a75216802e86a7
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:29.298008  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:29.308566  <8>[   42.129846] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-gamma-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-color-probed: https://kernelci.org/test/c=
ase/id/645b1f6f26a75216802e86a9
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:28.255818  /lava-10265650/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-ccorr-probed: https://kernelci.org/test/c=
ase/id/645b1f6f26a75216802e86ab
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:27.213618  /lava-10265650/1/../bin/lava-test-case
   =


  * baseline.bootrr.mediatek-disp-aal-probed: https://kernelci.org/test/cas=
e/id/645b1f6f26a75216802e86ad
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:26.171294  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:26.177573  <8>[   39.002213] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-aal-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-rdma4-probed: https://kernelci.org/test/c=
ase/id/645b1f6f26a75216802e86af
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:25.129104  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:25.136054  <8>[   37.959334] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma4-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-rdma0-probed: https://kernelci.org/test/c=
ase/id/645b1f6f26a75216802e86b0
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:23.092621  <8>[   35.912634] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma-driver-present RESULT=3Dpass>

    2023-05-10T04:36:24.106808  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:24.113518  <8>[   36.936199] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-rdma0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl2l2-probed: https://kernelci.org/test/=
case/id/645b1f6f26a75216802e86b2
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:23.064948  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:23.071149  <8>[   35.894487] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl2l2-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl2l0-probed: https://kernelci.org/test/=
case/id/645b1f6f26a75216802e86b3
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:22.040247  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:22.049760  <8>[   34.870934] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl2l0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-disp-ovl0-probed: https://kernelci.org/test/ca=
se/id/645b1f6f26a75216802e86b4
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:21.016565  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:21.023659  <8>[   33.846410] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-disp-ovl0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mediatek-mutex-probed: https://kernelci.org/test/case/i=
d/645b1f6f26a75216802e86b6
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:19.172597  <6>[   32.000900] Vgpu: disabling

    2023-05-10T04:36:19.184993  <6>[   32.009487] pp3300_mipibrdg: disabling

    2023-05-10T04:36:19.187335  <6>[   32.013533] pp3300_dpbrdg: disabling

    2023-05-10T04:36:19.974499  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:19.981438  <8>[   32.804772] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmediatek-mutex-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-iommu-probed: https://kernelci.org/test/case/id/645=
b1f6f26a75216802e86d6
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:15.324112  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:15.330612  <8>[   28.154026] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-iommu-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb18-probed: https://kernelci.org/test/case/i=
d/645b1f6f26a75216802e86d8
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:14.283453  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:14.289757  <8>[   27.113242] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb18-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb13-probed: https://kernelci.org/test/case/i=
d/645b1f6f26a75216802e86d9
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:13.260470  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:13.266724  <8>[   26.089281] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb13-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb11-probed: https://kernelci.org/test/case/i=
d/645b1f6f26a75216802e86da
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:12.237701  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:12.244190  <8>[   25.067028] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb11-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb2-probed: https://kernelci.org/test/case/id=
/645b1f6f26a75216802e86db
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:11.215109  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:11.221292  <8>[   24.043640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb2-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-dsi-probed: https://kernelci.org/test/case/id/645b1=
f6f26a75216802e86dd
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:16.759406  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:16.765717  <8>[   29.589494] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-dsi-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb17-probed: https://kernelci.org/test/case/i=
d/645b1f6f26a75216802e86de
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:10.192606  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:10.199513  <8>[   23.021088] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb17-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb7-probed: https://kernelci.org/test/case/id=
/645b1f6f26a75216802e86df
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:09.168220  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:09.175076  <8>[   21.996736] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb7-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb9-probed: https://kernelci.org/test/case/id=
/645b1f6f26a75216802e86e0
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:08.145297  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:08.151695  <8>[   20.973348] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb9-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb19-probed: https://kernelci.org/test/case/i=
d/645b1f6f26a75216802e86e1
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:07.123372  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:07.130408  <8>[   19.951123] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb19-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb16-probed: https://kernelci.org/test/case/i=
d/645b1f6f26a75216802e86e2
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:06.100188  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:06.106491  <8>[   18.928428] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb16-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb0-probed: https://kernelci.org/test/case/id=
/645b1f6f26a75216802e86e3
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:35:59.960420  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:35:59.967427  <8>[   12.788140] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-common-probed: https://kernelci.org/test/case/i=
d/645b1f6f26a75216802e86e5
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:35:58.920076  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:35:58.926940  <8>[   11.747141] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-common-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb4-probed: https://kernelci.org/test/case/id=
/645b1f6f26a75216802e86f4
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:05.077719  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:05.084521  <8>[   17.904733] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb4-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb1-probed: https://kernelci.org/test/case/id=
/645b1f6f26a75216802e86f5
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:04.054334  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:04.061030  <8>[   16.882167] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb1-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb20-probed: https://kernelci.org/test/case/i=
d/645b1f6f26a75216802e86f6
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:03.031485  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:03.037926  <8>[   15.858577] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb20-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb14-probed: https://kernelci.org/test/case/i=
d/645b1f6f26a75216802e86f7
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:02.009015  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:36:02.015727  <8>[   14.836622] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-smi-larb14-probed RESULT=3Dfail>
   =


  * baseline.bootrr.mtk-smi-larb5-probed: https://kernelci.org/test/case/id=
/645b1f6f26a75216802e86f8
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:36:00.762891  <4>[   13.582147] rt5682 1-001a: Using defa=
ult DAI clk names: rt5682-dai-wclk, rt5682-dai-bclk

    2023-05-10T04:36:00.769326  <6>[   13.583251] platform 1a00f000.larb: d=
eferred probe pending

    2023-05-10T04:36:00.772513  <6>[   13.583258] platform 1a010000.larb: d=
eferred probe pending

    2023-05-10T04:36:00.779360  <6>[   13.583261] platform 1a011000.larb: d=
eferred probe pending

    2023-05-10T04:36:00.785932  <6>[   13.583265] platform 1b00f000.larb: d=
eferred probe pending

    2023-05-10T04:36:00.792684  <6>[   13.583267] platform regulator-1v0-mi=
pibrdg: deferred probe pending

    2023-05-10T04:36:00.799196  <6>[   13.583270] platform 1b10f000.larb: d=
eferred probe pending

    2023-05-10T04:36:00.802882  <6>[   13.583273] platform 1f002000.larb: d=
eferred probe pending

    2023-05-10T04:36:00.808994  <6>[   13.583277] platform 11210000.syscon:=
mt8192-afe-pcm: deferred probe pending

    2023-05-10T04:36:00.816432  <6>[   13.583279] platform regulator-1v0-dp=
brdg: deferred probe pending
 =

    ... (30 line(s) more)  =


  * baseline.bootrr.mtk-power-controller-probed: https://kernelci.org/test/=
case/id/645b1f6f26a75216802e86ff
        failing since 4 days (last pass: next-20230411, first fail: next-20=
230505)

    2023-05-10T04:35:54.479844  <8>[    7.296315] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-power-controller-driver-present RESULT=3Dpass>

    2023-05-10T04:35:55.493869  /lava-10265650/1/../bin/lava-test-case

    2023-05-10T04:35:55.500620  <8>[    8.321119] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-power-controller-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b20e05d174452312e8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b20e05d174452312e8=
638
        new failure (last pass: next-20230509) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2f266855dd015d2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2f266855dd015d2e8=
5e8
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1acaca9fdb25e72e863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1acaca9fdb25e72e8=
63b
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1ab2ca1b8290842e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1ab2ca1b8290842e8=
5f3
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1a5473613a1c1c2e8606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1a5473613a1c1c2e8=
607
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1ac8ca1b8290842e8624

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1ac8ca1b8290842e8=
625
        failing since 236 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1a89394344157c2e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1a89394344157c2e8=
609
        failing since 236 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1a408fd018e6412e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1a408fd018e6412e8=
5ec
        failing since 236 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1ac9ca9fdb25e72e8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1ac9ca9fdb25e72e8=
638
        failing since 236 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1a9c1bbbd16e372e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1a9c1bbbd16e372e8=
605
        failing since 236 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1a5b56e546c17a2e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1a5b56e546c17a2e8=
5f1
        failing since 236 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1ad8f0d877280c2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1ad8f0d877280c2e8=
5e8
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1ab1a4a440f9952e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1ab1a4a440f9952e8=
618
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1a5c56e546c17a2e863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1a5c56e546c17a2e8=
63e
        failing since 238 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1aa7a5c206ce142e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1aa7a5c206ce142e8=
5f2
        failing since 1 day (last pass: next-20230505, first fail: next-202=
30508) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1f7f28444a94fe2e863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1f7f28444a94fe2e8=
63e
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2318b6d8eaee972e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2318b6d8eaee972e8=
5e7
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b19a293da92da892e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b19a293da92da892e8=
618
        failing since 168 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b17ae66500060e52e862b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b17ae66500060e52e8=
62c
        failing since 168 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2189e9992546aa2e8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2189e9992546aa2e8=
643
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | clang-17 | defcon=
fig                    | 3          =


  Details:     https://kernelci.org/test/plan/id/645b18aee9a37b0fa52e866f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230508111034+14f0=
776550b5-1~exp1~20230508111157.654))
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig/clang-17/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b18aee9a37b0fa52e8674
        new failure (last pass: next-20230508)

    2023-05-10T04:08:00.700545  <8>[   21.668199] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 429196_1.5.2.4.1>
    2023-05-10T04:08:00.807338  / # #
    2023-05-10T04:08:00.909447  export SHELL=3D/bin/sh
    2023-05-10T04:08:00.909960  #
    2023-05-10T04:08:01.011478  / # export SHELL=3D/bin/sh. /lava-429196/en=
vironment
    2023-05-10T04:08:01.011994  =

    2023-05-10T04:08:01.113564  / # . /lava-429196/environment/lava-429196/=
bin/lava-test-runner /lava-429196/1
    2023-05-10T04:08:01.114476  =

    2023-05-10T04:08:01.120553  / # /lava-429196/bin/lava-test-runner /lava=
-429196/1
    2023-05-10T04:08:01.171805  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b18aee9a37b0=
fa52e8676
        failing since 28 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-10T04:08:00.681005  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-10T04:08:00.682311  kern  :emerg : Code: 97fbe70a f9405688 5286=
4a69 72a686c9 (b9400908) =

    2023-05-10T04:08:00.697254  <8>[   21.665526] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-10T04:08:00.697632  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b18aee9a37b0=
fa52e8677
        failing since 28 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-10T04:08:00.652430  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-10T04:08:00.653720  kern  :alert : Mem abort info:
    2023-05-10T04:08:00.654076  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-10T04:08:00.655006  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-10T04:08:00.656357  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-10T04:08:00.656725  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-10T04:08:00.657587  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-10T04:08:00.658703  kern  :alert : Data abort info:
    2023-05-10T04:08:00.659058  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-10T04:08:00.659814  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/645b19c7bd40deeed92e85f3

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b19c7bd40deeed92e85f8
        failing since 1 day (last pass: next-20230505, first fail: next-202=
30508)

    2023-05-10T04:12:34.431400  <8>[   21.600535] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 429203_1.5.2.4.1>
    2023-05-10T04:12:34.537752  / # #
    2023-05-10T04:12:34.639882  export SHELL=3D/bin/sh
    2023-05-10T04:12:34.640394  #
    2023-05-10T04:12:34.741913  / # export SHELL=3D/bin/sh. /lava-429203/en=
vironment
    2023-05-10T04:12:34.742416  =

    2023-05-10T04:12:34.844081  / # . /lava-429203/environment/lava-429203/=
bin/lava-test-runner /lava-429203/1
    2023-05-10T04:12:34.845120  =

    2023-05-10T04:12:34.850836  / # /lava-429203/bin/lava-test-runner /lava=
-429203/1
    2023-05-10T04:12:34.900959  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b19c7bd40dee=
ed92e85fa
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-10T04:12:34.418057  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP
    2023-05-10T04:12:34.419289  kern  :emerg : Code: 97e5f0be f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-10T04:12:34.429415  <8>[   21.598561] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-10T04:12:34.429791  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b19c7bd40dee=
ed92e85fb
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-10T04:12:34.396097  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-10T04:12:34.397867  kern  :alert : Mem abort info:
    2023-05-10T04:12:34.398220  kern  :alert :   ESR =3D 0x0000000096000007
    2023-05-10T04:12:34.399753  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-10T04:12:34.401513  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-10T04:12:34.401869  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-10T04:12:34.403349  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-05-10T04:12:34.405047  kern  :alert : Data abort info:
    2023-05-10T04:12:34.405399  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-05-10T04:12:34.406757  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/645b1a2a26616bdf562e8659

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b1a2a26616bd=
f562e8660
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-10T04:14:15.496379  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-10T04:14:15.501979  kern  :emerg : Code: 97fde510 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-10T04:14:15.510293  <8>[   21.732372] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-10T04:14:15.510741  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b1a2a26616bd=
f562e8661
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-10T04:14:15.474419  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-10T04:14:15.474828  kern  :alert : Mem abort info:
    2023-05-10T04:14:15.475090  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-10T04:14:15.475722  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-10T04:14:15.476348  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-10T04:14:15.476669  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-10T04:14:15.478116  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-10T04:14:15.479874  kern  :alert : Data abort info:
    2023-05-10T04:14:15.480203  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-10T04:14:15.482157  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1c32fcd83f87f52e867f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1c32fcd83f87f52e8=
680
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/645b1daea7f0626cdc2e85ed

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b1daea7f0626=
cdc2e85f4
        failing since 28 days (last pass: next-20230404, first fail: next-2=
0230411)
        2 lines

    2023-05-10T04:29:23.396614  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-10T04:29:23.397970  kern  :emerg : Code: 97fe8510 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-10T04:29:23.409577  <8>[   23.684924] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-10T04:29:23.410063  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b1daea7f0626=
cdc2e85f5
        failing since 28 days (last pass: next-20230404, first fail: next-2=
0230411)
        12 lines

    2023-05-10T04:29:23.367795  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-10T04:29:23.369311  kern  :alert : Mem abort info:
    2023-05-10T04:29:23.370155  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-10T04:29:23.370964  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-10T04:29:23.372080  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-10T04:29:23.372676  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-10T04:29:23.373456  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-10T04:29:23.374711  kern  :alert : Data abort info:
    2023-05-10T04:29:23.375117  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-10T04:29:23.376052  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1f168827ba43732e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1f168827ba43732e8=
5ec
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/645b18bee97a8b6e3a2e8608

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230508111034+14f0=
776550b5-1~exp1~20230508111157.654))
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b18bee97a8b6=
e3a2e860f
        failing since 28 days (last pass: next-20230405, first fail: next-2=
0230411)
        2 lines

    2023-05-10T04:08:23.814070  <8>[   23.207113] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-10T04:08:23.814602  + set +x

    2023-05-10T04:08:23.814947  <8>[   23.209368] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265091_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b18bee97a8b6=
e3a2e8610
        failing since 28 days (last pass: next-20230405, first fail: next-2=
0230411)
        12 lines

    2023-05-10T04:08:23.743218  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-10T04:08:23.743749  kern  :alert : Mem abort info:

    2023-05-10T04:08:23.744085  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-10T04:08:23.744398  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-10T04:08:23.744701  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-10T04:08:23.744997  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-10T04:08:23.745286  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-10T04:08:23.745609  kern  :alert : Data abort info:

    2023-05-10T04:08:23.745894  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-10T04:08:23.746176  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/645b198783f16145df2e85f8

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b198783f1614=
5df2e85ff
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-10T04:11:32.029786  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP

    2023-05-10T04:11:32.030437  kern  :emerg : Code: 97dd30be f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-10T04:11:32.030940  <8>[   23.948730] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-10T04:11:32.031415  + set +x

    2023-05-10T04:11:32.031880  <8>[   23.950459] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265165_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b198783f1614=
5df2e8600
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-10T04:11:31.982085  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-10T04:11:31.982408  kern  :alert : Mem abort info:

    2023-05-10T04:11:31.982730  kern  :alert :   ESR =3D 0x0000000096000007

    2023-05-10T04:11:31.983143  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-10T04:11:31.983448  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-10T04:11:31.983761  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-10T04:11:31.984051  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault

    2023-05-10T04:11:31.984360  kern  :alert : Data abort info:

    2023-05-10T04:11:31.984716  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-05-10T04:11:31.985070  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/645b19a7698cab61942e868a

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b19a7698cab6=
1942e8691
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411)
        2 lines

    2023-05-10T04:12:07.133764  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-10T04:12:07.134293  kern  :emerg : Code: 97fae510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-10T04:12:07.134637  <8>[   23.861851] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-10T04:12:07.134958  + set +x

    2023-05-10T04:12:07.135266  <8>[   23.864088] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265182_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b19a7698cab6=
1942e8692
        failing since 28 days (last pass: next-20230406, first fail: next-2=
0230411)
        12 lines

    2023-05-10T04:12:07.086483  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-10T04:12:07.087013  kern  :alert : Mem abort info:

    2023-05-10T04:12:07.087352  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-10T04:12:07.087668  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-10T04:12:07.087971  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-10T04:12:07.088263  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-10T04:12:07.088552  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-10T04:12:07.088837  kern  :alert : Data abort info:

    2023-05-10T04:12:07.089119  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-10T04:12:07.089426  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1eaf9f40bbab2c2e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1eaf9f40bbab2c2e8=
5f7
        failing since 91 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b20a04c11ac1a122e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b20a04c11ac1a122e8=
60b
        failing since 5 days (last pass: next-20230209, first fail: next-20=
230504) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1a891bbbd16e372e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1a891bbbd16e372e8=
5f0
        failing since 5 days (last pass: next-20230222, first fail: next-20=
230504) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1c04ad06d2b73f2e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1c04ad06d2b73f2e8=
5ee
        new failure (last pass: next-20230504) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e1baa8117e8a42e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1e1baa8117e8a42e8=
5e8
        failing since 202 days (last pass: next-20221011, first fail: next-=
20221019) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2098260add366b2e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230510/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2098260add366b2e8=
5f6
        new failure (last pass: next-20230508) =

 =20
