Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6756730DDE
	for <lists+linux-next@lfdr.de>; Thu, 15 Jun 2023 06:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjFOEEe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Jun 2023 00:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236909AbjFOEEc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Jun 2023 00:04:32 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5522A212B
        for <linux-next@vger.kernel.org>; Wed, 14 Jun 2023 21:04:27 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b505665e2fso2713995ad.0
        for <linux-next@vger.kernel.org>; Wed, 14 Jun 2023 21:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686801866; x=1689393866;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HRylhEpGfJQy8ESxCibvuoXjQzvUfzNsIWLIDfg4g30=;
        b=bS3X2Gi9BK+oq4CVuzcr0gKnqa9odG+55QMcdspwCJL3OzZPOZKW1X13XBAVBwNXNJ
         tfi2Y61uroosh6NoGDBzR6wWi2qoqi6wklQt5ajzP1adEAM+yA5li9vkFXV9rk7MMd10
         nw8kJw7mh7i1pvzJacvhxXjZNkMlmvRNAcALdIzhHTCZ5NuZhSgJlQHIkVz0w7julhUz
         9M0Mh8XjWmgSEqCZST7jGyOnzbCh6ec4Qvgi7lPutE+ypg4mlsqRhryghoRzp6osNlZ2
         p9scdYId/73I0GFa0z6ATEz7A3iFRgeWNsDgINfnyz/d4PIGjEShmKQggg1I4Fr9yifG
         9+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686801866; x=1689393866;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRylhEpGfJQy8ESxCibvuoXjQzvUfzNsIWLIDfg4g30=;
        b=THfFPjMTCF93PDlKRgPuucSgwjDcrn3jOSBa2WSY7SWzrGP8m0Rt/2sUFdX4LqdOJN
         84Z41m3vFd8XEzb4/FwAPRQsXrc/LP2gWZ3xjU1jOMbSfiNisR4Wignj9pXFTtuRvssr
         z0ScFQF9YqNIljIHdZ7VQbs/O1Kj1rJKXZNG38obpv0Y3kUSg6u/+fbbY6i/dyVI8dpp
         Bz/ehqYGlgyZlIEK92cMLpDRMPe2Nx9PlVmis/zhPWoe4Un+JuoXB47luSsiepKGYbXJ
         aE+tLob28KqiU9QToG/Yw/hpW/TGjWp2wPNOm70tJrL0Ry+bnX0umRQxNRUyMX2Ujwsw
         A67A==
X-Gm-Message-State: AC+VfDwsQnRZAhhwTRxBfFoscwWsW5N5CySpHJKpDIr22UN7shv/1AE/
        Ie4ghiwu01zO7jAg5FMMmpb0eCG+zR0Rb+wXGeBdZg==
X-Google-Smtp-Source: ACHHUZ4hz5qD2sd7gZEfNlxjsqZ2cGJ+iu3Wk3bB8ueH4MI4jWubBRcE0X3dx+krIIZIMlYXovI1yw==
X-Received: by 2002:a17:903:22cd:b0:1b2:421b:6f21 with SMTP id y13-20020a17090322cd00b001b2421b6f21mr4553505plg.9.1686801863259;
        Wed, 14 Jun 2023 21:04:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902ecc700b001a4fecf79e4sm12923556plh.49.2023.06.14.21.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 21:04:22 -0700 (PDT)
Message-ID: <648a8dc6.170a0220.69e27.af18@mx.google.com>
Date:   Wed, 14 Jun 2023 21:04:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc6-274-g2a7f6b5fd1ca
Subject: next/pending-fixes baseline: 655 runs,
 79 regressions (v6.4-rc6-274-g2a7f6b5fd1ca)
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

next/pending-fixes baseline: 655 runs, 79 regressions (v6.4-rc6-274-g2a7f6b=
5fd1ca)

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
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

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

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+crypto             | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc6-274-g2a7f6b5fd1ca/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc6-274-g2a7f6b5fd1ca
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2a7f6b5fd1cae87824691ff5e66c4f79bbdd1ff2 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5554fa9da8fa32306185

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5554fa9da8fa32306=
186
        failing since 248 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5458fbff10037630614d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5458fbff100376306152
        failing since 78 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-14T23:59:02.382123  + set +x

    2023-06-14T23:59:02.388470  <8>[   10.605111] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10734625_1.4.2.3.1>

    2023-06-14T23:59:02.496219  / # #

    2023-06-14T23:59:02.598512  export SHELL=3D/bin/sh

    2023-06-14T23:59:02.599201  #

    2023-06-14T23:59:02.700505  / # export SHELL=3D/bin/sh. /lava-10734625/=
environment

    2023-06-14T23:59:02.701148  =


    2023-06-14T23:59:02.802532  / # . /lava-10734625/environment/lava-10734=
625/bin/lava-test-runner /lava-10734625/1

    2023-06-14T23:59:02.803719  =


    2023-06-14T23:59:02.809920  / # /lava-10734625/bin/lava-test-runner /la=
va-10734625/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648a565010aa9ef427306199

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a565010aa9ef42730619e
        failing since 78 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-15T00:07:18.502772  <8>[   11.492983] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10734907_1.4.2.3.1>

    2023-06-15T00:07:18.505987  + set +x

    2023-06-15T00:07:18.613644  / # #

    2023-06-15T00:07:18.715763  export SHELL=3D/bin/sh

    2023-06-15T00:07:18.715993  #

    2023-06-15T00:07:18.816702  / # export SHELL=3D/bin/sh. /lava-10734907/=
environment

    2023-06-15T00:07:18.817508  =


    2023-06-15T00:07:18.918947  / # . /lava-10734907/environment/lava-10734=
907/bin/lava-test-runner /lava-10734907/1

    2023-06-15T00:07:18.920310  =


    2023-06-15T00:07:18.925954  / # /lava-10734907/bin/lava-test-runner /la=
va-10734907/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648a56aa70a701c393306183

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a56aa70a701c393306188
        failing since 75 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-15T00:08:55.978398  + set +x

    2023-06-15T00:08:55.984950  <8>[   99.980358] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10734850_1.4.2.3.1>

    2023-06-15T00:08:56.090928  / # #

    2023-06-15T00:08:56.192856  export SHELL=3D/bin/sh

    2023-06-15T00:08:56.193027  #

    2023-06-15T00:08:56.293751  / # export SHELL=3D/bin/sh. /lava-10734850/=
