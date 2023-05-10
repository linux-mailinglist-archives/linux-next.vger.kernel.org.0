Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84BE6FD99A
	for <lists+linux-next@lfdr.de>; Wed, 10 May 2023 10:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236753AbjEJIjE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 May 2023 04:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236720AbjEJIig (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 May 2023 04:38:36 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F55B9ECD
        for <linux-next@vger.kernel.org>; Wed, 10 May 2023 01:37:22 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1aad55244b7so53092015ad.2
        for <linux-next@vger.kernel.org>; Wed, 10 May 2023 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683707840; x=1686299840;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k72j87vY7lQxiz8z4C0fQ9D2DfOiwRxjExrjlD70fow=;
        b=r9JIdqRm9tVJTmGRWW7XrsL0o1XJ5EU+6jzR8YcHkRCJn/UcPsjToHZi1oqmC6PEfK
         zihxPs0qUks8pBuH51kLiJr94D7Q3qjyT5LrSVZZRs4lmG1CBh+CilC3VicFkoHAi59G
         WIBhyHFBxh1GVMx+vAzOO3R5fAJpBzN8quuRqiFJDSSPqcziUfPAmnhGb4RyN9YLdouO
         NSuwYgtTBA9UOet3bG5p3jQQlCNsNPqkhwy4Rsm5GYlMJKqck37O/mdWVfrWqlY86tij
         nZXwo/L3LGte8maNsGI4TdNThzlj1QNOLYkBVvKhqF4LdO7TbVU4FROU7+f0wQu1ruu9
         Xfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683707840; x=1686299840;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k72j87vY7lQxiz8z4C0fQ9D2DfOiwRxjExrjlD70fow=;
        b=j1Dxp2bspUfpXa3VFnuV4rzWOGbA/+5/wBX0tXCgN3Hi+Wy3VWHDSlf5PEqgQiey+O
         kgvlx4moBwblMvNBqk061adXD58mvGsHmj+G202wGEZyChhMtDm7GYIpTqVDGVnYYJ1b
         ZNXlgKWcm/amQuCrT6ZDdWAYErSC7r6pxtqrI4C+fHfwA+YGqurS0DqWhmWfDq3RKIUM
         c8MR+fpt9Eztxtf5Yi6sYo2BhghJBvdb/eY378nqz+WSmQYlUht4c5oJp/rJudq4Ca+Z
         bh/CoXu7nT2Ft/bHUzNbWKDSfXD2jhcKTw9+qj46qKfcqc9lMf6xPquIp4aQRbossqJj
         Qxeg==
X-Gm-Message-State: AC+VfDz9qh9Z05qSaD+DJVJ1dPOYe084R7rH3Nzy3hXuwyoDssWdmET2
        hK0+C/DIIrE+/v7aeX2eRTYySQa0qjMdBdsmkV6j9UzQ
X-Google-Smtp-Source: ACHHUZ6+CiRYzFT8Zd8o7RCg+/8/NKx189CUVxowSEJ9hbTzQ4wg7ee7y15yOErZJ59Gg5hOK3x1Hw==
X-Received: by 2002:a17:903:185:b0:1a9:6bd4:236a with SMTP id z5-20020a170903018500b001a96bd4236amr21373315plg.69.1683707838423;
        Wed, 10 May 2023 01:37:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jj17-20020a170903049100b001ac2be2639asm3124887plb.223.2023.05.10.01.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 01:37:17 -0700 (PDT)
Message-ID: <645b57bd.170a0220.706fe.6727@mx.google.com>
Date:   Wed, 10 May 2023 01:37:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.4-rc1-166-g16fe96af4971
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 608 runs,
 81 regressions (v6.4-rc1-166-g16fe96af4971)
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

next/pending-fixes baseline: 608 runs, 81 regressions (v6.4-rc1-166-g16fe96=
af4971)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

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

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10   | exynos=
_defconfig             | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc1-166-g16fe96af4971/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc1-166-g16fe96af4971
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      16fe96af49719266b3b2293273c3e4a254a95362 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2eeb32910712152e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2eeb32910712152e8=
5fc
        failing since 212 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e91b1d6234ddc2e85f6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e91b1d6234ddc2e85fb
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-10T04:33:05.898296  + set +x

    2023-05-10T04:33:05.904305  <8>[   13.059435] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265536_1.4.2.3.1>

    2023-05-10T04:33:06.008699  / # #

    2023-05-10T04:33:06.109259  export SHELL=3D/bin/sh

    2023-05-10T04:33:06.109450  #

    2023-05-10T04:33:06.209965  / # export SHELL=3D/bin/sh. /lava-10265536/=
environment

    2023-05-10T04:33:06.210120  =


    2023-05-10T04:33:06.310630  / # . /lava-10265536/environment/lava-10265=
536/bin/lava-test-runner /lava-10265536/1

    2023-05-10T04:33:06.310876  =


    2023-05-10T04:33:06.316654  / # /lava-10265536/bin/lava-test-runner /la=
va-10265536/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1ef3a014f0827e2e85f4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1ef3a014f0827e2e85f9
        failing since 42 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:34:43.350267  + set +x

    2023-05-10T04:34:43.356438  <8>[   10.908462] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265553_1.4.2.3.1>

    2023-05-10T04:34:43.468266  / # #

    2023-05-10T04:34:43.569114  export SHELL=3D/bin/sh

    2023-05-10T04:34:43.570013  #

    2023-05-10T04:34:43.671577  / # export SHELL=3D/bin/sh. /lava-10265553/=
environment

    2023-05-10T04:34:43.672300  =


    2023-05-10T04:34:43.773771  / # . /lava-10265553/environment/lava-10265=
553/bin/lava-test-runner /lava-10265553/1

    2023-05-10T04:34:43.775015  =


    2023-05-10T04:34:43.781654  / # /lava-10265553/bin/lava-test-runner /la=
va-10265553/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645b20abeee5007a372e85ff

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b20abeee5007a372e8604
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:42:04.690192  + set +x

    2023-05-10T04:42:04.696438  <8>[    8.306814] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265885_1.4.2.3.1>

    2023-05-10T04:42:04.803932  #

    2023-05-10T04:42:04.805138  =


    2023-05-10T04:42:04.906743  / # #export SHELL=3D/bin/sh

    2023-05-10T04:42:04.907387  =


    2023-05-10T04:42:05.008685  / # export SHELL=3D/bin/sh. /lava-10265885/=
environment

    2023-05-10T04:42:05.009376  =


    2023-05-10T04:42:05.110977  / # . /lava-10265885/environment/lava-10265=
885/bin/lava-test-runner /lava-10265885/1

    2023-05-10T04:42:05.111995  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e61e28d0582072e85f3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e61e28d0582072e85f8
        failing since 42 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:32:21.969788  + set<8>[    8.966993] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10265477_1.4.2.3.1>

    2023-05-10T04:32:21.970397   +x

    2023-05-10T04:32:22.078978  / # #

    2023-05-10T04:32:22.181794  export SHELL=3D/bin/sh

    2023-05-10T04:32:22.182624  #

    2023-05-10T04:32:22.284184  / # export SHELL=3D/bin/sh. /lava-10265477/=
environment

    2023-05-10T04:32:22.284980  =


    2023-05-10T04:32:22.386736  / # . /lava-10265477/environment/lava-10265=
477/bin/lava-test-runner /lava-10265477/1

    2023-05-10T04:32:22.387985  =


    2023-05-10T04:32:22.392546  / # /lava-10265477/bin/lava-test-runner /la=
va-10265477/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/645b1e743f358749f52e85eb

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e743f358749f52e85f0
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-10T04:32:36.746830  + set +x

    2023-05-10T04:32:36.751222  <8>[   15.374746] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265550_1.4.2.3.1>

    2023-05-10T04:32:36.856957  / # #

    2023-05-10T04:32:36.958148  export SHELL=3D/bin/sh

    2023-05-10T04:32:36.958796  #

    2023-05-10T04:32:37.060002  / # export SHELL=3D/bin/sh. /lava-10265550/=
environment

    2023-05-10T04:32:37.060178  =


    2023-05-10T04:32:37.160698  / # . /lava-10265550/environment/lava-10265=
550/bin/lava-test-runner /lava-10265550/1

    2023-05-10T04:32:37.160932  =


    2023-05-10T04:32:37.166152  / # /lava-10265550/bin/lava-test-runner /la=
va-10265550/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b1e743f35874=
9f52e85f2
        new failure (last pass: v6.4-rc1-141-gb95366eba58e)
        3 lines

    2023-05-10T04:32:36.726877  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-05-10T04:32:36.730443  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-05-10T04:32:36.736535  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-05-10T04:32:36.743541  <8>[   15.358798] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1fdcc08f58a1a22e8609

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1fdcc08f58a1a22e860e
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:38:45.367186  + set +x<8>[    8.986207] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10265898_1.4.2.3.1>

    2023-05-10T04:38:45.367270  =


    2023-05-10T04:38:45.471429  / # #

    2023-05-10T04:38:45.571971  export SHELL=3D/bin/sh

    2023-05-10T04:38:45.572114  #

    2023-05-10T04:38:45.672647  / # export SHELL=3D/bin/sh. /lava-10265898/=
environment

    2023-05-10T04:38:45.672782  =


    2023-05-10T04:38:45.773334  / # . /lava-10265898/environment/lava-10265=
898/bin/lava-test-runner /lava-10265898/1

    2023-05-10T04:38:45.773585  =


    2023-05-10T04:38:45.778107  / # /lava-10265898/bin/lava-test-runner /la=
va-10265898/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e6be28d0582072e8627

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e6be28d0582072e862c
        failing since 42 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:32:21.460308  <8>[   10.853910] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265537_1.4.2.3.1>

    2023-05-10T04:32:21.463814  + set +x

    2023-05-10T04:32:21.568736  #

    2023-05-10T04:32:21.570060  =


    2023-05-10T04:32:21.672005  / # #export SHELL=3D/bin/sh

    2023-05-10T04:32:21.672709  =


    2023-05-10T04:32:21.774131  / # export SHELL=3D/bin/sh. /lava-10265537/=
environment

    2023-05-10T04:32:21.774743  =


    2023-05-10T04:32:21.876039  / # . /lava-10265537/environment/lava-10265=
537/bin/lava-test-runner /lava-10265537/1

    2023-05-10T04:32:21.877105  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e7ac69e20b4212e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e7ac69e20b4212e85ec
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-10T04:32:47.402186  <8>[   13.864518] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265564_1.4.2.3.1>

    2023-05-10T04:32:47.405683  + set +x

    2023-05-10T04:32:47.511197  #

    2023-05-10T04:32:47.512418  =


    2023-05-10T04:32:47.614319  / # #export SHELL=3D/bin/sh

    2023-05-10T04:32:47.615097  =


    2023-05-10T04:32:47.716759  / # export SHELL=3D/bin/sh. /lava-10265564/=
environment

    2023-05-10T04:32:47.717575  =


    2023-05-10T04:32:47.819071  / # . /lava-10265564/environment/lava-10265=
564/bin/lava-test-runner /lava-10265564/1

    2023-05-10T04:32:47.820291  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1fefee0eaaba362e8616

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1fefee0eaaba362e861b
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:38:49.433322  <8>[   10.570412] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265896_1.4.2.3.1>

    2023-05-10T04:38:49.437126  + set +x

    2023-05-10T04:38:49.543554  =


    2023-05-10T04:38:49.645551  / # #export SHELL=3D/bin/sh

    2023-05-10T04:38:49.646333  =


    2023-05-10T04:38:49.747991  / # export SHELL=3D/bin/sh. /lava-10265896/=
environment

    2023-05-10T04:38:49.748737  =


    2023-05-10T04:38:49.850226  / # . /lava-10265896/environment/lava-10265=
896/bin/lava-test-runner /lava-10265896/1

    2023-05-10T04:38:49.851556  =


    2023-05-10T04:38:49.856830  / # /lava-10265896/bin/lava-test-runner /la=
va-10265896/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1f438984a7fae82e8618

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1f438984a7fae82e861d
        failing since 118 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-05-10T04:35:59.620895  / # #

    2023-05-10T04:35:59.723104  export SHELL=3D/bin/sh

    2023-05-10T04:35:59.723819  #

    2023-05-10T04:35:59.825220  / # export SHELL=3D/bin/sh. /lava-10265454/=
environment

    2023-05-10T04:35:59.825960  =


    2023-05-10T04:35:59.927386  / # . /lava-10265454/environment/lava-10265=
454/bin/lava-test-runner /lava-10265454/1

    2023-05-10T04:35:59.928483  =


    2023-05-10T04:35:59.929910  / # /lava-10265454/bin/lava-test-runner /la=
va-10265454/1

    2023-05-10T04:36:00.054874  + export 'TESTRUN_ID=3D1_bootrr'

    2023-05-10T04:36:00.055392  + cd /lava-10265454/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b22656b793f7ceb2e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b22656b793f7ceb2e8=
603
        failing since 72 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b261da944ee78fd2e864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b261da944ee78fd2e8=
64d
        failing since 134 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e69e28d0582072e861c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e69e28d0582072e8621
        failing since 42 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:32:22.047069  + set +x

    2023-05-10T04:32:22.054072  <8>[   11.028316] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265505_1.4.2.3.1>

    2023-05-10T04:32:22.158009  / # #

    2023-05-10T04:32:22.258585  export SHELL=3D/bin/sh

    2023-05-10T04:32:22.258795  #

    2023-05-10T04:32:22.359277  / # export SHELL=3D/bin/sh. /lava-10265505/=
environment

    2023-05-10T04:32:22.359501  =


    2023-05-10T04:32:22.460066  / # . /lava-10265505/environment/lava-10265=
505/bin/lava-test-runner /lava-10265505/1

    2023-05-10T04:32:22.460395  =


    2023-05-10T04:32:22.465166  / # /lava-10265505/bin/lava-test-runner /la=
va-10265505/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e8284a977c6892e85e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e8284a977c6892e85eb
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-10T04:32:38.614803  + set +x

    2023-05-10T04:32:38.621131  <8>[   15.892342] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265574_1.4.2.3.1>

    2023-05-10T04:32:38.728291  / # #

    2023-05-10T04:32:38.828874  export SHELL=3D/bin/sh

    2023-05-10T04:32:38.829056  #

    2023-05-10T04:32:38.929689  / # export SHELL=3D/bin/sh. /lava-10265574/=
environment

    2023-05-10T04:32:38.929871  =


    2023-05-10T04:32:39.030358  / # . /lava-10265574/environment/lava-10265=
574/bin/lava-test-runner /lava-10265574/1

    2023-05-10T04:32:39.030624  =


    2023-05-10T04:32:39.035563  / # /lava-10265574/bin/lava-test-runner /la=
va-10265574/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645b20b0fa439d91092e85e9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b20b0fa439d91092e85ee
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:42:15.055996  + set +x

    2023-05-10T04:42:15.062819  <8>[   10.881236] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265874_1.4.2.3.1>

    2023-05-10T04:42:15.167226  / # #

    2023-05-10T04:42:15.267839  export SHELL=3D/bin/sh

    2023-05-10T04:42:15.268072  #

    2023-05-10T04:42:15.368617  / # export SHELL=3D/bin/sh. /lava-10265874/=
environment

    2023-05-10T04:42:15.368816  =


    2023-05-10T04:42:15.469362  / # . /lava-10265874/environment/lava-10265=
874/bin/lava-test-runner /lava-10265874/1

    2023-05-10T04:42:15.469694  =


    2023-05-10T04:42:15.474625  / # /lava-10265874/bin/lava-test-runner /la=
va-10265874/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e677cc93559fd2e85f9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e677cc93559fd2e85fe
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-10T04:32:25.585729  + set +x

    2023-05-10T04:32:25.592359  <8>[   15.277798] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265498_1.4.2.3.1>

    2023-05-10T04:32:25.697289  / # #

    2023-05-10T04:32:25.797942  export SHELL=3D/bin/sh

    2023-05-10T04:32:25.798145  #

    2023-05-10T04:32:25.898630  / # export SHELL=3D/bin/sh. /lava-10265498/=
environment

    2023-05-10T04:32:25.898854  =


    2023-05-10T04:32:25.999429  / # . /lava-10265498/environment/lava-10265=
498/bin/lava-test-runner /lava-10265498/1

    2023-05-10T04:32:25.999787  =


    2023-05-10T04:32:26.004778  / # /lava-10265498/bin/lava-test-runner /la=
va-10265498/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e6888e57f3ce62e8660

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e6888e57f3ce62e8665
        failing since 42 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:32:27.611040  <8>[   10.366338] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265591_1.4.2.3.1>

    2023-05-10T04:32:27.614061  + set +x

    2023-05-10T04:32:27.715463  =


    2023-05-10T04:32:27.816002  / # #export SHELL=3D/bin/sh

    2023-05-10T04:32:27.816168  =


    2023-05-10T04:32:27.916642  / # export SHELL=3D/bin/sh. /lava-10265591/=
environment

    2023-05-10T04:32:27.916839  =


    2023-05-10T04:32:28.017402  / # . /lava-10265591/environment/lava-10265=
591/bin/lava-test-runner /lava-10265591/1

    2023-05-10T04:32:28.017663  =


    2023-05-10T04:32:28.022536  / # /lava-10265591/bin/lava-test-runner /la=
va-10265591/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2098260add366b2e85ea

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b2098260add366b2e85ef
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:41:47.951607  <8>[   10.763381] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265882_1.4.2.3.1>

    2023-05-10T04:41:47.954960  + set +x

    2023-05-10T04:41:48.059294  / # #

    2023-05-10T04:41:48.159874  export SHELL=3D/bin/sh

    2023-05-10T04:41:48.160032  #

    2023-05-10T04:41:48.260497  / # export SHELL=3D/bin/sh. /lava-10265882/=
environment

    2023-05-10T04:41:48.260659  =


    2023-05-10T04:41:48.361127  / # . /lava-10265882/environment/lava-10265=
882/bin/lava-test-runner /lava-10265882/1

    2023-05-10T04:41:48.361381  =


    2023-05-10T04:41:48.366577  / # /lava-10265882/bin/lava-test-runner /la=
va-10265882/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e69e28d0582072e8611

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e69e28d0582072e8616
        failing since 42 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:32:26.145649  + set<8>[   11.465714] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10265571_1.4.2.3.1>

    2023-05-10T04:32:26.146103   +x

    2023-05-10T04:32:26.253388  / # #

    2023-05-10T04:32:26.355443  export SHELL=3D/bin/sh

    2023-05-10T04:32:26.355801  #

    2023-05-10T04:32:26.456749  / # export SHELL=3D/bin/sh. /lava-10265571/=
environment

    2023-05-10T04:32:26.457565  =


    2023-05-10T04:32:26.559050  / # . /lava-10265571/environment/lava-10265=
571/bin/lava-test-runner /lava-10265571/1

    2023-05-10T04:32:26.560347  =


    2023-05-10T04:32:26.565398  / # /lava-10265571/bin/lava-test-runner /la=
va-10265571/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e73368d3d4af62e85e6

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e73368d3d4af62e85eb
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-10T04:32:32.778201  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector<8>[   14.632001] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>

    2023-05-10T04:32:32.778637  =


    2023-05-10T04:32:32.781625  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-05-10T04:32:32.787751  <8>[   14.642046] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265539_1.4.2.3.1>

    2023-05-10T04:32:32.788206  + set +x

    2023-05-10T04:32:32.896836  / # #

    2023-05-10T04:32:32.999108  export SHELL=3D/bin/sh

    2023-05-10T04:32:32.999953  #

    2023-05-10T04:32:33.101434  / # export SHELL=3D/bin/sh. /lava-10265539/=
environment

    2023-05-10T04:32:33.102147  =

 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1ff97b9e18a7c32e85e7

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1ff97b9e18a7c32e85ec
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:38:59.332145  + set<8>[   11.463249] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10265890_1.4.2.3.1>

    2023-05-10T04:38:59.332589   +x

    2023-05-10T04:38:59.439703  / # #

    2023-05-10T04:38:59.541625  export SHELL=3D/bin/sh

    2023-05-10T04:38:59.542350  #

    2023-05-10T04:38:59.643806  / # export SHELL=3D/bin/sh. /lava-10265890/=
environment

    2023-05-10T04:38:59.644773  =


    2023-05-10T04:38:59.746200  / # . /lava-10265890/environment/lava-10265=
890/bin/lava-test-runner /lava-10265890/1

    2023-05-10T04:38:59.746652  =


    2023-05-10T04:38:59.751715  / # /lava-10265890/bin/lava-test-runner /la=
va-10265890/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1de61284ad3ecd2e8609

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1de61284ad3ecd2e860e
        failing since 100 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-10T04:30:06.145211  + set +x
    2023-05-10T04:30:06.145425  [   13.210181] <LAVA_SIGNAL_ENDRUN 0_dmesg =
946244_1.5.2.3.1>
    2023-05-10T04:30:06.252934  / # #
    2023-05-10T04:30:06.354556  export SHELL=3D/bin/sh
    2023-05-10T04:30:06.354968  #
    2023-05-10T04:30:06.456199  / # export SHELL=3D/bin/sh. /lava-946244/en=
vironment
    2023-05-10T04:30:06.456648  =

    2023-05-10T04:30:06.557984  / # . /lava-946244/environment/lava-946244/=
bin/lava-test-runner /lava-946244/1
    2023-05-10T04:30:06.558644  =

    2023-05-10T04:30:06.562095  / # /lava-946244/bin/lava-test-runner /lava=
-946244/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1ead1eaf16a8642e8623

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1ead1eaf16a8642e8628
        failing since 100 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-10T04:33:24.859340  + set +x
    2023-05-10T04:33:24.859502  [   12.179973] <LAVA_SIGNAL_ENDRUN 0_dmesg =
946252_1.5.2.3.1>
    2023-05-10T04:33:24.966204  / # #
    2023-05-10T04:33:25.067838  export SHELL=3D/bin/sh
    2023-05-10T04:33:25.068294  #
    2023-05-10T04:33:25.169468  / # export SHELL=3D/bin/sh. /lava-946252/en=
vironment
    2023-05-10T04:33:25.169904  =

    2023-05-10T04:33:25.271220  / # . /lava-946252/environment/lava-946252/=
bin/lava-test-runner /lava-946252/1
    2023-05-10T04:33:25.271858  =

    2023-05-10T04:33:25.275068  / # /lava-946252/bin/lava-test-runner /lava=
-946252/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2157a085e382892e85ea

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b2157a085e382892e85ef
        failing since 100 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-10T04:44:46.986287  + set +x
    2023-05-10T04:44:46.986465  [   13.159537] <LAVA_SIGNAL_ENDRUN 0_dmesg =
946292_1.5.2.3.1>
    2023-05-10T04:44:47.093934  / # #
    2023-05-10T04:44:47.195553  export SHELL=3D/bin/sh
    2023-05-10T04:44:47.196007  #
    2023-05-10T04:44:47.297255  / # export SHELL=3D/bin/sh. /lava-946292/en=
vironment
    2023-05-10T04:44:47.297739  =

    2023-05-10T04:44:47.398825  / # . /lava-946292/environment/lava-946292/=
bin/lava-test-runner /lava-946292/1
    2023-05-10T04:44:47.399673  =

    2023-05-10T04:44:47.403211  / # /lava-946292/bin/lava-test-runner /lava=
-946292/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b21a9f188cb694d2e8604

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b21a9f188cb694d2e8609
        failing since 100 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-05-10T04:46:13.927661  + set +x
    2023-05-10T04:46:13.928015  [   12.906224] <LAVA_SIGNAL_ENDRUN 0_dmesg =
946295_1.5.2.3.1>
    2023-05-10T04:46:14.035810  / # #
    2023-05-10T04:46:14.137414  export SHELL=3D/bin/sh
    2023-05-10T04:46:14.137846  #
    2023-05-10T04:46:14.239282  / # export SHELL=3D/bin/sh. /lava-946295/en=
vironment
    2023-05-10T04:46:14.239776  =

    2023-05-10T04:46:14.341002  / # . /lava-946295/environment/lava-946295/=
bin/lava-test-runner /lava-946295/1
    2023-05-10T04:46:14.341607  =

    2023-05-10T04:46:14.344666  / # /lava-946295/bin/lava-test-runner /lava=
-946295/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1de5f8d052e36a2e85ff

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1de5f8d052e36a2e8604
        new failure (last pass: v6.4-rc1-141-gb95366eba58e)

    2023-05-10T04:30:07.211935  + set[   15.102313] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 946242_1.5.2.3.1>
    2023-05-10T04:30:07.212166   +x
    2023-05-10T04:30:07.318013  / # #
    2023-05-10T04:30:07.419629  export SHELL=3D/bin/sh
    2023-05-10T04:30:07.420055  #
    2023-05-10T04:30:07.521368  / # export SHELL=3D/bin/sh. /lava-946242/en=
vironment
    2023-05-10T04:30:07.521958  =

    2023-05-10T04:30:07.623386  / # . /lava-946242/environment/lava-946242/=
bin/lava-test-runner /lava-946242/1
    2023-05-10T04:30:07.624007  =

    2023-05-10T04:30:07.627558  / # /lava-946242/bin/lava-test-runner /lava=
-946242/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/645b21a5eb8e98ffc72e862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b21a5eb8e98ffc72e8634
        new failure (last pass: v6.4-rc1-141-gb95366eba58e)

    2023-05-10T04:46:08.295871  + set[   15.099197] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 946287_1.5.2.3.1>
    2023-05-10T04:46:08.296099   +x
    2023-05-10T04:46:08.402453  / # #
    2023-05-10T04:46:08.504254  export SHELL=3D/bin/sh
    2023-05-10T04:46:08.504759  #
    2023-05-10T04:46:08.606103  / # export SHELL=3D/bin/sh. /lava-946287/en=
vironment
    2023-05-10T04:46:08.606642  =

    2023-05-10T04:46:08.707978  / # . /lava-946287/environment/lava-946287/=
bin/lava-test-runner /lava-946287/1
    2023-05-10T04:46:08.708700  =

    2023-05-10T04:46:08.711626  / # /lava-946287/bin/lava-test-runner /lava=
-946287/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645b42e265f24936912e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b42e265f24936912e8=
5e7
        new failure (last pass: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e4cdd223b5faf2e8605

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e4cdd223b5faf2e860a
        failing since 42 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:31:59.675715  + set<8>[   11.399138] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10265521_1.4.2.3.1>

    2023-05-10T04:31:59.675802   +x

    2023-05-10T04:31:59.780156  / # #

    2023-05-10T04:31:59.880714  export SHELL=3D/bin/sh

    2023-05-10T04:31:59.880946  #

    2023-05-10T04:31:59.981519  / # export SHELL=3D/bin/sh. /lava-10265521/=
environment

    2023-05-10T04:31:59.981684  =


    2023-05-10T04:32:00.082156  / # . /lava-10265521/environment/lava-10265=
521/bin/lava-test-runner /lava-10265521/1

    2023-05-10T04:32:00.082434  =


    2023-05-10T04:32:00.087133  / # /lava-10265521/bin/lava-test-runner /la=
va-10265521/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1e6b284665fc602e8607

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1e6b284665fc602e860c
        failing since 40 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-05-10T04:32:26.964846  + set +x

    2023-05-10T04:32:26.967910  <8>[   13.432786] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265560_1.4.2.3.1>

    2023-05-10T04:32:27.073846  / # #

    2023-05-10T04:32:27.174518  export SHELL=3D/bin/sh

    2023-05-10T04:32:27.174725  #

    2023-05-10T04:32:27.275279  / # export SHELL=3D/bin/sh. /lava-10265560/=
environment

    2023-05-10T04:32:27.275507  =


    2023-05-10T04:32:27.376055  / # . /lava-10265560/environment/lava-10265=
560/bin/lava-test-runner /lava-10265560/1

    2023-05-10T04:32:27.376359  =


    2023-05-10T04:32:27.381032  / # /lava-10265560/bin/lava-test-runner /la=
va-10265560/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/645b209b260add366b2e85fc

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b209b260add366b2e8601
        failing since 42 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-05-10T04:41:56.152389  + set<8>[    9.379832] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10265878_1.4.2.3.1>

    2023-05-10T04:41:56.152826   +x

    2023-05-10T04:41:56.260100  / # #

    2023-05-10T04:41:56.362279  export SHELL=3D/bin/sh

    2023-05-10T04:41:56.362986  #

    2023-05-10T04:41:56.464328  / # export SHELL=3D/bin/sh. /lava-10265878/=
environment

    2023-05-10T04:41:56.465041  =


    2023-05-10T04:41:56.566253  / # . /lava-10265878/environment/lava-10265=
878/bin/lava-test-runner /lava-10265878/1

    2023-05-10T04:41:56.566528  =


    2023-05-10T04:41:56.571388  / # /lava-10265878/bin/lava-test-runner /la=
va-10265878/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b208ef3da90e9cf2e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b208ef3da90e9cf2e8=
5f9
        failing since 105 days (last pass: v6.2-rc5-157-g1f16e03afb18, firs=
t fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2096f3da90e9cf2e8666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2096f3da90e9cf2e8=
667
        failing since 91 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645b248883489561582e863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b248883489561582e8=
640
        failing since 1 day (last pass: v6.3-rc7-226-gf05a2341f2478, first =
fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/645b24c0beea5a32002e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b24c0beea5a32002e8=
5ec
        failing since 13 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b208774e5e46a1f2e8600

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b208774e5e46a1f2e8=
601
        failing since 91 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/645b248c83489561582e8675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b248c83489561582e8=
676
        failing since 1 day (last pass: v6.3-rc7-226-gf05a2341f2478, first =
fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/645b24a17ac4eb81a52e8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b24a17ac4eb81a52e8=
646
        failing since 13 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10   | exynos=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1cafe0f9025bed2e85f3

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-x=
u3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-x=
u3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1cafe0f9025bed2e85f8
        new failure (last pass: v6.4-rc1-141-gb95366eba58e)

    2023-05-10T04:24:55.598937  kern  :alert : 8<--- cut here ---

    2023-05-10T04:24:55.599440  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000 when read

    2023-05-10T04:24:55.599731  kern  :alert : [00000000] *pgd=3D00000000

    2023-05-10T04:24:55.599975  kern  :alert : Register r0 information:

    2023-05-10T04:24:55.621908  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0890000 allocated at kernel_clone+0x54/0x=
39c

    2023-05-10T04:24:55.622418  kern  :alert : Register r2 information: n<8=
>[    :.10637: ReLAVA_SIGNAL_TESmatio TEST_CASE_ID=3Drlert RESULT=3Dfti: RN=
ITS=3Dli es iEASUmation: 6>

    2023-05-10T04:24:55.643932  forREMENT=3D12-page vmalloc region starting=
 at 0xf0890000 allocated at kernel_clone+0x54/0x39c

    2023-05-10T04:24:55.644447  kern  :alert : Register r5 information:

    2023-05-10T04:24:55.644733  kern  :alert : Register r6 information:

    2023-05-10T04:24:55.665997  kern  :alert : Register r7 information: 2-p=
age vmalloc region starting at 0xf0890000 allocated at kernel_clone+0x54/0x=
39c
 =

    ... (89 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b37fb294ece23002e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linar=
o-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linar=
o-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b37fb294ece23002e8=
602
        failing since 91 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b23b437e76479d42e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b23b437e76479d42e8=
619
        new failure (last pass: v6.4-rc1-141-gb95366eba58e) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b233f1e658cf7a12e861b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b233f1e658cf7a12e8=
61c
        new failure (last pass: v6.4-rc1-141-gb95366eba58e) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b236a6b2d50c9122e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b236a6b2d50c9122e8=
5e8
        failing since 21 days (last pass: v6.3-rc7-140-g88d3973741d7, first=
 fail: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2301c617c548f72e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2301c617c548f72e8=
5ed
        failing since 21 days (last pass: v6.3-rc7-140-g88d3973741d7, first=
 fail: v6.3-rc7-147-g6ba2ee0e9acd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1edf3bef2415c32e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1edf3bef2415c32e8=
5f8
        failing since 11 days (last pass: v6.3-8745-gc94d3163e00b, first fa=
il: v6.3-10703-gb3f869e79cdf) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1d6367a42070892e862c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1d6367a42070892e8=
62d
        failing since 145 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1af80d3af470ca2e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b1af80d3af470ca2e8=
60b
        failing since 145 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b213b43c5deb7932e866d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b213b43c5deb7932e8=
66e
        failing since 91 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/645b23ccfa28f449c32e860b

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b23ccfa28f44=
9c32e8662
        failing since 1 day (last pass: v6.3-rc7-226-gf05a2341f2478, first =
fail: v6.4-rc1-91-g2f19ff6b99223)
        2 lines

    2023-05-10T04:55:03.922802  fo:

    2023-05-10T04:55:03.926877  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-10T04:55:03.933650  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-10T04:55:03.936214  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-10T04:55:03.939972  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-10T04:55:03.945114  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-10T04:55:03.949177  kern  :alert : Data abort info:

    2023-05-10T04:55:03.952596  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-10T04:55:03.955855  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-05-10T04:55:03.969033  kern  :alert : user pgtable: 4k pages<8>[  =
 20.480574] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b23ccfa28f44=
9c32e8663
        failing since 1 day (last pass: v6.3-rc7-226-gf05a2341f2478, first =
fail: v6.4-rc1-91-g2f19ff6b99223)
        12 lines

    2023-05-10T04:55:03.910246  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-10T04:55:03.922095  kern  :alert : Mem abort in<8>[   20.429884=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 2          =


  Details:     https://kernelci.org/test/plan/id/645b23e8fa28f449c32e8677

  Results:     84 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b23e8fa28f44=
9c32e86ce
        failing since 13 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-10T04:55:30.192871  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   19.240801] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>

    2023-05-10T04:55:30.196124  at virtual address 0000000000000008

    2023-05-10T04:55:30.199430  kern  :alert : Mem abort info:

    2023-05-10T04:55:30.203486  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-10T04:55:30.208904  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-10T04:55:30.212677  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-10T04:55:30.216660  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-10T04:55:30.222110  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-10T04:55:30.224831  kern  :alert : Data abort info:

    2023-05-10T04:55:30.229597  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
 =

    ... (1 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b23e8fa28f44=
9c32e86cf
        failing since 13 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/645b1d4abb24a5330a2e862b

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-p=
c.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-p=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b1d4abb24a53=
30a2e8633
        failing since 11 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-10T04:27:41.466739  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-10T04:27:41.468018  kern  :emerg : Code: 97fd2d10 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-10T04:27:41.481386  <8>[   21.448030] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-10T04:27:41.481779  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b1d4abb24a53=
30a2e8634
        failing since 11 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-10T04:27:41.439316  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-10T04:27:41.440696  kern  :alert : Mem abort info:
    2023-05-10T04:27:41.441055  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-10T04:27:41.442116  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-10T04:27:41.443626  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-10T04:27:41.443985  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-10T04:27:41.444978  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-10T04:27:41.446267  kern  :alert : Data abort info:
    2023-05-10T04:27:41.446637  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-10T04:27:41.447565  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/645b1f7a28444a94fe2e85f6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b1f7a28444a9=
4fe2e85fd
        failing since 12 days (last pass: v6.3-rc6-186-g99455a05abbd, first=
 fail: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-10T04:36:56.638203  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-10T04:36:56.639379  kern  :emerg : Code: 97fe2110 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-10T04:36:56.648736  <8>[   19.369775] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-10T04:36:56.649096  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b1f7a28444a9=
4fe2e85fe
        failing since 12 days (last pass: v6.3-rc6-186-g99455a05abbd, first=
 fail: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-10T04:36:56.613532  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-10T04:36:56.615407  kern  :alert : Mem abort info:
    2023-05-10T04:36:56.615779  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-10T04:36:56.617457  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-10T04:36:56.619516  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-10T04:36:56.619871  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-10T04:36:56.621562  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-10T04:36:56.623692  kern  :alert : Data abort info:
    2023-05-10T04:36:56.624052  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-10T04:36:56.625732  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b21e7c63d61ae802e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b21e7c63d61ae802e8=
60b
        failing since 12 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/645b24cbbeea5a32002e861e

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b24cbbeea5a3=
2002e8625
        failing since 4 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.3-13708-gfd7527bf42e6)
        2 lines

    2023-05-10T04:59:47.626884  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-10T04:59:47.627472  kern  :emerg : Code: 94035910 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-10T04:59:47.629896  <8>[   26.774441] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-10T04:59:47.630257  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b24cbbeea5a3=
2002e8626
        failing since 4 days (last pass: v6.3-rc6-279-g281ec23cca3f, first =
fail: v6.3-13708-gfd7527bf42e6)
        12 lines

    2023-05-10T04:59:47.603958  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-10T04:59:47.608291  kern  :alert : Mem abort info:
    2023-05-10T04:59:47.612791  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-10T04:59:47.613145  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-10T04:59:47.617069  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-10T04:59:47.620628  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-10T04:59:47.621263  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-10T04:59:47.621596  kern  :alert : Data abort info:
    2023-05-10T04:59:47.621936  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-10T04:59:47.622226  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/645b2633237019a83c2e864c

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b2633237019a=
83c2e8653
        failing since 1 day (last pass: v6.3-rc6-279-g281ec23cca3f, first f=
ail: v6.4-rc1-91-g2f19ff6b99223)
        2 lines

    2023-05-10T05:05:44.236478  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-05-10T05:05:44.237741  kern  :emerg : Code: 97fdf510 f9405680 5286=
4a61 72a686c1 (b9400800) =

    2023-05-10T05:05:44.248092  <8>[   21.680444] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-05-10T05:05:44.248461  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b2633237019a=
83c2e8654
        failing since 1 day (last pass: v6.3-rc6-279-g281ec23cca3f, first f=
ail: v6.4-rc1-91-g2f19ff6b99223)
        12 lines

    2023-05-10T05:05:44.208963  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
    2023-05-10T05:05:44.209595  kern  :alert : Mem abort info:
    2023-05-10T05:05:44.209920  kern  :alert :   ESR =3D 0x0000000096000006
    2023-05-10T05:05:44.210269  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-05-10T05:05:44.210840  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-05-10T05:05:44.211149  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-05-10T05:05:44.211497  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-05-10T05:05:44.212393  kern  :alert : Data abort info:
    2023-05-10T05:05:44.212764  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-05-10T05:05:44.213812  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/645b1d0b497d6835c92e8605

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-ro=
ck-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b1d0b497d683=
5c92e860c
        failing since 11 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)
        2 lines

    2023-05-10T04:26:33.410019  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-10T04:26:33.410585  kern  :emerg : Code: 97f23110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-10T04:26:33.410966  <8>[   23.932129] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-10T04:26:33.411323  + set +x

    2023-05-10T04:26:33.411666  <8>[   23.934049] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265361_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b1d0b497d683=
5c92e860d
        failing since 11 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)
        12 lines

    2023-05-10T04:26:33.361665  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-10T04:26:33.362255  kern  :alert : Mem abort info:

    2023-05-10T04:26:33.362656  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-10T04:26:33.363018  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-10T04:26:33.363358  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-10T04:26:33.363682  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-10T04:26:33.364000  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-10T04:26:33.364316  kern  :alert : Data abort info:

    2023-05-10T04:26:33.364626  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-10T04:26:33.364936  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/645b1e6c284665fc602e8614

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b1e6c284665f=
c602e861b
        failing since 13 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        2 lines

    2023-05-10T04:32:19.070243  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-10T04:32:19.070830  kern  :emerg : Code: 97fbb510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-10T04:32:19.071216  <8>[   20.123324] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-10T04:32:19.071578  + set +x

    2023-05-10T04:32:19.071928  <8>[   20.125421] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10265448_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b1e6c284665f=
c602e861c
        failing since 13 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65)
        12 lines

    2023-05-10T04:32:19.017727  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-10T04:32:19.018313  kern  :alert : Mem abort info:

    2023-05-10T04:32:19.018695  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-10T04:32:19.019050  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-10T04:32:19.019393  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-10T04:32:19.019727  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-10T04:32:19.020054  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-10T04:32:19.020378  kern  :alert : Data abort info:

    2023-05-10T04:32:19.020694  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-10T04:32:19.021009  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2569636aad1c622e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2569636aad1c622e8=
5f9
        new failure (last pass: v6.3-13708-gfd7527bf42e6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/645b25d757557f1e222e85f2

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-p=
i-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/645b25d757557f1=
e222e85f9
        failing since 1 day (last pass: v6.3-1432-g527c4dda86b8, first fail=
: v6.4-rc1-91-g2f19ff6b99223)
        2 lines

    2023-05-10T05:04:01.016135  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-05-10T05:04:01.016668  kern  :emerg : Code: 97f83510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-05-10T05:04:01.017014  <8>[   22.085558] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-05-10T05:04:01.017362  + set +x

    2023-05-10T05:04:01.017679  <8>[   22.087976] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10266533_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/645b25d757557f1=
e222e85fa
        failing since 1 day (last pass: v6.3-1432-g527c4dda86b8, first fail=
: v6.4-rc1-91-g2f19ff6b99223)
        12 lines

    2023-05-10T05:04:00.962410  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-05-10T05:04:00.962886  kern  :alert : Mem abort info:

    2023-05-10T05:04:00.963259  kern  :alert :   ESR =3D 0x0000000096000006

    2023-05-10T05:04:00.963611  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-05-10T05:04:00.963946  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-05-10T05:04:00.964275  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-05-10T05:04:00.964598  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-05-10T05:04:00.964939  kern  :alert : Data abort info:

    2023-05-10T05:04:00.965255  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-05-10T05:04:00.965598  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2087d88a740a482e8626

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2087d88a740a482e8=
627
        failing since 91 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645b3aa93b4beb141b2e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b3aa93b4beb141b2e8=
5f5
        new failure (last pass: v6.3-13708-gfd7527bf42e6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2364ae4579b7e22e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2364ae4579b7e22e8=
5f4
        new failure (last pass: v6.4-rc1-141-gb95366eba58e) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b2591636aad1c622e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b2591636aad1c622e8=
604
        failing since 202 days (last pass: v6.0-10339-g565da9e84d8f, first =
fail: v6.1-rc1-192-gdfe701541ba9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/645b28ea3e33116e892e8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b28ea3e33116e892e8=
639
        failing since 4 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.3-13708-gfd7527bf42e6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645b294e933f0d223b2e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libr=
etech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libr=
etech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b294e933f0d223b2e8=
5ea
        new failure (last pass: v6.4-rc1-141-gb95366eba58e) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/645b215da085e382892e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b215da085e382892e8=
5fb
        failing since 1 day (last pass: v6.3-5614-gbe56a31d3d65, first fail=
: v6.4-rc1-141-gb95366eba58e) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/645b273eaad9a069942e8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orange=
pi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b273eaad9a069942e8=
632
        failing since 1 day (last pass: v6.4-rc1-91-g2f19ff6b99223, first f=
ail: v6.4-rc1-141-gb95366eba58e) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b1f64b885ce86802e861a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b1f64b885ce86802e861f
        failing since 97 days (last pass: v6.0-12387-ge54e01f1826aa, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-05-10T04:36:33.391271  / # #
    2023-05-10T04:36:33.497125  export SHELL=3D/bin/sh
    2023-05-10T04:36:33.498893  #
    2023-05-10T04:36:33.602387  / # export SHELL=3D/bin/sh. /lava-3570196/e=
nvironment
    2023-05-10T04:36:33.604217  =

    2023-05-10T04:36:33.707885  / # . /lava-3570196/environment/lava-357019=
6/bin/lava-test-runner /lava-3570196/1
    2023-05-10T04:36:33.710737  =

    2023-05-10T04:36:33.714908  / # /lava-3570196/bin/lava-test-runner /lav=
a-3570196/1
    2023-05-10T04:36:33.861802  + export 'TESTRUN_ID=3D1_bootrr'
    2023-05-10T04:36:33.864876  + cd /lava-3570196/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b3840c378d734d72e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/645b3840c378d734d72e85eb
        failing since 68 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-05-10T06:22:33.116087  <8>[    9.753863] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3570189_1.5.2.4.1>
    2023-05-10T06:22:33.235573  / # #
    2023-05-10T06:22:33.341173  export SHELL=3D/bin/sh
    2023-05-10T06:22:33.342831  #
    2023-05-10T06:22:33.446230  / # export SHELL=3D/bin/sh. /lava-3570189/e=
nvironment
    2023-05-10T06:22:33.447758  =

    2023-05-10T06:22:33.551318  / # . /lava-3570189/environment/lava-357018=
9/bin/lava-test-runner /lava-3570189/1
    2023-05-10T06:22:33.554066  =

    2023-05-10T06:22:33.560410  / # /lava-3570189/bin/lava-test-runner /lav=
a-3570189/1
    2023-05-10T06:22:33.698994  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/645b284f122f956e8d2e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc1-16=
6-g16fe96af4971/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230421.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/645b284f122f956e8d2e8=
5f5
        failing since 12 days (last pass: v6.3-5614-gbe56a31d3d65, first fa=
il: v6.3-8745-gc94d3163e00b) =

 =20
