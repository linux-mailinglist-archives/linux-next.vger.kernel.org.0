Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3F3A6D6495
	for <lists+linux-next@lfdr.de>; Tue,  4 Apr 2023 16:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235665AbjDDOCi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Apr 2023 10:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235418AbjDDOC0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Apr 2023 10:02:26 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913715FD7
        for <linux-next@vger.kernel.org>; Tue,  4 Apr 2023 07:01:53 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so36215097pjp.1
        for <linux-next@vger.kernel.org>; Tue, 04 Apr 2023 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680616899;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lw5W89P9W9HIHD/55NjK30HfJc+BafwnYFEoq0DJmvQ=;
        b=m9AGI5qDAxzJ61UzvkN0hmd8XlzT4UPNjzPY51Eoo7CV2P5QeHNbGQl8hofxDBw8wu
         iNxlIdXiaQzLfBqj4wZ2e5DHXSHoJhwqBOdSiDL63lQkGRm7diiwHyZ/jxzA2suWlwuv
         gVqfu1jw3O7uoODXi1FJANQDrl2LqywHrgm7vzV3ctMghTVjnA4fJeVlj3Dh3ffSj40s
         zuQkqwFalZy+WSNi2bgBwOJrpaV4SsBR1HijkLHVYQIqg+7Guv6zFoPk6xhg674cVB3d
         urNmtUoLNXgN2hvtw+SmXudgUZNYHKrbqN1qgxhlMN0dtWXcxMGE1xmsFwgps2TGrSeG
         hJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680616899;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lw5W89P9W9HIHD/55NjK30HfJc+BafwnYFEoq0DJmvQ=;
        b=3Ryhf0gNoRrknK1FD8cWEc7vD3AAPlxLMC1zzMAOxX64wkG3UtQa3dzDlGJtfjlqd3
         2GamS+IfCRSNTbN+lYRo1s4IxjYOGw4sYq961ckKQtw5r/rh0P5eHCkS7jvrwpgXSYA6
         7wN+lxCp0CvB1mRD431B2rrIp67CRa4XMZDK9mU5ap1Krc+h4xr9rQS/iFj7xVsoRnQs
         IwLz4cpRjFfA24OG1UirS4XnFkAPSBKjyQ45B93L7HfAqvwIAqVQIItCKH00loatg1jC
         3zsYLYHA1LIiS98+5g1/X69tiOlQRE+JuIEKVdlh0UsJynzTMR6P9l3gESlGjUiPFV1j
         OI4g==
X-Gm-Message-State: AAQBX9d1eNSqoGwHXUwDntq2kRLApyUcUzqtL6jK92uq2JNsV7OZXacq
        h9TeSRNLJHGRGyG/HWaR0kbC/y2qZHSkVGE/ONSeSQ==
X-Google-Smtp-Source: AKy350YVut6vQIwxyC96a192A/GS0JN9fXR5oi8pzj/78qv2iU/S8D8gh9F3J5fzW1Pp7YSaOC8Olg==
X-Received: by 2002:a17:90b:4b83:b0:23f:1165:b49f with SMTP id lr3-20020a17090b4b8300b0023f1165b49fmr2817995pjb.38.1680616897626;
        Tue, 04 Apr 2023 07:01:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e24-20020a630f18000000b005035f5e1f9csm7607059pgl.2.2023.04.04.07.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:01:37 -0700 (PDT)