environment

    2023-06-15T00:08:56.294269  =


    2023-06-15T00:08:56.395557  / # . /lava-10734850/environment/lava-10734=
850/bin/lava-test-runner /lava-10734850/1

    2023-06-15T00:08:56.396990  =


    2023-06-15T00:08:56.403567  / # /lava-10734850/bin/lava-test-runner /la=
va-10734850/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5470f1921cf8e7306140

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5470f1921cf8e7306145
        failing since 78 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-14T23:59:22.838728  + set<8>[   11.426908] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10734611_1.4.2.3.1>

    2023-06-14T23:59:22.839306   +x

    2023-06-14T23:59:22.946961  / # #

    2023-06-14T23:59:23.049501  export SHELL=3D/bin/sh

    2023-06-14T23:59:23.050285  #

    2023-06-14T23:59:23.151932  / # export SHELL=3D/bin/sh. /lava-10734611/=
environment

    2023-06-14T23:59:23.152744  =


    2023-06-14T23:59:23.254465  / # . /lava-10734611/environment/lava-10734=
611/bin/lava-test-runner /lava-10734611/1

    2023-06-14T23:59:23.255704  =


    2023-06-14T23:59:23.260956  / # /lava-10734611/bin/lava-test-runner /la=
va-10734611/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648a564210aa9ef42730612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a564210aa9ef427306134
        failing since 75 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-15T00:07:09.711804  + set +x

    2023-06-15T00:07:09.718486  <8>[   15.210682] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10734835_1.4.2.3.1>

    2023-06-15T00:07:09.822689  / # #

    2023-06-15T00:07:09.923419  export SHELL=3D/bin/sh

    2023-06-15T00:07:09.923642  #

    2023-06-15T00:07:10.024145  / # export SHELL=3D/bin/sh. /lava-10734835/=
environment

    2023-06-15T00:07:10.024319  =


    2023-06-15T00:07:10.124862  / # . /lava-10734835/environment/lava-10734=
835/bin/lava-test-runner /lava-10734835/1

    2023-06-15T00:07:10.125258  =


    2023-06-15T00:07:10.129552  / # /lava-10734835/bin/lava-test-runner /la=
va-10734835/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648a564510aa9ef427306145

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a564510aa9ef42730614a
        failing since 78 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-15T00:07:10.372221  + set<8>[   11.107630] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10734948_1.4.2.3.1>

    2023-06-15T00:07:10.372332   +x

    2023-06-15T00:07:10.476758  / # #

    2023-06-15T00:07:10.577330  export SHELL=3D/bin/sh

    2023-06-15T00:07:10.577580  #

    2023-06-15T00:07:10.678115  / # export SHELL=3D/bin/sh. /lava-10734948/=
environment

    2023-06-15T00:07:10.678366  =


    2023-06-15T00:07:10.778898  / # . /lava-10734948/environment/lava-10734=
948/bin/lava-test-runner /lava-10734948/1

    2023-06-15T00:07:10.779312  =


    2023-06-15T00:07:10.784111  / # /lava-10734948/bin/lava-test-runner /la=
va-10734948/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648a545ef4fca031be30612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a545ef4fca031be306133
        failing since 78 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-14T23:59:04.345531  <8>[   10.686180] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10734677_1.4.2.3.1>

    2023-06-14T23:59:04.349205  + set +x

    2023-06-14T23:59:04.450605  =


    2023-06-14T23:59:04.551220  / # #export SHELL=3D/bin/sh

    2023-06-14T23:59:04.551378  =


    2023-06-14T23:59:04.651852  / # export SHELL=3D/bin/sh. /lava-10734677/=
environment

    2023-06-14T23:59:04.652005  =


    2023-06-14T23:59:04.752474  / # . /lava-10734677/environment/lava-10734=
677/bin/lava-test-runner /lava-10734677/1

    2023-06-14T23:59:04.752797  =


    2023-06-14T23:59:04.757936  / # /lava-10734677/bin/lava-test-runner /la=
va-10734677/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648a565810aa9ef427306201

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a565810aa9ef427306206
        failing since 75 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-15T00:07:27.097122  + set +x

    2023-06-15T00:07:27.103536  <8>[   18.257675] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10734922_1.4.2.3.1>

    2023-06-15T00:07:27.207841  / # #

    2023-06-15T00:07:27.308570  export SHELL=3D/bin/sh

    2023-06-15T00:07:27.308812  #

    2023-06-15T00:07:27.409470  / # export SHELL=3D/bin/sh. /lava-10734922/=
environment

    2023-06-15T00:07:27.409717  =


    2023-06-15T00:07:27.510263  / # . /lava-10734922/environment/lava-10734=
922/bin/lava-test-runner /lava-10734922/1

    2023-06-15T00:07:27.510601  =


    2023-06-15T00:07:27.515699  / # /lava-10734922/bin/lava-test-runner /la=
va-10734922/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648a56ba8c449f5a1c30614e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sa=
ma5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sa=
ma5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a56ba8c449f5a1c306=
14f
        new failure (last pass: v6.4-rc6-221-gf82f3835a7c04) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5438267723fe0230613b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5438267723fe02306140
        failing since 154 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-14T23:59:26.550739  / # #

    2023-06-14T23:59:26.652883  export SHELL=3D/bin/sh

    2023-06-14T23:59:26.653639  #

    2023-06-14T23:59:26.755052  / # export SHELL=3D/bin/sh. /lava-10734602/=
environment

    2023-06-14T23:59:26.755769  =


    2023-06-14T23:59:26.857146  / # . /lava-10734602/environment/lava-10734=
602/bin/lava-test-runner /lava-10734602/1

    2023-06-14T23:59:26.858233  =


    2023-06-14T23:59:26.874841  / # /lava-10734602/bin/lava-test-runner /la=
va-10734602/1

    2023-06-14T23:59:26.983753  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-14T23:59:26.984268  + cd /lava-10734602/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5759cb80b288753061a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5759cb80b28875306=
