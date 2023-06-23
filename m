Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78DF373AF92
	for <lists+linux-next@lfdr.de>; Fri, 23 Jun 2023 06:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjFWEvB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Jun 2023 00:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbjFWEvA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Jun 2023 00:51:00 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3076E9B
        for <linux-next@vger.kernel.org>; Thu, 22 Jun 2023 21:50:55 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6685421cdb3so996093b3a.1
        for <linux-next@vger.kernel.org>; Thu, 22 Jun 2023 21:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687495854; x=1690087854;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uonSEkOn0fmN399/9z1FSw+Ag92gn4Mf8yqvkNzOTYo=;
        b=OAy2MxyYX0xvBjdRBcTmSqFUleRQulueAvm6Urs/Ua6w1ZZIu5iRS+kk1JjnCuQwO9
         p/FbldiuuvmwF94hHg4b8go0jEyAlUbHY7XZfKyBHCaYmGeYs9bCErILu4NhyYSZFCTU
         6l/tva5o9MtoSpw1WsvMnI+jNLf4O7xFOiV3EaAx+GUWlogyy9CV1cLswC1dEVLEGws1
         Z3J0h/vftxlDA2a97TTX/VElEDC48jra1QiUWIfG0SN8he4HgjVmhLIc4FWM+Ahl+j5h
         IDVvwYyvgfc64Eiif7wiQfnkzp2L6VGY+n0lwaGZQ2eNTSGrxvVyGjQFq0gr5iEnHmIC
         sS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687495854; x=1690087854;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uonSEkOn0fmN399/9z1FSw+Ag92gn4Mf8yqvkNzOTYo=;
        b=RTGg3Yoc/O1sGAxXSW/ewsVC/gfcETxCVwuk5PJ5wFQxtQ7I31PWEXTEWGSY84N/Wg
         +2DOUKoWfdTeuyrfbFkjVTfYcSn7enf20Tj02RHn7ER/Ovt0/z8F+SyGasEAtVCSezeP
         u1jxwAg11QssWSneAe9o/69jt8AHODQ7M5qqmqFetYFK8Bdz6tx8hjWVqHQrAjXeZx7X
         G0WRKK8OX2k5R3A9O+7VLRwk+GYaRZ3odJ2j9TU94tHepBfbdvz3jeeoW+qi3kxa4CnD
         TinZGq7lr62pqdb6e08RlZGZLKiQaNTUfbIaRyaPQ4eytpCNkux4mI2/TT9kLpEr7GEf
         CwUw==
X-Gm-Message-State: AC+VfDz6H0THog8G4fq4S7qRvMcQ8GH5NYl1fA0m0+in+P8WL+1kiDJz
        hU/EylkjgbRGrMzKF2f4PYADwIV2yy0ZN2wr4YkswQ==
X-Google-Smtp-Source: ACHHUZ7KWHFx6bzZ57ncLyqCshQcOqRGwxLCvy67bUh7k3CPt8Qr/HwYXKummtlZcdxx4e+7qC7LBw==
X-Received: by 2002:a05:6a21:900c:b0:10b:6b1f:c8c8 with SMTP id tq12-20020a056a21900c00b0010b6b1fc8c8mr18807890pzb.31.1687495851423;
        Thu, 22 Jun 2023 21:50:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id k23-20020a63f017000000b00528513c6bbcsm5573406pgh.28.2023.06.22.21.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 21:50:50 -0700 (PDT)
Message-ID: <649524aa.630a0220.8d3f2.cfe4@mx.google.com>
Date:   Thu, 22 Jun 2023 21:50:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc7-260-g7124fb0a8216
Subject: next/pending-fixes baseline: 505 runs,
 71 regressions (v6.4-rc7-260-g7124fb0a8216)
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

next/pending-fixes baseline: 505 runs, 71 regressions (v6.4-rc7-260-g7124fb=
0a8216)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
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

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

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
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
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

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc7-260-g7124fb0a8216/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc7-260-g7124fb0a8216
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7124fb0a82161c246738ccdf4b294c6a19d08bc5 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ea06fd3df3af8f30612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ea06fd3df3af8f306138
        failing since 86 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:40:15.524536  + set +x

    2023-06-23T00:40:15.531310  <8>[   10.833607] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10867373_1.4.2.3.1>

    2023-06-23T00:40:15.635388  / # #

    2023-06-23T00:40:15.735958  export SHELL=3D/bin/sh

    2023-06-23T00:40:15.736148  #

    2023-06-23T00:40:15.836642  / # export SHELL=3D/bin/sh. /lava-10867373/=
environment

    2023-06-23T00:40:15.836836  =


    2023-06-23T00:40:15.937325  / # . /lava-10867373/environment/lava-10867=
373/bin/lava-test-runner /lava-10867373/1

    2023-06-23T00:40:15.937651  =


    2023-06-23T00:40:15.943675  / # /lava-10867373/bin/lava-test-runner /la=
va-10867373/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ee8efb11c521ba306149

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ee8efb11c521ba306152
        failing since 86 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:59:41.616107  + set +x

    2023-06-23T00:59:41.622804  <8>[    7.929589] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10868060_1.4.2.3.1>

    2023-06-23T00:59:41.730222  / # #

    2023-06-23T00:59:41.831186  export SHELL=3D/bin/sh

    2023-06-23T00:59:41.831951  #

    2023-06-23T00:59:41.933481  / # export SHELL=3D/bin/sh. /lava-10868060/=
