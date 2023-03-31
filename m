Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A04A16D165D
	for <lists+linux-next@lfdr.de>; Fri, 31 Mar 2023 06:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjCaEcn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Mar 2023 00:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjCaEcm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Mar 2023 00:32:42 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F67B11679
        for <linux-next@vger.kernel.org>; Thu, 30 Mar 2023 21:32:38 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id l7so19281759pjg.5
        for <linux-next@vger.kernel.org>; Thu, 30 Mar 2023 21:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680237157;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7FOQCPkljfholpf5IgFC/sNywlxzm8iTrgSxo6b51EI=;
        b=bHbkdrLZPRp9PmarYNPmirsKMTvrWj5zqmXzCE7X89klktZZJ+50etmvXjEZ4ih60m
         bSCtDD2LR7tMzzq+S+6SfjRTr01AiwS9rnJQracLkBYl23a6kwXixNGvAE7BfGg9O/0T
         lgLZcIIea5Hw/xMQaegEhp/AGE+v7oWwsZlbAdI+oEELjvdUHT727HRHwKV+jrQbMFWn
         qPe4PuShMNfa8WGY2ffocTaCu8PmiubK0RmCZItlQviLvVR3+kq5MRElkHfGwFDAUsUT
         u5xnNDwF2hPWcJ07wz4CFr03UFGU97ibSk6FqQ/R0nuhqVzA3gr7BNljvtYNyBRMbgqC
         0G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680237157;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FOQCPkljfholpf5IgFC/sNywlxzm8iTrgSxo6b51EI=;
        b=VkZFLM6FuobeEiDbUbMms5T5N+7xr68ndZk2UO4T3UPGftdTGcV2NftkAYZKW1QMTp
         P9XyccEmDMHcY75Q/SEGbZWyqTRyXRFMQBNLKpW4MEMCvNLYb54UhsoSsGkpLwd+6C49
         kdYvnelsqwvqmKoY9Y/G9i1aHWhKNgMRAPNcpCdoWuzFHslLgue/+K0R6v0/EAstfQTp
         bXoL0XBClFH6nmuUFU4N2ysIWTaArx3DliTikIoeBfIQiX40cL9RndU3Z9eYCOph7fVq
         sd4zA36bkeNCs2ruHmDyr6Yb5HlFLhOYjhpMq/UAAeQEXog+f6hZet2XKGcaA+YRKqpH
         no+Q==
X-Gm-Message-State: AAQBX9ecyQv9P6WuOoY48XQpkAMODp+ehGyD+XIX3ReDCezU9WPc7/Rv
        z6gQM0degC+eArmPQx/xN8oJf4iIOx2ccwd7iEo=
X-Google-Smtp-Source: AKy350basTDdz/qgHbq2JIQ2DMnE/zAllRAYaVaIEVXy6SjQS52NG/ty5Q2WI1aAvVePZ8Tu5pVOFQ==
X-Received: by 2002:a17:902:ecc2:b0:19a:b754:4053 with SMTP id a2-20020a170902ecc200b0019ab7544053mr34167879plh.26.1680237156109;
        Thu, 30 Mar 2023 21:32:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090276ca00b0019c3296844csm481983plt.301.2023.03.30.21.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 21:32:35 -0700 (PDT)
Message-ID: <64266263.170a0220.a1d4b.170c@mx.google.com>
Date:   Thu, 30 Mar 2023 21:32:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.3-rc4-334-g60f00557d56b
Subject: next/pending-fixes baseline: 702 runs,
 74 regressions (v6.3-rc4-334-g60f00557d56b)
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

next/pending-fixes baseline: 702 runs, 74 regressions (v6.3-rc4-334-g60f005=
57d56b)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
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
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

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
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

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

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
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

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc4-334-g60f00557d56b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc4-334-g60f00557d56b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      60f00557d56bdf072710261ca69a579c7f4ab941 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64262a130a6eb94cb862f784

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262a130a6eb94cb862f789
        failing since 2 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:31:54.164850  + set +x

    2023-03-31T00:31:54.171776  <8>[   10.700401] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825501_1.4.2.3.1>

    2023-03-31T00:31:54.274526  =


    2023-03-31T00:31:54.375504  / # #export SHELL=3D/bin/sh

    2023-03-31T00:31:54.375689  =


    2023-03-31T00:31:54.476602  / # export SHELL=3D/bin/sh. /lava-9825501/e=
nvironment

    2023-03-31T00:31:54.476774  =


    2023-03-31T00:31:54.577779  / # . /lava-9825501/environment/lava-982550=
1/bin/lava-test-runner /lava-9825501/1

    2023-03-31T00:31:54.578039  =


    2023-03-31T00:31:54.583602  / # /lava-9825501/bin/lava-test-runner /lav=
