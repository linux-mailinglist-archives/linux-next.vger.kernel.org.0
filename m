Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B8C73263A
	for <lists+linux-next@lfdr.de>; Fri, 16 Jun 2023 06:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbjFPEez (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Jun 2023 00:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbjFPEew (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Jun 2023 00:34:52 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DF22D54
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2023 21:34:48 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b3d44e3d1cso2849745ad.0
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2023 21:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686890087; x=1689482087;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hLTUXp5DPTn8+MmFuvFKBUrth1sz4W6EpjVFxR9x4bg=;
        b=tz4A/0HSShI0Nbk4tDGqENfY+gjp8MmY7Ckskllt73xJKFaVWBx9fgvr4INVgA9HoZ
         krsuiQMX1P3N2qGGxlJViJWJhR7H0WAegopAwyvCgkyN7kPcUQUE4ECi9pCWHZKsLdP9
         4n9urtdVVadkkBWYiXUCr4d98S0RJnBrS/Iup8GO00hILB8dVfJpsfyorYL4D/GoDooV
         Wf126/C7mWqY1sjawVTsqKQKqY1eeMHQJGUW1P3+AsBfkQ7uft5RvE/Y99+nwIKR7dE0
         UI6mlqhmV1zlJKUnJRoKfvSR2mwGzjKh8KvPVveX2BpA0X8zZohBudc2tCF203/lEjrg
         dY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686890087; x=1689482087;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLTUXp5DPTn8+MmFuvFKBUrth1sz4W6EpjVFxR9x4bg=;
        b=PBTc15gKbVI0OGCsu08OnWjkIRNRh3VTk5HFrItDEmfPq19Bss5fjODFrTjA7eCvzB
         qz8Smykg79EwB74rm5hb2lzyXg9bjchQyGIVxWoAJY7vJqV0aBjKeS5yq4HGHRWXC8LS
         PbJTaiU8tNwR3CvvxgMWD1LlQyZscIwdazcetDY1ZdG1RcIaiYiVDPrDQqUyfTk1FLHn
         iw+QwyQ7LLQ1TUPu5VXmH6yDABUMdQOj52AGiVfPtmN03NJGd4/+kC4CNA3EGXkIPwLQ
         adRV3chUv7ArkRn86xM0BBxsIRDBcmOaB0pXKF2zUA88EoINwPP5j/Xf5+dJVqm+yRNU
         1P9g==
X-Gm-Message-State: AC+VfDzBVkSf68ZVwHRRMC5PH9yxG0vbvubZ5/oMKmP7RuBo/eJXowbM
        Azu6yluSqMV0reYjqyZ3IxhJXcPAlhHng/d75mjUbw==
X-Google-Smtp-Source: ACHHUZ73xzSjyL9O8o7hICLAwB0/HRW7M21OIVxs73UUl0R1oUP5Zrz5iF7Hw3ueR2YNxhzSbacucw==
X-Received: by 2002:a17:902:a3cc:b0:1b2:fa8:d9c9 with SMTP id q12-20020a170902a3cc00b001b20fa8d9c9mr937481plb.49.1686890084816;
        Thu, 15 Jun 2023 21:34:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id k1-20020a170902694100b001aaf370b1c7sm14797138plt.278.2023.06.15.21.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 21:34:44 -0700 (PDT)
Message-ID: <648be664.170a0220.455d4.eb43@mx.google.com>
Date:   Thu, 15 Jun 2023 21:34:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc6-301-ga3b6bb6457ef
Subject: next/pending-fixes baseline: 655 runs,
 71 regressions (v6.4-rc6-301-ga3b6bb6457ef)
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

next/pending-fixes baseline: 655 runs, 71 regressions (v6.4-rc6-301-ga3b6bb=
6457ef)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+crypto             | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc6-301-ga3b6bb6457ef/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc6-301-ga3b6bb6457ef
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a3b6bb6457ef043c903a923aaf8e30e5f043c8f6 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648bbe09f543ecfa7230613a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bbe09f543ecfa72306=
13b
        failing since 249 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba812adb0d17ce3306177

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba812adb0d17ce330617c
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:08:35.233363  <8>[   11.328882] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10751439_1.4.2.3.1>

    2023-06-16T00:08:35.236966  + set +x

    2023-06-16T00:08:35.339929  =


    2023-06-16T00:08:35.441655  / # #export SHELL=3D/bin/sh

    2023-06-16T00:08:35.442330  =


    2023-06-16T00:08:35.543611  / # export SHELL=3D/bin/sh. /lava-10751439/=
environment

    2023-06-16T00:08:35.544312  =


    2023-06-16T00:08:35.645821  / # . /lava-10751439/environment/lava-10751=
439/bin/lava-test-runner /lava-10751439/1

    2023-06-16T00:08:35.647084  =


    2023-06-16T00:08:35.651391  / # /lava-10751439/bin/lava-test-runner /la=
va-10751439/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba8206625765c22306131

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba8206625765c22306136
        failing since 79 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:08:47.318308  + set +x

    2023-06-16T00:08:47.324696  <8>[    8.287298] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10751517_1.4.2.3.1>

    2023-06-16T00:08:47.426848  #

    2023-06-16T00:08:47.427159  =


    2023-06-16T00:08:47.527781  / # #export SHELL=3D/bin/sh

    2023-06-16T00:08:47.528027  =


    2023-06-16T00:08:47.628599  / # export SHELL=3D/bin/sh. /lava-10751517/=
environment

    2023-06-16T00:08:47.628842  =


    2023-06-16T00:08:47.729395  / # . /lava-10751517/environment/lava-10751=
517/bin/lava-test-runner /lava-10751517/1

    2023-06-16T00:08:47.729765  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648badb34b11d51293306132

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648badb34b11d51293306137
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-16T00:32:34.936069  + set +x

    2023-06-16T00:32:34.942289  <8>[   13.466542] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10752160_1.4.2.3.1>

    2023-06-16T00:32:35.050831  / # #

    2023-06-16T00:32:35.151662  export SHELL=3D/bin/sh

    2023-06-16T00:32:35.152358  #

    2023-06-16T00:32:35.253661  / # export SHELL=3D/bin/sh. /lava-10752160/=
environment

    2023-06-16T00:32:35.254330  =


    2023-06-16T00:32:35.355735  / # . /lava-10752160/environment/lava-10752=
160/bin/lava-test-runner /lava-10752160/1

    2023-06-16T00:32:35.356940  =


    2023-06-16T00:32:35.363067  / # /lava-10752160/bin/lava-test-runner /la=
va-10752160/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba7fb119ba2c51f306136

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba7fb119ba2c51f30613b
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:08:15.297157  + set<8>[   11.406724] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10751421_1.4.2.3.1>

    2023-06-16T00:08:15.297238   +x

    2023-06-16T00:08:15.401346  / # #

    2023-06-16T00:08:15.501926  export SHELL=3D/bin/sh

    2023-06-16T00:08:15.502116  #

    2023-06-16T00:08:15.602639  / # export SHELL=3D/bin/sh. /lava-10751421/=
environment

    2023-06-16T00:08:15.602837  =


    2023-06-16T00:08:15.703368  / # . /lava-10751421/environment/lava-10751=
421/bin/lava-test-runner /lava-10751421/1

    2023-06-16T00:08:15.703659  =


    2023-06-16T00:08:15.708363  / # /lava-10751421/bin/lava-test-runner /la=
va-10751421/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba81ca3e7941ab4306153

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba81ca3e7941ab4306158
        failing since 79 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:08:37.900452  + <8>[   11.586712] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10751545_1.4.2.3.1>

    2023-06-16T00:08:37.900973  set +x

    2023-06-16T00:08:38.008470  / # #

    2023-06-16T00:08:38.110958  export SHELL=3D/bin/sh

    2023-06-16T00:08:38.111750  #

    2023-06-16T00:08:38.213207  / # export SHELL=3D/bin/sh. /lava-10751545/=
environment

    2023-06-16T00:08:38.213941  =


    2023-06-16T00:08:38.315483  / # . /lava-10751545/environment/lava-10751=
545/bin/lava-test-runner /lava-10751545/1

    2023-06-16T00:08:38.316820  =


    2023-06-16T00:08:38.322453  / # /lava-10751545/bin/lava-test-runner /la=
va-10751545/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/648badbcde4cc56400306196

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648badbcde4cc5640030619b
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-16T00:32:41.107740  + <8>[   15.655811] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10752147_1.4.2.3.1>

    2023-06-16T00:32:41.110775  set +x

    2023-06-16T00:32:41.215619  / # #

    2023-06-16T00:32:41.317769  export SHELL=3D/bin/sh

    2023-06-16T00:32:41.318508  #

    2023-06-16T00:32:41.420077  / # export SHELL=3D/bin/sh. /lava-10752147/=
environment

    2023-06-16T00:32:41.420873  =


    2023-06-16T00:32:41.522430  / # . /lava-10752147/environment/lava-10752=
147/bin/lava-test-runner /lava-10752147/1

    2023-06-16T00:32:41.523592  =


    2023-06-16T00:32:41.528570  / # /lava-10752147/bin/lava-test-runner /la=
va-10752147/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/648badbcde4cc56=
40030619d
        new failure (last pass: v6.4-rc6-274-g2a7f6b5fd1ca)
        3 lines

    2023-06-16T00:32:41.080118  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-16T00:32:41.086614  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-16T00:32:41.093137  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-16T00:32:41.099828  <8>[   15.639415] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba800119ba2c51f30614f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba800119ba2c51f306154
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:08:14.320802  <8>[   10.921252] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10751417_1.4.2.3.1>

    2023-06-16T00:08:14.324074  + set +x

    2023-06-16T00:08:14.429533  =


    2023-06-16T00:08:14.531160  / # #export SHELL=3D/bin/sh

    2023-06-16T00:08:14.531886  =


    2023-06-16T00:08:14.633285  / # export SHELL=3D/bin/sh. /lava-10751417/=
environment

    2023-06-16T00:08:14.633975  =


    2023-06-16T00:08:14.735238  / # . /lava-10751417/environment/lava-10751=
417/bin/lava-test-runner /lava-10751417/1

    2023-06-16T00:08:14.735545  =


    2023-06-16T00:08:14.740646  / # /lava-10751417/bin/lava-test-runner /la=
va-10751417/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba80bcbc27b38073061b4

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba80bcbc27b38073061b9
        failing since 79 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:08:30.696527  <8>[   11.413104] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10751492_1.4.2.3.1>

    2023-06-16T00:08:30.699817  + set +x

    2023-06-16T00:08:30.801920  #

    2023-06-16T00:08:30.802211  =


    2023-06-16T00:08:30.902874  / # #export SHELL=3D/bin/sh

    2023-06-16T00:08:30.903058  =


    2023-06-16T00:08:31.003673  / # export SHELL=3D/bin/sh. /lava-10751492/=
environment

    2023-06-16T00:08:31.004030  =


    2023-06-16T00:08:31.104975  / # . /lava-10751492/environment/lava-10751=
492/bin/lava-test-runner /lava-10751492/1

    2023-06-16T00:08:31.106064  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648badb747a39581e830613c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648badb747a39581e8306141
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-16T00:32:29.338658  + set +x

    2023-06-16T00:32:29.345554  <8>[   12.293452] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10752144_1.4.2.3.1>

    2023-06-16T00:32:29.451518  / # #

    2023-06-16T00:32:29.552230  export SHELL=3D/bin/sh

    2023-06-16T00:32:29.552387  #

    2023-06-16T00:32:29.652915  / # export SHELL=3D/bin/sh. /lava-10752144/=
environment

    2023-06-16T00:32:29.653114  =


    2023-06-16T00:32:29.753770  / # . /lava-10752144/environment/lava-10752=
144/bin/lava-test-runner /lava-10752144/1

    2023-06-16T00:32:29.754045  =


    2023-06-16T00:32:29.758723  / # /lava-10752144/bin/lava-test-runner /la=
va-10752144/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/648badfdfbd0bd65b0306133

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648badfdfbd0bd65b0306138
        failing since 155 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-16T00:34:41.941340  / # #

    2023-06-16T00:34:42.043510  export SHELL=3D/bin/sh

    2023-06-16T00:34:42.044230  #

    2023-06-16T00:34:42.145638  / # export SHELL=3D/bin/sh. /lava-10751898/=
environment

    2023-06-16T00:34:42.146374  =


    2023-06-16T00:34:42.247883  / # . /lava-10751898/environment/lava-10751=
898/bin/lava-test-runner /lava-10751898/1

    2023-06-16T00:34:42.249040  =


    2023-06-16T00:34:42.265609  / # /lava-10751898/bin/lava-test-runner /la=
va-10751898/1

    2023-06-16T00:34:42.375434  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-16T00:34:42.375960  + cd /lava-10751898/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648bad750fca5ab47930616d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bad750fca5ab479306=
16e
        failing since 109 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648bb246d7775b46a0306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bb246d7775b46a0306=
13a
        failing since 8 days (last pass: v6.4-rc5-244-g9d674be53332, first =
fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/648baa6f7c956dc207306178

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648baa6f7c956dc20730617d
        failing since 149 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-16T00:18:16.251099  <8>[   19.573537] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3666023_1.5.2.4.1>
    2023-06-16T00:18:16.364470  / # #
    2023-06-16T00:18:16.468478  export SHELL=3D/bin/sh
    2023-06-16T00:18:16.469002  #
    2023-06-16T00:18:16.571895  / # export SHELL=3D/bin/sh. /lava-3666023/e=
nvironment
    2023-06-16T00:18:16.572519  =

    2023-06-16T00:18:16.673897  / # . /lava-3666023/environment/lava-366602=
3/bin/lava-test-runner /lava-3666023/1
    2023-06-16T00:18:16.674780  =

    2023-06-16T00:18:16.679500  / # /lava-3666023/bin/lava-test-runner /lav=
a-3666023/1
    2023-06-16T00:18:16.777430  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648baaf4c5b3d20a86306138

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648baaf4c5b3d20a8630613d
        failing since 149 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-16T00:20:59.802154  + set +x<8>[   14.758263] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3666032_1.5.2.4.1>
    2023-06-16T00:20:59.802489  =

    2023-06-16T00:20:59.912748  / # #
    2023-06-16T00:21:00.014477  export SHELL=3D/bin/sh
    2023-06-16T00:21:00.015304  #
    2023-06-16T00:21:00.117266  / # export SHELL=3D/bin/sh. /lava-3666032/e=
nvironment
    2023-06-16T00:21:00.118168  =

    2023-06-16T00:21:00.221413  / # . /lava-3666032/environment/lava-366603=
2/bin/lava-test-runner /lava-3666032/1
    2023-06-16T00:21:00.222662  =

    2023-06-16T00:21:00.226831  / # /lava-3666032/bin/lava-test-runner /lav=
a-3666032/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648bb139f001caf60530612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bb139f001caf605306133
        failing since 149 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-16T00:47:08.778458  <8>[   14.565951] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3666195_1.5.2.4.1>
    2023-06-16T00:47:08.888219  / # #
    2023-06-16T00:47:08.991180  export SHELL=3D/bin/sh
    2023-06-16T00:47:08.992035  #
    2023-06-16T00:47:09.094024  / # export SHELL=3D/bin/sh. /lava-3666195/e=
nvironment
    2023-06-16T00:47:09.095263  =

    2023-06-16T00:47:09.198018  / # . /lava-3666195/environment/lava-366619=
5/bin/lava-test-runner /lava-3666195/1
    2023-06-16T00:47:09.199474  =

    2023-06-16T00:47:09.204075  / # /lava-3666195/bin/lava-test-runner /lav=
a-3666195/1
    2023-06-16T00:47:09.232857  <3>[   15.021934] Bluetooth: hci0: command =
0x0c03 tx timeout =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648bb1e1ec994ab9f3306134

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bb1e1ec994ab9f3306139
        failing since 149 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-16T00:50:28.817353  <8>[   15.230014] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3666241_1.5.2.4.1>
    2023-06-16T00:50:28.924357  / # #
    2023-06-16T00:50:29.027548  export SHELL=3D/bin/sh
    2023-06-16T00:50:29.028480  #
    2023-06-16T00:50:29.130784  / # export SHELL=3D/bin/sh. /lava-3666241/e=
nvironment
    2023-06-16T00:50:29.131672  =

    2023-06-16T00:50:29.233747  / # . /lava-3666241/environment/lava-366624=
1/bin/lava-test-runner /lava-3666241/1
    2023-06-16T00:50:29.234669  =

    2023-06-16T00:50:29.234969  / # <3>[   15.568904] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-06-16T00:50:29.239462  /lava-3666241/bin/lava-test-runner /lava-36=
66241/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648bb29124085375ac306170

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bb29124085375ac306175
        failing since 149 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-16T00:53:06.478428  <8>[   16.756337] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3666453_1.5.2.4.1>
    2023-06-16T00:53:06.585419  / # #
    2023-06-16T00:53:06.687456  export SHELL=3D/bin/sh
    2023-06-16T00:53:06.687973  #
    2023-06-16T00:53:06.789540  / # export SHELL=3D/bin/sh. /lava-3666453/e=
nvironment
    2023-06-16T00:53:06.790011  =

    2023-06-16T00:53:06.891327  / # . /lava-3666453/environment/lava-366645=
3/bin/lava-test-runner /lava-3666453/1
    2023-06-16T00:53:06.892099  =

    2023-06-16T00:53:06.896793  / # /lava-3666453/bin/lava-test-runner /lav=
a-3666453/1
    2023-06-16T00:53:06.990866  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/648bac3af708f0cfb1306245

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/648bac3af708f0c=
fb130624c
        failing since 105 days (last pass: v6.2-1218-g2d4a54ee969d, first f=
ail: v6.2-13370-g5872d227b73f)
        30 lines

    2023-06-16T00:26:22.066175  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4e97400 pointer offset 4 size 512
    2023-06-16T00:26:22.100129  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-16T00:26:22.100370  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-16T00:26:22.100583  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2ae000 allocated at load_module+0x6b0/0=
x1954
    2023-06-16T00:26:22.103240  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-16T00:26:22.207669  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-16T00:26:22.208324  kern  :emerg : Process udevd (pid: 67, stac=
k limit =3D 0xc3177da5)
    2023-06-16T00:26:22.208846  kern  :emerg : Stack: (0xc8909cf8 to 0xc890=
a000)
    2023-06-16T00:26:22.209266  kern  :emerg : 9ce0:                       =
                                c4e97400 c0777860
    2023-06-16T00:26:22.209951  kern  :emerg : 9d00: 00000000 c03afd98 0000=
0000 dd8617ba 0000005d dd8617ba c0777860 bf2ae220 =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/648bac3af708f0c=
fb130624d
        failing since 508 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-06-16T00:26:22.020144  kern  :alert : 8<--- cut here ---
    2023-06-16T00:26:22.020469  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-06-16T00:26:22.020761  kern  :alert : [00000060] *pgd=3Dc4a2c831, =
*pte=3D00000000, *ppte=3D00000000
    2023-06-16T00:26:22.020927  kern  :alert : Register r0 information: non=
-paged memory
    2023-06-16T00:26:22.021082  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8908000 allocated at kernel_clone+0x98/0x=
3a0
    2023-06-16T00:26:22.022851  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-06-16T00:26:22.062716  kern  :alert : Register r3 information: non=
-paged memory
    2023-06-16T00:26:22.063221  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4e97400 pointer offset 0 size 512
    2023-06-16T00:26:22.063386  kern  :alert : Register r5 information: non=
-slab/vmalloc me<8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail=
 UNITS=3Dlines MEASUREMENT=3D16>
    2023-06-16T00:26:22.063510  mory =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648bac35f708f0cfb1306213

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bac35f708f0cfb1306=
214
        failing since 171 days (last pass: v6.1-rc6-391-gf445421fe4c7, firs=
t fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba7ef9d82d4e2dd306157

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba7ef9d82d4e2dd30615c
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:08:07.011558  + set +x

    2023-06-16T00:08:07.018785  <8>[   10.958830] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10751435_1.4.2.3.1>

    2023-06-16T00:08:07.123021  / # #

    2023-06-16T00:08:07.223616  export SHELL=3D/bin/sh

    2023-06-16T00:08:07.223824  #

    2023-06-16T00:08:07.324340  / # export SHELL=3D/bin/sh. /lava-10751435/=
environment

    2023-06-16T00:08:07.324526  =


    2023-06-16T00:08:07.425015  / # . /lava-10751435/environment/lava-10751=
435/bin/lava-test-runner /lava-10751435/1

    2023-06-16T00:08:07.425342  =


    2023-06-16T00:08:07.429911  / # /lava-10751435/bin/lava-test-runner /la=
va-10751435/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba855d8b33ca30130616e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba855d8b33ca301306173
        failing since 79 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:09:42.614560  + set +x

    2023-06-16T00:09:42.620461  <8>[   10.075137] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10751511_1.4.2.3.1>

    2023-06-16T00:09:42.724698  / # #

    2023-06-16T00:09:42.825359  export SHELL=3D/bin/sh

    2023-06-16T00:09:42.825571  #

    2023-06-16T00:09:42.926112  / # export SHELL=3D/bin/sh. /lava-10751511/=
environment

    2023-06-16T00:09:42.926367  =


    2023-06-16T00:09:43.026968  / # . /lava-10751511/environment/lava-10751=
511/bin/lava-test-runner /lava-10751511/1

    2023-06-16T00:09:43.027340  =


    2023-06-16T00:09:43.032573  / # /lava-10751511/bin/lava-test-runner /la=
va-10751511/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648bada46f83ccfa7a306153

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bada46f83ccfa7a306158
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-16T00:32:28.161282  + set +x

    2023-06-16T00:32:28.168365  <8>[   15.798328] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10752166_1.4.2.3.1>

    2023-06-16T00:32:28.274241  / # #

    2023-06-16T00:32:28.374952  export SHELL=3D/bin/sh

    2023-06-16T00:32:28.375139  #

    2023-06-16T00:32:28.475618  / # export SHELL=3D/bin/sh. /lava-10752166/=
environment

    2023-06-16T00:32:28.826646  =


    2023-06-16T00:32:28.927288  / # . /lava-10752166/environmen/lava-107521=
66/bin/lava-test-runner /lava-10752166/1

    2023-06-16T00:32:28.927560  t

    2023-06-16T00:32:28.932285  / # /lava-10752166/bin/lava-test-runner /la=
va-10752166/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba7e0cc5ce9b0e13061a1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba7e0cc5ce9b0e13061a6
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:07:47.084691  <8>[   10.202030] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10751459_1.4.2.3.1>

    2023-06-16T00:07:47.087548  + set +x

    2023-06-16T00:07:47.190047  =


    2023-06-16T00:07:47.291819  / # #export SHELL=3D/bin/sh

    2023-06-16T00:07:47.292740  =


    2023-06-16T00:07:47.394485  / # export SHELL=3D/bin/sh. /lava-10751459/=
environment

    2023-06-16T00:07:47.395185  =


    2023-06-16T00:07:47.496519  / # . /lava-10751459/environment/lava-10751=
459/bin/lava-test-runner /lava-10751459/1

    2023-06-16T00:07:47.497766  =


    2023-06-16T00:07:47.502412  / # /lava-10751459/bin/lava-test-runner /la=
va-10751459/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba816a0b51748e530614e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba816a0b51748e5306153
        failing since 79 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:08:52.791360  + set +x

    2023-06-16T00:08:52.797889  <8>[   10.232860] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10751544_1.4.2.3.1>

    2023-06-16T00:08:52.899539  #

    2023-06-16T00:08:52.899818  =


    2023-06-16T00:08:53.000416  / # #export SHELL=3D/bin/sh

    2023-06-16T00:08:53.000613  =


    2023-06-16T00:08:53.101167  / # export SHELL=3D/bin/sh. /lava-10751544/=
environment

    2023-06-16T00:08:53.101353  =


    2023-06-16T00:08:53.201911  / # . /lava-10751544/environment/lava-10751=
544/bin/lava-test-runner /lava-10751544/1

    2023-06-16T00:08:53.202203  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648bad94cb2d4d586c306148

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bad94cb2d4d586c30614d
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-16T00:31:58.803251  + set<8>[   21.534684] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10752116_1.4.2.3.1>

    2023-06-16T00:31:58.803786   +x

    2023-06-16T00:31:58.911674  / # #

    2023-06-16T00:31:59.014273  export SHELL=3D/bin/sh

    2023-06-16T00:31:59.015032  #

    2023-06-16T00:31:59.116630  / # export SHELL=3D/bin/sh. /lava-10752116/=
environment

    2023-06-16T00:31:59.117347  =


    2023-06-16T00:31:59.218828  / # . /lava-10752116/environment/lava-10752=
116/bin/lava-test-runner /lava-10752116/1

    2023-06-16T00:31:59.220110  =


    2023-06-16T00:31:59.226242  / # /lava-10752116/bin/lava-test-runner /la=
va-10752116/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba7f7cbc27b3807306135

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba7f7cbc27b380730613a
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:08:04.922928  + <8>[   10.727918] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10751430_1.4.2.3.1>

    2023-06-16T00:08:04.923011  set +x

    2023-06-16T00:08:05.027378  / # #

    2023-06-16T00:08:05.127933  export SHELL=3D/bin/sh

    2023-06-16T00:08:05.128080  #

    2023-06-16T00:08:05.228589  / # export SHELL=3D/bin/sh. /lava-10751430/=
environment

    2023-06-16T00:08:05.228748  =


    2023-06-16T00:08:05.329276  / # . /lava-10751430/environment/lava-10751=
430/bin/lava-test-runner /lava-10751430/1

    2023-06-16T00:08:05.329555  =


    2023-06-16T00:08:05.334646  / # /lava-10751430/bin/lava-test-runner /la=
va-10751430/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba80fadb0d17ce330613c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba80fadb0d17ce3306141
        failing since 79 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:08:30.085382  + set<8>[   11.257444] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10751475_1.4.2.3.1>

    2023-06-16T00:08:30.085520   +x

    2023-06-16T00:08:30.189576  / # #

    2023-06-16T00:08:30.290165  export SHELL=3D/bin/sh

    2023-06-16T00:08:30.290360  #

    2023-06-16T00:08:30.390848  / # export SHELL=3D/bin/sh. /lava-10751475/=
environment

    2023-06-16T00:08:30.391035  =


    2023-06-16T00:08:30.491541  / # . /lava-10751475/environment/lava-10751=
475/bin/lava-test-runner /lava-10751475/1

    2023-06-16T00:08:30.491889  =


    2023-06-16T00:08:30.496789  / # /lava-10751475/bin/lava-test-runner /la=
va-10751475/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648badc01a9980c420306132

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648badc01a9980c420306137
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-16T00:32:39.077748  + set +x

    2023-06-16T00:32:39.080785  <8>[   15.158594] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10752167_1.4.2.3.1>

    2023-06-16T00:32:39.186515  / # #

    2023-06-16T00:32:39.287097  export SHELL=3D/bin/sh

    2023-06-16T00:32:39.287268  #

    2023-06-16T00:32:39.387787  / # export SHELL=3D/bin/sh. /lava-10752167/=
environment

    2023-06-16T00:32:39.387960  =


    2023-06-16T00:32:39.488531  / # . /lava-10752167/environment/lava-10752=
167/bin/lava-test-runner /lava-10752167/1

    2023-06-16T00:32:39.488777  =


    2023-06-16T00:32:39.493481  / # /lava-10752167/bin/lava-test-runner /la=
va-10752167/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba98eefa489dea130618a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba98eefa489dea130618f
        failing since 136 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-16T00:14:47.013838  + set +x
    2023-06-16T00:14:47.014022  [   14.364277] <LAVA_SIGNAL_ENDRUN 0_dmesg =
978834_1.5.2.3.1>
    2023-06-16T00:14:47.122239  / # #
    2023-06-16T00:14:47.223883  export SHELL=3D/bin/sh
    2023-06-16T00:14:47.224457  #
    2023-06-16T00:14:47.325840  / # export SHELL=3D/bin/sh. /lava-978834/en=
vironment
    2023-06-16T00:14:47.326306  =

    2023-06-16T00:14:47.427512  / # . /lava-978834/environment/lava-978834/=
bin/lava-test-runner /lava-978834/1
    2023-06-16T00:14:47.427992  =

    2023-06-16T00:14:47.431211  / # /lava-978834/bin/lava-test-runner /lava=
-978834/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba9ddc931635dda306136

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba9ddc931635dda30613b
        failing since 137 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-16T00:16:08.917863  + set +x
    2023-06-16T00:16:08.918031  [   13.190810] <LAVA_SIGNAL_ENDRUN 0_dmesg =
978846_1.5.2.3.1>
    2023-06-16T00:16:09.025319  / # #
    2023-06-16T00:16:09.126839  export SHELL=3D/bin/sh
    2023-06-16T00:16:09.127284  #
    2023-06-16T00:16:09.228516  / # export SHELL=3D/bin/sh. /lava-978846/en=
vironment
    2023-06-16T00:16:09.228943  =

    2023-06-16T00:16:09.330175  / # . /lava-978846/environment/lava-978846/=
bin/lava-test-runner /lava-978846/1
    2023-06-16T00:16:09.330767  =

    2023-06-16T00:16:09.334113  / # /lava-978846/bin/lava-test-runner /lava=
-978846/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648bae3dc5af0e5169306169

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bae3dc5af0e516930616e
        failing since 136 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-16T00:34:44.704667  + set +x
    2023-06-16T00:34:44.705048  [   12.863509] <LAVA_SIGNAL_ENDRUN 0_dmesg =
978871_1.5.2.3.1>
    2023-06-16T00:34:44.812952  / # #
    2023-06-16T00:34:44.914655  export SHELL=3D/bin/sh
    2023-06-16T00:34:44.915136  #
    2023-06-16T00:34:45.016485  / # export SHELL=3D/bin/sh. /lava-978871/en=
vironment
    2023-06-16T00:34:45.017019  =

    2023-06-16T00:34:45.118357  / # . /lava-978871/environment/lava-978871/=
bin/lava-test-runner /lava-978871/1
    2023-06-16T00:34:45.118985  =

    2023-06-16T00:34:45.122681  / # /lava-978871/bin/lava-test-runner /lava=
-978871/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648bae8d94f7bbb20b306176

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bae8d94f7bbb20b30617b
        failing since 136 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-16T00:36:05.551486  + set +x
    2023-06-16T00:36:05.551713  [   13.170939] <LAVA_SIGNAL_ENDRUN 0_dmesg =
978882_1.5.2.3.1>
    2023-06-16T00:36:05.658909  / # #
    2023-06-16T00:36:05.760501  export SHELL=3D/bin/sh
    2023-06-16T00:36:05.761064  #
    2023-06-16T00:36:05.862446  / # export SHELL=3D/bin/sh. /lava-978882/en=
vironment
    2023-06-16T00:36:05.862878  =

    2023-06-16T00:36:05.964140  / # . /lava-978882/environment/lava-978882/=
bin/lava-test-runner /lava-978882/1
    2023-06-16T00:36:05.964710  =

    2023-06-16T00:36:05.968257  / # /lava-978882/bin/lava-test-runner /lava=
-978882/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648baf05421999bc323061dc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648baf05421999bc323061e1
        failing since 137 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-16T00:38:24.173640  + set +x
    2023-06-16T00:38:24.173813  [   12.246609] <LAVA_SIGNAL_ENDRUN 0_dmesg =
978904_1.5.2.3.1>
    2023-06-16T00:38:24.280634  / # #
    2023-06-16T00:38:24.382300  export SHELL=3D/bin/sh
    2023-06-16T00:38:24.382753  #
    2023-06-16T00:38:24.484090  / # export SHELL=3D/bin/sh. /lava-978904/en=
vironment
    2023-06-16T00:38:24.484582  =

    2023-06-16T00:38:24.585908  / # . /lava-978904/environment/lava-978904/=
bin/lava-test-runner /lava-978904/1
    2023-06-16T00:38:24.586658  =

    2023-06-16T00:38:24.590225  / # /lava-978904/bin/lava-test-runner /lava=
-978904/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648bac219bfbd867103061af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+crypto/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+crypto/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bac219bfbd86710306=
1b0
        failing since 1 day (last pass: v6.4-rc6-221-gf82f3835a7c04, first =
fail: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648bace05ff0a23903306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bace05ff0a23903306=
145
        failing since 412 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648bb1aae007cd929f30612f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-s=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-s=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bb1aae007cd929f306134
        failing since 48 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)

    2023-06-16T00:48:42.707526  <8>[    7.589775] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3666330_1.5.2.4.1>
    2023-06-16T00:48:42.812903  =

    2023-06-16T00:48:42.914197  / # #export SHELL=3D/bin/sh
    2023-06-16T00:48:42.914566  =

    2023-06-16T00:48:43.015493  / # export SHELL=3D/bin/sh. /lava-3666330/e=
nvironment
    2023-06-16T00:48:43.015857  =

    2023-06-16T00:48:43.117007  / # . /lava-3666330/environment/lava-366633=
0/bin/lava-test-runner /lava-3666330/1
    2023-06-16T00:48:43.118049  =

    2023-06-16T00:48:43.161049  / # /lava-3666330/bin/lava-test-runner /lav=
a-3666330/1
    2023-06-16T00:48:43.170581  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648bb263d7775b46a030616e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am=
625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am=
625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bb263d7775b46a0306173
        failing since 50 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-16T00:52:29.925245  <8>[    7.648531] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3666399_1.5.2.4.1>
    2023-06-16T00:52:30.046245  / # #
    2023-06-16T00:52:30.149219  export SHELL=3D/bin/sh
    2023-06-16T00:52:30.152275  #
    2023-06-16T00:52:30.254688  / # export SHELL=3D/bin/sh. /lava-3666399/e=
nvironment
    2023-06-16T00:52:30.255500  =

    2023-06-16T00:52:30.357550  / # . /lava-3666399/environment/lava-366639=
9/bin/lava-test-runner /lava-3666399/1
    2023-06-16T00:52:30.359091  =

    2023-06-16T00:52:30.372765  / # /lava-3666399/bin/lava-test-runner /lav=
a-3666399/1
    2023-06-16T00:52:30.417599  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba7e88e09dafbc630619e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba7e88e09dafbc63061a3
        failing since 79 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:07:55.997164  + set<8>[    8.797726] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10751407_1.4.2.3.1>

    2023-06-16T00:07:55.997283   +x

    2023-06-16T00:07:56.101860  / # #

    2023-06-16T00:07:56.202597  export SHELL=3D/bin/sh

    2023-06-16T00:07:56.202832  #

    2023-06-16T00:07:56.303346  / # export SHELL=3D/bin/sh. /lava-10751407/=
environment

    2023-06-16T00:07:56.303585  =


    2023-06-16T00:07:56.404115  / # . /lava-10751407/environment/lava-10751=
407/bin/lava-test-runner /lava-10751407/1

    2023-06-16T00:07:56.404473  =


    2023-06-16T00:07:56.409522  / # /lava-10751407/bin/lava-test-runner /la=
va-10751407/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648ba810adb0d17ce3306147

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ba810adb0d17ce330614c
        failing since 79 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-16T00:08:29.794396  <8>[   11.834181] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10751462_1.4.2.3.1>

    2023-06-16T00:08:29.898599  / # #

    2023-06-16T00:08:29.999281  export SHELL=3D/bin/sh

    2023-06-16T00:08:29.999499  #

    2023-06-16T00:08:30.100045  / # export SHELL=3D/bin/sh. /lava-10751462/=
environment

    2023-06-16T00:08:30.100234  =


    2023-06-16T00:08:30.200774  / # . /lava-10751462/environment/lava-10751=
462/bin/lava-test-runner /lava-10751462/1

    2023-06-16T00:08:30.201149  =


    2023-06-16T00:08:30.205491  / # /lava-10751462/bin/lava-test-runner /la=
va-10751462/1

    2023-06-16T00:08:30.212400  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648badb1de4cc5640030617a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648badb1de4cc5640030617f
        failing since 76 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-16T00:32:33.308591  + <8>[   14.126352] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10752128_1.4.2.3.1>

    2023-06-16T00:32:33.309103  set +x

    2023-06-16T00:32:33.417174  / # #

    2023-06-16T00:32:33.519272  export SHELL=3D/bin/sh

    2023-06-16T00:32:33.519932  #

    2023-06-16T00:32:33.621238  / # export SHELL=3D/bin/sh. /lava-10752128/=
environment

    2023-06-16T00:32:33.621904  =


    2023-06-16T00:32:33.723361  / # . /lava-10752128/environment/lava-10752=
128/bin/lava-test-runner /lava-10752128/1

    2023-06-16T00:32:33.724436  =


    2023-06-16T00:32:33.729693  / # /lava-10752128/bin/lava-test-runner /la=
va-10752128/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648baf505684840c8e30614c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648baf505684840c8e306=
14d
        failing since 36 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648bb067abc517077a306142

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a=
-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a=
-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bb067abc517077a306=
143
        failing since 8 days (last pass: v6.4-rc5-210-gef2d89b88456f, first=
 fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648bb1aee007cd929f30613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bb1aee007cd929f306=
13d
        failing since 36 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648bc24e3fb544584c30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bc24e3fb544584c306=
130
        failing since 6 days (last pass: v6.4-rc3-342-gff661430bdd5, first =
fail: v6.4-rc5-342-gc7b658b8488d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648bb185365be2b95230613b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bb185365be2b952306=
13c
        new failure (last pass: v6.4-rc5-342-gc7b658b8488d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/648bae8794f7bbb20b306171

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bae8794f7bbb20b306=
172
        failing since 50 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648bb1a7e6ade01cf0306217

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bb1a7e6ade01cf0306=
218
        failing since 38 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/648baea5e4d18df00230616c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648baea5e4d18df002306=
16d
        failing since 50 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648bb1bce007cd929f306146

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bb1bce007cd929f306=
147
        failing since 38 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648bacd28ee298a610306142

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bacd28ee298a610306=
143
        new failure (last pass: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648bac9e348054851e306195

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bac9e348054851e306=
196
        new failure (last pass: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648bacb9c8aab34a593061c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bacb9c8aab34a59306=
1c6
        new failure (last pass: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648bac70c7e292355a30616d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bac70c7e292355a306=
16e
        new failure (last pass: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648bacd421bbb25d5b306146

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bacd421bbb25d5b306=
147
        new failure (last pass: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648bacac4bc4bd4e3d30623f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bacac4bc4bd4e3d306=
240
        new failure (last pass: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648bacbb6db253e040306181

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bacbb6db253e040306=
182
        failing since 0 day (last pass: v6.4-rc6-257-gbc9b3eb6d292, first f=
ail: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648bac9dd1ad3c07ed306189

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bac9dd1ad3c07ed306=
18a
        failing since 0 day (last pass: v6.4-rc6-257-gbc9b3eb6d292, first f=
ail: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/648bac71c7e292355a306172

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bac71c7e292355a306=
173
        new failure (last pass: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648bafb4758f2cd2e330614a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bafb4758f2cd2e3306=
14b
        failing since 182 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648bab7b1e2812cc82306136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bab7b1e2812cc82306=
137
        failing since 182 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648bac67c7e292355a306150

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bac67c7e292355a306155
        failing since 134 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-16T00:27:05.295467  [   32.494474] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3666299_1.5.2.4.1>
    2023-06-16T00:27:05.400424  =

    2023-06-16T00:27:05.501821  / # #export SHELL=3D/bin/sh
    2023-06-16T00:27:05.502298  =

    2023-06-16T00:27:05.603546  / # export SHELL=3D/bin/sh. /lava-3666299/e=
nvironment
    2023-06-16T00:27:05.604027  =

    2023-06-16T00:27:05.705288  / # . /lava-3666299/environment/lava-366629=
9/bin/lava-test-runner /lava-3666299/1
    2023-06-16T00:27:05.705993  =

    2023-06-16T00:27:05.709395  / # /lava-3666299/bin/lava-test-runner /lav=
a-3666299/1
    2023-06-16T00:27:05.745835  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648baccb8ee298a610306135

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648baccb8ee298a61030613a
        failing since 134 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-06-16T00:28:38.347052  [   29.227879] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3666337_1.5.2.4.1>
    2023-06-16T00:28:38.451083  =

    2023-06-16T00:28:38.552336  / # #export SHELL=3D/bin/sh
    2023-06-16T00:28:38.552664  =

    2023-06-16T00:28:38.653754  / # export SHELL=3D/bin/sh. /lava-3666337/e=
nvironment
    2023-06-16T00:28:38.654078  =

    2023-06-16T00:28:38.755174  / # . /lava-3666337/environment/lava-366633=
7/bin/lava-test-runner /lava-3666337/1
    2023-06-16T00:28:38.755741  =

    2023-06-16T00:28:38.758235  / # /lava-3666337/bin/lava-test-runner /lav=
a-3666337/1
    2023-06-16T00:28:38.794678  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648bad3069cb39313230612f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bad3069cb393132306134
        failing since 134 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-16T00:30:18.644994  [   28.785868] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3666407_1.5.2.4.1>
    2023-06-16T00:30:18.749537  =

    2023-06-16T00:30:18.851505  / # #export SHELL=3D/bin/sh
    2023-06-16T00:30:18.851965  =

    2023-06-16T00:30:18.953310  / # export SHELL=3D/bin/sh. /lava-3666407/e=
nvironment
    2023-06-16T00:30:18.954081  =

    2023-06-16T00:30:19.056818  / # . /lava-3666407/environment/lava-366640=
7/bin/lava-test-runner /lava-3666407/1
    2023-06-16T00:30:19.057876  =

    2023-06-16T00:30:19.061370  / # /lava-3666407/bin/lava-test-runner /lav=
a-3666407/1
    2023-06-16T00:30:19.096815  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648bad9396a30ec3e4306134

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648bad9396a30ec3e4306139
        failing since 134 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-16T00:31:59.491850  [   28.746296] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3666508_1.5.2.4.1>
    2023-06-16T00:31:59.596280  =

    2023-06-16T00:31:59.697843  / # #export SHELL=3D/bin/sh
    2023-06-16T00:31:59.698586  =

    2023-06-16T00:31:59.800626  / # export SHELL=3D/bin/sh. /lava-3666508/e=
nvironment
    2023-06-16T00:31:59.801374  =

    2023-06-16T00:31:59.903018  / # . /lava-3666508/environment/lava-366650=
8/bin/lava-test-runner /lava-3666508/1
    2023-06-16T00:31:59.903802  =

    2023-06-16T00:31:59.907177  / # /lava-3666508/bin/lava-test-runner /lav=
a-3666508/1
    2023-06-16T00:31:59.941264  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648bc01ccc97b069f130613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-a64=
-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-a64=
-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bc01ccc97b069f1306=
140
        new failure (last pass: v6.4-rc6-257-gbc9b3eb6d292) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648bc24d73b0ee5c2e306153

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bc24d73b0ee5c2e306=
154
        new failure (last pass: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648bac774717dc418d306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648bac774717dc418d306=
134
        failing since 1 day (last pass: v6.4-rc5-294-gda90eaebfb79, first f=
ail: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648baf0c421999bc32306201

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-30=
1-ga3b6bb6457ef/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libre=
tech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648baf0c421999bc32306=
202
        new failure (last pass: v6.4-rc6-274-g2a7f6b5fd1ca) =

 =20
