Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98BD2728ECC
	for <lists+linux-next@lfdr.de>; Fri,  9 Jun 2023 06:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238302AbjFIEHv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Jun 2023 00:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjFIEHt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Jun 2023 00:07:49 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74241BE4
        for <linux-next@vger.kernel.org>; Thu,  8 Jun 2023 21:07:44 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso396803a12.3
        for <linux-next@vger.kernel.org>; Thu, 08 Jun 2023 21:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686283664; x=1688875664;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YhWCcHzifVrWq2XrOCHeC+gBlnOFLM0UHK0kKTpIRbU=;
        b=FO1eI+9HY0tbc+oxXfImTN5q8atcWNKooDzANNcX06+KAj3B1E5yh2BHjnEN1p/4Z4
         rA+IImDJPiwtT0ls38dWuoaQtLDuX7wobR8nAcSfVaQi2iKugqzL7Zj83VTYZHTqUrzF
         15xLC7Guq5b58l7ZkngOdVCI86ey1yOSyLD/2UBsjJl5wzbuu6sufuPcE6fcIj+Nnpzv
         XzknJ1xJvWupZAuihFZCbxLpvDQedNzirNUWQPTKkJECBpQb/dI6cXjEZfoIN5Ywqx5K
         2cc/q2LTqUv2b3KfLZdfkt8rvdkZQ5q8q5F5CCML5jAfZAuWVKADObiJGLWLQxtBbr7t
         VoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686283664; x=1688875664;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhWCcHzifVrWq2XrOCHeC+gBlnOFLM0UHK0kKTpIRbU=;
        b=TpTd/aKuHowRsbNAoI270VJfbfPlzKLKZLY5J7LATcXAQYNlh4Ql7lycFUPXT8+jLk
         xTjuETq1w+1kBTV8g64fcqplb3kNbXd/3n3BlAAkXcjGsPjK02ElvpX2J/z8ArAYvus7
         AgZbvi9eU2AP6VhRg7Ca9GtLbIH5TZi6bbjd2pFXY2sOWFRlT96HYROBN6kDjUDg223m
         N9rIWGZY2iDKQKlYkJwnv0/W4dxLHv2cmEM56FV6e5sEHq9Zo/wZjdpgBoUtlFdGp3Jh
         lsrjy0AWOcuXUVEPYLGZFTqizCuoepbhB6OM3Bjug3KjS3JivXRJrULCS4sd4hyCRB0+
         b8yQ==
X-Gm-Message-State: AC+VfDy39V/1xBDLTXMIhyzCg2oqI8PXn0Uacivs40aSmMPQ9+UGMhwT
        GP1bemnlm9GX0qHG3vqVjmTy2IrhY9oXv7kLEaIAAQ==
X-Google-Smtp-Source: ACHHUZ5ry9grVVIMtwzqEW9ElUDTcTJFAq7D+xb1+5boqHSwyangOOcnpVjmvRxJ/S2YOWjtttSxUw==
X-Received: by 2002:a05:6a20:728b:b0:118:ed8a:af45 with SMTP id o11-20020a056a20728b00b00118ed8aaf45mr172649pzk.40.1686283661785;
        Thu, 08 Jun 2023 21:07:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p17-20020a170902b09100b001b0772fe3fdsm2151368plr.265.2023.06.08.21.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 21:07:41 -0700 (PDT)
Message-ID: <6482a58d.170a0220.35e82.4fc1@mx.google.com>
Date:   Thu, 08 Jun 2023 21:07:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc5-342-gc7b658b8488d
Subject: next/pending-fixes baseline: 516 runs,
 63 regressions (v6.4-rc5-342-gc7b658b8488d)
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

next/pending-fixes baseline: 516 runs, 63 regressions (v6.4-rc5-342-gc7b658=
b8488d)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc5-342-gc7b658b8488d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc5-342-gc7b658b8488d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c7b658b8488dd2db8992e9ed18afe739c893c6b9 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64827b96a65fdf188130617a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64827b96a65fdf1881306=
17b
        failing since 242 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b5ec570e2603030614c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b5ec570e26030306151
        failing since 72 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:59:20.702281  <8>[   10.331322] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648069_1.4.2.3.1>

    2023-06-08T23:59:20.705392  + set +x

    2023-06-08T23:59:20.806586  /#

    2023-06-08T23:59:20.907504   # #export SHELL=3D/bin/sh

    2023-06-08T23:59:20.907699  =


    2023-06-08T23:59:21.008211  / # export SHELL=3D/bin/sh. /lava-10648069/=
environment

    2023-06-08T23:59:21.008420  =


    2023-06-08T23:59:21.108960  / # . /lava-10648069/environment/lava-10648=
069/bin/lava-test-runner /lava-10648069/1

    2023-06-08T23:59:21.109335  =


    2023-06-08T23:59:21.114688  / # /lava-10648069/bin/lava-test-runner /la=
va-10648069/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b6cafa8beb0ef306165

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b6cafa8beb0ef30616a
        failing since 72 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:59:22.526105  + set +x

    2023-06-08T23:59:22.533207  <8>[   11.103540] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648157_1.4.2.3.1>

    2023-06-08T23:59:22.637520  / # #

    2023-06-08T23:59:22.738179  export SHELL=3D/bin/sh

    2023-06-08T23:59:22.738409  #

    2023-06-08T23:59:22.838998  / # export SHELL=3D/bin/sh. /lava-10648157/=
environment

    2023-06-08T23:59:22.839793  =


    2023-06-08T23:59:22.941301  / # . /lava-10648157/environment/lava-10648=
157/bin/lava-test-runner /lava-10648157/1

    2023-06-08T23:59:22.942552  =


    2023-06-08T23:59:22.947412  / # /lava-10648157/bin/lava-test-runner /la=