a-9825501/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c17ea97577d3362f76c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c17ea97577d3362f771
        failing since 2 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:40:44.213982  + set +x

    2023-03-31T00:40:44.220583  <8>[   10.466862] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825624_1.4.2.3.1>

    2023-03-31T00:40:44.322284  / # #

    2023-03-31T00:40:44.423109  export SHELL=3D/bin/sh

    2023-03-31T00:40:44.423327  #

    2023-03-31T00:40:44.524227  / # export SHELL=3D/bin/sh. /lava-9825624/e=
nvironment

    2023-03-31T00:40:44.524459  =


    2023-03-31T00:40:44.625418  / # . /lava-9825624/environment/lava-982562=
4/bin/lava-test-runner /lava-9825624/1

    2023-03-31T00:40:44.625738  =


    2023-03-31T00:40:44.631643  / # /lava-9825624/bin/lava-test-runner /lav=
a-9825624/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c532b15ed58a662f7e6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c532b15ed58a662f7eb
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-31T00:41:39.514283  + set +x

    2023-03-31T00:41:39.520903  <8>[   12.849039] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825671_1.4.2.3.1>

    2023-03-31T00:41:39.626187  / # #

    2023-03-31T00:41:39.727206  export SHELL=3D/bin/sh

    2023-03-31T00:41:39.727449  #

    2023-03-31T00:41:39.828393  / # export SHELL=3D/bin/sh. /lava-9825671/e=
nvironment

    2023-03-31T00:41:39.828630  =


    2023-03-31T00:41:39.929542  / # . /lava-9825671/environment/lava-982567=
1/bin/lava-test-runner /lava-9825671/1

    2023-03-31T00:41:39.929892  =


    2023-03-31T00:41:39.936202  / # /lava-9825671/bin/lava-test-runner /lav=
a-9825671/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64262a14977f8e093662f785

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262a14977f8e093662f78a
        failing since 2 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:32:11.996347  + set<8>[   11.087473] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9825495_1.4.2.3.1>

    2023-03-31T00:32:11.996951   +x

    2023-03-31T00:32:12.105633  / # #

    2023-03-31T00:32:12.208837  export SHELL=3D/bin/sh

    2023-03-31T00:32:12.209724  #

    2023-03-31T00:32:12.311884  / # export SHELL=3D/bin/sh. /lava-9825495/e=
nvironment

    2023-03-31T00:32:12.312773  =


    2023-03-31T00:32:12.414943  / # . /lava-9825495/environment/lava-982549=
5/bin/lava-test-runner /lava-9825495/1

    2023-03-31T00:32:12.416319  =


    2023-03-31T00:32:12.420971  / # /lava-9825495/bin/lava-test-runner /lav=
a-9825495/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c1de521e0aa6362f791

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c1de521e0aa6362f796
        failing since 2 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:40:52.477001  + set<8>[   10.820286] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9825642_1.4.2.3.1>

    2023-03-31T00:40:52.477598   +x

    2023-03-31T00:40:52.586292  / # #

    2023-03-31T00:40:52.689460  export SHELL=3D/bin/sh

    2023-03-31T00:40:52.690339  #

    2023-03-31T00:40:52.792549  / # export SHELL=3D/bin/sh. /lava-9825642/e=
nvironment

    2023-03-31T00:40:52.793436  =


    2023-03-31T00:40:52.895705  / # . /lava-9825642/environment/lava-982564=
2/bin/lava-test-runner /lava-9825642/1

    2023-03-31T00:40:52.897053  =


    2023-03-31T00:40:52.901937  / # /lava-9825642/bin/lava-test-runner /lav=
a-9825642/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c693f91c7075962f778

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c693f91c7075962f77d
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-31T00:41:58.047738  + set +x

    2023-03-31T00:41:58.051389  <8>[   15.249013] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825688_1.4.2.3.1>

    2023-03-31T00:41:58.156960  / # #

    2023-03-31T00:41:58.258044  export SHELL=3D/bin/sh

    2023-03-31T00:41:58.258311  #

    2023-03-31T00:41:58.359205  / # export SHELL=3D/bin/sh. /lava-9825688/e=
nvironment

    2023-03-31T00:41:58.359469  =


    2023-03-31T00:41:58.460406  / # . /lava-9825688/environment/lava-982568=
8/bin/lava-test-runner /lava-9825688/1

    2023-03-31T00:41:58.460814  =


    2023-03-31T00:41:58.465392  / # /lava-9825688/bin/lava-test-runner /lav=
a-9825688/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64262a050c95fd35c862f7a3

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262a050c95fd35c862f7a8
        failing since 2 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:31:58.320672  <8>[    9.904273] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825498_1.4.2.3.1>

    2023-03-31T00:31:58.324208  + set +x

    2023-03-31T00:31:58.430602  =


    2023-03-31T00:31:58.532902  / # #export SHELL=3D/bin/sh

    2023-03-31T00:31:58.533621  =


    2023-03-31T00:31:58.635485  / # export SHELL=3D/bin/sh. /lava-9825498/e=