environment

    2023-06-23T00:59:41.934219  =


    2023-06-23T00:59:42.035979  / # . /lava-10868060/environment/lava-10868=
060/bin/lava-test-runner /lava-10868060/1

    2023-06-23T00:59:42.037122  =


    2023-06-23T00:59:42.043270  / # /lava-10868060/bin/lava-test-runner /la=
va-10868060/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f003401bc9fa9430612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494f003401bc9fa94306138
        failing since 84 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-23T01:05:59.196464  + set +x

    2023-06-23T01:05:59.202954  <8>[   12.820442] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10868341_1.4.2.3.1>

    2023-06-23T01:05:59.307243  / # #

    2023-06-23T01:05:59.407859  export SHELL=3D/bin/sh

    2023-06-23T01:05:59.408070  #

    2023-06-23T01:05:59.508572  / # export SHELL=3D/bin/sh. /lava-10868341/=
environment

    2023-06-23T01:05:59.508790  =


    2023-06-23T01:05:59.609322  / # . /lava-10868341/environment/lava-10868=
341/bin/lava-test-runner /lava-10868341/1

    2023-06-23T01:05:59.609635  =


    2023-06-23T01:05:59.615545  / # /lava-10868341/bin/lava-test-runner /la=
va-10868341/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6494e9eb2d45fba2dd3061c9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494e9eb2d45fba2dd3061d2
        failing since 86 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:39:57.320495  + set<8>[   11.595805] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10867350_1.4.2.3.1>

    2023-06-23T00:39:57.320584   +x

    2023-06-23T00:39:57.424896  / # #

    2023-06-23T00:39:57.525507  export SHELL=3D/bin/sh

    2023-06-23T00:39:57.525708  #

    2023-06-23T00:39:57.626227  / # export SHELL=3D/bin/sh. /lava-10867350/=
environment

    2023-06-23T00:39:57.626434  =


    2023-06-23T00:39:57.727094  / # . /lava-10867350/environment/lava-10867=
350/bin/lava-test-runner /lava-10867350/1

    2023-06-23T00:39:57.728294  =


    2023-06-23T00:39:57.733144  / # /lava-10867350/bin/lava-test-runner /la=
va-10867350/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ee936d72d8cc72306143

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ee936d72d8cc7230614c
        failing since 86 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:59:43.356731  + set<8>[   11.362075] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10868055_1.4.2.3.1>

    2023-06-23T00:59:43.356823   +x

    2023-06-23T00:59:43.461216  / # #

    2023-06-23T00:59:43.561910  export SHELL=3D/bin/sh

    2023-06-23T00:59:43.562102  #

    2023-06-23T00:59:43.662630  / # export SHELL=3D/bin/sh. /lava-10868055/=
environment

    2023-06-23T00:59:43.662822  =


    2023-06-23T00:59:43.763302  / # . /lava-10868055/environment/lava-10868=
055/bin/lava-test-runner /lava-10868055/1

    2023-06-23T00:59:43.763586  =


    2023-06-23T00:59:43.768593  / # /lava-10868055/bin/lava-test-runner /la=
va-10868055/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/6494efeed5206bfd5b306135

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6494efeed5206bf=
d5b306138
        failing since 7 days (last pass: v6.4-rc6-274-g2a7f6b5fd1ca, first =
fail: v6.4-rc6-301-ga3b6bb6457ef)
        3 lines

    2023-06-23T01:05:42.614193  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-23T01:05:42.620700  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-23T01:05:42.627199  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-23T01:05:42.633906  <8>[   14.840431] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494efeed5206bfd5b30613e
        failing since 84 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-23T01:05:42.638122  + set +x

    2023-06-23T01:05:42.644605  <8>[   14.857391] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10868318_1.4.2.3.1>

    2023-06-23T01:05:42.753132  / # #

    2023-06-23T01:05:42.855739  export SHELL=3D/bin/sh

    2023-06-23T01:05:42.856552  #

    2023-06-23T01:05:42.958230  / # export SHELL=3D/bin/sh. /lava-10868318/=
environment

    2023-06-23T01:05:42.959017  =


    2023-06-23T01:05:43.060825  / # . /lava-10868318/environment/lava-10868=
318/bin/lava-test-runner /lava-10868318/1

    2023-06-23T01:05:43.062219  =


    2023-06-23T01:05:43.067119  / # /lava-10868318/bin/lava-test-runner /la=
va-10868318/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6494e9f00aba36540c306162

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494e9f00aba36540c30616b
        failing since 86 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:40:05.886959  <8>[   11.128923] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10867355_1.4.2.3.1>

    2023-06-23T00:40:05.890735  + set +x

    2023-06-23T00:40:05.996907  =


    2023-06-23T00:40:06.098756  / # #export SHELL=3D/bin/sh

    2023-06-23T00:40:06.099642  =


    2023-06-23T00:40:06.201546  / # export SHELL=3D/bin/sh. /lava-10867355/=
environment

    2023-06-23T00:40:06.202540  =


    2023-06-23T00:40:06.304229  / # . /lava-10867355/environment/lava-10867=
