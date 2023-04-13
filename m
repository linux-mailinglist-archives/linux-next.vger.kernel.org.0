Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 665DE6E1788
	for <lists+linux-next@lfdr.de>; Fri, 14 Apr 2023 00:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjDMWgZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Apr 2023 18:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbjDMWgW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Apr 2023 18:36:22 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D9C449A
        for <linux-next@vger.kernel.org>; Thu, 13 Apr 2023 15:36:11 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-634b28df952so1385799b3a.2
        for <linux-next@vger.kernel.org>; Thu, 13 Apr 2023 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681425371; x=1684017371;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nP4tOQEtPMmyTpo1uGZzayeNoBakK+1mNBlnzTZueBc=;
        b=fFUIHK5ue0TyaAeC0RL7u6W+D+fxXR1mGdXV2DKippnQGQn2GQNvFvZymYgpLV/wqq
         v9xz+ePxRTWT+FZrsRtYemlI/UpQJgX401Kn1VIL2FZHkvsFk7Z4F5n7D5Ubmg+GuITC
         p9NwJBe3UsPlLjtCdn9FVjfbOb81LuEgH4dEtgFKbOe4BwdpEhilFJ1pDaJ91FbRvwtR
         eIDVvw/B/DUN+2W98/SNJm/E1N5zKyccLO+dXyv83rlGpsWMJsNNFyYur21QrFFqdzjE
         z8+y5umjpbw8zaUbBkGCfnVyk6WebrQ81EvyASI5Sb5Ykeadc6hRrZGfOO4tbkIhn8lK
         k6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681425371; x=1684017371;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nP4tOQEtPMmyTpo1uGZzayeNoBakK+1mNBlnzTZueBc=;
        b=F9otwLWTiw4DIoNb+gyKl97YQEeozdhX4YcDfDp5CuqCZRVeBzljtR/jcD+m9BU+Sj
         ffNwQE6h0zZMyp0lZ8UvE0wgCCIy66QezIT8aXnf8Q3s+r0cbg5owhRkFoTfA6GJt99w
         LGdcK4ZRzBPZZniymLFjdKI/GJR18hA9ePEwIRPtDKzxUOX0S0DxuMpX16CDnqH0i2q/
         JtqKXaK7oWpBrNJrC5PVfpQ5BdL9iR58ELNZ+MvrgbUMMEIeWIYbAHYAslwRVQY7aWns
         TWBykoUwXJprQ9yF02w6Poeiz2/362SE9VoeLpUQ6Wp2FgnO8VbUKuUyshMjovAgBVPi
         5PuQ==
X-Gm-Message-State: AAQBX9cBWspXpfFEGb3oBEF4Yrxkxq+1vi7JtgOOM+fxGkWx1HC5oxAL
        2+R12Yw1nqFVd6KIPmJTb0zK+j0/lJ8njZHyIsLnDn/k
X-Google-Smtp-Source: AKy350b66B6x5qPVamAznVIr7tvYl++ajH8JvH3yGQ79IRh70xiz139ehzRFxsqROknYQG4ww2HRIw==
X-Received: by 2002:a05:6a00:10ca:b0:635:d5d9:8ff5 with SMTP id d10-20020a056a0010ca00b00635d5d98ff5mr5124365pfu.23.1681425368853;
        Thu, 13 Apr 2023 15:36:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g22-20020aa78756000000b0063799398eaesm1845981pfo.51.2023.04.13.15.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 15:36:07 -0700 (PDT)
Message-ID: <643883d7.a70a0220.541ec.43c8@mx.google.com>
Date:   Thu, 13 Apr 2023 15:36:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-rc6-249-g122e82851461
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 722 runs,
 78 regressions (v6.3-rc6-249-g122e82851461)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 722 runs, 78 regressions (v6.3-rc6-249-g122e82=
851461)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

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

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc6-249-g122e82851461/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc6-249-g122e82851461
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      122e828514618df81854447598972c6436931f63 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f13aa25d70a062e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f13aa25d70a062e8=
5e7
        failing since 183 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64384fdf4c1361b8382e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384fdf4c1361b8382e8=
5f3
        failing since 185 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64384b371ffd3d2a3a2e85e8

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384b371ffd3d2a3a2e85ed
        failing since 16 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:34:18.147174  <8>[   10.131263] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964487_1.4.2.3.1>

    2023-04-13T18:34:18.150568  + set +x

    2023-04-13T18:34:18.258947  / # #

    2023-04-13T18:34:18.361702  export SHELL=3D/bin/sh

    2023-04-13T18:34:18.362428  #

    2023-04-13T18:34:18.464266  / # export SHELL=3D/bin/sh. /lava-9964487/e=
nvironment

    2023-04-13T18:34:18.465025  =


    2023-04-13T18:34:18.566890  / # . /lava-9964487/environment/lava-996448=
7/bin/lava-test-runner /lava-9964487/1

    2023-04-13T18:34:18.568121  =


    2023-04-13T18:34:18.610035  / # /lava-9964487/bin/lava-test-runner /lav=
a-9964487/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384bc235cb947c5c2e86d1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384bc235cb947c5c2e86d6
        failing since 13 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-13T18:36:36.018900  <8>[   13.049275] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964577_1.4.2.3.1>

    2023-04-13T18:36:36.023582  + set +x

    2023-04-13T18:36:36.130126  #

    2023-04-13T18:36:36.231379  / # #export SHELL=3D/bin/sh

    2023-04-13T18:36:36.231576  =


    2023-04-13T18:36:36.332827  / # export SHELL=3D/bin/sh. /lava-9964577/e=