nvironment

    2023-03-31T00:31:58.636217  =


    2023-03-31T00:31:58.738048  / # . /lava-9825498/environment/lava-982549=
8/bin/lava-test-runner /lava-9825498/1

    2023-03-31T00:31:58.738306  =


    2023-03-31T00:31:58.743220  / # /lava-9825498/bin/lava-test-runner /lav=
a-9825498/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c20d0a2f2559462f76b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c20d0a2f2559462f770
        failing since 2 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:40:41.850667  <8>[   10.029313] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825630_1.4.2.3.1>

    2023-03-31T00:40:41.854220  + set +x

    2023-03-31T00:40:41.955936  #

    2023-03-31T00:40:41.956237  =


    2023-03-31T00:40:42.057237  / # #export SHELL=3D/bin/sh

    2023-03-31T00:40:42.057446  =


    2023-03-31T00:40:42.158378  / # export SHELL=3D/bin/sh. /lava-9825630/e=
nvironment

    2023-03-31T00:40:42.158596  =


    2023-03-31T00:40:42.259511  / # . /lava-9825630/environment/lava-982563=
0/bin/lava-test-runner /lava-9825630/1

    2023-03-31T00:40:42.259808  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c4554f087c27962f796

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c4554f087c27962f79b
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-31T00:41:31.133146  <8>[   12.318785] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825687_1.4.2.3.1>

    2023-03-31T00:41:31.136805  + set +x

    2023-03-31T00:41:31.242405  #

    2023-03-31T00:41:31.345781  / # #export SHELL=3D/bin/sh

    2023-03-31T00:41:31.346735  =


    2023-03-31T00:41:31.448485  / # export SHELL=3D/bin/sh. /lava-9825687/e=
nvironment

    2023-03-31T00:41:31.449370  =


    2023-03-31T00:41:31.551383  / # . /lava-9825687/environment/lava-982568=
7/bin/lava-test-runner /lava-9825687/1

    2023-03-31T00:41:31.552743  =


    2023-03-31T00:41:31.558012  / # /lava-9825687/bin/lava-test-runner /lav=
a-9825687/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6426284fc234e78b5362f82c

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6426284fc234e78b5362f85f
        new failure (last pass: v6.3-rc4-271-g7827aece40de)

    2023-03-31T00:24:15.554588  + set +x
    2023-03-31T00:24:15.558508  <8>[   18.237346] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 255141_1.5.2.4.1>
    2023-03-31T00:24:15.692619  / # #
    2023-03-31T00:24:15.794910  export SHELL=3D/bin/sh
    2023-03-31T00:24:15.795786  #
    2023-03-31T00:24:15.897592  / # export SHELL=3D/bin/sh. /lava-255141/en=
vironment
    2023-03-31T00:24:15.898179  =

    2023-03-31T00:24:15.999774  / # . /lava-255141/environment/lava-255141/=
bin/lava-test-runner /lava-255141/1
    2023-03-31T00:24:16.001149  =

    2023-03-31T00:24:16.007215  / # /lava-255141/bin/lava-test-runner /lava=
-255141/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/642628f39762bbc08762f80e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642628f39762bbc08762f813
        failing since 78 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-03-31T00:27:12.466497  / # #

    2023-03-31T00:27:12.568288  export SHELL=3D/bin/sh

    2023-03-31T00:27:12.568825  #

    2023-03-31T00:27:12.670142  / # export SHELL=3D/bin/sh. /lava-9825277/e=
nvironment

    2023-03-31T00:27:12.670692  =


    2023-03-31T00:27:12.772007  / # . /lava-9825277/environment/lava-982527=
7/bin/lava-test-runner /lava-9825277/1

    2023-03-31T00:27:12.772814  =


    2023-03-31T00:27:12.776462  / # /lava-9825277/bin/lava-test-runner /lav=
a-9825277/1

    2023-03-31T00:27:12.900247  + export 'TESTRUN_ID=3D1_bootrr'

    2023-03-31T00:27:12.900605  + cd /lava-9825277/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64262a331ba158f7d562f771

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262a331ba158f7d562f=
772
        failing since 32 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64262b9181df65287962f779

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262b9181df65287962f=
77a
        failing since 68 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262f857bb849556062f802

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262f857bb849556062f=
803
        new failure (last pass: v6.3-rc4-271-g7827aece40de) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64262ac2a4803e39ab62f7c2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262ac2a4803e39ab62f7c7
        failing since 72 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-31T00:34:11.813444  + set +x<8>[   15.161266] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3457585_1.5.2.4.1>
    2023-03-31T00:34:11.814191  =

    2023-03-31T00:34:11.923955  / # #
    2023-03-31T00:34:12.027084  export SHELL=3D/bin/sh
    2023-03-31T00:34:12.027875  #
    2023-03-31T00:34:12.129724  / # export SHELL=3D/bin/sh. /lava-3457585/e=