Message-ID: <642c2dc1.630a0220.3da4c.ecc3@mx.google.com>
Date:   Tue, 04 Apr 2023 07:01:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.3-rc5-226-g3a20340084c7
Subject: next/pending-fixes baseline: 614 runs,
 68 regressions (v6.3-rc5-226-g3a20340084c7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 614 runs, 68 regressions (v6.3-rc5-226-g3a2034=
0084c7)

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
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

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

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

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

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

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

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc5-226-g3a20340084c7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc5-226-g3a20340084c7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3a20340084c7ec1eaed02f9355fc4c7cee08cd29 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf33cbaff9fe3c279e94a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf33cbaff9fe3c279e953
        failing since 6 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T09:51:38.271256  <8>[   10.268900] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857307_1.4.2.3.1>

    2023-04-04T09:51:38.271748  + set +x

    2023-04-04T09:51:38.381110  / # #

    2023-04-04T09:51:38.483830  export SHELL=3D/bin/sh

    2023-04-04T09:51:38.484614  #

    2023-04-04T09:51:38.586494  / # export SHELL=3D/bin/sh. /lava-9857307/e=
nvironment

    2023-04-04T09:51:38.587242  =


    2023-04-04T09:51:38.689284  / # . /lava-9857307/environment/lava-985730=
7/bin/lava-test-runner /lava-9857307/1

    2023-04-04T09:51:38.690621  =


    2023-04-04T09:51:38.696590  / # /lava-9857307/bin/lava-test-runner /lav=
a-9857307/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf65209715b8f6a79e975

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf65209715b8f6a79e97a
        failing since 6 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T10:04:42.053323  <8>[   10.375765] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857723_1.4.2.3.1>

    2023-04-04T10:04:42.056979  + set +x

    2023-04-04T10:04:42.158557  #

    2023-04-04T10:04:42.158832  =


    2023-04-04T10:04:42.259635  / # #export SHELL=3D/bin/sh

    2023-04-04T10:04:42.259815  =


    2023-04-04T10:04:42.360751  / # export SHELL=3D/bin/sh. /lava-9857723/e=
nvironment

    2023-04-04T10:04:42.360939  =


    2023-04-04T10:04:42.461887  / # . /lava-9857723/environment/lava-985772=
3/bin/lava-test-runner /lava-9857723/1

    2023-04-04T10:04:42.462164  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf906fa3cfa58c879e9a0

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf906fa3cfa58c879e9a5
        failing since 4 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-04T10:16:21.461840  + set<8>[   12.561269] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9857974_1.4.2.3.1>

    2023-04-04T10:16:21.462294   +x

    2023-04-04T10:16:21.567648  / # #

    2023-04-04T10:16:21.670304  export SHELL=3D/bin/sh

    2023-04-04T10:16:21.671128  #

    2023-04-04T10:16:21.773011  / # export SHELL=3D/bin/sh. /lava-9857974/e=
nvironment

    2023-04-04T10:16:21.773843  =


    2023-04-04T10:16:21.875777  / # . /lava-9857974/environment/lava-985797=
4/bin/lava-test-runner /lava-9857974/1

    2023-04-04T10:16:21.877115  =


    2023-04-04T10:16:21.883146  / # /lava-9857974/bin/lava-test-runner /lav=
a-9857974/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf3238df794f77379e934

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf3238df794f77379e939
        failing since 6 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T09:51:15.492914  + set +x<8>[   11.486055] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9857331_1.4.2.3.1>

    2023-04-04T09:51:15.493007  =


    2023-04-04T09:51:15.597743  / # #

    2023-04-04T09:51:15.698895  export SHELL=3D/bin/sh

    2023-04-04T09:51:15.699161  #

    2023-04-04T09:51:15.800225  / # export SHELL=3D/bin/sh. /lava-9857331/e=
nvironment

    2023-04-04T09:51:15.800484  =


    2023-04-04T09:51:15.901497  / # . /lava-9857331/environment/lava-985733=
1/bin/lava-test-runner /lava-9857331/1

    2023-04-04T09:51:15.901867  =


    2023-04-04T09:51:15.906473  / # /lava-9857331/bin/lava-test-runner /lav=
a-9857331/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf635deb397b36d79e9ff

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf635deb397b36d79ea04
        failing since 6 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T10:04:31.681344  + <8>[   11.060521] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9857673_1.4.2.3.1>

    2023-04-04T10:04:31.681446  set +x

    2023-04-04T10:04:31.786169  / # #

    2023-04-04T10:04:31.888821  export SHELL=3D/bin/sh

    2023-04-04T10:04:31.889574  #

    2023-04-04T10:04:31.991326  / # export SHELL=3D/bin/sh. /lava-9857673/e=
nvironment

    2023-04-04T10:04:31.992060  =


    2023-04-04T10:04:32.094046  / # . /lava-9857673/environment/lava-985767=
3/bin/lava-test-runner /lava-9857673/1

    2023-04-04T10:04:32.095302  =


    2023-04-04T10:04:32.099757  / # /lava-9857673/bin/lava-test-runner /lav=
a-9857673/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/642bf8eec7b3b1932b79e9ca

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf8eec7b3b1932b79e9cf
        failing since 4 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-04T10:15:59.003854  + set +x

    2023-04-04T10:15:59.006745  <8>[   85.692075] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857933_1.4.2.3.1>

    2023-04-04T10:15:59.115760  / # #

    2023-04-04T10:15:59.218296  export SHELL=3D/bin/sh

    2023-04-04T10:15:59.218982  #

    2023-04-04T10:15:59.320869  / # export SHELL=3D/bin/sh. /lava-9857933/e=
nvironment

    2023-04-04T10:15:59.321545  =


    2023-04-04T10:15:59.423407  / # . /lava-9857933/environment/lava-985793=
3/bin/lava-test-runner /lava-9857933/1

    2023-04-04T10:15:59.424758  =


    2023-04-04T10:15:59.429524  / # /lava-9857933/bin/lava-test-runner /lav=
a-9857933/1
 =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/642bf8eec7b3b19=
32b79e9d1
        new failure (last pass: v6.3-rc4-334-g60f00557d56b)
        3 lines

    2023-04-04T10:15:58.979531  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-04-04T10:15:58.986340  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-04-04T10:15:58.992838  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-04T10:15:58.999473  <8>[   85.674756] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf313399cbce78179e932

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf313399cbce78179e937
        failing since 6 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T09:51:03.042984  <8>[   10.619702] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857320_1.4.2.3.1>

    2023-04-04T09:51:03.046267  + set +x

    2023-04-04T09:51:03.147885  #

    2023-04-04T09:51:03.148101  =


    2023-04-04T09:51:03.249072  / # #export SHELL=3D/bin/sh

    2023-04-04T09:51:03.249212  =


    2023-04-04T09:51:03.350146  / # export SHELL=3D/bin/sh. /lava-9857320/e=
nvironment

    2023-04-04T09:51:03.350288  =


    2023-04-04T09:51:03.451202  / # . /lava-9857320/environment/lava-985732=
0/bin/lava-test-runner /lava-9857320/1

    2023-04-04T09:51:03.451434  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf62ddeb397b36d79e95d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf62ddeb397b36d79e962
        failing since 6 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T10:04:17.773916  <8>[   10.294631] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857654_1.4.2.3.1>

    2023-04-04T10:04:17.777471  + set +x

    2023-04-04T10:04:17.883244  #

    2023-04-04T10:04:17.884466  =


    2023-04-04T10:04:17.986764  / # #export SHELL=3D/bin/sh

    2023-04-04T10:04:17.987614  =


    2023-04-04T10:04:18.089686  / # export SHELL=3D/bin/sh. /lava-9857654/e=
nvironment

    2023-04-04T10:04:18.090505  =


    2023-04-04T10:04:18.192485  / # . /lava-9857654/environment/lava-985765=
4/bin/lava-test-runner /lava-9857654/1

    2023-04-04T10:04:18.193770  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf89aea7e85595e79e940

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf89aea7e85595e79e945
        failing since 4 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-04T10:14:38.178309  <8>[   12.488971] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857926_1.4.2.3.1>

    2023-04-04T10:14:38.182034  + set +x

    2023-04-04T10:14:38.287189  #

    2023-04-04T10:14:38.288297  =


    2023-04-04T10:14:38.390325  / # #export SHELL=3D/bin/sh

    2023-04-04T10:14:38.390967  =


    2023-04-04T10:14:38.492635  / # export SHELL=3D/bin/sh. /lava-9857926/e=
nvironment

    2023-04-04T10:14:38.493401  =


    2023-04-04T10:14:38.595238  / # . /lava-9857926/environment/lava-985792=
6/bin/lava-test-runner /lava-9857926/1

    2023-04-04T10:14:38.596385  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf6d549151a3f1879e93e

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf6d549151a3f1879e971
        new failure (last pass: v6.3-rc5-173-g0a9d12dce512)

    2023-04-04T10:06:54.051749  + set +x
    2023-04-04T10:06:54.056562  <8>[   17.448202] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 272297_1.5.2.4.1>
    2023-04-04T10:06:54.191099  / # #
    2023-04-04T10:06:54.294385  export SHELL=3D/bin/sh
    2023-04-04T10:06:54.295105  #
    2023-04-04T10:06:54.397264  / # export SHELL=3D/bin/sh. /lava-272297/en=
vironment
    2023-04-04T10:06:54.397952  =

    2023-04-04T10:06:54.500140  / # . /lava-272297/environment/lava-272297/=
bin/lava-test-runner /lava-272297/1
    2023-04-04T10:06:54.501329  =

    2023-04-04T10:06:54.507819  / # /lava-272297/bin/lava-test-runner /lava=
-272297/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf74b2fcac1f46d79e94c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf74b2fcac1f46d79e951
        failing since 82 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-04-04T10:08:58.311349  / # #

    2023-04-04T10:08:58.414643  export SHELL=3D/bin/sh

    2023-04-04T10:08:58.415568  #

    2023-04-04T10:08:58.517801  / # export SHELL=3D/bin/sh. /lava-9857633/e=
nvironment

    2023-04-04T10:08:58.518850  =


    2023-04-04T10:08:58.621171  / # . /lava-9857633/environment/lava-985763=
3/bin/lava-test-runner /lava-9857633/1

    2023-04-04T10:08:58.622669  =


    2023-04-04T10:08:58.632413  / # /lava-9857633/bin/lava-test-runner /lav=
a-9857633/1

    2023-04-04T10:08:58.749247  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-04T10:08:58.749768  + cd /lava-9857633/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfbcd978b98190a79e94b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfbcd978b98190a79e=
94c
        failing since 36 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfcdf90114982bb79e924

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfcdf90114982bb79e=
925
        failing since 72 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfb56dd2fe8de8379e92a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfb56dd2fe8de8379e=
92b
        failing since 4 days (last pass: v6.3-rc4-271-g7827aece40de, first =
fail: v6.3-rc4-334-g60f00557d56b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf4b1c278331d6b79e941

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf4b1c278331d6b79e946
        failing since 76 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-04T09:57:42.729657  + set +x<8>[   21.522562] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3468823_1.5.2.4.1>
    2023-04-04T09:57:42.729882  =

    2023-04-04T09:57:42.836690  / # #
    2023-04-04T09:57:42.938393  export SHELL=3D/bin/sh
    2023-04-04T09:57:42.938890  #
    2023-04-04T09:57:43.040169  / # export SHELL=3D/bin/sh. /lava-3468823/e=
nvironment
    2023-04-04T09:57:43.040608  =

    2023-04-04T09:57:43.141913  / # . /lava-3468823/environment/lava-346882=
3/bin/lava-test-runner /lava-3468823/1
    2023-04-04T09:57:43.142571  =

    2023-04-04T09:57:43.147339  / # /lava-3468823/bin/lava-test-runner /lav=
a-3468823/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf53710c284302279e99c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf53710c284302279e9a1
        failing since 76 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-04T10:00:14.832790  + set +x<8>[   11.756942] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3468853_1.5.2.4.1>
    2023-04-04T10:00:14.833063  =

    2023-04-04T10:00:14.939918  / # #
    2023-04-04T10:00:15.041533  export SHELL=3D/bin/sh
    2023-04-04T10:00:15.041973  #<3>[   11.871448] Bluetooth: hci0: command=
 0x0c03 tx timeout
    2023-04-04T10:00:15.042192  =

    2023-04-04T10:00:15.143450  / # export SHELL=3D/bin/sh. /lava-3468853/e=
nvironment
    2023-04-04T10:00:15.143823  =

    2023-04-04T10:00:15.245023  / # . /lava-3468853/environment/lava-346885=
3/bin/lava-test-runner /lava-3468853/1
    2023-04-04T10:00:15.245543   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf67d4cd545dd4079e968

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf67d4cd545dd4079e96d
        failing since 76 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-04T10:05:35.847033  <8>[   14.558322] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3468889_1.5.2.4.1>
    2023-04-04T10:05:35.955999  / # #
    2023-04-04T10:05:36.058292  export SHELL=3D/bin/sh
    2023-04-04T10:05:36.058749  #
    2023-04-04T10:05:36.160109  / # export SHELL=3D/bin/sh. /lava-3468889/e=
nvironment
    2023-04-04T10:05:36.161002  =

    2023-04-04T10:05:36.262999  / # . /lava-3468889/environment/lava-346888=
9/bin/lava-test-runner /lava-3468889/1
    2023-04-04T10:05:36.264743  =

    2023-04-04T10:05:36.269411  / # /lava-3468889/bin/lava-test-runner /lav=
a-3468889/1
    2023-04-04T10:05:36.355011  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf98a4a50717a3f79e92e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf98a4a50717a3f79e933
        failing since 76 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-04T10:18:20.563123  + set +x<8>[   12.904875] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3469011_1.5.2.4.1>
    2023-04-04T10:18:20.563424  =

    2023-04-04T10:18:20.671671  / # #
    2023-04-04T10:18:20.773430  export SHELL=3D/bin/sh
    2023-04-04T10:18:20.773795  #
    2023-04-04T10:18:20.773974  / # <3>[   13.071439] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-04-04T10:18:20.874944  export SHELL=3D/bin/sh. /lava-3469011/envir=
onment
    2023-04-04T10:18:20.875390  =

    2023-04-04T10:18:20.976695  / # . /lava-3469011/environment/lava-346901=
1/bin/lava-test-runner /lava-3469011/1
    2023-04-04T10:18:20.977367   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfa1e0a7999057d79e923

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bfa1e0a7999057d79e928
        failing since 76 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-04-04T10:20:59.129945  <8>[   13.039028] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3469091_1.5.2.4.1>
    2023-04-04T10:20:59.240406  / # #
    2023-04-04T10:20:59.344476  export SHELL=3D/bin/sh
    2023-04-04T10:20:59.345593  #
    2023-04-04T10:20:59.346264  / # export SHELL=3D/bin/sh<3>[   13.245424]=
 Bluetooth: hci0: command 0x0c03 tx timeout
    2023-04-04T10:20:59.448512  . /lava-3469091/environment
    2023-04-04T10:20:59.449559  =

    2023-04-04T10:20:59.551862  / # . /lava-3469091/environment/lava-346909=
1/bin/lava-test-runner /lava-3469091/1
    2023-04-04T10:20:59.553709  =

    2023-04-04T10:20:59.558460  / # /lava-3469091/bin/lava-test-runner /lav=
a-3469091/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/642bf36c547a71155d79e96c

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/642bf36c547a711=
55d79e973
        failing since 32 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-04-04T09:52:24.692501  kern  :alert : Register r6 information: NUL=
L pointer
    2023-04-04T09:52:24.737731  kern  :alert : Register r7 information: non=
-paged memory
    2023-04-04T09:52:24.738006  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4e17200 pointer offset 4 size 512
    2023-04-04T09:52:24.738217  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-04T09:52:24.738382  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-04T09:52:24.738522  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf423000 allocated at load_module+0x898/0=
x1b10
    2023-04-04T09:52:24.740857  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-04T09:52:24.831473  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-04T09:52:24.831770  kern  :emerg : Process udevd (pid: 67, stac=
k limit =3D 0x7da5ac2b)
    2023-04-04T09:52:24.831972  kern  :emerg : Stack: (0xc88f9cf8 to 0xc88f=
a000) =

    ... (8 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/642bf36c547a711=
55d79e974
        failing since 435 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-04-04T09:52:24.645315  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-04-04T09:52:24.645624  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-04-04T09:52:24.645836  kern  :alert : 8<--- cut here ---
    2023-04-04T09:52:24.646287  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-04-04T09:52:24.646474  kern  :alert : [00000060] *pgd=3Dc4989831, =
*pte=3D00000000, *ppte=3D00000000
    2023-04-04T09:52:24.646652  kern  :alert : Register r0 information: non=
-paged memory
    2023-04-04T09:52:24.689546  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc88f8000 allocated at kernel_clone+0x98/0x=
3a0
    2023-04-04T09:52:24.689843  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-04-04T09:52:24.690077  kern  :alert : Register r3 information: non=
-paged memory
    2023-04-04T09:52:24.690255  kern  :alert : Register r4 infor<8><LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfe17c00213a54979e97c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfe17c00213a54979e=
97d
        failing since 99 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf332909b7adcb379e934

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
42bf332909b7adcb379e945
        new failure (last pass: v6.3-rc5-173-g0a9d12dce512)

    2023-04-04T09:51:21.760441  /usr/bin/tpm2_getcap

    2023-04-04T09:51:31.965429  /lava-9857335/1/../bin/lava-test-case

    2023-04-04T09:51:31.972610  <8>[   21.210045] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf33f9b3058508f79e925

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf33f9b3058508f79e92a
        failing since 6 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T09:51:42.770167  + <8>[   10.621996] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9857337_1.4.2.3.1>

    2023-04-04T09:51:42.770265  set +x

    2023-04-04T09:51:42.871897  #

    2023-04-04T09:51:42.973145  / # #export SHELL=3D/bin/sh

    2023-04-04T09:51:42.973368  =


    2023-04-04T09:51:43.074302  / # export SHELL=3D/bin/sh. /lava-9857337/e=
nvironment

    2023-04-04T09:51:43.074538  =


    2023-04-04T09:51:43.175520  / # . /lava-9857337/environment/lava-985733=
7/bin/lava-test-runner /lava-9857337/1

    2023-04-04T09:51:43.175847  =


    2023-04-04T09:51:43.180934  / # /lava-9857337/bin/lava-test-runner /lav=
a-9857337/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf6219603c315ce79e922

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf6219603c315ce79e927
        failing since 6 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T10:04:06.850416  + set +x

    2023-04-04T10:04:06.856989  <8>[    8.076688] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857687_1.4.2.3.1>

    2023-04-04T10:04:06.961367  / # #

    2023-04-04T10:04:07.062319  export SHELL=3D/bin/sh

    2023-04-04T10:04:07.062480  #

    2023-04-04T10:04:07.163516  / # export SHELL=3D/bin/sh. /lava-9857687/e=
nvironment

    2023-04-04T10:04:07.163719  =


    2023-04-04T10:04:07.264664  / # . /lava-9857687/environment/lava-985768=
7/bin/lava-test-runner /lava-9857687/1

    2023-04-04T10:04:07.264945  =


    2023-04-04T10:04:07.269503  / # /lava-9857687/bin/lava-test-runner /lav=
a-9857687/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf9da3c8d40940d79e922

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf9da3c8d40940d79e927
        failing since 4 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-04T10:19:42.506021  + set +x

    2023-04-04T10:19:42.512356  <8>[   15.170192] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857924_1.4.2.3.1>

    2023-04-04T10:19:42.618542  / # #

    2023-04-04T10:19:42.719492  export SHELL=3D/bin/sh

    2023-04-04T10:19:42.719708  #

    2023-04-04T10:19:42.820630  / # export SHELL=3D/bin/sh. /lava-9857924/e=
nvironment

    2023-04-04T10:19:42.820807  =


    2023-04-04T10:19:42.921712  / # . /lava-9857924/environment/lava-985792=
4/bin/lava-test-runner /lava-9857924/1

    2023-04-04T10:19:42.921976  =


    2023-04-04T10:19:42.926397  / # /lava-9857924/bin/lava-test-runner /lav=
a-9857924/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf311399cbce78179e924

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf311399cbce78179e929
        failing since 6 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T09:51:02.411792  <8>[   10.400113] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857340_1.4.2.3.1>

    2023-04-04T09:51:02.414748  + set +x

    2023-04-04T09:51:02.516426  /#

    2023-04-04T09:51:02.617672   # #export SHELL=3D/bin/sh

    2023-04-04T09:51:02.617866  =


    2023-04-04T09:51:02.718765  / # export SHELL=3D/bin/sh. /lava-9857340/e=
nvironment

    2023-04-04T09:51:02.718958  =


    2023-04-04T09:51:02.819683  / # . /lava-9857340/environment/lava-985734=
0/bin/lava-test-runner /lava-9857340/1

    2023-04-04T09:51:02.820024  =


    2023-04-04T09:51:02.825424  / # /lava-9857340/bin/lava-test-runner /lav=
a-9857340/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf61e4de1a6507b79e998

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf61e4de1a6507b79e99d
        failing since 6 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T10:04:03.264857  <8>[   10.754177] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857712_1.4.2.3.1>

    2023-04-04T10:04:03.268384  + set +x

    2023-04-04T10:04:03.374403  =


    2023-04-04T10:04:03.476518  / # #export SHELL=3D/bin/sh

    2023-04-04T10:04:03.477250  =


    2023-04-04T10:04:03.578973  / # export SHELL=3D/bin/sh. /lava-9857712/e=
nvironment

    2023-04-04T10:04:03.579686  =


    2023-04-04T10:04:03.681501  / # . /lava-9857712/environment/lava-985771=
2/bin/lava-test-runner /lava-9857712/1

    2023-04-04T10:04:03.682593  =


    2023-04-04T10:04:03.687709  / # /lava-9857712/bin/lava-test-runner /lav=
a-9857712/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf88c8baa184d8379e922

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf88c8baa184d8379e927
        failing since 4 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-04T10:14:23.606060  + <8>[   11.529701] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9857962_1.4.2.3.1>

    2023-04-04T10:14:23.608832  set +x

    2023-04-04T10:14:23.710633  #

    2023-04-04T10:14:23.710966  =


    2023-04-04T10:14:23.812044  / # #export SHELL=3D/bin/sh

    2023-04-04T10:14:23.812232  =


    2023-04-04T10:14:23.913160  / # export SHELL=3D/bin/sh. /lava-9857962/e=
nvironment

    2023-04-04T10:14:23.913351  =


    2023-04-04T10:14:24.014103  / # . /lava-9857962/environment/lava-985796=
2/bin/lava-test-runner /lava-9857962/1

    2023-04-04T10:14:24.014442  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf32e025c231eaf79e98b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf32e025c231eaf79e990
        failing since 6 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T09:51:22.628698  + set +x<8>[   10.856023] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9857351_1.4.2.3.1>

    2023-04-04T09:51:22.629211  =


    2023-04-04T09:51:22.737873  / # #

    2023-04-04T09:51:22.840970  export SHELL=3D/bin/sh

    2023-04-04T09:51:22.841874  #

    2023-04-04T09:51:22.943950  / # export SHELL=3D/bin/sh. /lava-9857351/e=
nvironment

    2023-04-04T09:51:22.944884  =


    2023-04-04T09:51:23.046822  / # . /lava-9857351/environment/lava-985735=
1/bin/lava-test-runner /lava-9857351/1

    2023-04-04T09:51:23.047204  =


    2023-04-04T09:51:23.052021  / # /lava-9857351/bin/lava-test-runner /lav=
a-9857351/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf6309603c315ce79ee4a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf6309603c315ce79ee4f
        failing since 6 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T10:04:21.074052  + <8>[   11.542030] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9857705_1.4.2.3.1>

    2023-04-04T10:04:21.074138  set +x

    2023-04-04T10:04:21.178813  / # #

    2023-04-04T10:04:21.279873  export SHELL=3D/bin/sh

    2023-04-04T10:04:21.280050  #

    2023-04-04T10:04:21.380910  / # export SHELL=3D/bin/sh. /lava-9857705/e=
nvironment

    2023-04-04T10:04:21.381134  =


    2023-04-04T10:04:21.482097  / # . /lava-9857705/environment/lava-985770=
5/bin/lava-test-runner /lava-9857705/1

    2023-04-04T10:04:21.482387  =


    2023-04-04T10:04:21.486824  / # /lava-9857705/bin/lava-test-runner /lav=
a-9857705/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf8998baa184d8379e98e

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf8998baa184d8379e993
        failing since 4 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-04T10:14:27.157866  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector<8>[   14.870334] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>

    2023-04-04T10:14:27.158482  =


    2023-04-04T10:14:27.161586  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-04-04T10:14:27.167614  <8>[   14.881732] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857947_1.4.2.3.1>

    2023-04-04T10:14:27.168095  + set +x

    2023-04-04T10:14:27.276536  / # #

    2023-04-04T10:14:27.379371  export SHELL=3D/bin/sh

    2023-04-04T10:14:27.380171  #

    2023-04-04T10:14:27.481873  / # export SHELL=3D/bin/sh. /lava-9857947/e=
nvironment

    2023-04-04T10:14:27.482598  =

 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bff9d974b53d8f679e98b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bff9d974b53d8f679e=
98c
        failing since 201 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf98e50bca6404079e98c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bf98e50bca6404079e=
98d
        failing since 339 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf88f8baa184d8379e93d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bf88f8baa184d8379e=
93e
        failing since 56 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfc98aad1db53a479e922

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfc98aad1db53a479e=
923
        new failure (last pass: v6.3-rc5-173-g0a9d12dce512) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/642bf67f4cd545dd4079e976

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf67f4cd545dd4079e97d
        new failure (last pass: v6.3-rc4-334-g60f00557d56b)

    2023-04-04T10:05:36.346964  + set<8>[  132.076602] <LAVA_SIGNAL_ENDRUN =
0_dmesg 310224_1.5.2.4.1>
    2023-04-04T10:05:36.347239   +x
    2023-04-04T10:05:36.453592  / # #
    2023-04-04T10:05:36.554906  export SHELL=3D/bin/sh
    2023-04-04T10:05:36.555542  #
    2023-04-04T10:05:36.657064  / # export SHELL=3D/bin/sh. /lava-310224/en=
vironment
    2023-04-04T10:05:36.657713  =

    2023-04-04T10:05:36.759321  / # . /lava-310224/environment/lava-310224/=
bin/lava-test-runner /lava-310224/1
    2023-04-04T10:05:36.760387  =

    2023-04-04T10:05:36.780263  / # /lava-310224/bin/lava-test-runner /lava=
-310224/1 =

    ... (12 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/642=
bf67f4cd545dd4079e98d
        new failure (last pass: v6.3-rc4-334-g60f00557d56b)

    2023-04-04T10:05:39.214334  /lava-310224/1/../bin/lava-test-case
    2023-04-04T10:05:39.214797  <8>[  135.045007] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf330025c231eaf79e9ac

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf330025c231eaf79e9b1
        failing since 6 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T09:51:27.863070  + set<8>[   11.281179] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9857306_1.4.2.3.1>

    2023-04-04T09:51:27.863699   +x

    2023-04-04T09:51:27.972019  / # #

    2023-04-04T09:51:28.075066  export SHELL=3D/bin/sh

    2023-04-04T09:51:28.075980  #

    2023-04-04T09:51:28.177978  / # export SHELL=3D/bin/sh. /lava-9857306/e=
nvironment

    2023-04-04T09:51:28.178776  =


    2023-04-04T09:51:28.280792  / # . /lava-9857306/environment/lava-985730=
6/bin/lava-test-runner /lava-9857306/1

    2023-04-04T09:51:28.281992  =


    2023-04-04T09:51:28.287240  / # /lava-9857306/bin/lava-test-runner /lav=
a-9857306/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf63cc72f9432e479e927

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf63cc72f9432e479e92c
        failing since 6 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-04-04T10:04:32.472258  <8>[   11.677567] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857717_1.4.2.3.1>

    2023-04-04T10:04:32.576933  / # #

    2023-04-04T10:04:32.677930  export SHELL=3D/bin/sh

    2023-04-04T10:04:32.678168  #

    2023-04-04T10:04:32.779122  / # export SHELL=3D/bin/sh. /lava-9857717/e=
nvironment

    2023-04-04T10:04:32.779396  =


    2023-04-04T10:04:32.880376  / # . /lava-9857717/environment/lava-985771=
7/bin/lava-test-runner /lava-9857717/1

    2023-04-04T10:04:32.880756  =


    2023-04-04T10:04:32.885359  / # /lava-9857717/bin/lava-test-runner /lav=
a-9857717/1

    2023-04-04T10:04:32.891724  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf88e8baa184d8379e92f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf88e8baa184d8379e934
        failing since 4 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-04T10:14:32.454886  + set +x

    2023-04-04T10:14:32.458114  <8>[   13.744788] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9857951_1.4.2.3.1>

    2023-04-04T10:14:32.567252  / # #

    2023-04-04T10:14:32.670243  export SHELL=3D/bin/sh

    2023-04-04T10:14:32.671207  #

    2023-04-04T10:14:32.773064  / # export SHELL=3D/bin/sh. /lava-9857951/e=
nvironment

    2023-04-04T10:14:32.773944  =


    2023-04-04T10:14:32.875843  / # . /lava-9857951/environment/lava-985795=
1/bin/lava-test-runner /lava-9857951/1

    2023-04-04T10:14:32.877160  =


    2023-04-04T10:14:32.882065  / # /lava-9857951/bin/lava-test-runner /lav=
a-9857951/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf6609c91b6ee1179e96b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf6609c91b6ee1179e970
        failing since 4 days (last pass: v6.3-rc4-271-g7827aece40de, first =
fail: v6.3-rc4-334-g60f00557d56b)

    2023-04-04T10:04:47.409276  / # #
    2023-04-04T10:04:47.510736  export SHELL=3D/bin/sh
    2023-04-04T10:04:47.511096  #
    2023-04-04T10:04:47.511262  / # <3>[   18.450261] mmc2: tuning executio=
n failed: -5
    2023-04-04T10:04:47.511408  <3>[   18.450314] mmc2: error -5 whilst ini=
tialising SDIO card
    2023-04-04T10:04:47.612320  export SHELL=3D/bin/sh. /lava-3468917/envir=
onment
    2023-04-04T10:04:47.612677  =

    2023-04-04T10:04:47.713936  / # . /lava-3468917/environment/lava-346891=
7/bin/lava-test-runner /lava-3468917/1
    2023-04-04T10:04:47.714442  =

    2023-04-04T10:04:47.727211  / # /lava-3468917/bin/lava-test-runner /lav=
a-3468917/1 =

    ... (19 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf5b14772859ed479e946

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bf5b14772859ed479e=
947
        failing since 174 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfd3f7f1bbd50e679e96e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfd3f7f1bbd50e679e=
96f
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bff0a1bf86943be79e92e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bff0a1bf86943be79e=
92f
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfe32cfdf2cc9a279ea5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfe32cfdf2cc9a279e=
a60
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfd524419f4cde379e924

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfd524419f4cde379e=
925
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfe05e617dc905779e936

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfe05e617dc905779e=
937
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfd4635563fbd6879e99e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfd4635563fbd6879e=
99f
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfd3db2931c239079ea2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfd3db2931c239079e=
a2f
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfe2dcfdf2cc9a279ea5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfe2dcfdf2cc9a279e=
a5d
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfe0f68c758a3c679e93e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfe0f68c758a3c679e=
93f
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfd3c04e808f33479e934

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfd3c04e808f33479e=
935
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfe1ae617dc905779e94c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfe1ae617dc905779e=
94d
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfd7e0e665ff47079e928

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfd7e0e665ff47079e=
929
        failing since 174 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfd574419f4cde379e929

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfd574419f4cde379e=
92a
        new failure (last pass: v6.3-rc5-173-g0a9d12dce512) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfe61484131b25d79e92f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfe61484131b25d79e=
930
        new failure (last pass: v6.3-rc5-173-g0a9d12dce512) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfd56bc15ce4cbb79e92b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfd56bc15ce4cbb79e=
92c
        new failure (last pass: v6.3-rc5-173-g0a9d12dce512) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfe5f6f1f929c1779e946

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfe5f6f1f929c1779e=
947
        new failure (last pass: v6.3-rc5-173-g0a9d12dce512) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfd535458ddeec379e924

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfd535458ddeec379e=
925
        new failure (last pass: v6.3-rc5-173-g0a9d12dce512) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfe37cfdf2cc9a279ea62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfe37cfdf2cc9a279e=
a63
        new failure (last pass: v6.3-rc5-173-g0a9d12dce512) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfd554d0ed470c679e927

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfd554d0ed470c679e=
928
        new failure (last pass: v6.3-rc5-173-g0a9d12dce512) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfe741e255a3d5e79e935

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfe741e255a3d5e79e=
936
        new failure (last pass: v6.3-rc5-173-g0a9d12dce512) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf610693d1d7bb179e9c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bf610693d1d7bb179e=
9c6
        failing since 6 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfa80a4004e5c5b79e982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfa80a4004e5c5b79e=
983
        failing since 110 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf943183b8a9c9b79e92f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bf943183b8a9c9b79e=
930
        failing since 109 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/642bf2fec21c73451479e968

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc5-22=
6-g3a20340084c7/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642bf2fec21c73451479e96d
        failing since 1 day (last pass: v6.3-rc4-334-g60f00557d56b, first f=
ail: v6.3-rc5-173-g0a9d12dce512)

    2023-04-04T09:50:39.396999  <8>[    7.142676] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 420586_1.5.2.4.1>
    2023-04-04T09:50:39.507604  / # #
    2023-04-04T09:50:39.611597  export SHELL=3D/bin/sh
    2023-04-04T09:50:39.612545  #
    2023-04-04T09:50:39.714860  / # export SHELL=3D/bin/sh. /lava-420586/en=
vironment
    2023-04-04T09:50:39.715575  =

    2023-04-04T09:50:39.817605  / # . /lava-420586/environment/lava-420586/=
bin/lava-test-runner /lava-420586/1
    2023-04-04T09:50:39.818631  =

    2023-04-04T09:50:39.827686  / # /lava-420586/bin/lava-test-runner /lava=
-420586/1
    2023-04-04T09:50:39.938999  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