1aa
        failing since 108 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648a596e11fd42fe0730613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a596e11fd42fe07306=
140
        failing since 6 days (last pass: v6.4-rc5-244-g9d674be53332, first =
fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a57b5fae2ca924f306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a57b5fae2ca924f306=
13a
        new failure (last pass: v6.4-rc6-257-gbc9b3eb6d292) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648a55481b87d517e8306130

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a55481b87d517e8306135
        failing since 148 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-15T00:02:52.764492  <8>[   16.875215] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664462_1.5.2.4.1>
    2023-06-15T00:02:52.873564  / # #
    2023-06-15T00:02:52.976679  export SHELL=3D/bin/sh
    2023-06-15T00:02:52.977466  #
    2023-06-15T00:02:53.079085  / # export SHELL=3D/bin/sh. /lava-3664462/e=
nvironment
    2023-06-15T00:02:53.080001  =

    2023-06-15T00:02:53.182163  / # . /lava-3664462/environment/lava-366446=
2/bin/lava-test-runner /lava-3664462/1
    2023-06-15T00:02:53.182963  =

    2023-06-15T00:02:53.187958  / # /lava-3664462/bin/lava-test-runner /lav=
a-3664462/1
    2023-06-15T00:02:53.273203  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648a55d9bc13d33eb430618c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a55d9bc13d33eb4306191
        failing since 148 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-15T00:05:25.259803  <8>[   15.483501] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664531_1.5.2.4.1>
    2023-06-15T00:05:25.368888  / # #
    2023-06-15T00:05:25.470662  export SHELL=3D/bin/sh
    2023-06-15T00:05:25.471098  #
    2023-06-15T00:05:25.471374  / # <3>[   15.648859] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-06-15T00:05:25.572459  export SHELL=3D/bin/sh. /lava-3664531/envir=
onment
    2023-06-15T00:05:25.572784  =

    2023-06-15T00:05:25.673898  / # . /lava-3664531/environment/lava-366453=
1/bin/lava-test-runner /lava-3664531/1
    2023-06-15T00:05:25.674525  =

    2023-06-15T00:05:25.679583  / # /lava-3664531/bin/lava-test-runner /lav=
a-3664531/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648a587814e530c11430614e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a587814e530c114306153
        failing since 148 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-15T00:16:26.916396  <8>[   14.840827] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664559_1.5.2.4.1>
    2023-06-15T00:16:27.027852  / # #
    2023-06-15T00:16:27.130782  export SHELL=3D/bin/sh
    2023-06-15T00:16:27.131634  #
    2023-06-15T00:16:27.233631  / # export SHELL=3D/bin/sh. /lava-3664559/e=
nvironment
    2023-06-15T00:16:27.234471  =

    2023-06-15T00:16:27.336315  / # . /lava-3664559/environment/lava-366455=
9/bin/lava-test-runner /lava-3664559/1
    2023-06-15T00:16:27.337707  =

    2023-06-15T00:16:27.343068  / # /lava-3664559/bin/lava-test-runner /lav=
a-3664559/1
    2023-06-15T00:16:27.431179  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5ab31ddfcb78bc306223

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5ab31ddfcb78bc306228
        failing since 148 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-15T00:26:09.727496  <8>[   15.089419] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664812_1.5.2.4.1>
    2023-06-15T00:26:09.836042  / # #
    2023-06-15T00:26:09.940928  export SHELL=3D/bin/sh
    2023-06-15T00:26:09.941374  #
    2023-06-15T00:26:10.042879  / # export SHELL=3D/bin/sh. /lava-3664812/e=
nvironment
    2023-06-15T00:26:10.043718  =

    2023-06-15T00:26:10.147647  / # . /lava-3664812/environment/lava-366481=
2/bin/lava-test-runner /lava-3664812/1
    2023-06-15T00:26:10.149351  <3>[   15.408918] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-06-15T00:26:10.150037  =

    2023-06-15T00:26:10.153549  / # /lava-3664812/bin/lava-test-runner /lav=
a-3664812/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5dab42d2535bb3306135

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5dab42d2535bb330613a
        failing since 148 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-15T00:38:39.911143  <8>[   20.202592] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664840_1.5.2.4.1>
    2023-06-15T00:38:40.024776  / # #
    2023-06-15T00:38:40.128395  export SHELL=3D/bin/sh
    2023-06-15T00:38:40.129321  #
    2023-06-15T00:38:40.231206  / # export SHELL=3D/bin/sh. /lava-3664840/e=
nvironment
    2023-06-15T00:38:40.232069  =

    2023-06-15T00:38:40.333941  / # . /lava-3664840/environment/lava-366484=
0/bin/lava-test-runner /lava-3664840/1
    2023-06-15T00:38:40.335580  =

    2023-06-15T00:38:40.343553  / # /lava-3664840/bin/lava-test-runner /lav=
a-3664840/1
    2023-06-15T00:38:40.436259  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/648a5466896cda2f0c306131

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/648a5466896cda2=
f0c306138
        failing since 103 days (last pass: v6.2-1218-g2d4a54ee969d, first f=
ail: v6.2-13370-g5872d227b73f)
        30 lines

    2023-06-14T23:59:07.646721  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-14T23:59:07.647353  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-14T23:59:07.647760  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2e2000 allocated at load_module+0x6b0/0=
x1954
    2023-06-14T23:59:07.650014  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-14T23:59:07.753583  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-14T23:59:07.754510  kern  :emerg : Process udevd (pid: 71, stac=
k limit =3D 0xf67936d7)
    2023-06-14T23:59:07.755364  kern  :emerg : Stack: (0xc88b1cf8 to 0xc88b=
2000)
    2023-06-14T23:59:07.755843  kern  :emerg : 1ce0:                       =
                                c4d68200 c0777860
    2023-06-14T23:59:07.756258  kern  :emerg : 1d00: 00000000 c03afd98 0000=
0000 5ec04b11 0000005d 5ec04b11 c0777860 bf2e2220
    2023-06-14T23:59:07.757158  kern  :emerg : 1d20: 00000000 00000000 0000=
0000 00000001 c077785c bf2c1590 bf2e2220 00000000 =

    ... (5 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/648a5466896cda2=
f0c306139
        failing since 507 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-06-14T23:59:07.565556  kern  :alert : 8<--- cut here ---
    2023-06-14T23:59:07.566666  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-06-14T23:59:07.567144  kern  :alert : [00000060] *pgd=3Dc4a8f831, =
*pte=3D00000000, *ppte=3D00000000
    2023-06-14T23:59:07.567605  kern  :alert : Register r0 information: non=
-paged memory
    2023-06-14T23:59:07.568047  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc88b0000 allocated at kernel_clone+0x98/0x=
3a0
    2023-06-14T23:59:07.569417  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-06-14T23:59:07.608977  kern  :alert : Register r3 information: non=
-paged memory
    2023-06-14T23:59:07.610037  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4d68200 pointer offset 0 size 512
    2023-06-14T23:59:07.610594  kern  :alert : Register r5 information: non=
-slab/vmalloc me<8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail=
 UNITS=3Dlines MEASUREMENT=3D16>
    2023-06-14T23:59:07.611156  mory =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648a54373b34987af630619c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a54373b34987af63061a1
        failing since 78 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-14T23:58:38.876961  + set +x

    2023-06-14T23:58:38.882969  <8>[   21.471278] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10734608_1.4.2.3.1>

    2023-06-14T23:58:38.987713  / # #

    2023-06-14T23:58:39.088306  export SHELL=3D/bin/sh

    2023-06-14T23:58:39.088534  #

    2023-06-14T23:58:39.189079  / # export SHELL=3D/bin/sh. /lava-10734608/=
environment

    2023-06-14T23:58:39.189292  =


    2023-06-14T23:58:39.289848  / # . /lava-10734608/environment/lava-10734=
608/bin/lava-test-runner /lava-10734608/1

    2023-06-14T23:58:39.290193  =


    2023-06-14T23:58:39.294165  / # /lava-10734608/bin/lava-test-runner /la=
va-10734608/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648a58a7c829c412b330613c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a58a7c829c412b3306141
        failing since 75 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-15T00:17:34.004334  + set +x

    2023-06-15T00:17:34.010830  <8>[   13.370449] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10734844_1.4.2.3.1>

    2023-06-15T00:17:34.117213  / # #

    2023-06-15T00:17:34.217835  export SHELL=3D/bin/sh

    2023-06-15T00:17:34.218027  #

    2023-06-15T00:17:34.318564  / # export SHELL=3D/bin/sh. /lava-10734844/=
environment

    2023-06-15T00:17:34.318760  =


    2023-06-15T00:17:34.419250  / # . /lava-10734844/environment/lava-10734=
844/bin/lava-test-runner /lava-10734844/1

    2023-06-15T00:17:34.419565  =


    2023-06-15T00:17:34.424367  / # /lava-10734844/bin/lava-test-runner /la=
va-10734844/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648a58c1337cd54613306148

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a58c1337cd5461330614d
        failing since 78 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-15T00:18:00.715467  + <8>[   10.972871] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10734954_1.4.2.3.1>

    2023-06-15T00:18:00.715583  set +x

    2023-06-15T00:18:00.816920  #

    2023-06-15T00:18:00.917789  / # #export SHELL=3D/bin/sh

    2023-06-15T00:18:00.918002  =


    2023-06-15T00:18:01.018511  / # export SHELL=3D/bin/sh. /lava-10734954/=
environment

    2023-06-15T00:18:01.018733  =


    2023-06-15T00:18:01.119264  / # . /lava-10734954/environment/lava-10734=
954/bin/lava-test-runner /lava-10734954/1

    2023-06-15T00:18:01.119594  =


    2023-06-15T00:18:01.124294  / # /lava-10734954/bin/lava-test-runner /la=
va-10734954/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648a545c6a745bcee8306153

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a545c6a745bcee8306158
        failing since 78 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-14T23:59:01.027716  <8>[   10.040035] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10734659_1.4.2.3.1>

    2023-06-14T23:59:01.031262  + set +x

    2023-06-14T23:59:01.139054  / # #

    2023-06-14T23:59:01.241093  export SHELL=3D/bin/sh

    2023-06-14T23:59:01.241711  #

    2023-06-14T23:59:01.342998  / # export SHELL=3D/bin/sh. /lava-10734659/=
environment

    2023-06-14T23:59:01.343623  =


    2023-06-14T23:59:01.444945  / # . /lava-10734659/environment/lava-10734=
659/bin/lava-test-runner /lava-10734659/1

    2023-06-14T23:59:01.445941  =


    2023-06-14T23:59:01.450989  / # /lava-10734659/bin/lava-test-runner /la=
va-10734659/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648a57cdfae2ca924f30618d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a57cdfae2ca924f306192
        failing since 75 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-15T00:13:58.049688  + set +x

    2023-06-15T00:13:58.055878  <8>[   14.046402] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10734891_1.4.2.3.1>

    2023-06-15T00:13:58.164213  / # #

    2023-06-15T00:13:58.266406  export SHELL=3D/bin/sh

    2023-06-15T00:13:58.267189  #

    2023-06-15T00:13:58.368916  / # export SHELL=3D/bin/sh. /lava-10734891/=
environment

    2023-06-15T00:13:58.369667  =


    2023-06-15T00:13:58.471338  / # . /lava-10734891/environment/lava-10734=
891/bin/lava-test-runner /lava-10734891/1

    2023-06-15T00:13:58.472661  =


    2023-06-15T00:13:58.478513  / # /lava-10734891/bin/lava-test-runner /la=
va-10734891/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5810e17e352f8730613c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5810e17e352f87306141
        failing since 78 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-15T00:14:58.982703  + set +x<8>[   10.859475] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10734967_1.4.2.3.1>

    2023-06-15T00:14:58.982791  =


    2023-06-15T00:14:59.084484  #

    2023-06-15T00:14:59.084799  =


    2023-06-15T00:14:59.185376  / # #export SHELL=3D/bin/sh

    2023-06-15T00:14:59.185623  =


    2023-06-15T00:14:59.286139  / # export SHELL=3D/bin/sh. /lava-10734967/=
environment

    2023-06-15T00:14:59.286345  =


    2023-06-15T00:14:59.386886  / # . /lava-10734967/environment/lava-10734=
967/bin/lava-test-runner /lava-10734967/1

    2023-06-15T00:14:59.387183  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5450a8347e99da306139

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5450a8347e99da30613e
        failing since 78 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-14T23:59:00.433339  + set<8>[   11.418280] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10734635_1.4.2.3.1>

    2023-06-14T23:59:00.433433   +x

    2023-06-14T23:59:00.537593  / # #

    2023-06-14T23:59:00.638219  export SHELL=3D/bin/sh

    2023-06-14T23:59:00.638417  #

    2023-06-14T23:59:00.738955  / # export SHELL=3D/bin/sh. /lava-10734635/=
environment

    2023-06-14T23:59:00.739151  =


    2023-06-14T23:59:00.839717  / # . /lava-10734635/environment/lava-10734=
635/bin/lava-test-runner /lava-10734635/1

    2023-06-14T23:59:00.840016  =


    2023-06-14T23:59:00.844853  / # /lava-10734635/bin/lava-test-runner /la=
va-10734635/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648a563df6f8c8245830616c

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a563df6f8c82458306171
        failing since 75 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-15T00:07:18.159025  + set +x

    2023-06-15T00:07:18.165807  <8>[   12.113249] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10734893_1.4.2.3.1>

    2023-06-15T00:07:18.269827  / # #

    2023-06-15T00:07:18.370404  export SHELL=3D/bin/sh

    2023-06-15T00:07:18.370632  #

    2023-06-15T00:07:18.471206  / # export SHELL=3D/bin/sh. /lava-10734893/=
environment

    2023-06-15T00:07:18.471490  =


    2023-06-15T00:07:18.571994  / # . /lava-10734893/environment/lava-10734=
893/bin/lava-test-runner /lava-10734893/1

    2023-06-15T00:07:18.572308  =


    2023-06-15T00:07:18.576982  / # /lava-10734893/bin/lava-test-runner /la=
va-10734893/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5660b7353fb0b030613a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5660b7353fb0b030613f
        failing since 78 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-15T00:07:24.305208  + <8>[   11.409907] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10734926_1.4.2.3.1>

    2023-06-15T00:07:24.305328  set +x

    2023-06-15T00:07:24.409570  / # #

    2023-06-15T00:07:24.510296  export SHELL=3D/bin/sh

    2023-06-15T00:07:24.510552  #

    2023-06-15T00:07:24.611139  / # export SHELL=3D/bin/sh. /lava-10734926/=
environment

    2023-06-15T00:07:24.611342  =


    2023-06-15T00:07:24.711868  / # . /lava-10734926/environment/lava-10734=
926/bin/lava-test-runner /lava-10734926/1

    2023-06-15T00:07:24.712157  =


    2023-06-15T00:07:24.717097  / # /lava-10734926/bin/lava-test-runner /la=
va-10734926/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648a548321f0b10cbc306136

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a548321f0b10cbc30613b
        failing since 135 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-14T23:59:57.084126  + set +x
    2023-06-14T23:59:57.084310  [   12.186380] <LAVA_SIGNAL_ENDRUN 0_dmesg =
977944_1.5.2.3.1>
    2023-06-14T23:59:57.191571  / # #
    2023-06-14T23:59:57.293320  export SHELL=3D/bin/sh
    2023-06-14T23:59:57.293840  #
    2023-06-14T23:59:57.395150  / # export SHELL=3D/bin/sh. /lava-977944/en=
vironment
    2023-06-14T23:59:57.395635  =

    2023-06-14T23:59:57.497014  / # . /lava-977944/environment/lava-977944/=
bin/lava-test-runner /lava-977944/1
    2023-06-14T23:59:57.497635  =

    2023-06-14T23:59:57.500781  / # /lava-977944/bin/lava-test-runner /lava=
-977944/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5538f782e9760f306183

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5538f782e9760f306188
        failing since 135 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-15T00:02:42.340308  + set +x
    2023-06-15T00:02:42.340478  [   13.212033] <LAVA_SIGNAL_ENDRUN 0_dmesg =
977950_1.5.2.3.1>
    2023-06-15T00:02:42.447935  / # #
    2023-06-15T00:02:42.549491  export SHELL=3D/bin/sh
    2023-06-15T00:02:42.549969  #
    2023-06-15T00:02:42.651149  / # export SHELL=3D/bin/sh. /lava-977950/en=
vironment
    2023-06-15T00:02:42.651581  =

    2023-06-15T00:02:42.752823  / # . /lava-977950/environment/lava-977950/=
bin/lava-test-runner /lava-977950/1
    2023-06-15T00:02:42.753493  =

    2023-06-15T00:02:42.756943  / # /lava-977950/bin/lava-test-runner /lava=
-977950/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648a56b31113e6d681306130

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a56b31113e6d681306135
        failing since 135 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-15T00:08:59.325159  + set +x
    2023-06-15T00:08:59.325312  [   12.900833] <LAVA_SIGNAL_ENDRUN 0_dmesg =
977960_1.5.2.3.1>
    2023-06-15T00:08:59.432273  / # #
    2023-06-15T00:08:59.534180  export SHELL=3D/bin/sh
    2023-06-15T00:08:59.534594  #
    2023-06-15T00:08:59.635809  / # export SHELL=3D/bin/sh. /lava-977960/en=
vironment
    2023-06-15T00:08:59.636265  =

    2023-06-15T00:08:59.737678  / # . /lava-977960/environment/lava-977960/=
bin/lava-test-runner /lava-977960/1
    2023-06-15T00:08:59.738646  =

    2023-06-15T00:08:59.742866  / # /lava-977960/bin/lava-test-runner /lava=
-977960/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5a60a986474952306130

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5a60a986474952306135
        failing since 136 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-15T00:24:45.827790  + set +x
    2023-06-15T00:24:45.827948  [   13.269243] <LAVA_SIGNAL_ENDRUN 0_dmesg =
977981_1.5.2.3.1>
    2023-06-15T00:24:45.936001  / # #
    2023-06-15T00:24:46.037760  export SHELL=3D/bin/sh
    2023-06-15T00:24:46.038222  #
    2023-06-15T00:24:46.139419  / # export SHELL=3D/bin/sh. /lava-977981/en=
vironment
    2023-06-15T00:24:46.139836  =

    2023-06-15T00:24:46.241012  / # . /lava-977981/environment/lava-977981/=
bin/lava-test-runner /lava-977981/1
    2023-06-15T00:24:46.241562  =

    2023-06-15T00:24:46.244951  / # /lava-977981/bin/lava-test-runner /lava=
-977981/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5c403713a26b93306130

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5c403713a26b93306135
        failing since 135 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-15T00:32:42.292190  + set +x
    2023-06-15T00:32:42.292434  [   14.401964] <LAVA_SIGNAL_ENDRUN 0_dmesg =
977989_1.5.2.3.1>
    2023-06-15T00:32:42.399660  / # #
    2023-06-15T00:32:42.501017  export SHELL=3D/bin/sh
    2023-06-15T00:32:42.501428  #
    2023-06-15T00:32:42.602621  / # export SHELL=3D/bin/sh. /lava-977989/en=
vironment
    2023-06-15T00:32:42.603060  =

    2023-06-15T00:32:42.704278  / # . /lava-977989/environment/lava-977989/=
bin/lava-test-runner /lava-977989/1
    2023-06-15T00:32:42.704947  =

    2023-06-15T00:32:42.708272  / # /lava-977989/bin/lava-test-runner /lava=
-977989/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5523f782e9760f30613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+crypto/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+crypto/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5523f782e9760f306=
140
        new failure (last pass: v6.4-rc6-221-gf82f3835a7c04) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648a58b0c829c412b3306254

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a58b0c829c412b3306=
255
        failing since 411 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648a53d51783e8145b30612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am=
625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-k3-am=
625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a53d51783e8145b306133
        failing since 49 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-14T23:56:24.175383  <8>[    7.721182] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664389_1.5.2.4.1>
    2023-06-14T23:56:24.284582  / # #
    2023-06-14T23:56:24.388941  export SHELL=3D/bin/sh
    2023-06-14T23:56:24.389937  #
    2023-06-14T23:56:24.492579  / # export SHELL=3D/bin/sh. /lava-3664389/e=
nvironment
    2023-06-14T23:56:24.494139  =

    2023-06-14T23:56:24.596528  / # . /lava-3664389/environment/lava-366438=
9/bin/lava-test-runner /lava-3664389/1
    2023-06-14T23:56:24.597940  =

    2023-06-14T23:56:24.641248  / # /lava-3664389/bin/lava-test-runner /lav=
a-3664389/1
    2023-06-14T23:56:24.651901  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648a57b8fae2ca924f306160

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a57b8fae2ca924f306165
        failing since 49 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-15T00:13:14.291122  <8>[    8.862009] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-06-15T00:13:14.291593  + set +x
    2023-06-15T00:13:14.292459  <8>[    8.872207] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664596_1.5.2.4.1>
    2023-06-15T00:13:14.413956  / # #
    2023-06-15T00:13:14.518162  export SHELL=3D/bin/sh
    2023-06-15T00:13:14.519554  #
    2023-06-15T00:13:14.621924  / # export SHELL=3D/bin/sh. /lava-3664596/e=
nvironment
    2023-06-15T00:13:14.623297  =

    2023-06-15T00:13:14.725602  / # . /lava-3664596/environment/lava-366459=
6/bin/lava-test-runner /lava-3664596/1
    2023-06-15T00:13:14.726819   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5a55a3aa6f071d3061bc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-s=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-s=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5a55a3aa6f071d3061c1
        failing since 47 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)

    2023-06-15T00:24:09.944771  <8>[    7.789570] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664730_1.5.2.4.1>
    2023-06-15T00:24:10.051298  / # #
    2023-06-15T00:24:10.155318  export SHELL=3D/bin/sh
    2023-06-15T00:24:10.155650  #
    2023-06-15T00:24:10.257114  / # export SHELL=3D/bin/sh. /lava-3664730/e=
nvironment
    2023-06-15T00:24:10.257908  =

    2023-06-15T00:24:10.359277  / # . /lava-3664730/environment/lava-366473=
0/bin/lava-test-runner /lava-3664730/1
    2023-06-15T00:24:10.359898  =

    2023-06-15T00:24:10.379811  / # /lava-3664730/bin/lava-test-runner /lav=
a-3664730/1
    2023-06-15T00:24:10.420924  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5b3b81e3d8033530616b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-a=
m625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-a=
m625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5b3b81e3d80335306170
        failing since 49 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.3-5614-gbe56a31d3d65)

    2023-06-15T00:28:02.923256  <8>[   19.329712] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664755_1.5.2.4.1>
    2023-06-15T00:28:03.041773  / # #
    2023-06-15T00:28:03.143171  export SHELL=3D/bin/sh
    2023-06-15T00:28:03.144033  #
    2023-06-15T00:28:03.248318  / # export SHELL=3D/bin/sh. /lava-3664755/e=