nvironment
    2023-03-31T00:34:12.130535  =

    2023-03-31T00:34:12.232307  / # . /lava-3457585/environment/lava-345758=
5/bin/lava-test-runner /lava-3457585/1
    2023-03-31T00:34:12.233670  =

    2023-03-31T00:34:12.234244  / # /lava-3457585/bin/lava-test-runner /lav=
a-3457585/1<3>[   15.561015] Bluetooth: hci0: command 0x0c03 tx timeout =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c0d70d12a1e4962f76b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c0d70d12a1e4962f770
        failing since 72 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-31T00:40:19.312853  <8>[   24.332625] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3457676_1.5.2.4.1>
    2023-03-31T00:40:19.422843  / # #
    2023-03-31T00:40:19.524792  export SHELL=3D/bin/sh
    2023-03-31T00:40:19.525422  #
    2023-03-31T00:40:19.627236  / # export SHELL=3D/bin/sh. /lava-3457676/e=
nvironment
    2023-03-31T00:40:19.628132  =

    2023-03-31T00:40:19.729975  / # . /lava-3457676/environment/lava-345767=
6/bin/lava-test-runner /lava-3457676/1
    2023-03-31T00:40:19.730856  =

    2023-03-31T00:40:19.735870  / # /lava-3457676/bin/lava-test-runner /lav=
a-3457676/1
    2023-03-31T00:40:19.821291  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64262ca1844fcbb78762f7da

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262ca1844fcbb78762f7df
        failing since 72 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-31T00:42:58.968559  + set +x
    2023-03-31T00:42:58.978340  <8>[   14.909024] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3457701_1.5.2.4.1>
    2023-03-31T00:42:59.087834  / # #
    2023-03-31T00:42:59.190983  export SHELL=3D/bin/sh
    2023-03-31T00:42:59.191291  #
    2023-03-31T00:42:59.292368  / # export SHELL=3D/bin/sh. /lava-3457701/e=
nvironment
    2023-03-31T00:42:59.292742  =

    2023-03-31T00:42:59.292962  / # . /lava-3457701/environment<3>[   15.22=
2538] Bluetooth: hci0: command 0xfc18 tx timeout
    2023-03-31T00:42:59.394358  /lava-3457701/bin/lava-test-runner /lava-34=
57701/1
    2023-03-31T00:42:59.395681   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64262d4ef758ca926c62f76d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262d4ef758ca926c62f772
        failing since 72 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-31T00:45:31.991212  <8>[   15.002868] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3457803_1.5.2.4.1>
    2023-03-31T00:45:32.097888  / # #
    2023-03-31T00:45:32.199483  export SHELL=3D/bin/sh
    2023-03-31T00:45:32.199812  #
    2023-03-31T00:45:32.300932  / # export SHELL=3D/bin/sh. /lava-3457803/e=
nvironment
    2023-03-31T00:45:32.301294  =

    2023-03-31T00:45:32.402469  / # . /lava-3457803/environment/lava-345780=
3/bin/lava-test-runner /lava-3457803/1
    2023-03-31T00:45:32.403004  =

    2023-03-31T00:45:32.407969  / # /lava-3457803/bin/lava-test-runner /lav=
a-3457803/1
    2023-03-31T00:45:32.506408  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64262dd03d621af41862f77e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262dd03d621af41862f783
        failing since 72 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-31T00:47:56.985735  <8>[   16.731678] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3457872_1.5.2.4.1>
    2023-03-31T00:47:57.097382  / # #
    2023-03-31T00:47:57.200365  export SHELL=3D/bin/sh
    2023-03-31T00:47:57.201154  #
    2023-03-31T00:47:57.302967  / # export SHELL=3D/bin/sh. /lava-3457872/e=
nvironment
    2023-03-31T00:47:57.303877  =

    2023-03-31T00:47:57.406284  / # . /lava-3457872/environment/lava-345787=
2/bin/lava-test-runner /lava-3457872/1
    2023-03-31T00:47:57.408150  =

    2023-03-31T00:47:57.412987  / # /lava-3457872/bin/lava-test-runner /lav=
a-3457872/1
    2023-03-31T00:47:57.497612  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64262cc8502d68c12962f7aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262cc8502d68c12962f=
7ab
        failing since 94 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64262a688b3309c62362f7e2

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4262a688b3309c62362f7f1
        new failure (last pass: v6.3-rc4-271-g7827aece40de)

    2023-03-31T00:33:21.666914  /usr/bin/tpm2_getcap

    2023-03-31T00:33:31.883693  /lava-9825492/1/../bin/lava-test-case<8>[  =
 20.690387] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dtpm-chip-is-online RESULT=