va-10648157/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64826cb287615b76db306143

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826cb287615b76db306148
        failing since 69 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-09T00:05:06.907301  <8>[   95.331051] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648276_1.4.2.3.1>

    2023-06-09T00:05:06.910680  + set +x

    2023-06-09T00:05:07.015221  #

    2023-06-09T00:05:07.118172  / # #export SHELL=3D/bin/sh

    2023-06-09T00:05:07.118926  =


    2023-06-09T00:05:07.220349  / # export SHELL=3D/bin/sh. /lava-10648276/=
environment

    2023-06-09T00:05:07.221028  =


    2023-06-09T00:05:07.322381  / # . /lava-10648276/environment/lava-10648=
276/bin/lava-test-runner /lava-10648276/1

    2023-06-09T00:05:07.323648  =


    2023-06-09T00:05:07.330410  / # /lava-10648276/bin/lava-test-runner /la=
va-10648276/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b66afa8beb0ef30612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b66afa8beb0ef306133
        failing since 72 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:59:15.268980  + <8>[   11.973249] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10648090_1.4.2.3.1>

    2023-06-08T23:59:15.269465  set +x

    2023-06-08T23:59:15.378082  / # #

    2023-06-08T23:59:15.480225  export SHELL=3D/bin/sh

    2023-06-08T23:59:15.481219  #

    2023-06-08T23:59:15.582893  / # export SHELL=3D/bin/sh. /lava-10648090/=
environment

    2023-06-08T23:59:15.583641  =


    2023-06-08T23:59:15.685103  / # . /lava-10648090/environment/lava-10648=
090/bin/lava-test-runner /lava-10648090/1

    2023-06-08T23:59:15.686309  =


    2023-06-08T23:59:15.690992  / # /lava-10648090/bin/lava-test-runner /la=
va-10648090/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b7ae40692da6330613e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b7ae40692da63306143
        failing since 72 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:59:38.547566  + set +x<8>[   11.765391] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10648180_1.4.2.3.1>

    2023-06-08T23:59:38.548146  =


    2023-06-08T23:59:38.656232  / # #

    2023-06-08T23:59:38.758990  export SHELL=3D/bin/sh

    2023-06-08T23:59:38.759804  #

    2023-06-08T23:59:38.861469  / # export SHELL=3D/bin/sh. /lava-10648180/=
environment

    2023-06-08T23:59:38.862310  =


    2023-06-08T23:59:38.964195  / # . /lava-10648180/environment/lava-10648=
180/bin/lava-test-runner /lava-10648180/1

    2023-06-08T23:59:38.965445  =


    2023-06-08T23:59:38.970035  / # /lava-10648180/bin/lava-test-runner /la=
va-10648180/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/64826c6be8ce3f3fc4306181

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826c6be8ce3f3fc4306186
        failing since 69 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-09T00:03:39.432891  + set +x

    2023-06-09T00:03:39.438994  <8>[   12.962864] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648254_1.4.2.3.1>

    2023-06-09T00:03:39.547769  / # #

    2023-06-09T00:03:39.650541  export SHELL=3D/bin/sh

    2023-06-09T00:03:39.651373  #

    2023-06-09T00:03:39.752821  / # export SHELL=3D/bin/sh. /lava-10648254/=
environment

    2023-06-09T00:03:39.753620  =


    2023-06-09T00:03:39.855313  / # . /lava-10648254/environment/lava-10648=
254/bin/lava-test-runner /lava-10648254/1

    2023-06-09T00:03:39.856657  =


    2023-06-09T00:03:39.861476  / # /lava-10648254/bin/lava-test-runner /la=
va-10648254/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64826c6be8ce3f3=
fc4306188
        failing since 29 days (last pass: v6.4-rc1-141-gb95366eba58e, first=
 fail: v6.4-rc1-166-g16fe96af4971)
        3 lines

    2023-06-09T00:03:39.408931  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-09T00:03:39.415710  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-09T00:03:39.421950  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-09T00:03:39.428741  <8>[   12.946633] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b6217537f4110306182

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b6317537f4110306187
        failing since 72 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:59:18.915699  <8>[   11.311661] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648186_1.4.2.3.1>

    2023-06-08T23:59:18.918930  + set +x

    2023-06-08T23:59:19.020217  #

    2023-06-08T23:59:19.020569  =


    2023-06-08T23:59:19.121210  / # #export SHELL=3D/bin/sh

    2023-06-08T23:59:19.121421  =


    2023-06-08T23:59:19.221964  / # export SHELL=3D/bin/sh. /lava-10648186/=
environment

    2023-06-08T23:59:19.222178  =


    2023-06-08T23:59:19.322720  / # . /lava-10648186/environment/lava-10648=
186/bin/lava-test-runner /lava-10648186/1

    2023-06-08T23:59:19.323001  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b70afa8beb0ef306174

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b70afa8beb0ef306179
        failing since 72 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:59:20.065557  <8>[   10.324769] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648112_1.4.2.3.1>

    2023-06-08T23:59:20.068723  + set +x

    2023-06-08T23:59:20.170398  #

    2023-06-08T23:59:20.170678  =


    2023-06-08T23:59:20.271301  / # #export SHELL=3D/bin/sh

    2023-06-08T23:59:20.271496  =


    2023-06-08T23:59:20.372027  / # export SHELL=3D/bin/sh. /lava-10648112/=
environment

    2023-06-08T23:59:20.372251  =


    2023-06-08T23:59:20.472849  / # . /lava-10648112/environment/lava-10648=