nvironment
    2023-06-15T00:28:03.248720  =

    2023-06-15T00:28:03.350025  / # . /lav/lava-3664755/bin/lava-test-runne=
r /lava-3664755/1
    2023-06-15T00:28:03.350571  a-3664755/environment
    2023-06-15T00:28:03.392769  / # /lava-3664755/bin/lava-test-runner /lav=
a-3664755/1
    2023-06-15T00:28:03.610586  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648a54486df6793b8830612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a54486df6793b88306134
        failing since 78 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-14T23:58:49.089995  + <8>[    9.230919] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10734634_1.4.2.3.1>

    2023-06-14T23:58:49.090640  set +x

    2023-06-14T23:58:49.198228  / # #

    2023-06-14T23:58:49.300889  export SHELL=3D/bin/sh

    2023-06-14T23:58:49.301681  #

    2023-06-14T23:58:49.403542  / # export SHELL=3D/bin/sh. /lava-10734634/=
environment

    2023-06-14T23:58:49.404338  =


    2023-06-14T23:58:49.505948  / # . /lava-10734634/environment/lava-10734=
634/bin/lava-test-runner /lava-10734634/1

    2023-06-14T23:58:49.507418  =


    2023-06-14T23:58:49.512234  / # /lava-10734634/bin/lava-test-runner /la=