=3Dfail>

    2023-03-31T00:33:31.884232  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c0ce4d73b778b62f77e

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4262c0ce4d73b778b62f78d
        new failure (last pass: v6.3-rc4-271-g7827aece40de)

    2023-03-31T00:40:27.997056  /usr/bin/tpm2_getcap

    2023-03-31T00:40:38.209315  /lava-9825609/1/../bin/lava-test-case

    2023-03-31T00:40:38.216440  <8>[   20.700204] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64262a040c95fd35c862f76f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262a040c95fd35c862f774
        failing since 2 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:31:49.106683  + set +x

    2023-03-31T00:31:49.113203  <8>[   10.091224] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825486_1.4.2.3.1>

    2023-03-31T00:31:49.218284  / # #

    2023-03-31T00:31:49.319374  export SHELL=3D/bin/sh

    2023-03-31T00:31:49.319604  #

    2023-03-31T00:31:49.420497  / # export SHELL=3D/bin/sh. /lava-9825486/e=
nvironment

    2023-03-31T00:31:49.420741  =


    2023-03-31T00:31:49.521693  / # . /lava-9825486/environment/lava-982548=
6/bin/lava-test-runner /lava-9825486/1

    2023-03-31T00:31:49.522014  =


    2023-03-31T00:31:49.526843  / # /lava-9825486/bin/lava-test-runner /lav=
a-9825486/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c0e70d12a1e4962f7b6

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c0e70d12a1e4962f7bb
        failing since 2 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:40:36.250356  + set +x

    2023-03-31T00:40:36.257074  <8>[   10.799387] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825612_1.4.2.3.1>

    2023-03-31T00:40:36.365537  / # #

    2023-03-31T00:40:36.468265  export SHELL=3D/bin/sh

    2023-03-31T00:40:36.468979  #

    2023-03-31T00:40:36.570798  / # export SHELL=3D/bin/sh. /lava-9825612/e=
nvironment

    2023-03-31T00:40:36.571811  =


    2023-03-31T00:40:36.674100  / # . /lava-9825612/environment/lava-982561=
2/bin/lava-test-runner /lava-9825612/1

    2023-03-31T00:40:36.674380  =


    2023-03-31T00:40:36.679149  / # /lava-9825612/bin/lava-test-runner /lav=
a-9825612/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c707d0c44569362f787

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c707d0c44569362f78c
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-31T00:42:01.767457  + set +x

    2023-03-31T00:42:01.773783  <8>[   15.078096] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825685_1.4.2.3.1>

    2023-03-31T00:42:01.880277  / # #

    2023-03-31T00:42:01.981197  export SHELL=3D/bin/sh

    2023-03-31T00:42:01.981376  #

    2023-03-31T00:42:02.082208  / # export SHELL=3D/bin/sh. /lava-9825685/e=
nvironment

    2023-03-31T00:42:02.082390  =


    2023-03-31T00:42:02.183265  / # . /lava-9825685/environment/lava-982568=
5/bin/lava-test-runner /lava-9825685/1

    2023-03-31T00:42:02.183600  =


    2023-03-31T00:42:02.188279  / # /lava-9825685/bin/lava-test-runner /lav=
a-9825685/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642629fc5ceba80ac162f792

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642629fc5ceba80ac162f797
        failing since 2 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:31:34.533646  + set +x<8>[    9.804531] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9825484_1.4.2.3.1>

    2023-03-31T00:31:34.533735  =


    2023-03-31T00:31:34.635507  #

    2023-03-31T00:31:34.736706  / # #export SHELL=3D/bin/sh

    2023-03-31T00:31:34.736896  =


    2023-03-31T00:31:34.837846  / # export SHELL=3D/bin/sh. /lava-9825484/e=
nvironment

    2023-03-31T00:31:34.838040  =


    2023-03-31T00:31:34.938963  / # . /lava-9825484/environment/lava-982548=
4/bin/lava-test-runner /lava-9825484/1

    2023-03-31T00:31:34.939236  =


    2023-03-31T00:31:34.943790  / # /lava-9825484/bin/lava-test-runner /lav=
a-9825484/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c053581d2bee162f797

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c053581d2bee162f79c
        failing since 2 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:40:27.262624  + set +x

    2023-03-31T00:40:27.269622  <8>[   10.761432] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825646_1.4.2.3.1>

    2023-03-31T00:40:27.371677  #

    2023-03-31T00:40:27.371983  =


    2023-03-31T00:40:27.472899  / # #export SHELL=3D/bin/sh

    2023-03-31T00:40:27.473084  =


    2023-03-31T00:40:27.573935  / # export SHELL=3D/bin/sh. /lava-9825646/e=
nvironment

    2023-03-31T00:40:27.574124  =


    2023-03-31T00:40:27.674989  / # . /lava-9825646/environment/lava-982564=