nvironment

    2023-04-13T18:36:36.333832  =


    2023-04-13T18:36:36.435971  / # . /lava-9964577/environment/lava-996457=
7/bin/lava-test-runner /lava-9964577/1

    2023-04-13T18:36:36.437382  =


    2023-04-13T18:36:36.443341  / # /lava-9964577/bin/lava-test-runner /lav=
a-9964577/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64384c3caa8bb59b6d2e867d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384c3caa8bb59b6d2e8682
        failing since 16 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:38:37.377157  <8>[   10.280993] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964685_1.4.2.3.1>

    2023-04-13T18:38:37.380626  + set +x

    2023-04-13T18:38:37.482619  #

    2023-04-13T18:38:37.482953  =


    2023-04-13T18:38:37.583727  / # #export SHELL=3D/bin/sh

    2023-04-13T18:38:37.583906  =


    2023-04-13T18:38:37.684838  / # export SHELL=3D/bin/sh. /lava-9964685/e=
nvironment

    2023-04-13T18:38:37.685049  =


    2023-04-13T18:38:37.786026  / # . /lava-9964685/environment/lava-996468=
5/bin/lava-test-runner /lava-9964685/1

    2023-04-13T18:38:37.786343  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64384b2203d602d3f22e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384b2203d602d3f22e85f9
        failing since 16 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:33:52.795924  + set<8>[   11.638831] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9964473_1.4.2.3.1>

    2023-04-13T18:33:52.796007   +x

    2023-04-13T18:33:52.900837  / # #

    2023-04-13T18:33:53.001545  export SHELL=3D/bin/sh

    2023-04-13T18:33:53.001736  #

    2023-04-13T18:33:53.102611  / # export SHELL=3D/bin/sh. /lava-9964473/e=
nvironment

    2023-04-13T18:33:53.102792  =


    2023-04-13T18:33:53.203677  / # . /lava-9964473/environment/lava-996447=
3/bin/lava-test-runner /lava-9964473/1

    2023-04-13T18:33:53.203938  =


    2023-04-13T18:33:53.208359  / # /lava-9964473/bin/lava-test-runner /lav=
a-9964473/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/64384bc4f25a768a532e85f9

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384bc4f25a768a532e85fe
        failing since 13 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-13T18:36:45.397948  + set +x

    2023-04-13T18:36:45.401587  <8>[   16.101912] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964585_1.4.2.3.1>

    2023-04-13T18:36:45.507339  / # #

    2023-04-13T18:36:45.608349  export SHELL=3D/bin/sh

    2023-04-13T18:36:45.608526  #

    2023-04-13T18:36:45.709337  / # export SHELL=3D/bin/sh. /lava-9964585/e=
nvironment

    2023-04-13T18:36:45.709532  =


    2023-04-13T18:36:45.810401  / # . /lava-9964585/environment/lava-996458=
5/bin/lava-test-runner /lava-9964585/1

    2023-04-13T18:36:45.810652  =


    2023-04-13T18:36:45.815457  / # /lava-9964585/bin/lava-test-runner /lav=
a-9964585/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64384bc4f25a768=
a532e8600
        failing since 2 days (last pass: v6.3-rc5-284-g1beddc8728ad, first =
fail: v6.3-rc6-158-g254ff7648cb9)
        3 lines

    2023-04-13T18:36:45.374566  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-04-13T18:36:45.381104  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-04-13T18:36:45.387606  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-13T18:36:45.394292  <8>[   16.085252] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64384c15e191593a132e862c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384c15e191593a132e8631
        failing since 16 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:37:53.264505  + set<8>[   11.790521] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9964663_1.4.2.3.1>

    2023-04-13T18:37:53.264996   +x

    2023-04-13T18:37:53.374451  / # #

    2023-04-13T18:37:53.477360  export SHELL=3D/bin/sh

    2023-04-13T18:37:53.478131  #

    2023-04-13T18:37:53.579955  / # export SHELL=3D/bin/sh. /lava-9964663/e=
nvironment

    2023-04-13T18:37:53.580713  =


    2023-04-13T18:37:53.682502  / # . /lava-9964663/environment/lava-996466=
3/bin/lava-test-runner /lava-9964663/1

    2023-04-13T18:37:53.683600  =


    2023-04-13T18:37:53.688746  / # /lava-9964663/bin/lava-test-runner /lav=
a-9964663/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64384b361fce7cc0732e8616

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384b361fce7cc0732e861b
        failing since 16 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:34:06.247755  <8>[   11.222576] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964511_1.4.2.3.1>

    2023-04-13T18:34:06.251708  + set +x

    2023-04-13T18:34:06.353726  =


    2023-04-13T18:34:06.454769  / # #export SHELL=3D/bin/sh

    2023-04-13T18:34:06.454926  =


    2023-04-13T18:34:06.555892  / # export SHELL=3D/bin/sh. /lava-9964511/e=
nvironment

    2023-04-13T18:34:06.556069  =


    2023-04-13T18:34:06.656798  / # . /lava-9964511/environment/lava-996451=
1/bin/lava-test-runner /lava-9964511/1

    2023-04-13T18:34:06.657042  =


    2023-04-13T18:34:06.661950  / # /lava-9964511/bin/lava-test-runner /lav=