va-10734634/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5620f6f8c82458306133

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5620f6f8c82458306138
        failing since 78 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-15T00:06:52.981064  + set +x<8>[   17.230858] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10734957_1.4.2.3.1>

    2023-06-15T00:06:52.981601  =


    2023-06-15T00:06:53.088632  / # #

    2023-06-15T00:06:53.191076  export SHELL=3D/bin/sh

    2023-06-15T00:06:53.191770  #

    2023-06-15T00:06:53.293271  / # export SHELL=3D/bin/sh. /lava-10734957/=
environment

    2023-06-15T00:06:53.294109  =


    2023-06-15T00:06:53.395494  / # . /lava-10734957/environment/lava-10734=
957/bin/lava-test-runner /lava-10734957/1

    2023-06-15T00:06:53.396679  =


    2023-06-15T00:06:53.401625  / # /lava-10734957/bin/lava-test-runner /la=
va-10734957/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648a565310aa9ef4273061ea

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a565310aa9ef4273061ef
        failing since 75 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-15T00:07:28.592477  + <8>[   15.466925] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10734862_1.4.2.3.1>

    2023-06-15T00:07:28.592602  set +x

    2023-06-15T00:07:28.697743  / # #

    2023-06-15T00:07:28.798378  export SHELL=3D/bin/sh

    2023-06-15T00:07:28.798585  #

    2023-06-15T00:07:28.899133  / # export SHELL=3D/bin/sh. /lava-10734862/=