6/bin/lava-test-runner /lava-9825646/1

    2023-03-31T00:40:27.675334  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c48b995faf6e362f83a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c48b995faf6e362f83f
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-31T00:41:20.479292  + set +x

    2023-03-31T00:41:20.485736  <8>[   13.609670] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825691_1.4.2.3.1>

    2023-03-31T00:41:20.594145  / # #

    2023-03-31T00:41:20.696701  export SHELL=3D/bin/sh

    2023-03-31T00:41:20.697478  #

    2023-03-31T00:41:20.799265  / # export SHELL=3D/bin/sh. /lava-9825691/e=
nvironment

    2023-03-31T00:41:20.800013  =


    2023-03-31T00:41:20.901591  / # . /lava-9825691/environment/lava-982569=
1/bin/lava-test-runner /lava-9825691/1

    2023-03-31T00:41:20.902814  =


    2023-03-31T00:41:20.908019  / # /lava-9825691/bin/lava-test-runner /lav=
a-9825691/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642629fd5ceba80ac162f79f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642629fd5ceba80ac162f7a4
        failing since 2 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:31:51.449769  + <8>[   11.106613] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9825500_1.4.2.3.1>

    2023-03-31T00:31:51.449874  set +x

    2023-03-31T00:31:51.554421  / # #

    2023-03-31T00:31:51.655389  export SHELL=3D/bin/sh

    2023-03-31T00:31:51.655580  #

    2023-03-31T00:31:51.756431  / # export SHELL=3D/bin/sh. /lava-9825500/e=
nvironment

    2023-03-31T00:31:51.756612  =


    2023-03-31T00:31:51.857259  / # . /lava-9825500/environment/lava-982550=
0/bin/lava-test-runner /lava-9825500/1

    2023-03-31T00:31:51.857561  =


    2023-03-31T00:31:51.862353  / # /lava-9825500/bin/lava-test-runner /lav=
a-9825500/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c26ea97577d3362f791

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c26ea97577d3362f796
        failing since 2 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:40:53.599927  + set<8>[   11.195824] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9825598_1.4.2.3.1>

    2023-03-31T00:40:53.600454   +x

    2023-03-31T00:40:53.708606  / # #

    2023-03-31T00:40:53.809555  export SHELL=3D/bin/sh

    2023-03-31T00:40:53.809744  #

    2023-03-31T00:40:53.910616  / # export SHELL=3D/bin/sh. /lava-9825598/e=
nvironment

    2023-03-31T00:40:53.910809  =


    2023-03-31T00:40:54.011738  / # . /lava-9825598/environment/lava-982559=
8/bin/lava-test-runner /lava-9825598/1

    2023-03-31T00:40:54.012014  =


    2023-03-31T00:40:54.016537  / # /lava-9825598/bin/lava-test-runner /lav=
a-9825598/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c6031783aa63d62f81f

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c6031783aa63d62f824
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-31T00:41:49.970977  + set +x

    2023-03-31T00:41:49.974020  <8>[   14.022327] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9825672_1.4.2.3.1>

    2023-03-31T00:41:50.084158  / # #

    2023-03-31T00:41:50.187337  export SHELL=3D/bin/sh

    2023-03-31T00:41:50.188298  #

    2023-03-31T00:41:50.290397  / # export SHELL=3D/bin/sh. /lava-9825672/e=
nvironment

    2023-03-31T00:41:50.291365  =


    2023-03-31T00:41:50.393113  / # . /lava-9825672/environment/lava-982567=
2/bin/lava-test-runner /lava-9825672/1

    2023-03-31T00:41:50.394406  =


    2023-03-31T00:41:50.399165  / # /lava-9825672/bin/lava-test-runner /lav=
a-9825672/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/642629895698c62b5062f77a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642629895698c62b5062f77d
        failing since 85 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-31T00:29:36.474982  / # #
    2023-03-31T00:29:37.635311  export SHELL=3D/bin/sh
    2023-03-31T00:29:37.640757  #
    2023-03-31T00:29:39.186475  / # export SHELL=3D/bin/sh. /lava-1191275/e=
nvironment
    2023-03-31T00:29:39.191881  =

    2023-03-31T00:29:42.010605  / # . /lava-1191275/environment/lava-119127=
5/bin/lava-test-runner /lava-1191275/1
    2023-03-31T00:29:42.016240  =

    2023-03-31T00:29:42.016569  / # /lava-1191275/bin/lava-test-runner /lav=
a-1191275/1
    2023-03-31T00:29:42.109633  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-31T00:29:42.110041  + cd /lava-1191275/1/tests/1_bootrr =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64262d1c709831ad7a62f828

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262d1c709831ad7a62f82b
        failing since 85 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-31T00:44:53.085052  + set +x
    2023-03-31T00:44:53.086027  <8>[   67.139920] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1191276_1.5.2.4.1>
    2023-03-31T00:44:53.194114  / # #
    2023-03-31T00:44:54.352517  export SHELL=3D/bin/sh
    2023-03-31T00:44:54.357931  #
    2023-03-31T00:44:54.358054  / # export SHELL=3D/bin/sh
    2023-03-31T00:44:55.904081  / # . /lava-1191276/environment
    2023-03-31T00:44:58.731366  /lava-1191276/bin/lava-test-runner /lava-11=