355/bin/lava-test-runner /lava-10867355/1

    2023-06-23T00:40:06.305509  =


    2023-06-23T00:40:06.310710  / # /lava-10867355/bin/lava-test-runner /la=
va-10867355/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6494eea55f5bd5d2243061c0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494eea55f5bd5d2243061c9
        failing since 86 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:59:59.145908  <8>[   10.534507] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10868113_1.4.2.3.1>

    2023-06-23T00:59:59.149051  + set +x

    2023-06-23T00:59:59.250235  #

    2023-06-23T00:59:59.250515  =


    2023-06-23T00:59:59.351152  / # #export SHELL=3D/bin/sh

    2023-06-23T00:59:59.351364  =


    2023-06-23T00:59:59.452058  / # export SHELL=3D/bin/sh. /lava-10868113/=
environment

    2023-06-23T00:59:59.452263  =


    2023-06-23T00:59:59.552839  / # . /lava-10868113/environment/lava-10868=
113/bin/lava-test-runner /lava-10868113/1

    2023-06-23T00:59:59.553162  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494eff534940ce761306141

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494eff634940ce76130614a
        failing since 84 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-23T01:05:40.106609  <8>[   13.665213] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10868310_1.4.2.3.1>

    2023-06-23T01:05:40.109695  + set +x

    2023-06-23T01:05:40.214259  / # #

    2023-06-23T01:05:40.315101  export SHELL=3D/bin/sh

    2023-06-23T01:05:40.315289  #

    2023-06-23T01:05:40.415791  / # export SHELL=3D/bin/sh. /lava-10868310/=
environment

    2023-06-23T01:05:40.415995  =


    2023-06-23T01:05:40.516477  / # . /lava-10868310/environment/lava-10868=
310/bin/lava-test-runner /lava-10868310/1

    2023-06-23T01:05:40.516743  =


    2023-06-23T01:05:40.521318  / # /lava-10868310/bin/lava-test-runner /la=
va-10868310/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f0b21d7071a25030612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494f0b21d7071a250306137
        failing since 162 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-23T01:09:43.178858  / # #

    2023-06-23T01:09:43.279811  export SHELL=3D/bin/sh

    2023-06-23T01:09:43.280550  #

    2023-06-23T01:09:43.382039  / # export SHELL=3D/bin/sh. /lava-10867908/=
environment

    2023-06-23T01:09:43.382762  =


    2023-06-23T01:09:43.484173  / # . /lava-10867908/environment/lava-10867=
908/bin/lava-test-runner /lava-10867908/1

    2023-06-23T01:09:43.485275  =


    2023-06-23T01:09:43.487769  / # /lava-10867908/bin/lava-test-runner /la=
va-10867908/1

    2023-06-23T01:09:43.611686  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-23T01:09:43.612212  + cd /lava-10867908/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6494eed201b7a2dfc730613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494eed201b7a2dfc7306=
13d
        failing since 116 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f0175e2771d301306251

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f0175e2771d301306=
252
        failing since 0 day (last pass: v6.4-rc7-214-g00072f89e53f9, first =
fail: v6.4-rc7-235-g8d8d57edb1481) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ea78096bf9765c306161

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ea78096bf9765c30616a
        failing since 156 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-23T00:42:22.206079  + set +x<8>[   20.019594] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3687274_1.5.2.4.1>
    2023-06-23T00:42:22.206838  =

    2023-06-23T00:42:22.316560  / # #
    2023-06-23T00:42:22.420266  export SHELL=3D/bin/sh
    2023-06-23T00:42:22.421453  #
    2023-06-23T00:42:22.523943  / # export SHELL=3D/bin/sh. /lava-3687274/e=
nvironment
    2023-06-23T00:42:22.525028  =

    2023-06-23T00:42:22.627443  / # . /lava-3687274/environment/lava-368727=
4/bin/lava-test-runner /lava-3687274/1
    2023-06-23T00:42:22.629594  =

    2023-06-23T00:42:22.634542  / # /lava-3687274/bin/lava-test-runner /lav=
a-3687274/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ec44d3eab487eb306132

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ec44d3eab487eb30613b
        failing since 156 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-23T00:49:50.296109  + set +x<8>[   14.997325] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3687334_1.5.2.4.1>
    2023-06-23T00:49:50.296411  =

    2023-06-23T00:49:50.403425  / # #
    2023-06-23T00:49:50.505230  export SHELL=3D/bin/sh
    2023-06-23T00:49:50.505680  #
    2023-06-23T00:49:50.607037  / # export SHELL=3D/bin/sh. /lava-3687334/e=
nvironment
    2023-06-23T00:49:50.607380  =

    2023-06-23T00:49:50.708519  / # . /lava-3687334/environment/lava-368733=
4/bin/lava-test-runner /lava-3687334/1
    2023-06-23T00:49:50.709325  =

    2023-06-23T00:49:50.713960  / # /lava-3687334/bin/lava-test-runner /lav=
a-3687334/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ecc16b420a13a930613e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ecc16b420a13a9306147
        failing since 156 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-23T00:52:04.301423  <8>[   16.876769] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3687348_1.5.2.4.1>
    2023-06-23T00:52:04.409848  / # #
    2023-06-23T00:52:04.512250  export SHELL=3D/bin/sh
    2023-06-23T00:52:04.512608  #
    2023-06-23T00:52:04.613742  / # export SHELL=3D/bin/sh. /lava-3687348/e=