environment

    2023-06-15T00:07:28.899331  =


    2023-06-15T00:07:28.999903  / # . /lava-10734862/environment/lava-10734=
862/bin/lava-test-runner /lava-10734862/1

    2023-06-15T00:07:29.000177  =


    2023-06-15T00:07:29.005252  / # /lava-10734862/bin/lava-test-runner /la=
va-10734862/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648a53ddfa2d8b05e9306153

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a53ddfa2d8b05e9306=
154
        failing since 8 days (last pass: v6.4-rc5-142-g7f2b5d41063a, first =
fail: v6.4-rc5-210-gef2d89b88456f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648a55a2c4c2343e683061a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a55a2c4c2343e68306=
1a6
        failing since 35 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648a57a95b2770a3b330615a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a57a95b2770a3b3306=
15b
        failing since 7 days (last pass: v6.4-rc5-210-gef2d89b88456f, first=
 fail: v6.4-rc5-244-g9d674be53332) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648a583d2a7948b7aa306168

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a583d2a7948b7aa306=
169
        failing since 35 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5a51a3aa6f071d306153

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a=
-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a=
-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5a51a3aa6f071d306=
154
        failing since 6 days (last pass: v6.4-rc5-210-gef2d89b88456f, first=
 fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5c4e32321c2e8b306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5c4e32321c2e8b306=
145
        failing since 127 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5c7788ba039e81306192

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5c7788ba039e81306=
193
        failing since 127 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5aad1ddfcb78bc306148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5aad1ddfcb78bc306=
149
        failing since 127 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5b0b01522ee103306185

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5b0b01522ee103306=
186
        failing since 115 days (last pass: v6.2-rc8-150-g30cd52e17d48, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5c794b1e049f1c3061b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5c794b1e049f1c306=
1b4
        failing since 127 days (last pass: v6.2-rc6-351-gf42837eac380f, fir=
st fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5cff810dddc0ca30614d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5cff810dddc0ca306=
14e
        failing since 127 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5ac496e0aab20a306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5ac496e0aab20a306=
13a
        failing since 127 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5967b7002da2d7306241

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5967b7002da2d7306=
242
        failing since 37 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5969b7002da2d7306247

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5969b7002da2d7306=
248
        failing since 37 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a6a87739b505be130616e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a6a87739b505be1306=
16f
        failing since 127 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5b3c81e3d80335306176

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5b3c81e3d80335306=
177
        new failure (last pass: v6.4-rc6-257-gbc9b3eb6d292) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5b2e81e3d80335306154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5b2e81e3d80335306=
155
        new failure (last pass: v6.4-rc6-257-gbc9b3eb6d292) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648a53d04cc646cc19306337

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a53d04cc646cc19306=
338
        failing since 12 days (last pass: v6.4-rc4-316-g2ef1da21bb4b, first=
 fail: v6.4-rc4-407-g4cdb5de9397d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5925c4fa091e4d30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5925c4fa091e4d306=
12f
        failing since 181 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648a580fe17e352f87306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a580fe17e352f87306=
13a
        failing since 181 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5364cca1a96a73306140

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5364cca1a96a73306145
        failing since 133 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-14T23:55:02.894857  [   29.044041] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3664396_1.5.2.4.1>
    2023-06-14T23:55:02.999652  =

    2023-06-14T23:55:03.101158  / # #export SHELL=3D/bin/sh
    2023-06-14T23:55:03.101690  =

    2023-06-14T23:55:03.203246  / # export SHELL=3D/bin/sh. /lava-3664396/e=
nvironment
    2023-06-14T23:55:03.203741  =

    2023-06-14T23:55:03.305193  / # . /lava-3664396/environment/lava-366439=
6/bin/lava-test-runner /lava-3664396/1
    2023-06-14T23:55:03.306528  =

    2023-06-14T23:55:03.309826  / # /lava-3664396/bin/lava-test-runner /lav=
a-3664396/1
    2023-06-14T23:55:03.343958  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5543fa9da8fa32306139

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a5543fa9da8fa3230613e
        failing since 133 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-15T00:02:57.671199  [   32.327433] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3664485_1.5.2.4.1>
    2023-06-15T00:02:57.776334  =

    2023-06-15T00:02:57.878104  / # #export SHELL=3D/bin/sh
    2023-06-15T00:02:57.878829  =

    2023-06-15T00:02:57.980756  / # export SHELL=3D/bin/sh. /lava-3664485/e=
nvironment
    2023-06-15T00:02:57.981484  =

    2023-06-15T00:02:58.083176  / # . /lava-3664485/environment/lava-366448=
5/bin/lava-test-runner /lava-3664485/1
    2023-06-15T00:02:58.083936  =

    2023-06-15T00:02:58.087325  / # /lava-3664485/bin/lava-test-runner /lav=
a-3664485/1
    2023-06-15T00:02:58.123789  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648a56d685197d4e53306213

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a56d685197d4e53306218
        failing since 133 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-15T00:09:49.712648  [   29.264064] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3664595_1.5.2.4.1>
    2023-06-15T00:09:49.817442  =

    2023-06-15T00:09:49.919080  / # #export SHELL=3D/bin/sh
    2023-06-15T00:09:49.919651  =

    2023-06-15T00:09:50.021359  / # export SHELL=3D/bin/sh. /lava-3664595/e=
nvironment
    2023-06-15T00:09:50.021977  =

    2023-06-15T00:09:50.123675  / # . /lava-3664595/environment/lava-366459=
5/bin/lava-test-runner /lava-3664595/1
    2023-06-15T00:09:50.124391  =

    2023-06-15T00:09:50.127803  / # /lava-3664595/bin/lava-test-runner /lav=
a-3664595/1
    2023-06-15T00:09:50.161418  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648a587714e530c114306143

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a587714e530c114306148
        failing since 133 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-15T00:16:33.160403  [   29.243920] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3664658_1.5.2.4.1>
    2023-06-15T00:16:33.265147  =

    2023-06-15T00:16:33.366689  / # #export SHELL=3D/bin/sh
    2023-06-15T00:16:33.367266  =

    2023-06-15T00:16:33.468878  / # export SHELL=3D/bin/sh. /lava-3664658/e=
nvironment
    2023-06-15T00:16:33.469420  =

    2023-06-15T00:16:33.571023  / # . /lava-3664658/environment/lava-366465=
8/bin/lava-test-runner /lava-3664658/1
    2023-06-15T00:16:33.572216  =

    2023-06-15T00:16:33.575822  / # /lava-3664658/bin/lava-test-runner /lav=
a-3664658/1
    2023-06-15T00:16:33.609579  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648a599053d198e26a306144

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-roc=
k64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a599053d198e26a306149
        failing since 133 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-06-15T00:21:26.159855  [   29.175925] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3664715_1.5.2.4.1>
    2023-06-15T00:21:26.264971  =

    2023-06-15T00:21:26.366562  / # #export SHELL=3D/bin/sh
    2023-06-15T00:21:26.367136  =

    2023-06-15T00:21:26.468803  / # export SHELL=3D/bin/sh. /lava-3664715/e=
nvironment
    2023-06-15T00:21:26.469196  =

    2023-06-15T00:21:26.570711  / # . /lava-3664715/environment/lava-366471=
5/bin/lava-test-runner /lava-3664715/1
    2023-06-15T00:21:26.571389  =

    2023-06-15T00:21:26.574947  / # /lava-3664715/bin/lava-test-runner /lav=
a-3664715/1
    2023-06-15T00:21:26.610562  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648a54698ee306544c30613a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a54698ee306544c306=
13b
        new failure (last pass: v6.4-rc6-257-gbc9b3eb6d292) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648a560c785c6a7a87306184

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a560c785c6a7a87306=
185
        new failure (last pass: v6.4-rc6-221-gf82f3835a7c04) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5a95b475ab698c306249

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5a95b475ab698c306=
24a
        failing since 127 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5b04eecc44118c306130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5b04eecc44118c306=
131
        failing since 127 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/648a54ff5aac1f0545306132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a54ff5aac1f0545306=
133
        new failure (last pass: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648a563ff6f8c82458306177

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a563ff6f8c82458306=
178
        new failure (last pass: v6.4-rc6-221-gf82f3835a7c04) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648a5af00beb9e073e306150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-l=
ibretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-l=
ibretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a5af00beb9e073e306=
151
        failing since 1 day (last pass: v6.4-rc5-210-gef2d89b88456f, first =
fail: v6.4-rc6-221-gf82f3835a7c04) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/648a6c305a1fe1817b306130

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a6c305a1fe1817b306135
        failing since 133 days (last pass: v6.0-12387-ge54e01f1826aa, first=
 fail: v6.2-rc6-289-g1b7183933813)

    2023-06-15T01:40:51.746840  <8>[    9.430259] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664449_1.5.2.4.1>
    2023-06-15T01:40:51.866191  / # #
    2023-06-15T01:40:51.971904  export SHELL=3D/bin/sh
    2023-06-15T01:40:51.973411  #
    2023-06-15T01:40:52.076808  / # export SHELL=3D/bin/sh. /lava-3664449/e=
nvironment
    2023-06-15T01:40:52.078383  =

    2023-06-15T01:40:52.182080  / # . /lava-3664449/environment/lava-366444=
9/bin/lava-test-runner /lava-3664449/1
    2023-06-15T01:40:52.184784  =

    2023-06-15T01:40:52.191357  / # /lava-3664449/bin/lava-test-runner /lav=
a-3664449/1
    2023-06-15T01:40:52.287351  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648a7a42887051f18530612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648a7a42887051f185306=
12f
        new failure (last pass: v6.4-rc6-257-gbc9b3eb6d292) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/648a77862995a4941d306131

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc6-27=
4-g2a7f6b5fd1ca/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648a77862995a4941d306136
        failing since 104 days (last pass: v6.2-12625-g13efc3a9f23b, first =
fail: v6.2-13370-g5872d227b73f)

    2023-06-15T02:28:45.768814  / # #
    2023-06-15T02:28:45.874309  export SHELL=3D/bin/sh
    2023-06-15T02:28:45.875863  #
    2023-06-15T02:28:45.979086  / # export SHELL=3D/bin/sh. /lava-3664446/e=
nvironment
    2023-06-15T02:28:45.980687  =

    2023-06-15T02:28:46.083991  / # . /lava-3664446/environment/lava-366444=
6/bin/lava-test-runner /lava-3664446/1
    2023-06-15T02:28:46.086606  =

    2023-06-15T02:28:46.094048  / # /lava-3664446/bin/lava-test-runner /lav=
a-3664446/1
    2023-06-15T02:28:46.218711  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-15T02:28:46.219918  + cd /lava-3664446/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20