91276/1
    2023-03-31T00:44:58.737434  . /lava-1191276/environment
    2023-03-31T00:44:58.737736  / # /lava-1191276/bin/lava-test-runner /lav=
a-1191276/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64262bc6912b3c25c462f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262bc6912b3c25c462f=
76c
        failing since 335 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262e9f1039a352f862f799

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262e9f1039a352f862f=
79a
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64262a0c0c95fd35c862f7b9

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262a0c0c95fd35c862f7be
        failing since 2 days (last pass: v6.3-rc3-370-g8269040171a02, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:31:53.746685  + set<8>[   11.519746] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9825464_1.4.2.3.1>

    2023-03-31T00:31:53.746773   +x

    2023-03-31T00:31:53.851212  / # #

    2023-03-31T00:31:53.952195  export SHELL=3D/bin/sh

    2023-03-31T00:31:53.952405  #

    2023-03-31T00:31:54.053325  / # export SHELL=3D/bin/sh. /lava-9825464/e=
nvironment

    2023-03-31T00:31:54.053529  =


    2023-03-31T00:31:54.154153  / # . /lava-9825464/environment/lava-982546=
4/bin/lava-test-runner /lava-9825464/1

    2023-03-31T00:31:54.154449  =


    2023-03-31T00:31:54.159066  / # /lava-9825464/bin/lava-test-runner /lav=
a-9825464/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c033581d2bee162f772

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-co=
llabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c033581d2bee162f777
        failing since 2 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-03-31T00:40:23.802926  + set +x<8>[   12.199677] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9825618_1.4.2.3.1>

    2023-03-31T00:40:23.803063  =


    2023-03-31T00:40:23.908282  / # #

    2023-03-31T00:40:24.009211  export SHELL=3D/bin/sh

    2023-03-31T00:40:24.009421  #

    2023-03-31T00:40:24.110379  / # export SHELL=3D/bin/sh. /lava-9825618/e=
nvironment

    2023-03-31T00:40:24.110677  =


    2023-03-31T00:40:24.211350  / # . /lava-9825618/environment/lava-982561=
8/bin/lava-test-runner /lava-9825618/1

    2023-03-31T00:40:24.211710  =


    2023-03-31T00:40:24.216528  / # /lava-9825618/bin/lava-test-runner /lav=
a-9825618/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c4154f087c27962f789

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262c4254f087c27962f78e
        new failure (last pass: v6.3-rc3-550-g902f54bbd6c7)

    2023-03-31T00:41:17.143739  + <8>[   14.033682] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9825665_1.4.2.3.1>

    2023-03-31T00:41:17.143826  set +x

    2023-03-31T00:41:17.248336  / # #

    2023-03-31T00:41:17.349346  export SHELL=3D/bin/sh

    2023-03-31T00:41:17.349528  #

    2023-03-31T00:41:17.450468  / # export SHELL=3D/bin/sh. /lava-9825665/e=
nvironment

    2023-03-31T00:41:17.450657  =


    2023-03-31T00:41:17.551675  / # . /lava-9825665/environment/lava-982566=
5/bin/lava-test-runner /lava-9825665/1

    2023-03-31T00:41:17.551982  =


    2023-03-31T00:41:17.556342  / # /lava-9825665/bin/lava-test-runner /lav=
a-9825665/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262d95893286d73562f86b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262d95893286d73562f=
86c
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6426300d403929ef0762f930

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6426300d403929ef0762f=
931
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64263134c5267bcc7a62f76d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64263134c5267bcc7a62f=
76e
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262e1b58bf8cb82b62f7dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262e1b58bf8cb82b62f=
7de
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262ebee8c678494f62f777

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262ebee8c678494f62f=
778
        failing since 39 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64262d62fc39ac9f8a62f827

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262d62fc39ac9f8a62f=
828
        new failure (last pass: v6.3-rc4-271-g7827aece40de) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262ffc00433a3c8062f802

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262ffc00433a3c8062f=
803
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262f7c7bb849556062f7fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262f7c7bb849556062f=
7fd
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/642636f722f3d0bb2e62f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642636f722f3d0bb2e62f=
76c
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262def526bacda5162f76f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262def526bacda5162f=
770
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262d9f049644781a62f777

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262d9f049644781a62f=
778
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64262f33b1cc69c37762f78a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64262f33b1cc69c37762f78f
        new failure (last pass: v6.3-rc4-271-g7827aece40de)

    2023-03-31T00:53:57.392783  + set +x<8>[   18.373009] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3457817_1.5.2.4.1>
    2023-03-31T00:53:57.393267  =

    2023-03-31T00:53:57.501082  / # #
    2023-03-31T00:53:57.603891  export SHELL=3D/bin/sh
    2023-03-31T00:53:57.604762  #<3>[   18.486413] mmc2: tuning execution f=
ailed: -5
    2023-03-31T00:53:57.605275  <3>[   18.486466] mmc2: error -5 whilst ini=
tialising SDIO card
    2023-03-31T00:53:57.605790  =

    2023-03-31T00:53:57.707825  / # export SHELL=3D/bin/sh. /lava-3457817/e=
nvironment
    2023-03-31T00:53:57.708551  =

    2023-03-31T00:53:57.810303  / # . /lava-3457817/environment/lava-345781=
7/bin/lava-test-runner /lava-3457817/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/642632d69ccce936fa62f76d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642632d69ccce936fa62f=
76e
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262d96893286d73562f86e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262d96893286d73562f=
86f
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64262dc36d49e03ed862f7ac

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/642=
62dc36d49e03ed862f7fc
        failing since 36 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-31T00:47:49.920970  /lava-9825761/1/../bin/lava-test-case

    2023-03-31T00:47:49.927774  <8>[   23.346899] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/64262dc36d49e03ed862f84e
        failing since 32 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-31T00:47:46.050844  <3>[   19.470939] Bluetooth: hci0: Opcode 0=
x1002 failed: -110

    2023-03-31T00:47:46.057134  <3>[   19.471132] Bluetooth: hci0: command =
0x1002 tx timeout

    2023-03-31T00:47:47.063666  /lava-9825761/1/../bin/lava-test-case

    2023-03-31T00:47:47.074294  <8>[   20.490831] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/64262dc36d49e03ed862f84f
        failing since 32 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-31T00:47:46.032023  /lava-9825761/1/../bin/lava-test-case

    2023-03-31T00:47:46.042121  <8>[   19.459335] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64262d774e47ed126b62f840

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/64262d774e47ed126b62f8f2
        failing since 32 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-31T00:46:29.925560  /lava-9825729/1/../bin/lava-test-case

    2023-03-31T00:46:29.932435  <8>[   20.983608] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/64262d774e47ed126b62f8f3
        failing since 32 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-31T00:46:28.906139  /lava-9825729/1/../bin/lava-test-case

    2023-03-31T00:46:28.913032  <8>[   19.963823] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/64262d774e47ed126b62f8f4
        failing since 32 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-31T00:46:27.887144  /lava-9825729/1/../bin/lava-test-case

    2023-03-31T00:46:27.893451  <8>[   18.944517] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64262cb34f27f92df462f7e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid=
-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid=
-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262cb34f27f92df462f=
7e8
        new failure (last pass: v6.3-rc4-271-g7827aece40de) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6426281c8de53e72b562f795

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6426281c8de53e72b562f=
796
        failing since 169 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64263b5cfd963e187162f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64263b5cfd963e187162f=
76c
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64262af418f44c6ec762f76c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262af418f44c6ec762f=
76d
        failing since 20 days (last pass: v6.2-13684-gf93c476d9769, first f=
ail: v6.3-rc1-336-gbec2983895c5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64262a1a3b0524b9aa62f775

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262a1a3b0524b9aa62f=
776
        failing since 20 days (last pass: v6.2-13684-gf93c476d9769, first f=
ail: v6.3-rc1-336-gbec2983895c5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64262b28e84cdccb6c62f9b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262b28e84cdccb6c62f=
9b9
        failing since 20 days (last pass: v6.3-rc1-156-g1bb628591feb, first=
 fail: v6.3-rc1-336-gbec2983895c5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642629f3b34755d65962f790

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642629f3b34755d65962f=
791
        failing since 20 days (last pass: v6.3-rc1-156-g1bb628591feb, first=
 fail: v6.3-rc1-336-gbec2983895c5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/64262af6acd90398f362f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262af6acd90398f362f=
76c
        failing since 20 days (last pass: v6.3-rc1-156-g1bb628591feb, first=
 fail: v6.3-rc1-336-gbec2983895c5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642629f2b34755d65962f77e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642629f2b34755d65962f=
77f
        failing since 20 days (last pass: v6.3-rc1-156-g1bb628591feb, first=
 fail: v6.3-rc1-336-gbec2983895c5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64262623abf514207062f76b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262623abf514207062f=
76c
        failing since 2 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first =
fail: v6.3-rc4-214-g39ee5bf6e049) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64262f0bbc74bae2be62f77e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262f0cbc74bae2be62f=
77f
        failing since 105 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64262c15473e4c400162f7c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262c15473e4c400162f=
7c3
        failing since 105 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262e270fef75db7762f9bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262e270fef75db7762f=
9be
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262d98893286d73562f87c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262d98893286d73562f=
87d
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262fb46173b7f52862f83e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262fb46173b7f52862f=
83f
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64262d98893286d73562f87f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc4-33=
4-g60f00557d56b/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64262d98893286d73562f=
880
        failing since 51 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-157-ga82755b498dd) =

 =20