nvironment
    2023-06-23T00:52:04.614174  =

    2023-06-23T00:52:04.715496  / # . /lava-3687348/environment/lava-368734=
8/bin/lava-test-runner /lava-3687348/1
    2023-06-23T00:52:04.716330  =

    2023-06-23T00:52:04.721450  / # /lava-3687348/bin/lava-test-runner /lav=
a-3687348/1
    2023-06-23T00:52:04.814028  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6494edab3133ad8f9e306138

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494edab3133ad8f9e306141
        failing since 156 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-23T00:55:46.714516  <8>[   14.994508] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3687391_1.5.2.4.1>
    2023-06-23T00:55:46.825087  / # #
    2023-06-23T00:55:46.928760  export SHELL=3D/bin/sh
    2023-06-23T00:55:46.930068  #
    2023-06-23T00:55:47.032533  / # export SHELL=3D/bin/sh. /lava-3687391/e=
nvironment
    2023-06-23T00:55:47.033673  =

    2023-06-23T00:55:47.136193  / # . /lava-3687391/environment/lava-368739=
1/bin/lava-test-runner /lava-3687391/1
    2023-06-23T00:55:47.138118  =

    2023-06-23T00:55:47.143161  / # /lava-3687391/bin/lava-test-runner /lav=
a-3687391/1
    2023-06-23T00:55:47.232870  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ee24ad7b35a5b0306150

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ee24ad7b35a5b0306159
        failing since 156 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-23T00:58:02.493891  <8>[   14.705767] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3687428_1.5.2.4.1>
    2023-06-23T00:58:02.605075  / # #
    2023-06-23T00:58:02.708542  export SHELL=3D/bin/sh
    2023-06-23T00:58:02.709708  #
    2023-06-23T00:58:02.811711  / # export SHELL=3D/bin/sh. /lava-3687428/e=
nvironment
    2023-06-23T00:58:02.812782  =

    2023-06-23T00:58:02.915037  / # . /lava-3687428/environment/lava-368742=
8/bin/lava-test-runner /lava-3687428/1
    2023-06-23T00:58:02.916582  =

    2023-06-23T00:58:02.920207  / # /lava-3687428/bin/lava-test-runner /lav=
a-3687428/1
    2023-06-23T00:58:03.017247  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/6494ec4541ac436da4306136

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6494ec4541ac436=
da4306139
        failing since 112 days (last pass: v6.2-1218-g2d4a54ee969d, first f=
ail: v6.2-13370-g5872d227b73f)
        30 lines

    2023-06-23T00:49:47.224847  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-23T00:49:47.225685  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-23T00:49:47.226466  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf296000 allocated at load_module+0x6b0/0=
x1954
    2023-06-23T00:49:47.228070  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-23T00:49:47.332148  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-23T00:49:47.332990  kern  :emerg : Process udevd (pid: 73, stac=
k limit =3D 0x566e954d)
    2023-06-23T00:49:47.333436  kern  :emerg : Stack: (0xc88e9cf8 to 0xc88e=
a000)
    2023-06-23T00:49:47.333836  kern  :emerg : 9ce0:                       =
                                c4c12200 c0777860
    2023-06-23T00:49:47.334225  kern  :emerg : 9d00: 00000000 c03aff10 0000=
0000 a6a15054 0000005d a6a15054 c0777860 bf296220
    2023-06-23T00:49:47.335501  kern  :emerg : 9d20: 00000000 00000000 0000=