a-9964511/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384bc135cb947c5c2e86ad

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384bc135cb947c5c2e86b2
        failing since 13 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-13T18:36:27.251959  <8>[   12.191354] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964568_1.4.2.3.1>

    2023-04-13T18:36:27.256204  + set +x

    2023-04-13T18:36:27.363137  #

    2023-04-13T18:36:27.364612  =


    2023-04-13T18:36:27.467200  / # #export SHELL=3D/bin/sh

    2023-04-13T18:36:27.468129  =


    2023-04-13T18:36:27.570122  / # export SHELL=3D/bin/sh. /lava-9964568/e=
nvironment

    2023-04-13T18:36:27.570824  =


    2023-04-13T18:36:27.672912  / # . /lava-9964568/environment/lava-996456=
8/bin/lava-test-runner /lava-9964568/1

    2023-04-13T18:36:27.673258  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64384bfe6392a1740d2e8678

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384bfe6392a1740d2e867d
        failing since 16 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:37:33.704909  <8>[   10.293201] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964652_1.4.2.3.1>

    2023-04-13T18:37:33.708231  + set +x

    2023-04-13T18:37:33.809770  /#

    2023-04-13T18:37:33.910974   # #export SHELL=3D/bin/sh

    2023-04-13T18:37:33.911126  =


    2023-04-13T18:37:34.012039  / # export SHELL=3D/bin/sh. /lava-9964652/e=
nvironment

    2023-04-13T18:37:34.012194  =


    2023-04-13T18:37:34.113113  / # . /lava-9964652/environment/lava-996465=
2/bin/lava-test-runner /lava-9964652/1

    2023-04-13T18:37:34.113348  =


    2023-04-13T18:37:34.118632  / # /lava-9964652/bin/lava-test-runner /lav=
a-9964652/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64384aa6e546156ede2e85ed

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384aa6e546156ede2e861f
        failing since 7 days (last pass: v6.3-rc5-258-g0f20c88b6871, first =
fail: v6.3-rc5-284-g1beddc8728ad)

    2023-04-13T18:31:45.827951  + set +x
    2023-04-13T18:31:45.831633  <8>[   18.223153] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 324430_1.5.2.4.1>
    2023-04-13T18:31:45.966225  / # #
    2023-04-13T18:31:46.068299  export SHELL=3D/bin/sh
    2023-04-13T18:31:46.069023  #
    2023-04-13T18:31:46.170944  / # export SHELL=3D/bin/sh. /lava-324430/en=
vironment
    2023-04-13T18:31:46.171505  =

    2023-04-13T18:31:46.273163  / # . /lava-324430/environment/lava-324430/=
bin/lava-test-runner /lava-324430/1
    2023-04-13T18:31:46.273998  =

    2023-04-13T18:31:46.280115  / # /lava-324430/bin/lava-test-runner /lava=
-324430/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64384b371fce7cc0732e8625

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384b371fce7cc0732e862a
        failing since 92 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-04-13T18:34:16.954985  / # #

    2023-04-13T18:34:17.056733  export SHELL=3D/bin/sh

    2023-04-13T18:34:17.057413  #

    2023-04-13T18:34:17.159314  / # export SHELL=3D/bin/sh. /lava-9964386/e=
nvironment

    2023-04-13T18:34:17.160162  =


    2023-04-13T18:34:17.262206  / # . /lava-9964386/environment/lava-996438=
6/bin/lava-test-runner /lava-9964386/1

    2023-04-13T18:34:17.263435  =


    2023-04-13T18:34:17.275085  / # /lava-9964386/bin/lava-test-runner /lav=
a-9964386/1

    2023-04-13T18:34:17.388683  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-13T18:34:17.389229  + cd /lava-9964386/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64384cdcdada0ac5b32e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384cdcdada0ac5b32e8=
5e8
        failing since 45 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64384cfb210cce3cdd2e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384cfb210cce3cdd2e8=
5f6
        failing since 81 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64384ffce9667418db2e8675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384ffce9667418db2e8=