112/bin/lava-test-runner /lava-10648112/1

    2023-06-08T23:59:20.473208  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64826c5b0994b5042130617b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826c5b0994b50421306180
        failing since 69 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-09T00:03:29.447043  <8>[   12.591789] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648294_1.4.2.3.1>

    2023-06-09T00:03:29.450285  + set +x

    2023-06-09T00:03:29.551897  =


    2023-06-09T00:03:29.652461  / # #export SHELL=3D/bin/sh

    2023-06-09T00:03:29.652700  =


    2023-06-09T00:03:29.753244  / # export SHELL=3D/bin/sh. /lava-10648294/=
environment

    2023-06-09T00:03:29.753473  =


    2023-06-09T00:03:29.854032  / # . /lava-10648294/environment/lava-10648=
294/bin/lava-test-runner /lava-10648294/1

    2023-06-09T00:03:29.854377  =


    2023-06-09T00:03:29.859398  / # /lava-10648294/bin/lava-test-runner /la=
va-10648294/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482712b1e1c3729f9306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6482712b1e1c3729f9306=
13a
        new failure (last pass: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64826c33306af29ec2306136

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826c33306af29ec230613b
        failing since 148 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-09T00:03:13.243722  / # #

    2023-06-09T00:03:13.345895  export SHELL=3D/bin/sh

    2023-06-09T00:03:13.346618  #

    2023-06-09T00:03:13.448034  / # export SHELL=3D/bin/sh. /lava-10648173/=
environment

    2023-06-09T00:03:13.448761  =


    2023-06-09T00:03:13.550245  / # . /lava-10648173/environment/lava-10648=
173/bin/lava-test-runner /lava-10648173/1

    2023-06-09T00:03:13.551368  =


    2023-06-09T00:03:13.568423  / # /lava-10648173/bin/lava-test-runner /la=
va-10648173/1

    2023-06-09T00:03:13.676291  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-09T00:03:13.676815  + cd /lava-10648173/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64827135b3b6e5c7f430612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64827135b3b6e5c7f4306=
12f
        failing since 102 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64827259eb9d4c16c9306186

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64827259eb9d4c16c9306=
187
        failing since 1 day (last pass: v6.4-rc5-244-g9d674be53332, first f=
ail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64826ea93b9c62019a30614c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826ea93b9c62019a306=
14d
        new failure (last pass: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64826ece3d72d7a6213061b8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826ece3d72d7a6213061bd
        failing since 142 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-09T00:13:15.440151  <8>[   20.239575] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3650016_1.5.2.4.1>
    2023-06-09T00:13:15.547338  / # #
    2023-06-09T00:13:15.650324  export SHELL=3D/bin/sh
    2023-06-09T00:13:15.651281  #
    2023-06-09T00:13:15.753131  / # export SHELL=3D/bin/sh. /lava-3650016/e=
nvironment
    2023-06-09T00:13:15.753990  =

    2023-06-09T00:13:15.856091  / # . /lava-3650016/environment/lava-365001=
6/bin/lava-test-runner /lava-3650016/1
    2023-06-09T00:13:15.857632  =

    2023-06-09T00:13:15.862516  / # /lava-3650016/bin/lava-test-runner /lav=
a-3650016/1
    2023-06-09T00:13:15.947860  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64827060c8db6c26e530613b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64827060c8db6c26e5306140
        failing since 142 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-09T00:20:17.150053  <8>[   16.850463] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3650061_1.5.2.4.1>
    2023-06-09T00:20:17.259500  / # #
    2023-06-09T00:20:17.362976  export SHELL=3D/bin/sh
    2023-06-09T00:20:17.363954  #
    2023-06-09T00:20:17.466252  / # export SHELL=3D/bin/sh. /lava-3650061/e=
nvironment
    2023-06-09T00:20:17.467397  =

    2023-06-09T00:20:17.569861  / # . /lava-3650061/environment/lava-365006=
1/bin/lava-test-runner /lava-3650061/1
    2023-06-09T00:20:17.571684  =

    2023-06-09T00:20:17.576503  / # /lava-3650061/bin/lava-test-runner /lav=
a-3650061/1
    2023-06-09T00:20:17.667776  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648271ed16a5de8e0630614e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648271ed16a5de8e06306153
        failing since 142 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-09T00:26:45.664433  <8>[   14.967681] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3650090_1.5.2.4.1>
    2023-06-09T00:26:45.771077  / # #
    2023-06-09T00:26:45.872550  export SHELL=3D/bin/sh
    2023-06-09T00:26:45.872893  #
    2023-06-09T00:26:45.974028  / # export SHELL=3D/bin/sh. /lava-3650090/e=
nvironment
    2023-06-09T00:26:45.974826  =

    2023-06-09T00:26:46.076633  / # . /lava-3650090/environment/lava-365009=
0/bin/lava-test-runner /lava-3650090/1
    2023-06-09T00:26:46.077911  =

    2023-06-09T00:26:46.082585  / # /lava-3650090/bin/lava-test-runner /lav=
a-3650090/1
    2023-06-09T00:26:46.163746  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6482727db6f481df17306136

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482727db6f481df1730613b
        failing since 142 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-09T00:29:22.566762  <8>[   15.473535] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3650117_1.5.2.4.1>
    2023-06-09T00:29:22.677115  / # #
    2023-06-09T00:29:22.780269  export SHELL=3D/bin/sh
    2023-06-09T00:29:22.781193  #
    2023-06-09T00:29:22.883178  / # export SHELL=3D/bin/sh. /lava-3650117/e=
nvironment
    2023-06-09T00:29:22.884067  =

    2023-06-09T00:29:22.986016  / # . /lava-3650117/environment/lava-365011=
7/bin/lava-test-runner /lava-3650117/1
    2023-06-09T00:29:22.987613  =

    2023-06-09T00:29:22.992317  / # /lava-3650117/bin/lava-test-runner /lav=
a-3650117/1
    2023-06-09T00:29:23.082002  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6482730e0a6f6c8e033061ac

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482730e0a6f6c8e033061b1
        failing since 142 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-09T00:31:53.826159  <8>[   14.870677] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3650184_1.5.2.4.1>
    2023-06-09T00:31:53.936120  / # #
    2023-06-09T00:31:54.039437  export SHELL=3D/bin/sh
    2023-06-09T00:31:54.040416  #
    2023-06-09T00:31:54.142393  / # export SHELL=3D/bin/sh. /lava-3650184/e=
nvironment
    2023-06-09T00:31:54.143442  =

    2023-06-09T00:31:54.245658  / # . /lava-3650184/environment/lava-365018=
4/bin/lava-test-runner /lava-3650184/1
    2023-06-09T00:31:54.247291  =

    2023-06-09T00:31:54.252364  / # /lava-3650184/bin/lava-test-runner /lav=
a-3650184/1
    2023-06-09T00:31:54.353147  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/64826e2763e9068d7530612e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64826e2763e9068=
d75306135
        failing since 97 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-06-09T00:10:55.358421  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4ca0200 pointer offset 4 size 512
    2023-06-09T00:10:55.392531  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-09T00:10:55.392790  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-09T00:10:55.392926  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2cf000 allocated at load_module+0x6b0/0=
x1954
    2023-06-09T00:10:55.395641  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-09T00:10:55.459662  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-09T00:10:55.502848  kern  :emerg : Process udevd (pid: 73, stac=
k limit =3D 0x7000c548)
    2023-06-09T00:10:55.503142  kern  :emerg : Stack: (0xc88e9cf8 to 0xc88e=
a000)
    2023-06-09T00:10:55.503330  kern  :emerg : 9ce0:                       =
                                c4ca0200 c0777860
    2023-06-09T00:10:55.503502  kern  :emerg : 9d00: 00000000 c03affe8 0000=
0000 f65f061e 0000005d f65f061e c0777860 bf2cf220 =

    ... (7 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64826e2763e9068=
d75306136
        failing since 501 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-06-09T00:10:55.311897  kern  :alert : 8<--- cut here ---
    2023-06-09T00:10:55.312199  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-06-09T00:10:55.312362  kern  :alert : [00000060] *pgd=3Dc4ab0831, =
*pte=3D00000000, *ppte=3D00000000
    2023-06-09T00:10:55.312510  kern  :alert : Register r0 information: non=
-paged memory
    2023-06-09T00:10:55.312652  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc88e8000 allocated at kernel_clone+0x98/0x=
3a0
    2023-06-09T00:10:55.314768  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-06-09T00:10:55.355585  kern  :alert : Register r3 information: non=
-paged memory
    2023-06-09T00:10:55.355864  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4ca0200 pointer offset 0 size 512
    2023-06-09T00:10:55.356028  kern  :alert : Register r5 information: non=
-slab/vmalloc me<8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail=
 UNITS=3Dlines MEASUREMENT=3D16>
    2023-06-09T00:10:55.356177  mory =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64826ba2f3ff95505d30616d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826ba2f3ff95505d306172
        failing since 72 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-09T00:00:20.976359  + set +x

    2023-06-09T00:00:20.982894  <8>[    8.197887] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648102_1.4.2.3.1>

    2023-06-09T00:00:21.087532  / # #

    2023-06-09T00:00:21.188339  export SHELL=3D/bin/sh

    2023-06-09T00:00:21.188614  #

    2023-06-09T00:00:21.289219  / # export SHELL=3D/bin/sh. /lava-10648102/=
environment

    2023-06-09T00:00:21.289501  =


    2023-06-09T00:00:21.390130  / # . /lava-10648102/environment/lava-10648=
102/bin/lava-test-runner /lava-10648102/1

    2023-06-09T00:00:21.390546  =


    2023-06-09T00:00:21.395022  / # /lava-10648102/bin/lava-test-runner /la=
va-10648102/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64826bbb305176f5fb306131

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826bbb305176f5fb306136
        failing since 72 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-09T00:00:45.564451  + <8>[   10.671022] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10648181_1.4.2.3.1>

    2023-06-09T00:00:45.564541  set +x

    2023-06-09T00:00:45.665802  #

    2023-06-09T00:00:45.666112  =


    2023-06-09T00:00:45.766749  / # #export SHELL=3D/bin/sh

    2023-06-09T00:00:45.767019  =


    2023-06-09T00:00:45.867586  / # export SHELL=3D/bin/sh. /lava-10648181/=
environment

    2023-06-09T00:00:45.867812  =


    2023-06-09T00:00:45.968403  / # . /lava-10648181/environment/lava-10648=
181/bin/lava-test-runner /lava-10648181/1

    2023-06-09T00:00:45.968742  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64826ca61cbc39083b306145

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826ca61cbc39083b30614a
        failing since 69 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-09T00:04:30.983152  + set +x<8>[   23.772713] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10648272_1.4.2.3.1>

    2023-06-09T00:04:30.983253  =


    2023-06-09T00:04:31.089409  / # #

    2023-06-09T00:04:31.189992  export SHELL=3D/bin/sh

    2023-06-09T00:04:31.190183  #

    2023-06-09T00:04:31.290659  / # export SHELL=3D/bin/sh. /lava-10648272/=
environment

    2023-06-09T00:04:31.290836  =


    2023-06-09T00:04:31.391415  / # . /lava-10648272/environment/lava-10648=
272/bin/lava-test-runner /lava-10648272/1

    2023-06-09T00:04:31.391678  =


    2023-06-09T00:04:31.396124  / # /lava-10648272/bin/lava-test-runner /la=
va-10648272/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b52b33074c1f5306180

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b52b33074c1f5306185
        failing since 72 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:58:57.144736  <8>[   10.368860] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648114_1.4.2.3.1>

    2023-06-08T23:58:57.147992  + set +x

    2023-06-08T23:58:57.249276  #

    2023-06-08T23:58:57.249518  =


    2023-06-08T23:58:57.350243  / # #export SHELL=3D/bin/sh

    2023-06-08T23:58:57.350399  =


    2023-06-08T23:58:57.450913  / # export SHELL=3D/bin/sh. /lava-10648114/=
environment

    2023-06-08T23:58:57.451077  =


    2023-06-08T23:58:57.551682  / # . /lava-10648114/environment/lava-10648=
114/bin/lava-test-runner /lava-10648114/1

    2023-06-08T23:58:57.552014  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b6aafa8beb0ef306155

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b6aafa8beb0ef30615a
        failing since 72 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:59:11.153169  <8>[   10.164811] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648161_1.4.2.3.1>

    2023-06-08T23:59:11.156251  + set +x

    2023-06-08T23:59:11.257542  /#

    2023-06-08T23:59:11.358334   # #export SHELL=3D/bin/sh

    2023-06-08T23:59:11.358596  =


    2023-06-08T23:59:11.459096  / # export SHELL=3D/bin/sh. /lava-10648161/=
environment

    2023-06-08T23:59:11.459308  =


    2023-06-08T23:59:11.559818  / # . /lava-10648161/environment/lava-10648=
161/bin/lava-test-runner /lava-10648161/1

    2023-06-08T23:59:11.560158  =


    2023-06-08T23:59:11.565008  / # /lava-10648161/bin/lava-test-runner /la=
va-10648161/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64826c4b9dca86bd8d306150

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826c4b9dca86bd8d306155
        failing since 69 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-09T00:03:06.339356  + set +x

    2023-06-09T00:03:06.345858  <8>[   12.300950] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648279_1.4.2.3.1>

    2023-06-09T00:03:06.450377  / # #

    2023-06-09T00:03:06.551007  export SHELL=3D/bin/sh

    2023-06-09T00:03:06.551183  #

    2023-06-09T00:03:06.651664  / # export SHELL=3D/bin/sh. /lava-10648279/=
environment

    2023-06-09T00:03:06.651843  =


    2023-06-09T00:03:06.752395  / # . /lava-10648279/environment/lava-10648=
279/bin/lava-test-runner /lava-10648279/1

    2023-06-09T00:03:06.752678  =


    2023-06-09T00:03:06.758355  / # /lava-10648279/bin/lava-test-runner /la=
va-10648279/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b5388ff03f4d230612e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b5388ff03f4d2306133
        failing since 72 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:59:09.338761  + set<8>[   11.430962] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10648086_1.4.2.3.1>

    2023-06-08T23:59:09.338847   +x

    2023-06-08T23:59:09.442629  / # #

    2023-06-08T23:59:09.543353  export SHELL=3D/bin/sh

    2023-06-08T23:59:09.543550  #

    2023-06-08T23:59:09.644024  / # export SHELL=3D/bin/sh. /lava-10648086/=
environment

    2023-06-08T23:59:09.644235  =


    2023-06-08T23:59:09.744760  / # . /lava-10648086/environment/lava-10648=
086/bin/lava-test-runner /lava-10648086/1

    2023-06-08T23:59:09.745017  =


    2023-06-08T23:59:09.749395  / # /lava-10648086/bin/lava-test-runner /la=
va-10648086/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b696587af6720306153

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b696587af6720306158
        failing since 72 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:59:25.401910  + <8>[   11.285759] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10648160_1.4.2.3.1>

    2023-06-08T23:59:25.401996  set +x

    2023-06-08T23:59:25.505905  / # #

    2023-06-08T23:59:25.606484  export SHELL=3D/bin/sh

    2023-06-08T23:59:25.606666  #

    2023-06-08T23:59:25.707163  / # export SHELL=3D/bin/sh. /lava-10648160/=
environment

    2023-06-08T23:59:25.707352  =


    2023-06-08T23:59:25.807857  / # . /lava-10648160/environment/lava-10648=
160/bin/lava-test-runner /lava-10648160/1

    2023-06-08T23:59:25.808122  =


    2023-06-08T23:59:25.812877  / # /lava-10648160/bin/lava-test-runner /la=
va-10648160/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64826c530994b50421306139

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826c530994b5042130613e
        failing since 69 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-09T00:03:11.103537  + set +x

    2023-06-09T00:03:11.110360  <8>[   14.794296] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648239_1.4.2.3.1>

    2023-06-09T00:03:11.214967  / # #

    2023-06-09T00:03:11.315578  export SHELL=3D/bin/sh

    2023-06-09T00:03:11.315749  #

    2023-06-09T00:03:11.416245  / # export SHELL=3D/bin/sh. /lava-10648239/=
environment

    2023-06-09T00:03:11.416404  =


    2023-06-09T00:03:11.516955  / # . /lava-10648239/environment/lava-10648=
239/bin/lava-test-runner /lava-10648239/1

    2023-06-09T00:03:11.517197  =


    2023-06-09T00:03:11.521654  / # /lava-10648239/bin/lava-test-runner /la=
va-10648239/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64826dcad1c6b289a230613b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826dcad1c6b289a2306140
        failing since 129 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-09T00:09:24.101655  + set +x
    2023-06-09T00:09:24.101825  [   14.406984] <LAVA_SIGNAL_ENDRUN 0_dmesg =
971628_1.5.2.3.1>
    2023-06-09T00:09:24.209909  / # #
    2023-06-09T00:09:24.311481  export SHELL=3D/bin/sh
    2023-06-09T00:09:24.311854  #
    2023-06-09T00:09:24.413013  / # export SHELL=3D/bin/sh. /lava-971628/en=
vironment
    2023-06-09T00:09:24.413397  =

    2023-06-09T00:09:24.514899  / # . /lava-971628/environment/lava-971628/=
bin/lava-test-runner /lava-971628/1
    2023-06-09T00:09:24.515483  =

    2023-06-09T00:09:24.518958  / # /lava-971628/bin/lava-test-runner /lava=
-971628/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64826fd3a8c4a158db30634b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826fd3a8c4a158db306350
        failing since 130 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-09T00:18:20.413102  + set +x
    2023-06-09T00:18:20.413291  [   12.159641] <LAVA_SIGNAL_ENDRUN 0_dmesg =
971641_1.5.2.3.1>
    2023-06-09T00:18:20.520523  / # #
    2023-06-09T00:18:20.622245  export SHELL=3D/bin/sh
    2023-06-09T00:18:20.622736  #
    2023-06-09T00:18:20.723994  / # export SHELL=3D/bin/sh. /lava-971641/en=
vironment
    2023-06-09T00:18:20.724445  =

    2023-06-09T00:18:20.825702  / # . /lava-971641/environment/lava-971641/=
bin/lava-test-runner /lava-971641/1
    2023-06-09T00:18:20.826282  =

    2023-06-09T00:18:20.829551  / # /lava-971641/bin/lava-test-runner /lava=
-971641/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648270c12578972b613061dd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648270c12578972b613061e2
        failing since 129 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-09T00:22:02.578752  + set +x
    2023-06-09T00:22:02.578927  [   12.853212] <LAVA_SIGNAL_ENDRUN 0_dmesg =
971650_1.5.2.3.1>
    2023-06-09T00:22:02.686471  / # #
    2023-06-09T00:22:02.788057  export SHELL=3D/bin/sh
    2023-06-09T00:22:02.788626  #
    2023-06-09T00:22:02.889817  / # export SHELL=3D/bin/sh. /lava-971650/en=
vironment
    2023-06-09T00:22:02.890289  =

    2023-06-09T00:22:02.991692  / # . /lava-971650/environment/lava-971650/=
bin/lava-test-runner /lava-971650/1
    2023-06-09T00:22:02.992281  =

    2023-06-09T00:22:02.995506  / # /lava-971650/bin/lava-test-runner /lava=
-971650/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64827189366bb07a7b306152

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64827189366bb07a7b306157
        failing since 129 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-09T00:25:22.184875  + set +x
    2023-06-09T00:25:22.185041  [   13.121644] <LAVA_SIGNAL_ENDRUN 0_dmesg =
971656_1.5.2.3.1>
    2023-06-09T00:25:22.292987  / # #
    2023-06-09T00:25:22.394614  export SHELL=3D/bin/sh
    2023-06-09T00:25:22.395049  #
    2023-06-09T00:25:22.496197  / # export SHELL=3D/bin/sh. /lava-971656/en=
vironment
    2023-06-09T00:25:22.496681  =

    2023-06-09T00:25:22.597943  / # . /lava-971656/environment/lava-971656/=
bin/lava-test-runner /lava-971656/1
    2023-06-09T00:25:22.598531  =

    2023-06-09T00:25:22.602124  / # /lava-971656/bin/lava-test-runner /lava=
-971656/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648273e2aa8839cbf0306130

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648273e2aa8839cbf0306135
        failing since 130 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-09T00:35:25.748145  + set +x
    2023-06-09T00:35:25.748331  [   13.112369] <LAVA_SIGNAL_ENDRUN 0_dmesg =
971689_1.5.2.3.1>
    2023-06-09T00:35:25.855433  / # #
    2023-06-09T00:35:25.957173  export SHELL=3D/bin/sh
    2023-06-09T00:35:25.957766  #
    2023-06-09T00:35:26.059053  / # export SHELL=3D/bin/sh. /lava-971689/en=
vironment
    2023-06-09T00:35:26.059546  =

    2023-06-09T00:35:26.160815  / # . /lava-971689/environment/lava-971689/=
bin/lava-test-runner /lava-971689/1
    2023-06-09T00:35:26.161632  =

    2023-06-09T00:35:26.165248  / # /lava-971689/bin/lava-test-runner /lava=
-971689/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64826dd21f1de4132630614d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826dd21f1de41326306=
14e
        failing since 405 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64826ef8acc5ea0d7a30613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-brooni=
e/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-brooni=
e/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826ef8acc5ea0d7a306=
13d
        new failure (last pass: v6.4-rc5-244-g9d674be53332) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64826e601451972cf930626c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826e601451972cf9306271
        failing since 43 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-09T00:11:42.737407  <8>[    7.686209] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3650029_1.5.2.4.1>
    2023-06-09T00:11:42.843462  / # #
    2023-06-09T00:11:42.944884  export SHELL=3D/bin/sh
    2023-06-09T00:11:42.945221  #
    2023-06-09T00:11:43.046362  / # export SHELL=3D/bin/sh. /lava-3650029/e=
nvironment
    2023-06-09T00:11:43.046958  =

    2023-06-09T00:11:43.150661  / # . /lava-3650029/environment/lava-365002=
9/bin/lava-test-runner /lava-3650029/1
    2023-06-09T00:11:43.151432  =

    2023-06-09T00:11:43.198971  / # /lava-3650029/bin/lava-test-runner /lav=
a-3650029/1
    2023-06-09T00:11:43.202750  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648272b4b07a4be9b73061b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648272b4b07a4be9b7306=
1b5
        new failure (last pass: v6.4-rc5-244-g9d674be53332) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b60c570e26030306159

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b60c570e2603030615e
        failing since 72 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:59:07.651816  <8>[   11.846386] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648123_1.4.2.3.1>

    2023-06-08T23:59:07.756299  / # #

    2023-06-08T23:59:07.857049  export SHELL=3D/bin/sh

    2023-06-08T23:59:07.857294  #

    2023-06-08T23:59:07.957844  / # export SHELL=3D/bin/sh. /lava-10648123/=
environment

    2023-06-08T23:59:07.958029  =


    2023-06-08T23:59:08.058516  / # . /lava-10648123/environment/lava-10648=
123/bin/lava-test-runner /lava-10648123/1

    2023-06-08T23:59:08.058837  =


    2023-06-08T23:59:08.063599  / # /lava-10648123/bin/lava-test-runner /la=
va-10648123/1

    2023-06-08T23:59:08.070717  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64826b6ea725d6b737306152

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826b6ea725d6b737306157
        failing since 72 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-08T23:59:21.583898  <8>[   11.494864] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648178_1.4.2.3.1>

    2023-06-08T23:59:21.687859  / # #

    2023-06-08T23:59:21.788587  export SHELL=3D/bin/sh

    2023-06-08T23:59:21.788769  #

    2023-06-08T23:59:21.889261  / # export SHELL=3D/bin/sh. /lava-10648178/=
environment

    2023-06-08T23:59:21.889470  =


    2023-06-08T23:59:21.990060  / # . /lava-10648178/environment/lava-10648=
178/bin/lava-test-runner /lava-10648178/1

    2023-06-08T23:59:21.990310  =


    2023-06-08T23:59:21.995078  / # /lava-10648178/bin/lava-test-runner /la=
va-10648178/1

    2023-06-08T23:59:22.001756  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64826c448e30c38b6b30616a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826c448e30c38b6b30616f
        failing since 69 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-09T00:02:56.803835  + set +x

    2023-06-09T00:02:56.806882  <8>[   13.955172] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10648284_1.4.2.3.1>

    2023-06-09T00:02:56.913091  / # #

    2023-06-09T00:02:57.013747  export SHELL=3D/bin/sh

    2023-06-09T00:02:57.013976  #

    2023-06-09T00:02:57.114495  / # export SHELL=3D/bin/sh. /lava-10648284/=
environment

    2023-06-09T00:02:57.114732  =


    2023-06-09T00:02:57.215293  / # . /lava-10648284/environment/lava-10648=
284/bin/lava-test-runner /lava-10648284/1

    2023-06-09T00:02:57.215649  =


    2023-06-09T00:02:57.220500  / # /lava-10648284/bin/lava-test-runner /la=
va-10648284/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64826e8437389fa1873061cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826e8437389fa187306=
1ce
        failing since 1 day (last pass: v6.4-rc5-210-gef2d89b88456f, first =
fail: v6.4-rc5-244-g9d674be53332) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648271bf5c6549eaaa306157

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648271bf5c6549eaaa306=
158
        failing since 29 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64826ce3909c25fa4d306137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826ce3909c25fa4d306=
138
        failing since 43 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64826efcacc5ea0d7a306142

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826efcacc5ea0d7a306=
143
        failing since 31 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/64826ccc253d7cd8a8306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826ccc253d7cd8a8306=
134
        failing since 43 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64826efb77a132e75730614d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826efb77a132e757306=
14e
        failing since 31 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/64826de01f1de4132630616e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826de01f1de41326306=
16f
        new failure (last pass: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64826fa347865eca8e30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826fa347865eca8e306=
130
        failing since 6 days (last pass: v6.4-rc4-316-g2ef1da21bb4b, first =
fail: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64826ecc3d72d7a621306199

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826ecc3d72d7a621306=
19a
        failing since 175 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64826dc30ce2d56fe930619b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64826dc30ce2d56fe9306=
19c
        failing since 175 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64826e3563e9068d75306161

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64826e3563e9068d75306166
        failing since 127 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-09T00:11:15.723444  [   30.387907] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3650048_1.5.2.4.1>
    2023-06-09T00:11:15.827986  =

    2023-06-09T00:11:15.929541  / # #export SHELL=3D/bin/sh
    2023-06-09T00:11:15.930289  =

    2023-06-09T00:11:16.032883  / # export SHELL=3D/bin/sh. /lava-3650048/e=
nvironment
    2023-06-09T00:11:16.033640  =

    2023-06-09T00:11:16.135255  / # . /lava-3650048/environment/lava-365004=
8/bin/lava-test-runner /lava-3650048/1
    2023-06-09T00:11:16.135944  =

    2023-06-09T00:11:16.139527  / # /lava-3650048/bin/lava-test-runner /lav=
a-3650048/1
    2023-06-09T00:11:16.176579  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64827189caac53ba9c30614c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64827189caac53ba9c306151
        failing since 127 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-09T00:25:31.373966  [   33.070890] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3650120_1.5.2.4.1>
    2023-06-09T00:25:31.478403  =

    2023-06-09T00:25:31.580004  / # #export SHELL=3D/bin/sh
    2023-06-09T00:25:31.580552  =

    2023-06-09T00:25:31.682144  / # export SHELL=3D/bin/sh. /lava-3650120/e=
nvironment
    2023-06-09T00:25:31.682918  =

    2023-06-09T00:25:31.784905  / # . /lava-3650120/environment/lava-365012=
0/bin/lava-test-runner /lava-3650120/1
    2023-06-09T00:25:31.785937  =

    2023-06-09T00:25:31.789422  / # /lava-3650120/bin/lava-test-runner /lav=
a-3650120/1
    2023-06-09T00:25:31.824018  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6482714ca376b7314a3061bf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482714ca376b7314a3061c4
        failing since 127 days (last pass: v5.19-rc5-345-gd3298a6516a4, fir=
st fail: v6.2-rc6-289-g1b7183933813)

    2023-06-09T00:24:26.607167  <8>[   15.839185] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3650081_1.5.2.4.1>
    2023-06-09T00:24:26.714131  / # #
    2023-06-09T00:24:26.815943  export SHELL=3D/bin/sh
    2023-06-09T00:24:26.816400  #
    2023-06-09T00:24:26.917780  / # export SHELL=3D/bin/sh. /lava-3650081/e=
nvironment
    2023-06-09T00:24:26.918237  =

    2023-06-09T00:24:27.019617  / # . /lava-3650081/environment/lava-365008=
1/bin/lava-test-runner /lava-3650081/1
    2023-06-09T00:24:27.020308  =

    2023-06-09T00:24:27.024271  / # /lava-3650081/bin/lava-test-runner /lav=
a-3650081/1
    2023-06-09T00:24:27.094225  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64827188366bb07a7b306144

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp=
157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp=
157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64827188366bb07a7b306149
        failing since 127 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-09T00:25:38.850995  <8>[   13.839296] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3650102_1.5.2.4.1>
    2023-06-09T00:25:38.957013  / # #
    2023-06-09T00:25:39.058797  export SHELL=3D/bin/sh
    2023-06-09T00:25:39.059217  #
    2023-06-09T00:25:39.160616  / # export SHELL=3D/bin/sh. /lava-3650102/e=
nvironment
    2023-06-09T00:25:39.161160  =

    2023-06-09T00:25:39.262572  / # . /lava-3650102/environment/lava-365010=
2/bin/lava-test-runner /lava-3650102/1
    2023-06-09T00:25:39.263395  =

    2023-06-09T00:25:39.267182  / # /lava-3650102/bin/lava-test-runner /lav=
a-3650102/1
    2023-06-09T00:25:39.343004  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648271ecb167f488c4306140

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-stm=
32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-stm=
32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648271ecb167f488c4306145
        failing since 127 days (last pass: v5.19-3879-ge7dffa5317766, first=
 fail: v6.2-rc6-289-g1b7183933813)

    2023-06-09T00:27:03.971680  <8>[   17.952980] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3650179_1.5.2.4.1>
    2023-06-09T00:27:04.076605  / # #
    2023-06-09T00:27:04.178577  export SHELL=3D/bin/sh
    2023-06-09T00:27:04.179343  #
    2023-06-09T00:27:04.281124  / # export SHELL=3D/bin/sh. /lava-3650179/e=
nvironment
    2023-06-09T00:27:04.281505  =

    2023-06-09T00:27:04.382875  / # . /lava-3650179/environment/lava-365017=
9/bin/lava-test-runner /lava-3650179/1
    2023-06-09T00:27:04.383763  =

    2023-06-09T00:27:04.388021  / # /lava-3650179/bin/lava-test-runner /lav=
a-3650179/1
    2023-06-09T00:27:04.463009  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64826ec799fec63f2330612f

  Results:     41 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-brooni=
e/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-brooni=
e/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.hdmi-probed: https://kernelci.org/test/case/id/64826ec7=
99fec63f23306136
        new failure (last pass: v6.4-rc5-244-g9d674be53332)

    2023-06-09T00:13:42.050089  /lava-582905/1/../bin/lava-test-case
    2023-06-09T00:13:42.064424  <8>[   21.640214] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64827288b6f481df173061d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64827288b6f481df17306=
1da
        new failure (last pass: v6.4-rc5-244-g9d674be53332) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/648274ba4a083717c630615c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648274ba4a083717c6306161
        failing since 127 days (last pass: v6.0-12387-ge54e01f1826aa, first=
 fail: v6.2-rc6-289-g1b7183933813)

    2023-06-09T00:39:04.739002  <8>[    9.703084] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3649864_1.5.2.4.1>
    2023-06-09T00:39:04.860804  / # #
    2023-06-09T00:39:04.966998  export SHELL=3D/bin/sh
    2023-06-09T00:39:04.969208  #
    2023-06-09T00:39:05.072935  / # export SHELL=3D/bin/sh. /lava-3649864/e=
nvironment
    2023-06-09T00:39:05.074863  =

    2023-06-09T00:39:05.178648  / # . /lava-3649864/environment/lava-364986=
4/bin/lava-test-runner /lava-3649864/1
    2023-06-09T00:39:05.181587  =

    2023-06-09T00:39:05.199367  / # /lava-3649864/bin/lava-test-runner /lav=
a-3649864/1
    2023-06-09T00:39:05.328099  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6482809e8e30050220306134

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc5-34=
2-gc7b658b8488d/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230527.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6482809e8e30050220306139
        failing since 98 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-06-09T01:29:47.707288  <8>[    9.743094] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3649867_1.5.2.4.1>
    2023-06-09T01:29:47.826494  / # #
    2023-06-09T01:29:47.931956  export SHELL=3D/bin/sh
    2023-06-09T01:29:47.933450  #
    2023-06-09T01:29:48.036776  / # export SHELL=3D/bin/sh. /lava-3649867/e=
nvironment
    2023-06-09T01:29:48.038285  =

    2023-06-09T01:29:48.141608  / # . /lava-3649867/environment/lava-364986=
7/bin/lava-test-runner /lava-3649867/1
    2023-06-09T01:29:48.144287  =

    2023-06-09T01:29:48.151706  / # /lava-3649867/bin/lava-test-runner /lav=
a-3649867/1
    2023-06-09T01:29:48.291523  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