0000 00000001 c077785c bf32a590 bf296220 00000000 =

    ... (3 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6494ec4541ac436=
da430613a
        failing since 515 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-06-23T00:49:47.145665  kern  :alert : 8<--- cut here ---
    2023-06-23T00:49:47.148213  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-06-23T00:49:47.148930  kern  :alert : [00000060] *pgd=3Dc4ab2831, =
*pte=3D00000000, *ppte=3D00000000
    2023-06-23T00:49:47.149535  kern  :alert : Register r0 information: non=
-paged memory
    2023-06-23T00:49:47.149961  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc88e8000 allocated at kernel_clone+0x98/0x=
3a0
    2023-06-23T00:49:47.150450  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-06-23T00:49:47.188014  kern  :alert : Register r3 information: non=
-paged memory
    2023-06-23T00:49:47.189383  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4c12200 pointer offset 0 size 512
    2023-06-23T00:49:47.189872  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-06-23T00:49:47.190287  kern  :ale<8><LAVA_SIGNAL_TESTCASE TEST_CAS=
E_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16> =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ea0296b44d5b47306147

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ea0296b44d5b47306150
        failing since 86 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:40:20.308152  + <8>[   10.531828] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10867349_1.4.2.3.1>

    2023-06-23T00:40:20.308237  set +x

    2023-06-23T00:40:20.409661  =


    2023-06-23T00:40:20.510263  / # #export SHELL=3D/bin/sh

    2023-06-23T00:40:20.510539  =


    2023-06-23T00:40:20.611102  / # export SHELL=3D/bin/sh. /lava-10867349/=
environment

    2023-06-23T00:40:20.611344  =


    2023-06-23T00:40:20.711858  / # . /lava-10867349/environment/lava-10867=
349/bin/lava-test-runner /lava-10867349/1

    2023-06-23T00:40:20.712201  =


    2023-06-23T00:40:20.716455  / # /lava-10867349/bin/lava-test-runner /la=
va-10867349/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6494eeb9d32f5a105e30615f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494eeb9d32f5a105e306168
        failing since 86 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T01:00:24.746079  + set +x

    2023-06-23T01:00:24.752518  <8>[    8.186781] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10868124_1.4.2.3.1>

    2023-06-23T01:00:24.857188  / # #

    2023-06-23T01:00:24.957878  export SHELL=3D/bin/sh

    2023-06-23T01:00:24.958118  #

    2023-06-23T01:00:25.058670  / # export SHELL=3D/bin/sh. /lava-10868124/=
environment

    2023-06-23T01:00:25.058897  =


    2023-06-23T01:00:25.159452  / # . /lava-10868124/environment/lava-10868=
124/bin/lava-test-runner /lava-10868124/1

    2023-06-23T01:00:25.159798  =


    2023-06-23T01:00:25.164081  / # /lava-10868124/bin/lava-test-runner /la=
va-10868124/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f0075e2771d301306209

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494f0075e2771d301306212
        failing since 84 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-23T01:05:52.830942  + set +x

    2023-06-23T01:05:52.837193  <8>[   15.553926] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10868331_1.4.2.3.1>

    2023-06-23T01:05:52.943606  / # #

    2023-06-23T01:05:53.044275  export SHELL=3D/bin/sh

    2023-06-23T01:05:53.044490  #

    2023-06-23T01:05:53.145113  / # export SHELL=3D/bin/sh. /lava-10868331/=
environment

    2023-06-23T01:05:53.145393  =


    2023-06-23T01:05:53.245964  / # . /lava-10868331/environment/lava-10868=
331/bin/lava-test-runner /lava-10868331/1

    2023-06-23T01:05:53.246301  =


    2023-06-23T01:05:53.251158  / # /lava-10868331/bin/lava-test-runner /la=
va-10868331/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6494e9dbdd4b31d3983061a9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494e9dbdd4b31d3983061b2
        failing since 86 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:39:40.547214  <8>[   10.344361] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10867367_1.4.2.3.1>

    2023-06-23T00:39:40.550439  + set +x

    2023-06-23T00:39:40.651833  =


    2023-06-23T00:39:40.752386  / # #export SHELL=3D/bin/sh

    2023-06-23T00:39:40.752646  =


    2023-06-23T00:39:40.853128  / # export SHELL=3D/bin/sh. /lava-10867367/=
environment

    2023-06-23T00:39:40.853349  =


    2023-06-23T00:39:40.953891  / # . /lava-10867367/environment/lava-10867=
367/bin/lava-test-runner /lava-10867367/1

    2023-06-23T00:39:40.954272  =


    2023-06-23T00:39:40.959004  / # /lava-10867367/bin/lava-test-runner /la=
va-10867367/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ee8d6d72d8cc7230612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ee8d6d72d8cc72306137
        failing since 86 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:59:40.055144  + set +x

    2023-06-23T00:59:40.061582  <8>[   10.069414] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10868114_1.4.2.3.1>

    2023-06-23T00:59:40.165214  =


    2023-06-23T00:59:40.265931  / # #export SHELL=3D/bin/sh

    2023-06-23T00:59:40.266556  =


    2023-06-23T00:59:40.367583  / # export SHELL=3D/bin/sh. /lava-10868114/=
environment

    2023-06-23T00:59:40.367825  =


    2023-06-23T00:59:40.468487  / # . /lava-10868114/environment/lava-10868=
114/bin/lava-test-runner /lava-10868114/1

    2023-06-23T00:59:40.469714  =


    2023-06-23T00:59:40.474097  / # /lava-10868114/bin/lava-test-runner /la=
va-10868114/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494efd8806dc52bfb30614d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494efd8806dc52bfb306156
        failing since 84 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-23T01:05:08.850671  + <8>[   13.847032] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10868315_1.4.2.3.1>

    2023-06-23T01:05:08.850829  set +x

    2023-06-23T01:05:08.955067  / # #

    2023-06-23T01:05:09.055646  export SHELL=3D/bin/sh

    2023-06-23T01:05:09.055836  #

    2023-06-23T01:05:09.156344  / # export SHELL=3D/bin/sh. /lava-10868315/=
environment

    2023-06-23T01:05:09.156590  =


    2023-06-23T01:05:09.257188  / # . /lava-10868315/environment/lava-10868=
315/bin/lava-test-runner /lava-10868315/1

    2023-06-23T01:05:09.257466  =


    2023-06-23T01:05:09.262828  / # /lava-10868315/bin/lava-test-runner /la=
va-10868315/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6494e9ed0aba36540c30614e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494e9ed0aba36540c306157
        failing since 86 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:40:03.223705  + <8>[   11.407678] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10867360_1.4.2.3.1>

    2023-06-23T00:40:03.224275  set +x

    2023-06-23T00:40:03.332195  / # #

    2023-06-23T00:40:03.434810  export SHELL=3D/bin/sh

    2023-06-23T00:40:03.435700  #

    2023-06-23T00:40:03.537459  / # export SHELL=3D/bin/sh. /lava-10867360/=
environment

    2023-06-23T00:40:03.538337  =


    2023-06-23T00:40:03.639921  / # . /lava-10867360/environment/lava-10867=
360/bin/lava-test-runner /lava-10867360/1

    2023-06-23T00:40:03.641165  =


    2023-06-23T00:40:03.645852  / # /lava-10867360/bin/lava-test-runner /la=
va-10867360/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ee96fb11c521ba306172

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ee96fb11c521ba30617b
        failing since 86 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:59:44.548104  + set +x<8>[   11.561519] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10868121_1.4.2.3.1>

    2023-06-23T00:59:44.548230  =


    2023-06-23T00:59:44.652160  / # #

    2023-06-23T00:59:44.752927  export SHELL=3D/bin/sh

    2023-06-23T00:59:44.753132  #

    2023-06-23T00:59:44.853706  / # export SHELL=3D/bin/sh. /lava-10868121/=
environment

    2023-06-23T00:59:44.853920  =


    2023-06-23T00:59:44.954549  / # . /lava-10868121/environment/lava-10868=
121/bin/lava-test-runner /lava-10868121/1

    2023-06-23T00:59:44.954872  =


    2023-06-23T00:59:44.959501  / # /lava-10868121/bin/lava-test-runner /la=
va-10868121/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494eff4d5206bfd5b3061cd

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494eff4d5206bfd5b3061d6
        failing since 84 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-23T01:05:42.928579  + set +x

    2023-06-23T01:05:42.935036  <8>[   14.709972] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10868323_1.4.2.3.1>

    2023-06-23T01:05:43.039213  / # #

    2023-06-23T01:05:43.139839  export SHELL=3D/bin/sh

    2023-06-23T01:05:43.140040  #

    2023-06-23T01:05:43.240590  / # export SHELL=3D/bin/sh. /lava-10868323/=
environment

    2023-06-23T01:05:43.240799  =


    2023-06-23T01:05:43.341352  / # . /lava-10868323/environment/lava-10868=
323/bin/lava-test-runner /lava-10868323/1

    2023-06-23T01:05:43.341635  =


    2023-06-23T01:05:43.346956  / # /lava-10868323/bin/lava-test-runner /la=
va-10868323/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ec45f82042a1d9306160

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ec45f82042a1d9306169
        failing since 144 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-23T00:49:51.000354  + set +x
    2023-06-23T00:49:51.000515  [   14.390677] <LAVA_SIGNAL_ENDRUN 0_dmesg =
986067_1.5.2.3.1>
    2023-06-23T00:49:51.107934  / # #
    2023-06-23T00:49:51.209411  export SHELL=3D/bin/sh
    2023-06-23T00:49:51.209770  #
    2023-06-23T00:49:51.310927  / # export SHELL=3D/bin/sh. /lava-986067/en=
vironment
    2023-06-23T00:49:51.311376  =

    2023-06-23T00:49:51.412587  / # . /lava-986067/environment/lava-986067/=
bin/lava-test-runner /lava-986067/1
    2023-06-23T00:49:51.413164  =

    2023-06-23T00:49:51.416031  / # /lava-986067/bin/lava-test-runner /lava=
-986067/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ece501859e6e19306194

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ece501859e6e1930619d
        failing since 144 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-23T00:52:28.795155  + set +x
    2023-06-23T00:52:28.795305  [   13.119028] <LAVA_SIGNAL_ENDRUN 0_dmesg =
986082_1.5.2.3.1>
    2023-06-23T00:52:28.902545  / # #
    2023-06-23T00:52:29.003973  export SHELL=3D/bin/sh
    2023-06-23T00:52:29.004415  #
    2023-06-23T00:52:29.105696  / # export SHELL=3D/bin/sh. /lava-986082/en=
vironment
    2023-06-23T00:52:29.106241  =

    2023-06-23T00:52:29.207842  / # . /lava-986082/environment/lava-986082/=
bin/lava-test-runner /lava-986082/1
    2023-06-23T00:52:29.208471  =

    2023-06-23T00:52:29.211815  / # /lava-986082/bin/lava-test-runner /lava=
-986082/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ed71389257c0783061f1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ed71389257c0783061fa
        failing since 144 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-23T00:55:07.193332  + set +x
    2023-06-23T00:55:07.193514  [   12.170261] <LAVA_SIGNAL_ENDRUN 0_dmesg =
986095_1.5.2.3.1>
    2023-06-23T00:55:07.300061  / # #
    2023-06-23T00:55:07.401735  export SHELL=3D/bin/sh
    2023-06-23T00:55:07.402220  #
    2023-06-23T00:55:07.503409  / # export SHELL=3D/bin/sh. /lava-986095/en=
vironment
    2023-06-23T00:55:07.503801  =

    2023-06-23T00:55:07.605063  / # . /lava-986095/environment/lava-986095/=
bin/lava-test-runner /lava-986095/1
    2023-06-23T00:55:07.605698  =

    2023-06-23T00:55:07.608994  / # /lava-986095/bin/lava-test-runner /lava=
-986095/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6494edea2e51aa13c1306134

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494edea2e51aa13c130613d
        failing since 144 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-23T00:57:07.954608  + set +x
    2023-06-23T00:57:07.954776  [   12.856582] <LAVA_SIGNAL_ENDRUN 0_dmesg =
986104_1.5.2.3.1>
    2023-06-23T00:57:08.062221  / # #
    2023-06-23T00:57:08.164016  export SHELL=3D/bin/sh
    2023-06-23T00:57:08.164433  #
    2023-06-23T00:57:08.265718  / # export SHELL=3D/bin/sh. /lava-986104/en=
vironment
    2023-06-23T00:57:08.266266  =

    2023-06-23T00:57:08.367606  / # . /lava-986104/environment/lava-986104/=
bin/lava-test-runner /lava-986104/1
    2023-06-23T00:57:08.368369  =

    2023-06-23T00:57:08.371178  / # /lava-986104/bin/lava-test-runner /lava=
-986104/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6494efa2bf76ca0ab7306146

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494efa2bf76ca0ab730614f
        failing since 144 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-23T01:04:09.889824  + set +x
    2023-06-23T01:04:09.890068  [   13.122084] <LAVA_SIGNAL_ENDRUN 0_dmesg =
986116_1.5.2.3.1>
    2023-06-23T01:04:09.998234  / # #
    2023-06-23T01:04:10.100104  export SHELL=3D/bin/sh
    2023-06-23T01:04:10.100632  #
    2023-06-23T01:04:10.202002  / # export SHELL=3D/bin/sh. /lava-986116/en=
vironment
    2023-06-23T01:04:10.202609  =

    2023-06-23T01:04:10.304093  / # . /lava-986116/environment/lava-986116/=
bin/lava-test-runner /lava-986116/1
    2023-06-23T01:04:10.304858  =

    2023-06-23T01:04:10.308045  / # /lava-986116/bin/lava-test-runner /lava=
-986116/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f43e295cd5f10c30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f43e295cd5f10c306=
12f
        failing since 228 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6494eab5008f0a243e30616b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494eab5008f0a243e306=
16c
        failing since 419 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ed47bcb6ab4716306134

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am=
625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am=
625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ed47bcb6ab471630613d
        failing since 57 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-23T00:54:13.198645  <8>[    7.732284] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3687417_1.5.2.4.1>
    2023-06-23T00:54:13.304552  / # #
    2023-06-23T00:54:13.407297  export SHELL=3D/bin/sh
    2023-06-23T00:54:13.407782  #
    2023-06-23T00:54:13.509121  / # export SHELL=3D/bin/sh. /lava-3687417/e=
nvironment
    2023-06-23T00:54:13.509541  =

    2023-06-23T00:54:13.610689  / # . /lava-3687417/environment/lava-368741=
7/bin/lava-test-runner /lava-3687417/1
    2023-06-23T00:54:13.611263  =

    2023-06-23T00:54:13.631843  / # /lava-3687417/bin/lava-test-runner /lav=
a-3687417/1
    2023-06-23T00:54:13.673068  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6494e9dd2d45fba2dd306133

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494e9dd2d45fba2dd30613c
        failing since 86 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T00:39:43.141787  <8>[   11.873499] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10867370_1.4.2.3.1>

    2023-06-23T00:39:43.246129  / # #

    2023-06-23T00:39:43.346698  export SHELL=3D/bin/sh

    2023-06-23T00:39:43.346883  #

    2023-06-23T00:39:43.447376  / # export SHELL=3D/bin/sh. /lava-10867370/=
environment

    2023-06-23T00:39:43.447618  =


    2023-06-23T00:39:43.548090  / # . /lava-10867370/environment/lava-10867=
370/bin/lava-test-runner /lava-10867370/1

    2023-06-23T00:39:43.548407  =


    2023-06-23T00:39:43.553045  / # /lava-10867370/bin/lava-test-runner /la=
va-10867370/1

    2023-06-23T00:39:43.560197  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6494eea6852c65a63f30615f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494eea6852c65a63f306168
        failing since 86 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-23T01:00:09.349718  <8>[   11.651355] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10868129_1.4.2.3.1>

    2023-06-23T01:00:09.453901  / # #

    2023-06-23T01:00:09.554503  export SHELL=3D/bin/sh

    2023-06-23T01:00:09.554714  #

    2023-06-23T01:00:09.655232  / # export SHELL=3D/bin/sh. /lava-10868129/=
environment

    2023-06-23T01:00:09.655443  =


    2023-06-23T01:00:09.755971  / # . /lava-10868129/environment/lava-10868=
129/bin/lava-test-runner /lava-10868129/1

    2023-06-23T01:00:09.756238  =


    2023-06-23T01:00:09.760819  / # /lava-10868129/bin/lava-test-runner /la=
va-10868129/1

    2023-06-23T01:00:09.767333  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494efd9806dc52bfb306158

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494efd9806dc52bfb306161
        failing since 84 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-23T01:05:17.523190  + set +x

    2023-06-23T01:05:17.529838  <8>[   14.394804] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10868328_1.4.2.3.1>

    2023-06-23T01:05:17.634050  / # #

    2023-06-23T01:05:17.734729  export SHELL=3D/bin/sh

    2023-06-23T01:05:17.734984  #

    2023-06-23T01:05:17.835601  / # export SHELL=3D/bin/sh. /lava-10868328/=
environment

    2023-06-23T01:05:17.835822  =


    2023-06-23T01:05:17.936401  / # . /lava-10868328/environment/lava-10868=
328/bin/lava-test-runner /lava-10868328/1

    2023-06-23T01:05:17.936735  =


    2023-06-23T01:05:17.940706  / # /lava-10868328/bin/lava-test-runner /la=
va-10868328/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f19e6ce43ea22d306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f19e6ce43ea22d306=
13a
        failing since 149 days (last pass: v6.2-rc5-157-g1f16e03afb18, firs=
t fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ed72389257c078306222

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494ed72389257c078306=
223
        failing since 57 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f0c62c5995c11730615e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f0c62c5995c117306=
15f
        failing since 45 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f1b2a773703ebe306151

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f1b2a773703ebe306=
152
        failing since 135 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ed75389257c07830622e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494ed75389257c078306=
22f
        failing since 57 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f10c4628bb822e3061ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f10c4628bb822e306=
1ed
        failing since 45 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f1fd2ccaeae83e306135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f1fd2ccaeae83e306=
136
        failing since 135 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f3e409f3f7db3430615d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f3e409f3f7db34306=
15e
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494fbbe8a542371f9306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494fbbe8a542371f9306=
145
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f3e409f3f7db3430615a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f3e409f3f7db34306=
15b
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f3e509f3f7db34306160

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f3e509f3f7db34306=
161
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494fbd2e40d1db663306172

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494fbd2e40d1db663306=
173
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f3d7eeb7a14caa306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f3d7eeb7a14caa306=
132
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f3e709f3f7db34306166

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f3e709f3f7db34306=
167
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494fbfa0edac9139d30617b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494fbfa0edac9139d306=
17c
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f3ee31305e63d330612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f3ee31305e63d3306=
12f
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f3e609f3f7db34306163

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f3e609f3f7db34306=
164
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494fbe60edac9139d30613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494fbe60edac9139d306=
13e
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f3d9025e64f85b306130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f3d9025e64f85b306=
131
        failing since 253 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f2a7bbc261e21f30613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f2a7bbc261e21f306=
140
        failing since 1 day (last pass: v6.4-rc7-164-g1f02f25057f7, first f=
ail: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f3876f002cd9b33062e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f3876f002cd9b3306=
2e9
        failing since 1 day (last pass: v6.4-rc7-164-g1f02f25057f7, first f=
ail: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f2a4bbc261e21f30613a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f2a4bbc261e21f306=
13b
        new failure (last pass: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f39c4175436220306150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f39c4175436220306=
151
        new failure (last pass: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ef9ae4df0863bf3065fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494ef9ae4df0863bf306=
5fc
        failing since 189 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6494eb3b6ed7cbbf3c306135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494eb3b6ed7cbbf3c306=
136
        failing since 189 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ecb0dd3070149e306192

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ecb0dd3070149e30619b
        failing since 142 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-23T00:51:45.665986  [   29.243877] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3687384_1.5.2.4.1>
    2023-06-23T00:51:45.770655  =

    2023-06-23T00:51:45.872331  / # #export SHELL=3D/bin/sh
    2023-06-23T00:51:45.872800  =

    2023-06-23T00:51:45.974231  / # export SHELL=3D/bin/sh. /lava-3687384/e=
nvironment
    2023-06-23T00:51:45.974667  =

    2023-06-23T00:51:46.076093  / # . /lava-3687384/environment/lava-368738=
4/bin/lava-test-runner /lava-3687384/1
    2023-06-23T00:51:46.076798  =

    2023-06-23T00:51:46.080142  / # /lava-3687384/bin/lava-test-runner /lav=
a-3687384/1
    2023-06-23T00:51:46.116908  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6494ed1552f0ada3b9306178

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6494ed1552f0ada3b9306181
        failing since 141 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-23T00:53:32.871562  [   30.503331] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3687405_1.5.2.4.1>
    2023-06-23T00:53:32.976310  =

    2023-06-23T00:53:33.078527  / # #export SHELL=3D/bin/sh
    2023-06-23T00:53:33.078920  =

    2023-06-23T00:53:33.180340  / # export SHELL=3D/bin/sh. /lava-3687405/e=
nvironment
    2023-06-23T00:53:33.180812  =

    2023-06-23T00:53:33.282282  / # . /lava-3687405/environment/lava-368740=
5/bin/lava-test-runner /lava-3687405/1
    2023-06-23T00:53:33.283279  =

    2023-06-23T00:53:33.286449  / # /lava-3687405/bin/lava-test-runner /lav=
a-3687405/1
    2023-06-23T00:53:33.319625  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f1ce8e15c3c207306143

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f1ce8e15c3c207306=
144
        failing since 135 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f18c7c56260e92306369

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f18c7c56260e92306=
36a
        failing since 135 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f1c657f3e9a63c30613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f1c657f3e9a63c306=
13e
        failing since 135 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6494f93d27f70d20f6306190

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-26=
0-g7124fb0a8216/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6494f93d27f70d20f6306=
191
        failing since 1 day (last pass: v6.4-rc7-214-g00072f89e53f9, first =
fail: v6.4-rc7-235-g8d8d57edb1481) =

 =20