676
        failing since 2 days (last pass: v6.3-rc5-284-g1beddc8728ad, first =
fail: v6.3-rc6-158-g254ff7648cb9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64384c333293cf22402e85f2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384c333293cf22402e85f7
        failing since 86 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-13T18:38:20.140295  <8>[   15.061627] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3492666_1.5.2.4.1>
    2023-04-13T18:38:20.249254  / # #
    2023-04-13T18:38:20.352683  export SHELL=3D/bin/sh
    2023-04-13T18:38:20.353729  #
    2023-04-13T18:38:20.455978  / # export SHELL=3D/bin/sh. /lava-3492666/e=
nvironment
    2023-04-13T18:38:20.456961  =

    2023-04-13T18:38:20.559135  / # . /lava-3492666/environment/lava-349266=
6/bin/lava-test-runner /lava-3492666/1
    2023-04-13T18:38:20.560616  =

    2023-04-13T18:38:20.565047  / # /lava-3492666/bin/lava-test-runner /lav=
a-3492666/1
    2023-04-13T18:38:20.640947  <3>[   15.566067] Bluetooth: hci0: command =
0x0c03 tx timeout =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64384d23ae850cd3c42e85f6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384d23ae850cd3c42e85fb
        failing since 86 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-13T18:42:34.224297  <8>[   14.730433] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3492696_1.5.2.4.1>
    2023-04-13T18:42:34.332757  / # #
    2023-04-13T18:42:34.435390  export SHELL=3D/bin/sh
    2023-04-13T18:42:34.436193  #<3>[   14.847112] Bluetooth: hci0: command=
 0x0c03 tx timeout
    2023-04-13T18:42:34.436655  =

    2023-04-13T18:42:34.538441  / # export SHELL=3D/bin/sh. /lava-3492696/e=
nvironment
    2023-04-13T18:42:34.539257  =

    2023-04-13T18:42:34.641167  / # . /lava-3492696/environment/lava-349269=
6/bin/lava-test-runner /lava-3492696/1
    2023-04-13T18:42:34.642486  =

    2023-04-13T18:42:34.647187  / # /lava-3492696/bin/lava-test-runner /lav=
a-3492696/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64384dafcb50ad6ac92e85fd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384dafcb50ad6ac92e8602
        failing since 86 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-13T18:44:54.142836  + set +x
    2023-04-13T18:44:54.152518  <8>[   14.650695] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3492725_1.5.2.4.1>
    2023-04-13T18:44:54.263243  / # #
    2023-04-13T18:44:54.367310  export SHELL=3D/bin/sh
    2023-04-13T18:44:54.368486  #
    2023-04-13T18:44:54.471431  / # export SHELL=3D/bin/sh. /lava-3492725/e=
nvironment
    2023-04-13T18:44:54.472397  =

    2023-04-13T18:44:54.574672  / # . /lava-3492725/environment/lava-349272=
5/bin/lava-test-runner /lava-3492725/1
    2023-04-13T18:44:54.576389  =

    2023-04-13T18:44:54.576843  / # <3>[   15.006823] Bluetooth: hci0: comm=
and 0x0c03 tx timeout =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643852614d1c2417952e8607

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643852614d1c2417952e860c
        failing since 86 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-13T19:04:32.233875  <8>[   16.827125] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3492788_1.5.2.4.1>
    2023-04-13T19:04:32.340627  / # #
    2023-04-13T19:04:32.443859  export SHELL=3D/bin/sh
    2023-04-13T19:04:32.444741  #
    2023-04-13T19:04:32.546741  / # export SHELL=3D/bin/sh. /lava-3492788/e=
nvironment
    2023-04-13T19:04:32.547601  =

    2023-04-13T19:04:32.649579  / # . /lava-3492788/environment/lava-349278=
8/bin/lava-test-runner /lava-3492788/1
    2023-04-13T19:04:32.651127  =

    2023-04-13T19:04:32.655532  / # /lava-3492788/bin/lava-test-runner /lav=
a-3492788/1
    2023-04-13T19:04:32.751118  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64385325089ecb05f42e8660

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64385325089ecb05f42e8665
        failing since 86 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-13T19:08:06.635484  <8>[   24.476784] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3492812_1.5.2.4.1>
    2023-04-13T19:08:06.742283  / # #
    2023-04-13T19:08:06.844158  export SHELL=3D/bin/sh
    2023-04-13T19:08:06.844890  #
    2023-04-13T19:08:06.947039  / # export SHELL=3D/bin/sh. /lava-3492812/e=
nvironment
    2023-04-13T19:08:06.947391  =

    2023-04-13T19:08:07.048566  / # . /lava-3492812/environment/lava-349281=
2/bin/lava-test-runner /lava-3492812/1
    2023-04-13T19:08:07.049178  =

    2023-04-13T19:08:07.053649  / # /lava-3492812/bin/lava-test-runner /lav=
a-3492812/1
    2023-04-13T19:08:07.150864  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/643848871bd691c1ac2e85f2

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643848871bd691c=
1ac2e85f9
        failing since 41 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-04-13T18:22:45.253083  kern  :alert : Register r7 information: non=
-paged memory
    2023-04-13T18:22:45.253744  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4b08200 pointer offset 4 size 512
    2023-04-13T18:22:45.254359  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-13T18:22:45.254903  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-13T18:22:45.255395  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e6000 allocated at load_module+0x898/0=
x1b10
    2023-04-13T18:22:45.256321  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-13T18:22:45.349658  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-13T18:22:45.350398  kern  :emerg : Process udevd (pid: 74, stac=
k limit =3D 0xd430f35f)
    2023-04-13T18:22:45.351315  kern  :emerg : Stack: (0xc8991cf8 to 0xc899=
2000)
    2023-04-13T18:22:45.351896  kern  :emerg : 1ce0:                       =
                                c4b08200 c076f860 =

    ... (7 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643848871bd691c=
1ac2e85fa
        failing since 444 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-04-13T18:22:45.162279  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-04-13T18:22:45.163095  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-04-13T18:22:45.163633  kern  :alert : 8<--- cut here ---
    2023-04-13T18:22:45.164161  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-04-13T18:22:45.164636  kern  :alert : [00000060] *pgd=3Dc4ab0831, =
*pte=3D00000000, *ppte=3D00000000
    2023-04-13T18:22:45.165018  kern  :alert : Register r0 information: non=
-paged memory
    2023-04-13T18:22:45.205165  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8990000 allocated at kernel_clone+0x98/0x=
3a0
    2023-04-13T18:22:45.205959  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-13T18:22:45.206900  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-13T18:22:45.207317  kern  :alert : Register r4 infor<8><LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D18> =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64385016e3fe1225482e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64385016e3fe1225482e8=
603
        failing since 108 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64384d02210cce3cdd2e861b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384d02210cce3cdd2e8620
        failing since 16 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:41:54.893101  + set +x

    2023-04-13T18:41:54.899483  <8>[   10.663580] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964504_1.4.2.3.1>

    2023-04-13T18:41:55.004061  / # #

    2023-04-13T18:41:55.105135  export SHELL=3D/bin/sh

    2023-04-13T18:41:55.105413  #

    2023-04-13T18:41:55.206392  / # export SHELL=3D/bin/sh. /lava-9964504/e=
nvironment

    2023-04-13T18:41:55.206627  =


    2023-04-13T18:41:55.307610  / # . /lava-9964504/environment/lava-996450=
4/bin/lava-test-runner /lava-9964504/1

    2023-04-13T18:41:55.308005  =


    2023-04-13T18:41:55.312792  / # /lava-9964504/bin/lava-test-runner /lav=
a-9964504/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384d15bfed3400082e85f9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384d15bfed3400082e85fe
        failing since 13 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-13T18:42:05.859980  + set +x

    2023-04-13T18:42:05.866382  <8>[   15.175028] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964597_1.4.2.3.1>

    2023-04-13T18:42:05.972279  / # #

    2023-04-13T18:42:06.073386  export SHELL=3D/bin/sh

    2023-04-13T18:42:06.073619  #

    2023-04-13T18:42:06.174564  / # export SHELL=3D/bin/sh. /lava-9964597/e=
nvironment

    2023-04-13T18:42:06.174763  =


    2023-04-13T18:42:06.275602  / # . /lava-9964597/environment/lava-996459=
7/bin/lava-test-runner /lava-9964597/1

    2023-04-13T18:42:06.275874  =


    2023-04-13T18:42:06.279966  / # /lava-9964597/bin/lava-test-runner /lav=
a-9964597/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64384d4987de664ef82e8636

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384d4987de664ef82e863b
        failing since 16 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:43:10.543908  + set +x

    2023-04-13T18:43:10.550360  <8>[   10.178114] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964648_1.4.2.3.1>

    2023-04-13T18:43:10.655275  / # #

    2023-04-13T18:43:10.756301  export SHELL=3D/bin/sh

    2023-04-13T18:43:10.756531  #

    2023-04-13T18:43:10.857459  / # export SHELL=3D/bin/sh. /lava-9964648/e=
nvironment

    2023-04-13T18:43:10.857641  =


    2023-04-13T18:43:10.958602  / # . /lava-9964648/environment/lava-996464=
8/bin/lava-test-runner /lava-9964648/1

    2023-04-13T18:43:10.958953  =


    2023-04-13T18:43:10.963400  / # /lava-9964648/bin/lava-test-runner /lav=
a-9964648/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64384b1b206da38b2a2e8615

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384b1b206da38b2a2e861a
        failing since 16 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:33:47.341674  + set +x<8>[   10.580869] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9964495_1.4.2.3.1>

    2023-04-13T18:33:47.341782  =


    2023-04-13T18:33:47.444175  #

    2023-04-13T18:33:47.545383  / # #export SHELL=3D/bin/sh

    2023-04-13T18:33:47.545588  =


    2023-04-13T18:33:47.646513  / # export SHELL=3D/bin/sh. /lava-9964495/e=
nvironment

    2023-04-13T18:33:47.646726  =


    2023-04-13T18:33:47.747666  / # . /lava-9964495/environment/lava-996449=
5/bin/lava-test-runner /lava-9964495/1

    2023-04-13T18:33:47.748002  =


    2023-04-13T18:33:47.753884  / # /lava-9964495/bin/lava-test-runner /lav=
a-9964495/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384bc2f25a768a532e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384bc2f25a768a532e85eb
        failing since 13 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-13T18:36:37.454803  + set<8>[   13.602590] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9964595_1.4.2.3.1>

    2023-04-13T18:36:37.455246   +x

    2023-04-13T18:36:37.562582  / # #

    2023-04-13T18:36:37.665019  export SHELL=3D/bin/sh

    2023-04-13T18:36:37.665747  #

    2023-04-13T18:36:37.767679  / # export SHELL=3D/bin/sh. /lava-9964595/e=
nvironment

    2023-04-13T18:36:37.768400  =


    2023-04-13T18:36:37.870224  / # . /lava-9964595/environment/lava-996459=
5/bin/lava-test-runner /lava-9964595/1

    2023-04-13T18:36:37.871373  =


    2023-04-13T18:36:37.876354  / # /lava-9964595/bin/lava-test-runner /lav=
a-9964595/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64384bfe90495bee552e8643

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384bfe90495bee552e8648
        failing since 16 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:37:36.413396  <8>[   10.640488] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964640_1.4.2.3.1>

    2023-04-13T18:37:36.417140  + set +x

    2023-04-13T18:37:36.522295  #

    2023-04-13T18:37:36.625329  / # #export SHELL=3D/bin/sh

    2023-04-13T18:37:36.626109  =


    2023-04-13T18:37:36.728041  / # export SHELL=3D/bin/sh. /lava-9964640/e=
nvironment

    2023-04-13T18:37:36.728869  =


    2023-04-13T18:37:36.830777  / # . /lava-9964640/environment/lava-996464=
0/bin/lava-test-runner /lava-9964640/1

    2023-04-13T18:37:36.831928  =


    2023-04-13T18:37:36.837186  / # /lava-9964640/bin/lava-test-runner /lav=
a-9964640/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64384b37fc25e6d5792e861d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384b37fc25e6d5792e8622
        failing since 16 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:34:09.934823  + <8>[   10.888253] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9964537_1.4.2.3.1>

    2023-04-13T18:34:09.935429  set +x

    2023-04-13T18:34:10.043878  / # #

    2023-04-13T18:34:10.146647  export SHELL=3D/bin/sh

    2023-04-13T18:34:10.147654  #

    2023-04-13T18:34:10.250017  / # export SHELL=3D/bin/sh. /lava-9964537/e=
nvironment

    2023-04-13T18:34:10.250714  =


    2023-04-13T18:34:10.352604  / # . /lava-9964537/environment/lava-996453=
7/bin/lava-test-runner /lava-9964537/1

    2023-04-13T18:34:10.353876  =


    2023-04-13T18:34:10.358588  / # /lava-9964537/bin/lava-test-runner /lav=
a-9964537/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384bb935cb947c5c2e8628

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384bb935cb947c5c2e862d
        failing since 13 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-13T18:36:21.810835  + set +x

    2023-04-13T18:36:21.814526  <8>[   14.562532] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9964567_1.4.2.3.1>

    2023-04-13T18:36:21.920411  / # #

    2023-04-13T18:36:22.021415  export SHELL=3D/bin/sh

    2023-04-13T18:36:22.021599  #

    2023-04-13T18:36:22.122478  / # export SHELL=3D/bin/sh. /lava-9964567/e=
nvironment

    2023-04-13T18:36:22.122714  =


    2023-04-13T18:36:22.223668  / # . /lava-9964567/environment/lava-996456=
7/bin/lava-test-runner /lava-9964567/1

    2023-04-13T18:36:22.223948  =


    2023-04-13T18:36:22.228280  / # /lava-9964567/bin/lava-test-runner /lav=
a-9964567/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64384c13e191593a132e8613

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384c13e191593a132e8618
        failing since 16 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:37:54.299993  + set<8>[   10.947185] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9964665_1.4.2.3.1>

    2023-04-13T18:37:54.300111   +x

    2023-04-13T18:37:54.404970  / # #

    2023-04-13T18:37:54.506008  export SHELL=3D/bin/sh

    2023-04-13T18:37:54.506217  #

    2023-04-13T18:37:54.607124  / # export SHELL=3D/bin/sh. /lava-9964665/e=
nvironment

    2023-04-13T18:37:54.607353  =


    2023-04-13T18:37:54.708320  / # . /lava-9964665/environment/lava-996466=
5/bin/lava-test-runner /lava-9964665/1

    2023-04-13T18:37:54.708610  =


    2023-04-13T18:37:54.714206  / # /lava-9964665/bin/lava-test-runner /lav=
a-9964665/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f3ee88eb3af6b2e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f3ee88eb3af6b2e8=
610
        failing since 210 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6438547f2cb7a3e77c2e86af

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6u=
l-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6u=
l-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6438547f2cb7a3e77c2e86b4
        failing since 98 days (last pass: v6.1-rc4-339-g185da88d03ed, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-13T19:13:52.681102  + set +x
    2023-04-13T19:13:52.682232  <8>[   57.703624] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1199426_1.5.2.4.1>
    2023-04-13T19:13:52.792585  =

    2023-04-13T19:13:53.951740  / # #export SHELL=3D/bin/sh
    2023-04-13T19:13:53.957462  =

    2023-04-13T19:13:55.503946  / # export SHELL=3D/bin/sh. /lava-1199426/e=
nvironment
    2023-04-13T19:13:55.509638  =

    2023-04-13T19:13:58.330974  / # . /lava-1199426/environment/lava-119942=
6/bin/lava-test-runner /lava-1199426/1
    2023-04-13T19:13:58.337289  =

    2023-04-13T19:13:58.337620  / # /lava-1199426/bin/lava-test-runner /lav=
a-1199426/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6438507d91887e9c622e85f5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6438507d91887e9c622e85fa
        failing since 98 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-13T18:56:42.044649  / # #
    2023-04-13T18:56:43.203461  export SHELL=3D/bin/sh
    2023-04-13T18:56:43.209182  #
    2023-04-13T18:56:44.756062  / # export SHELL=3D/bin/sh. /lava-1199425/e=
nvironment
    2023-04-13T18:56:44.761478  =

    2023-04-13T18:56:47.579939  / # . /lava-1199425/environment/lava-119942=
5/bin/lava-test-runner /lava-1199425/1
    2023-04-13T18:56:47.585676  =

    2023-04-13T18:56:47.585866  / # /lava-1199425/bin/lava-test-runner /lav=
a-1199425/1
    2023-04-13T18:56:47.678981  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-13T18:56:47.679576  + cd /lava-1199425/1/tests/1_bootrr =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/643854d593daa760aa2e85ef

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643854d593daa760aa2e85f4
        failing since 98 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-04-13T19:15:05.224281  + set +x<8>[   66.944393] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1199423_1.5.2.4.1>
    2023-04-13T19:15:05.224588  =

    2023-04-13T19:15:05.333902  / # #
    2023-04-13T19:15:06.494212  export SHELL=3D/bin/sh
    2023-04-13T19:15:06.499898  #
    2023-04-13T19:15:06.500188  / # export SHELL=3D/bin/sh
    2023-04-13T19:15:08.047885  / # . /lava-1199423/environment
    2023-04-13T19:15:10.873416  /lava-1199423/bin/lava-test-runner /lava-11=
99423/1
    2023-04-13T19:15:10.879392  . /lava-1199423/environment
    2023-04-13T19:15:10.879606  / # /lava-1199423/bin/lava-test-runner /lav=
a-1199423/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64384bebb6e2415c022e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384bebb6e2415c022e8=
5e8
        failing since 348 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6438521a7277d56ce42e8676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6438521a7277d56ce42e8=
677
        failing since 65 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64385228d41e04fc5d2e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-j721=
e-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-j721=
e-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64385228d41e04fc5d2e8=
5f5
        new failure (last pass: v6.3-rc6-186-g99455a05abbd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/64384bc881654ac0bd2e8657

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384bc881654ac0bd2e865a
        new failure (last pass: v6.3-rc6-186-g99455a05abbd)

    2023-04-13T18:36:30.694741  / # #
    2023-04-13T18:36:30.795649  export SHELL=3D/bin/sh
    2023-04-13T18:36:30.795905  #
    2023-04-13T18:36:30.897204  / # export SHELL=3D/bin/sh. /lava-318038/en=
vironment
    2023-04-13T18:36:30.897982  =

    2023-04-13T18:36:30.999696  / # . /lava-318038/environment/lava-318038/=
bin/lava-test-runner /lava-318038/1
    2023-04-13T18:36:31.000219  =

    2023-04-13T18:36:31.004183  / # /lava-318038/bin/lava-test-runner /lava=
-318038/1
    2023-04-13T18:36:31.069920  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-13T18:36:31.070099  + cd /l<8>[   15.062255] <LAVA_SIGNAL_START=
RUN 1_bootrr 318038_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/643=
84bc981654ac0bd2e866a
        new failure (last pass: v6.3-rc6-186-g99455a05abbd)

    2023-04-13T18:36:33.452182  /lava-318038/1/../bin/lava-test-case
    2023-04-13T18:36:33.452666  <8>[   17.539374] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-04-13T18:36:33.453109  /lava-318038/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64384b2503d602d3f22e8606

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384b2503d602d3f22e860b
        failing since 16 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:33:57.091035  + set<8>[   11.878816] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9964475_1.4.2.3.1>

    2023-04-13T18:33:57.091142   +x

    2023-04-13T18:33:57.195808  / # #

    2023-04-13T18:33:57.296884  export SHELL=3D/bin/sh

    2023-04-13T18:33:57.297126  #

    2023-04-13T18:33:57.398029  / # export SHELL=3D/bin/sh. /lava-9964475/e=
nvironment

    2023-04-13T18:33:57.398238  =


    2023-04-13T18:33:57.499252  / # . /lava-9964475/environment/lava-996447=
5/bin/lava-test-runner /lava-9964475/1

    2023-04-13T18:33:57.499564  =


    2023-04-13T18:33:57.504147  / # /lava-9964475/bin/lava-test-runner /lav=
a-9964475/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384bc235cb947c5c2e86bb

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384bc235cb947c5c2e86c0
        failing since 13 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-13T18:36:35.659049  + set<8>[   13.823246] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9964606_1.4.2.3.1>

    2023-04-13T18:36:35.659145   +x

    2023-04-13T18:36:35.764570  / # #

    2023-04-13T18:36:35.865658  export SHELL=3D/bin/sh

    2023-04-13T18:36:35.865876  #

    2023-04-13T18:36:35.966845  / # export SHELL=3D/bin/sh. /lava-9964606/e=
nvironment

    2023-04-13T18:36:35.967074  =


    2023-04-13T18:36:36.067948  / # . /lava-9964606/environment/lava-996460=
6/bin/lava-test-runner /lava-9964606/1

    2023-04-13T18:36:36.068252  =


    2023-04-13T18:36:36.072526  / # /lava-9964606/bin/lava-test-runner /lav=
a-9964606/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64384bf7bff89e05b22e85f7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64384bf7bff89e05b22e85fc
        failing since 16 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-13T18:37:28.447501  + set<8>[   11.930398] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9964677_1.4.2.3.1>

    2023-04-13T18:37:28.447620   +x

    2023-04-13T18:37:28.552834  / # #

    2023-04-13T18:37:28.654039  export SHELL=3D/bin/sh

    2023-04-13T18:37:28.654325  #

    2023-04-13T18:37:28.755310  / # export SHELL=3D/bin/sh. /lava-9964677/e=
nvironment

    2023-04-13T18:37:28.755569  =


    2023-04-13T18:37:28.856410  / # . /lava-9964677/environment/lava-996467=
7/bin/lava-test-runner /lava-9964677/1

    2023-04-13T18:37:28.856879  =


    2023-04-13T18:37:28.861661  / # /lava-9964677/bin/lava-test-runner /lav=
a-9964677/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/643854ee93daa760aa2e8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643854ee93daa760aa2e8=
664
        new failure (last pass: v6.3-rc6-186-g99455a05abbd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384df4ccfbfa1f422e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384df4ccfbfa1f422e8=
5fd
        failing since 79 days (last pass: v6.2-rc5-157-g1f16e03afb18, first=
 fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384de0ccfbfa1f422e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384de0ccfbfa1f422e8=
5e7
        failing since 65 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6438522bd41e04fc5d2e8602

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/643=
8522bd41e04fc5d2e8652
        failing since 50 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-04-13T19:04:02.414109  /lava-9965010/1/../bin/lava-test-case

    2023-04-13T19:04:02.424129  <8>[   23.427388] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/6438522bd41e04fc5d2e86a3
        failing since 45 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-13T19:03:58.367554  <3>[   19.374449] Bluetooth: hci0: command =
0x0c14 tx timeout

    2023-04-13T19:03:58.376747  <3>[   19.374450] Bluetooth: hci0: Opcode 0=
x c14 failed: -110

    2023-04-13T19:03:58.517304  /lava-9965010/1/../bin/lava-test-case

    2023-04-13T19:03:58.527532  <8>[   19.531289] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/6438522bd41e04fc5d2e86ab
        failing since 45 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-13T19:03:59.545900  /lava-9965010/1/../bin/lava-test-case

    2023-04-13T19:03:59.555664  <8>[   20.559555] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384de0483419b0c52e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384de0483419b0c52e8=
5e7
        failing since 65 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6438527d08c1ef81fd2e85e7

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/6438527d08c1ef81fd2e8698
        failing since 45 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-13T19:04:57.461664  /lava-9965043/1/../bin/lava-test-case

    2023-04-13T19:04:57.468492  <8>[   20.953092] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/6438527d08c1ef81fd2e8699
        failing since 45 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-13T19:04:56.441906  /lava-9965043/1/../bin/lava-test-case

    2023-04-13T19:04:56.448213  <8>[   19.933247] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/6438527d08c1ef81fd2e869a
        failing since 45 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-04-13T19:04:55.422434  /lava-9965043/1/../bin/lava-test-case

    2023-04-13T19:04:55.429595  <8>[   18.913837] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64384b9b1c22a298392e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384b9b1c22a298392e8=
5f5
        failing since 183 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643851f875eb8e06db2e8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linar=
o-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linar=
o-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643851f875eb8e06db2e8=
637
        failing since 65 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f1d288d5be3112e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f1d288d5be3112e8=
5ee
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f33d9951fa3bf2e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f33d9951fa3bf2e8=
5f4
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f21d9951fa3bf2e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f21d9951fa3bf2e8=
5e9
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f1c9f5740769d2e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f1c9f5740769d2e8=
5f9
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f219f5740769d2e8619

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f219f5740769d2e8=
61a
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f20288d5be3112e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f20288d5be3112e8=
5fb
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f199f5740769d2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f199f5740769d2e8=
5e7
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f1f288d5be3112e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f1f288d5be3112e8=
5f5
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384ef9f53eb7c5142e860b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384ef9f53eb7c5142e8=
60c
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f1a9f5740769d2e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f1a9f5740769d2e8=
5f0
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f20aa25d70a062e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f20aa25d70a062e8=
5ff
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64384f0c031f8b02282e860e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384f0c031f8b02282e8=
60f
        failing since 183 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643849feb3793151952e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643849feb3793151952e8=
5f6
        new failure (last pass: v6.3-rc6-158-g254ff7648cb9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64384c13531aa46a252e8616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384c13531aa46a252e8=
617
        failing since 119 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64384b39486fbcc9cd2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384b39486fbcc9cd2e8=
5e7
        failing since 119 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384e6b848738ee3e2e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384e6b848738ee3e2e8=
5e8
        failing since 65 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384df2f63dc32d5e2e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384df2f63dc32d5e2e8=
5f3
        failing since 65 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64384df4a95bc4a7112e8619

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64384df4a95bc4a7112e8=
61a
        failing since 65 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643859774518a09fe82e860d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643859774518a09fe82e8612
        failing since 71 days (last pass: v6.0-12387-ge54e01f1826aa, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-04-13T19:34:51.220761  <8>[    9.283189] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3492681_1.5.2.4.1>
    2023-04-13T19:34:51.341757  / # #
    2023-04-13T19:34:51.447605  export SHELL=3D/bin/sh
    2023-04-13T19:34:51.449470  #
    2023-04-13T19:34:51.553086  / # export SHELL=3D/bin/sh. /lava-3492681/e=
nvironment
    2023-04-13T19:34:51.555087  =

    2023-04-13T19:34:51.658792  / # . /lava-3492681/environment/lava-349268=
1/bin/lava-test-runner /lava-3492681/1
    2023-04-13T19:34:51.662138  =

    2023-04-13T19:34:51.665500  / # /lava-3492681/bin/lava-test-runner /lav=
a-3492681/1
    2023-04-13T19:34:51.776419  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6438703646073aea2e2e85fc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc6-24=
9-g122e82851461/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230407.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6438703646073aea2e2e8601
        failing since 41 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-04-13T21:11:55.607020  / # #
    2023-04-13T21:11:55.712619  export SHELL=3D/bin/sh
    2023-04-13T21:11:55.714211  #
    2023-04-13T21:11:55.817536  / # export SHELL=3D/bin/sh. /lava-3492673/e=
nvironment
    2023-04-13T21:11:55.819152  =

    2023-04-13T21:11:55.922537  / # . /lava-3492673/environment/lava-349267=
3/bin/lava-test-runner /lava-3492673/1
    2023-04-13T21:11:55.925208  =

    2023-04-13T21:11:55.931643  / # /lava-3492673/bin/lava-test-runner /lav=
a-3492673/1
    2023-04-13T21:11:56.090210  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-13T21:11:56.091293  + cd /lava-3492673/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20
