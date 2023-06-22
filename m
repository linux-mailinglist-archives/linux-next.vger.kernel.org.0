Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11BD673968F
	for <lists+linux-next@lfdr.de>; Thu, 22 Jun 2023 06:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjFVE5H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jun 2023 00:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjFVE5C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Jun 2023 00:57:02 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1FB019AD
        for <linux-next@vger.kernel.org>; Wed, 21 Jun 2023 21:56:57 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6b45803edfcso4862082a34.3
        for <linux-next@vger.kernel.org>; Wed, 21 Jun 2023 21:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687409816; x=1690001816;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3Dl9x78vGSBZntcP/EO9HYOlldWUF2STB1B8Kn51eC8=;
        b=Mv/ObyQErTemo3VUtZGBOSrJyxTMQ8Tak04bcjYSTqpf4do4yPPFS6/GeQDJyd0Hts
         /gaMebjeFlt0eEg1VN+ayEHP0R6L9L0IiJAMFk5BqeqWi0GlJR4BvlCjuzFAzOD89mum
         3pOGE8cN/UmETCmioIJa8zcVxrltyIAWgDOA6NPt0P8qJa4LoTBREdhLrnLfU/3RiAcm
         Gc77t+R/Axxe46XQU+7BbSE/hlKCCrxDR+Sc6tOyRwItelU/MudW5V5CX5ioqPnGnV5U
         0GDIzbG0UUHY0nylnCOgwwSipEYWe1t73d3O+qmiyipCTE0YmykaT7yujINlhZNzknV3
         NGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687409816; x=1690001816;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Dl9x78vGSBZntcP/EO9HYOlldWUF2STB1B8Kn51eC8=;
        b=hV6aipOEUEKDLIPlcLKAItj1vzLMVDiqLZtBauizVw8GVNvB8WTISzGgDZdZtvuBRH
         itRWRwuSWfa6oy//vIkG9qW2SPnYO274k0ckusKhC5bdVRNHpte57TwxMnzG1eeDt5No
         8i/9cdUzSmmko3zDC3zBsx7gJnOVBG3TStmbUFd/pCuevlXxVR92ME42hbmvuJ33+mJL
         NtxTVp4qsogImv5kvQs0iFNMDlp2Klk3XhXfuLrhrKupYd6NUICkyMJZJG1buEm0Bx+O
         yvYHL0vORAms8aF/FKCucVaRsNluOcA7/T1u0+w+CevUSXf9YTCQVSsMDPfSNfaMgNEq
         Kytw==
X-Gm-Message-State: AC+VfDzjaL8nZY3arZzkqBGF2VeCCci+qSuMsnIrqD38/hljl+VMc9Ah
        hmFeJKJVLQdXY3YHYuN+cDhB9LeyyUnjQmpYnu+Ejw==
X-Google-Smtp-Source: ACHHUZ54gvF+SFt1DsdlrKgP2Bvcjvw+d5VDU6/JKNDTJecuuRWlvQNJtx+2LgfprmincP3DEsGTxw==
X-Received: by 2002:a05:6359:2ea4:b0:12e:3a90:24f with SMTP id rp36-20020a0563592ea400b0012e3a90024fmr8930643rwb.0.1687409814264;
        Wed, 21 Jun 2023 21:56:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i3-20020a63d443000000b00553ebb05d28sm3711951pgj.41.2023.06.21.21.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 21:56:53 -0700 (PDT)
Message-ID: <6493d495.630a0220.e4f17.8773@mx.google.com>
Date:   Wed, 21 Jun 2023 21:56:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.4-rc7-235-g8d8d57edb1481
Subject: next/pending-fixes baseline: 620 runs,
 90 regressions (v6.4-rc7-235-g8d8d57edb1481)
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

next/pending-fixes baseline: 620 runs, 90 regressions (v6.4-rc7-235-g8d8d57=
edb1481)

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
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

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
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =

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

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.4-rc7-235-g8d8d57edb1481/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.4-rc7-235-g8d8d57edb1481
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8d8d57edb1481ed31aae4ce505df25bb4dba1313 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a51b0472c3875b306193

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a51b0472c3875b306=
194
        failing since 255 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a810695c61a71f306152

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a810695c61a71f306=
153
        failing since 252 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64939cc6b9728511c5306146

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939cc6b9728511c530614f
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-22T00:58:53.403875  + set +x

    2023-06-22T00:58:53.410560  <8>[   13.240148] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10852740_1.4.2.3.1>

    2023-06-22T00:58:53.514784  / # #

    2023-06-22T00:58:53.615453  export SHELL=3D/bin/sh

    2023-06-22T00:58:53.615651  #

    2023-06-22T00:58:53.716143  / # export SHELL=3D/bin/sh. /lava-10852740/=
environment

    2023-06-22T00:58:53.716342  =


    2023-06-22T00:58:53.816830  / # . /lava-10852740/environment/lava-10852=
740/bin/lava-test-runner /lava-10852740/1

    2023-06-22T00:58:53.817142  =


    2023-06-22T00:58:53.822815  / # /lava-10852740/bin/lava-test-runner /la=
va-10852740/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64939d6249e6e19d9c30612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939d6249e6e19d9c306138
        failing since 85 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:01:03.956639  <8>[   10.910152] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10852862_1.4.2.3.1>

    2023-06-22T01:01:03.959735  + set +x

    2023-06-22T01:01:04.061223  =


    2023-06-22T01:01:04.161789  / # #export SHELL=3D/bin/sh

    2023-06-22T01:01:04.162078  =


    2023-06-22T01:01:04.262690  / # export SHELL=3D/bin/sh. /lava-10852862/=
environment

    2023-06-22T01:01:04.262942  =


    2023-06-22T01:01:04.363482  / # . /lava-10852862/environment/lava-10852=
862/bin/lava-test-runner /lava-10852862/1

    2023-06-22T01:01:04.363807  =


    2023-06-22T01:01:04.368728  / # /lava-10852862/bin/lava-test-runner /la=
va-10852862/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a234f426809e3730612f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a234f426809e37306138
        failing since 85 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:21:37.898780  <8>[   10.420624] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10853043_1.4.2.3.1>

    2023-06-22T01:21:37.901900  + set +x

    2023-06-22T01:21:38.003404  #

    2023-06-22T01:21:38.105424  / # #export SHELL=3D/bin/sh

    2023-06-22T01:21:38.105979  =


    2023-06-22T01:21:38.206996  / # export SHELL=3D/bin/sh. /lava-10853043/=
environment

    2023-06-22T01:21:38.207363  =


    2023-06-22T01:21:38.308105  / # . /lava-10853043/environment/lava-10853=
043/bin/lava-test-runner /lava-10853043/1

    2023-06-22T01:21:38.308666  =


    2023-06-22T01:21:38.314565  / # /lava-10853043/bin/lava-test-runner /la=
va-10853043/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/64939cd559ddafcfd4306148

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64939cd559ddafc=
fd430614b
        failing since 6 days (last pass: v6.4-rc6-274-g2a7f6b5fd1ca, first =
fail: v6.4-rc6-301-ga3b6bb6457ef)
        3 lines

    2023-06-22T00:58:44.640197  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-06-22T00:58:44.646650  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-06-22T00:58:44.653463  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-06-22T00:58:44.659790  <8>[   15.634616] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939cd559ddafcfd4306151
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-22T00:58:44.663663  + set +x

    2023-06-22T00:58:44.667039  <8>[   15.651112] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10852793_1.4.2.3.1>

    2023-06-22T00:58:44.776527  / # #

    2023-06-22T00:58:44.879429  export SHELL=3D/bin/sh

    2023-06-22T00:58:44.880194  #

    2023-06-22T00:58:44.981742  / # export SHELL=3D/bin/sh. /lava-10852793/=
environment

    2023-06-22T00:58:44.982899  =


    2023-06-22T00:58:45.084998  / # . /lava-10852793/environment/lava-10852=
793/bin/lava-test-runner /lava-10852793/1

    2023-06-22T00:58:45.086112  =


    2023-06-22T00:58:45.091136  / # /lava-10852793/bin/lava-test-runner /la=
va-10852793/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64939d418939c4bb093061ba

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939d418939c4bb093061c3
        failing since 85 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:00:32.773925  + set +x<8>[   10.959448] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10852842_1.4.2.3.1>

    2023-06-22T01:00:32.774004  =


    2023-06-22T01:00:32.878261  / # #

    2023-06-22T01:00:32.978797  export SHELL=3D/bin/sh

    2023-06-22T01:00:32.978959  #

    2023-06-22T01:00:33.079506  / # export SHELL=3D/bin/sh. /lava-10852842/=
environment

    2023-06-22T01:00:33.079696  =


    2023-06-22T01:00:33.180369  / # . /lava-10852842/environment/lava-10852=
842/bin/lava-test-runner /lava-10852842/1

    2023-06-22T01:00:33.182001  =


    2023-06-22T01:00:33.186758  / # /lava-10852842/bin/lava-test-runner /la=
va-10852842/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a136525644f7ec3061dc

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a136525644f7ec3061e5
        failing since 85 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:17:24.358789  + set<8>[   10.874749] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10853061_1.4.2.3.1>

    2023-06-22T01:17:24.358872   +x

    2023-06-22T01:17:24.463109  / # #

    2023-06-22T01:17:24.563689  export SHELL=3D/bin/sh

    2023-06-22T01:17:24.563853  #

    2023-06-22T01:17:24.664344  / # export SHELL=3D/bin/sh. /lava-10853061/=
environment

    2023-06-22T01:17:24.664541  =


    2023-06-22T01:17:24.765087  / # . /lava-10853061/environment/lava-10853=
061/bin/lava-test-runner /lava-10853061/1

    2023-06-22T01:17:24.765360  =


    2023-06-22T01:17:24.770128  / # /lava-10853061/bin/lava-test-runner /la=
va-10853061/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64939cca99f6b3563c306155

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939cca99f6b3563c30615e
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-22T00:58:40.674131  <8>[   13.588649] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10852766_1.4.2.3.1>

    2023-06-22T00:58:40.677425  + set +x

    2023-06-22T00:58:40.782013  / # #

    2023-06-22T00:58:40.882703  export SHELL=3D/bin/sh

    2023-06-22T00:58:40.882955  #

    2023-06-22T00:58:40.983653  / # export SHELL=3D/bin/sh. /lava-10852766/=
environment

    2023-06-22T00:58:40.983945  =


    2023-06-22T00:58:41.084801  / # . /lava-10852766/environment/lava-10852=
766/bin/lava-test-runner /lava-10852766/1

    2023-06-22T00:58:41.085956  =


    2023-06-22T00:58:41.091471  / # /lava-10852766/bin/lava-test-runner /la=
va-10852766/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64939d3e8939c4bb093061af

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939d3e8939c4bb093061b8
        failing since 85 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:00:29.751693  <8>[   11.125917] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10852822_1.4.2.3.1>

    2023-06-22T01:00:29.754523  + set +x

    2023-06-22T01:00:29.855749  #

    2023-06-22T01:00:29.856034  =


    2023-06-22T01:00:29.956647  / # #export SHELL=3D/bin/sh

    2023-06-22T01:00:29.956831  =


    2023-06-22T01:00:30.057333  / # export SHELL=3D/bin/sh. /lava-10852822/=
environment

    2023-06-22T01:00:30.057565  =


    2023-06-22T01:00:30.158147  / # . /lava-10852822/environment/lava-10852=
822/bin/lava-test-runner /lava-10852822/1

    2023-06-22T01:00:30.158437  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64939fa61e31f3e64130613e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939fa61e31f3e641306147
        failing since 85 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:10:41.447550  <8>[   11.128587] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10853090_1.4.2.3.1>

    2023-06-22T01:10:41.450551  + set +x

    2023-06-22T01:10:41.551960  =


    2023-06-22T01:10:41.652632  / # #export SHELL=3D/bin/sh

    2023-06-22T01:10:41.652851  =


    2023-06-22T01:10:41.753350  / # export SHELL=3D/bin/sh. /lava-10853090/=
environment

    2023-06-22T01:10:41.753577  =


    2023-06-22T01:10:41.854099  / # . /lava-10853090/environment/lava-10853=
090/bin/lava-test-runner /lava-10853090/1

    2023-06-22T01:10:41.854579  =


    2023-06-22T01:10:41.859801  / # /lava-10853090/bin/lava-test-runner /la=
va-10853090/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64939bc8252d31d2c930612f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939bc8252d31d2c9306138
        failing since 161 days (last pass: v6.2-rc3-243-g3145d9dfed32, firs=
t fail: v6.2-rc3-296-g79fa898551af)

    2023-06-22T00:55:10.046571  / # #

    2023-06-22T00:55:10.148791  export SHELL=3D/bin/sh

    2023-06-22T00:55:10.149556  #

    2023-06-22T00:55:10.251001  / # export SHELL=3D/bin/sh. /lava-10852712/=
environment

    2023-06-22T00:55:10.251743  =


    2023-06-22T00:55:10.353121  / # . /lava-10852712/environment/lava-10852=
712/bin/lava-test-runner /lava-10852712/1

    2023-06-22T00:55:10.354246  =


    2023-06-22T00:55:10.370788  / # /lava-10852712/bin/lava-test-runner /la=
va-10852712/1

    2023-06-22T00:55:10.481606  + export 'TESTRUN_ID=3D1_bootrr'

    2023-06-22T00:55:10.482120  + cd /lava-10852712/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64939ee84629ecedb4306167

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64939ee84629ecedb4306=
168
        failing since 115 days (last pass: v6.2-8700-gab98cc06b683, first f=
ail: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a18d19c93c5ac930612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a18d19c93c5ac9306=
12f
        failing since 14 days (last pass: v6.4-rc5-244-g9d674be53332, first=
 fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a01763ec9e68cc306155

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagl=
e-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagl=
e-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a01763ec9e68cc306=
156
        new failure (last pass: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64939f3e77f82e0853306168

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939f3e77f82e0853306171
        failing since 155 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-22T01:09:04.937032  <8>[   14.877517] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3685576_1.5.2.4.1>
    2023-06-22T01:09:05.046040  / # #
    2023-06-22T01:09:05.148129  export SHELL=3D/bin/sh
    2023-06-22T01:09:05.148545  #
    2023-06-22T01:09:05.249722  / # export SHELL=3D/bin/sh. /lava-3685576/e=
nvironment
    2023-06-22T01:09:05.250475  =

    2023-06-22T01:09:05.351888  / # . /lava-3685576/environment/lava-368557=
6/bin/lava-test-runner /lava-3685576/1
    2023-06-22T01:09:05.352535  =

    2023-06-22T01:09:05.357471  / # /lava-3685576/bin/lava-test-runner /lav=
a-3685576/1
    2023-06-22T01:09:05.446760  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64939fe81d88260f4b30618d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939fe81d88260f4b306196
        failing since 155 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-22T01:11:40.030475  <8>[   16.860649] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-06-22T01:11:40.030905  + set +x
    2023-06-22T01:11:40.037125  <8>[   16.871036] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3685591_1.5.2.4.1>
    2023-06-22T01:11:40.146455  / # #
    2023-06-22T01:11:40.248258  export SHELL=3D/bin/sh
    2023-06-22T01:11:40.248773  #
    2023-06-22T01:11:40.352590  / # export SHELL=3D/bin/sh. /lava-3685591/e=
nvironment
    2023-06-22T01:11:40.352964  =

    2023-06-22T01:11:40.454689  / # . /lava-3685591/environment/lava-368559=
1/bin/lava-test-runner /lava-3685591/1
    2023-06-22T01:11:40.455356   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a087861364c2093061b1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a087861364c2093061ba
        failing since 155 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-22T01:14:22.877096  + set +x<8>[   14.653125] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3685636_1.5.2.4.1>
    2023-06-22T01:14:22.877373  =

    2023-06-22T01:14:22.983805  / # #
    2023-06-22T01:14:23.085576  export SHELL=3D/bin/sh
    2023-06-22T01:14:23.085953  #
    2023-06-22T01:14:23.187214  / # export SHELL=3D/bin/sh. /lava-3685636/e=
nvironment
    2023-06-22T01:14:23.187676  =

    2023-06-22T01:14:23.187872  / # . /lava-3685636/environment<3>[   14.93=
9283] Bluetooth: hci0: command 0x0c03 tx timeout
    2023-06-22T01:14:23.289153  /lava-3685636/bin/lava-test-runner /lava-36=
85636/1
    2023-06-22T01:14:23.290079   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a12e525644f7ec306195

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a12e525644f7ec30619e
        failing since 155 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-22T01:17:20.572991  + set +x
    2023-06-22T01:17:20.577221  <8>[   14.996493] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3685649_1.5.2.4.1>
    2023-06-22T01:17:20.685243  / # #
    2023-06-22T01:17:20.787157  export SHELL=3D/bin/sh
    2023-06-22T01:17:20.787890  #
    2023-06-22T01:17:20.889547  / # export SHELL=3D/bin/sh. /lava-3685649/e=
nvironment
    2023-06-22T01:17:20.890226  =

    2023-06-22T01:17:20.991871  / # . /lava-3685649/environment/lava-368564=
9/bin/lava-test-runner /lava-3685649/1
    2023-06-22T01:17:20.993099  =

    2023-06-22T01:17:20.997353  / # /lava-3685649/bin/lava-test-runner /lav=
a-3685649/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a3312096992a5d306140

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a3312096992a5d306149
        failing since 155 days (last pass: v6.1-13341-g16cba743aec0, first =
fail: v6.2-rc4-302-g48ed69cf21b2)

    2023-06-22T01:25:50.538719  <8>[   20.100866] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3685757_1.5.2.4.1>
    2023-06-22T01:25:50.645147  / # #
    2023-06-22T01:25:50.747871  export SHELL=3D/bin/sh
    2023-06-22T01:25:50.748606  #
    2023-06-22T01:25:50.850402  / # export SHELL=3D/bin/sh. /lava-3685757/e=
nvironment
    2023-06-22T01:25:50.851279  =

    2023-06-22T01:25:50.953180  / # . /lava-3685757/environment/lava-368575=
7/bin/lava-test-runner /lava-3685757/1
    2023-06-22T01:25:50.954562  =

    2023-06-22T01:25:50.959340  / # /lava-3685757/bin/lava-test-runner /lav=
a-3685757/1
    2023-06-22T01:25:51.042599  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/64939c17fcfe7e383f306141

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64939c17fcfe7e3=
83f306144
        failing since 111 days (last pass: v6.2-1218-g2d4a54ee969d, first f=
ail: v6.2-13370-g5872d227b73f)
        30 lines

    2023-06-22T00:55:29.093053  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4e97200 pointer offset 4 size 512
    2023-06-22T00:55:29.125045  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-22T00:55:29.125793  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-22T00:55:29.126221  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf1e8000 allocated at load_module+0x6b0/0=
x1954
    2023-06-22T00:55:29.128299  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-22T00:55:29.233012  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-22T00:55:29.233739  kern  :emerg : Process udevd (pid: 71, stac=
k limit =3D 0xaad73ca3)
    2023-06-22T00:55:29.234552  kern  :emerg : Stack: (0xc88f9cf8 to 0xc88f=
a000)
    2023-06-22T00:55:29.234989  kern  :emerg : 9ce0:                       =
                                c4e97200 c0777860
    2023-06-22T00:55:29.235384  kern  :emerg : 9d00: 00000000 c03aff10 0000=
0000 9bf3b570 0000005d 9bf3b570 c0777860 bf1e8220 =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64939c17fcfe7e3=
83f306145
        failing since 514 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        16 lines

    2023-06-22T00:55:29.044334  kern  :alert : 8<--- cut here ---
    2023-06-22T00:55:29.045926  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-06-22T00:55:29.046423  kern  :alert : [00000060] *pgd=3Dc49e2831, =
*pte=3D00000000, *ppte=3D00000000
    2023-06-22T00:55:29.046838  kern  :alert : Register r0 information: non=
-paged memory
    2023-06-22T00:55:29.047233  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc88f8000 allocated at kernel_clone+0x98/0x=
3a0
    2023-06-22T00:55:29.048824  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-06-22T00:55:29.088188  kern  :alert : Register r3 information: non=
-paged memory
    2023-06-22T00:55:29.088992  kern  :alert : Register r4 information: sla=
b kmalloc-512 start c4e97200 pointer offset 0 size 512
    2023-06-22T00:55:29.089398  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-06-22T00:55:29.089830  kern  :ale<8><LAVA_SIGNAL_TESTCASE TEST_CAS=
E_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64939cda59e0cd7a23306140

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939cda59e0cd7a23306149
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-22T00:59:03.028643  + set +x

    2023-06-22T00:59:03.035310  <8>[   15.638843] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10852765_1.4.2.3.1>

    2023-06-22T00:59:03.142358  / # #

    2023-06-22T00:59:03.243087  export SHELL=3D/bin/sh

    2023-06-22T00:59:03.243353  #

    2023-06-22T00:59:03.343847  / # export SHELL=3D/bin/sh. /lava-10852765/=
environment

    2023-06-22T00:59:03.344081  =


    2023-06-22T00:59:03.444666  / # . /lava-10852765/environment/lava-10852=
765/bin/lava-test-runner /lava-10852765/1

    2023-06-22T00:59:03.445052  =


    2023-06-22T00:59:03.449692  / # /lava-10852765/bin/lava-test-runner /la=
va-10852765/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64939d2b4bf124edc73061ab

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939d2b4bf124edc73061b4
        failing since 85 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:00:34.424124  + <8>[    8.022069] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10852820_1.4.2.3.1>

    2023-06-22T01:00:34.424229  set +x

    2023-06-22T01:00:34.525818  #

    2023-06-22T01:00:34.626750  / # #export SHELL=3D/bin/sh

    2023-06-22T01:00:34.626978  =


    2023-06-22T01:00:34.727520  / # export SHELL=3D/bin/sh. /lava-10852820/=
environment

    2023-06-22T01:00:34.727804  =


    2023-06-22T01:00:34.828363  / # . /lava-10852820/environment/lava-10852=
820/bin/lava-test-runner /lava-10852820/1

    2023-06-22T01:00:34.828783  =


    2023-06-22T01:00:34.832716  / # /lava-10852820/bin/lava-test-runner /la=
va-10852820/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a1d67d4aeb9fbd306152

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a1d67d4aeb9fbd30615b
        failing since 85 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:20:07.238804  + set +x

    2023-06-22T01:20:07.245056  <8>[   10.434650] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10853049_1.4.2.3.1>

    2023-06-22T01:20:07.349600  / # #

    2023-06-22T01:20:07.450356  export SHELL=3D/bin/sh

    2023-06-22T01:20:07.450577  #

    2023-06-22T01:20:07.551118  / # export SHELL=3D/bin/sh. /lava-10853049/=
environment

    2023-06-22T01:20:07.551359  =


    2023-06-22T01:20:07.651896  / # . /lava-10853049/environment/lava-10853=
049/bin/lava-test-runner /lava-10853049/1

    2023-06-22T01:20:07.652194  =


    2023-06-22T01:20:07.656442  / # /lava-10853049/bin/lava-test-runner /la=
va-10853049/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64939cbff57a514dde3061a5

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939cbff57a514dde3061ae
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-22T00:58:18.686841  + set +x

    2023-06-22T00:58:18.693405  <8>[   14.081171] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10852759_1.4.2.3.1>

    2023-06-22T00:58:18.798625  / # #

    2023-06-22T00:58:18.899311  export SHELL=3D/bin/sh

    2023-06-22T00:58:18.899561  #

    2023-06-22T00:58:19.000089  / # export SHELL=3D/bin/sh. /lava-10852759/=
environment

    2023-06-22T00:58:19.000263  =


    2023-06-22T00:58:19.100787  / # . /lava-10852759/environment/lava-10852=
759/bin/lava-test-runner /lava-10852759/1

    2023-06-22T00:58:19.101067  =


    2023-06-22T00:58:19.106538  / # /lava-10852759/bin/lava-test-runner /la=
va-10852759/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64939d2c4bf124edc73061ee

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939d2c4bf124edc73061f7
        failing since 85 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:00:31.670117  + <8>[   10.685340] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10852828_1.4.2.3.1>

    2023-06-22T01:00:31.673466  set +x

    2023-06-22T01:00:31.774655  /#

    2023-06-22T01:00:31.875556   # #export SHELL=3D/bin/sh

    2023-06-22T01:00:31.875765  =


    2023-06-22T01:00:31.976289  / # export SHELL=3D/bin/sh. /lava-10852828/=
environment

    2023-06-22T01:00:31.976492  =


    2023-06-22T01:00:32.077035  / # . /lava-10852828/environment/lava-10852=
828/bin/lava-test-runner /lava-10852828/1

    2023-06-22T01:00:32.077372  =


    2023-06-22T01:00:32.082426  / # /lava-10852828/bin/lava-test-runner /la=
va-10852828/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a0be96868b75bc306144

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a0be96868b75bc30614d
        failing since 85 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:15:27.256491  + set +x

    2023-06-22T01:15:27.263044  <8>[   10.592630] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10853129_1.4.2.3.1>

    2023-06-22T01:15:27.370483  / # #

    2023-06-22T01:15:27.472701  export SHELL=3D/bin/sh

    2023-06-22T01:15:27.473583  #

    2023-06-22T01:15:27.575072  / # export SHELL=3D/bin/sh. /lava-10853129/=
environment

    2023-06-22T01:15:27.575868  =


    2023-06-22T01:15:27.677295  / # . /lava-10853129/environment/lava-10853=
129/bin/lava-test-runner /lava-10853129/1

    2023-06-22T01:15:27.677646  =


    2023-06-22T01:15:27.682847  / # /lava-10853129/bin/lava-test-runner /la=
va-10853129/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64939cd5b9728511c5306173

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939cd5b9728511c530617c
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-22T00:58:42.934511  + set +x

    2023-06-22T00:58:42.941438  <8>[   13.959609] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10852773_1.4.2.3.1>

    2023-06-22T00:58:43.045797  / # #

    2023-06-22T00:58:43.147882  export SHELL=3D/bin/sh

    2023-06-22T00:58:43.148539  #

    2023-06-22T00:58:43.249805  / # export SHELL=3D/bin/sh. /lava-10852773/=
environment

    2023-06-22T00:58:43.250578  =


    2023-06-22T00:58:43.351972  / # . /lava-10852773/environment/lava-10852=
773/bin/lava-test-runner /lava-10852773/1

    2023-06-22T00:58:43.353256  =


    2023-06-22T00:58:43.358145  / # /lava-10852773/bin/lava-test-runner /la=
va-10852773/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64939d4c8939c4bb093061da

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939d4c8939c4bb093061e3
        failing since 85 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:00:41.651319  + set<8>[   11.471791] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10852831_1.4.2.3.1>

    2023-06-22T01:00:41.651405   +x

    2023-06-22T01:00:41.755834  / # #

    2023-06-22T01:00:41.858053  export SHELL=3D/bin/sh

    2023-06-22T01:00:41.858778  #

    2023-06-22T01:00:41.960189  / # export SHELL=3D/bin/sh. /lava-10852831/=
environment

    2023-06-22T01:00:41.961094  =


    2023-06-22T01:00:42.062817  / # . /lava-10852831/environment/lava-10852=
831/bin/lava-test-runner /lava-10852831/1

    2023-06-22T01:00:42.064265  =


    2023-06-22T01:00:42.068584  / # /lava-10852831/bin/lava-test-runner /la=
va-10852831/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64939e06869548628f306175

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939e06869548628f30617e
        failing since 85 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:03:58.046260  + <8>[   11.258689] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10853083_1.4.2.3.1>

    2023-06-22T01:03:58.046346  set +x

    2023-06-22T01:03:58.150906  / # #

    2023-06-22T01:03:58.251530  export SHELL=3D/bin/sh

    2023-06-22T01:03:58.251726  #

    2023-06-22T01:03:58.352213  / # export SHELL=3D/bin/sh. /lava-10853083/=
environment

    2023-06-22T01:03:58.352405  =


    2023-06-22T01:03:58.452889  / # . /lava-10853083/environment/lava-10853=
083/bin/lava-test-runner /lava-10853083/1

    2023-06-22T01:03:58.453188  =


    2023-06-22T01:03:58.457627  / # /lava-10853083/bin/lava-test-runner /la=
va-10853083/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64939f1f77f82e0853306132

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939f1f77f82e085330613b
        failing since 143 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-22T01:08:40.717117  + set +x
    2023-06-22T01:08:40.717315  [   12.893540] <LAVA_SIGNAL_ENDRUN 0_dmesg =
984939_1.5.2.3.1>
    2023-06-22T01:08:40.824959  / # #
    2023-06-22T01:08:40.926555  export SHELL=3D/bin/sh
    2023-06-22T01:08:40.927078  #
    2023-06-22T01:08:41.028375  / # export SHELL=3D/bin/sh. /lava-984939/en=
vironment
    2023-06-22T01:08:41.028811  =

    2023-06-22T01:08:41.130072  / # . /lava-984939/environment/lava-984939/=
bin/lava-test-runner /lava-984939/1
    2023-06-22T01:08:41.130669  =

    2023-06-22T01:08:41.134109  / # /lava-984939/bin/lava-test-runner /lava=
-984939/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64939f701033eb725d306144

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939f701033eb725d30614d
        failing since 143 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-22T01:09:42.285321  + set +x
    2023-06-22T01:09:42.285487  [   12.140522] <LAVA_SIGNAL_ENDRUN 0_dmesg =
984944_1.5.2.3.1>
    2023-06-22T01:09:42.391941  / # #
    2023-06-22T01:09:42.493667  export SHELL=3D/bin/sh
    2023-06-22T01:09:42.494146  #
    2023-06-22T01:09:42.595388  / # export SHELL=3D/bin/sh. /lava-984944/en=
vironment
    2023-06-22T01:09:42.595822  =

    2023-06-22T01:09:42.697139  / # . /lava-984944/environment/lava-984944/=
bin/lava-test-runner /lava-984944/1
    2023-06-22T01:09:42.697752  =

    2023-06-22T01:09:42.701335  / # /lava-984944/bin/lava-test-runner /lava=
-984944/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64939fc06c79606971306145

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939fc06c7960697130614e
        failing since 143 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-22T01:11:03.620235  + set +x
    2023-06-22T01:11:03.620413  [   13.138158] <LAVA_SIGNAL_ENDRUN 0_dmesg =
984954_1.5.2.3.1>
    2023-06-22T01:11:03.727379  / # #
    2023-06-22T01:11:03.828896  export SHELL=3D/bin/sh
    2023-06-22T01:11:03.829247  #
    2023-06-22T01:11:03.930400  / # export SHELL=3D/bin/sh. /lava-984954/en=
vironment
    2023-06-22T01:11:03.930812  =

    2023-06-22T01:11:04.032026  / # . /lava-984954/environment/lava-984954/=
bin/lava-test-runner /lava-984954/1
    2023-06-22T01:11:04.032597  =

    2023-06-22T01:11:04.036030  / # /lava-984954/bin/lava-test-runner /lava=
-984954/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a0106ed7539f0e306185

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a0106ed7539f0e30618e
        failing since 143 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-22T01:12:23.138358  + set +x
    2023-06-22T01:12:23.138634  [   13.158445] <LAVA_SIGNAL_ENDRUN 0_dmesg =
984962_1.5.2.3.1>
    2023-06-22T01:12:23.245746  / # #
    2023-06-22T01:12:23.347418  export SHELL=3D/bin/sh
    2023-06-22T01:12:23.347851  #
    2023-06-22T01:12:23.449010  / # export SHELL=3D/bin/sh. /lava-984962/en=
vironment
    2023-06-22T01:12:23.449416  =

    2023-06-22T01:12:23.550676  / # . /lava-984962/environment/lava-984962/=
bin/lava-test-runner /lava-984962/1
    2023-06-22T01:12:23.551280  =

    2023-06-22T01:12:23.554765  / # /lava-984962/bin/lava-test-runner /lava=
-984962/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a1f06a72c8e4b630613a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a1f06a72c8e4b6306143
        failing since 143 days (last pass: v6.1-rc8-128-gc530a9add07c, firs=
t fail: v6.2-rc6-199-g0a49732f057b)

    2023-06-22T01:20:24.335376  + set +x
    2023-06-22T01:20:24.335628  [   14.401398] <LAVA_SIGNAL_ENDRUN 0_dmesg =
984987_1.5.2.3.1>
    2023-06-22T01:20:24.443497  / # #
    2023-06-22T01:20:24.545598  export SHELL=3D/bin/sh
    2023-06-22T01:20:24.546118  #
    2023-06-22T01:20:24.647393  / # export SHELL=3D/bin/sh. /lava-984987/en=
vironment
    2023-06-22T01:20:24.647929  =

    2023-06-22T01:20:24.749265  / # . /lava-984987/environment/lava-984987/=
bin/lava-test-runner /lava-984987/1
    2023-06-22T01:20:24.749918  =

    2023-06-22T01:20:24.753236  / # /lava-984987/bin/lava-test-runner /lava=
-984987/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a4fbaca6fe2b4430612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a4fbaca6fe2b44306=
130
        failing since 227 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a1afde5233a353306173

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a1afde5233a353306=
174
        failing since 418 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64939cf4373aa37cd4306159

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939cf4373aa37cd4306162
        failing since 56 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-5614-gbe56a31d3d65)

    2023-06-22T00:59:13.355108  / # #
    2023-06-22T00:59:13.458499  export SHELL=3D/bin/sh
    2023-06-22T00:59:13.460167  #
    2023-06-22T00:59:13.563607  / # export SHELL=3D/bin/sh. /lava-3685473/e=
nvironment
    2023-06-22T00:59:13.564535  =

    2023-06-22T00:59:13.666824  / # . /lava-3685473/environment/lava-368547=
3/bin/lava-test-runner /lava-3685473/1
    2023-06-22T00:59:13.668488  =

    2023-06-22T00:59:13.682425  / # /lava-3685473/bin/lava-test-runner /lav=
a-3685473/1
    2023-06-22T00:59:13.727121  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-22T00:59:13.728109  + cd /lava-3685473/1/tests/1_bootr<8>[    8=
.124316] <LAVA_SIGNAL_STARTRUN 1_bootrr 3685473_1.5.2.4.5> =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a03004fa76e799306195

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-=
sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-=
sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a03004fa76e79930619e
        failing since 54 days (last pass: v6.3-rc7-147-g6ba2ee0e9acd, first=
 fail: v6.3-10703-gb3f869e79cdf)

    2023-06-22T01:12:52.036355  <8>[    7.691756] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3685683_1.5.2.4.1>
    2023-06-22T01:12:52.165029  / # #
    2023-06-22T01:12:52.268994  export SHELL=3D/bin/sh
    2023-06-22T01:12:52.269621  #
    2023-06-22T01:12:52.370805  / # export SHELL=3D/bin/sh. /lava-3685683/e=
nvironment
    2023-06-22T01:12:52.371471  =

    2023-06-22T01:12:52.472994  / # . /lava-3685683/environment/lava-368568=
3/bin/lava-test-runner /lava-3685683/1
    2023-06-22T01:12:52.474271  =

    2023-06-22T01:12:52.485016  / # /lava-3685683/bin/lava-test-runner /lav=
a-3685683/1
    2023-06-22T01:12:52.529319  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a19219c93c5ac9306135

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-=
am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-=
am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a19219c93c5ac930613e
        failing since 56 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.3-5614-gbe56a31d3d65)

    2023-06-22T01:18:39.191267  + set +x
    2023-06-22T01:18:39.194561  <8>[   17.601024] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3685732_1.5.2.4.1>
    2023-06-22T01:18:39.348509  / # #
    2023-06-22T01:18:39.451541  export SHELL=3D/bin/sh
    2023-06-22T01:18:39.452521  #
    2023-06-22T01:18:39.554516  / # export SHELL=3D/bin/sh. /lava-3685732/e=
nvironment
    2023-06-22T01:18:39.555489  =

    2023-06-22T01:18:39.657501  / # . /lava-3685732/environment/lava-368573=
2/bin/lava-test-runner /lava-3685732/1
    2023-06-22T01:18:39.659322  =

    2023-06-22T01:18:39.705218  / # /lava-3685732/bin/lava-test-runner /lav=
a-3685732/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64939ccd99f6b3563c306160

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939ccd99f6b3563c306169
        failing since 83 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-334-g60f00557d56b)

    2023-06-22T00:58:38.441536  + set +x

    2023-06-22T00:58:38.444719  <8>[   13.973953] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10852777_1.4.2.3.1>

    2023-06-22T00:58:38.550573  / # #

    2023-06-22T00:58:38.651314  export SHELL=3D/bin/sh

    2023-06-22T00:58:38.651537  #

    2023-06-22T00:58:38.752080  / # export SHELL=3D/bin/sh. /lava-10852777/=
environment

    2023-06-22T00:58:38.752328  =


    2023-06-22T00:58:38.852897  / # . /lava-10852777/environment/lava-10852=
777/bin/lava-test-runner /lava-10852777/1

    2023-06-22T00:58:38.853257  =


    2023-06-22T00:58:38.857109  / # /lava-10852777/bin/lava-test-runner /la=
va-10852777/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64939d39ffb8f1516d30613d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939d39ffb8f1516d306146
        failing since 85 days (last pass: v6.3-rc3-550-g902f54bbd6c7, first=
 fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:00:34.513606  + set<8>[   10.892062] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10852851_1.4.2.3.1>

    2023-06-22T01:00:34.514037   +x

    2023-06-22T01:00:34.622010  / # #

    2023-06-22T01:00:34.722692  export SHELL=3D/bin/sh

    2023-06-22T01:00:34.722877  #

    2023-06-22T01:00:34.823414  / # export SHELL=3D/bin/sh. /lava-10852851/=
environment

    2023-06-22T01:00:34.823603  =


    2023-06-22T01:00:34.924107  / # . /lava-10852851/environment/lava-10852=
851/bin/lava-test-runner /lava-10852851/1

    2023-06-22T01:00:34.924390  =


    2023-06-22T01:00:34.929567  / # /lava-10852851/bin/lava-test-runner /la=
va-10852851/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64939e3ca478ac44e23061b2

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939e3ca478ac44e23061bb
        failing since 85 days (last pass: v6.3-rc3-370-g8269040171a02, firs=
t fail: v6.3-rc4-214-g39ee5bf6e049)

    2023-06-22T01:04:55.688413  <8>[   11.923692] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10853060_1.4.2.3.1>

    2023-06-22T01:04:55.798692  / # #

    2023-06-22T01:04:55.899449  export SHELL=3D/bin/sh

    2023-06-22T01:04:55.899652  #

    2023-06-22T01:04:56.000218  / # export SHELL=3D/bin/sh. /lava-10853060/=
environment

    2023-06-22T01:04:56.001074  =


    2023-06-22T01:04:56.102714  / # . /lava-10853060/environment/lava-10853=
060/bin/lava-test-runner /lava-10853060/1

    2023-06-22T01:04:56.103877  =


    2023-06-22T01:04:56.108949  / # /lava-10853060/bin/lava-test-runner /la=
va-10853060/1

    2023-06-22T01:04:56.114808  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64939b7788f651046b306191

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u2=
00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u2=
00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64939b7788f651046b306=
192
        failing since 42 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64939cf5373aa37cd4306164

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64939cf5373aa37cd4306=
165
        failing since 14 days (last pass: v6.4-rc5-210-gef2d89b88456f, firs=
t fail: v6.4-rc5-244-g9d674be53332) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a02c596f6afb58306135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a02c596f6afb58306=
136
        failing since 14 days (last pass: v6.4-rc5-210-gef2d89b88456f, firs=
t fail: v6.4-rc5-294-gda90eaebfb79) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a0e0dd8d1b4b3e30613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a0e0dd8d1b4b3e306=
13e
        failing since 42 days (last pass: v6.3-rc6-279-g281ec23cca3f, first=
 fail: v6.4-rc1-166-g16fe96af4971) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a2555ad421f6dd306245

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a2555ad421f6dd306=
246
        failing since 134 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a2846683262041306178

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a2846683262041306=
179
        failing since 134 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64939eb0e6cf31117b30613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64939eb0e6cf31117b306=
13e
        new failure (last pass: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a4b51221d8720f3061ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a4b51221d8720f306=
1ed
        failing since 134 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64939c531a7ed4747a30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s90=
5d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s90=
5d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64939c531a7ed4747a306=
130
        new failure (last pass: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a21bac03d0a44130616b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a21bac03d0a441306=
16c
        failing since 134 days (last pass: v6.2-rc6-351-gf42837eac380f, fir=
st fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a3fa212ded25913061a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a3fa212ded2591306=
1a4
        failing since 134 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a21782b55c65ef3061a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a21782b55c65ef306=
1a5
        failing since 134 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493aa365c291bb4ea306158

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493aa365c291bb4ea306=
159
        failing since 143 days (last pass: v6.2-rc5-286-g436294605dc5, firs=
t fail: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64939f1abeecda9e5c306135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64939f1abeecda9e5c306=
136
        failing since 44 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a227409a35011b30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a227409a35011b306=
12f
        failing since 56 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64939f2077f82e085330613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64939f2077f82e0853306=
13e
        failing since 44 days (last pass: v6.3-rc7-226-gf05a2341f2478, firs=
t fail: v6.4-rc1-91-g2f19ff6b99223) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a1f26a72c8e4b630614c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-colla=
bora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a1f26a72c8e4b6306=
14d
        failing since 56 days (last pass: v6.3-1432-g527c4dda86b8, first fa=
il: v6.3-5614-gbe56a31d3d65) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a4a96f430d8913306143

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a4a96f430d8913306=
144
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a580567ba717b2306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a580567ba717b2306=
134
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a498e59205015b306154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a498e59205015b306=
155
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a49550836a2426306246

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a49550836a2426306=
247
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a57fac7562ce4e306189

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a57fac7562ce4e306=
18a
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a49650836a242630624b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a49650836a2426306=
24c
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a4ab67c7bdec7d30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a4ab67c7bdec7d306=
130
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a593567ba717b230617c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a593567ba717b2306=
17d
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a52b0472c3875b3061a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a52b0472c3875b306=
1a8
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a4aaf0167e2431306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a4aaf0167e2431306=
145
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a581ac7562ce4e30618f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a581ac7562ce4e306=
190
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a52a0472c3875b3061a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a52a0472c3875b306=
1a5
        failing since 252 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64939d78381d05333e3061f0

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mi=
ps-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mi=
ps-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64939d78381d053=
33e3061f4
        new failure (last pass: v6.4-rc7-214-g00072f89e53f9)
        1 lines

    2023-06-22T01:01:37.720834  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 2422e45c, epc =3D=3D 801ff458, ra =3D=
=3D 80201e54
    2023-06-22T01:01:37.720981  =


    2023-06-22T01:01:37.748124  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-06-22T01:01:37.748309  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64939e29a478ac44e2306136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64939e29a478ac44e2306=
137
        new failure (last pass: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a168d893eaa44e30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a168d893eaa44e306=
12f
        failing since 188 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a0785c4b9679cb30617b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a0785c4b9679cb306=
17c
        failing since 188 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64939b54e8f4d52526306164

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939b54e8f4d5252630616d
        failing since 141 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-22T00:52:24.767293  [   28.691977] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3685407_1.5.2.4.1>
    2023-06-22T00:52:24.872734  =

    2023-06-22T00:52:24.975055  / # #export SHELL=3D/bin/sh
    2023-06-22T00:52:24.975686  =

    2023-06-22T00:52:25.077459  / # export SHELL=3D/bin/sh. /lava-3685407/e=
nvironment
    2023-06-22T00:52:25.078247  =

    2023-06-22T00:52:25.179855  / # . /lava-3685407/environment/lava-368540=
7/bin/lava-test-runner /lava-3685407/1
    2023-06-22T00:52:25.180679  =

    2023-06-22T00:52:25.183968  / # /lava-3685407/bin/lava-test-runner /lav=
a-3685407/1
    2023-06-22T00:52:25.219790  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64939ccfb9728511c530615c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64939ccfb9728511c5306165
        failing since 140 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-22T00:58:49.558471  [   28.752383] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3685469_1.5.2.4.1>
    2023-06-22T00:58:49.662898  =

    2023-06-22T00:58:49.764965  / # #export SHELL=3D/bin/sh
    2023-06-22T00:58:49.765565  =

    2023-06-22T00:58:49.867030  / # export SHELL=3D/bin/sh. /lava-3685469/e=
nvironment
    2023-06-22T00:58:49.867657  =

    2023-06-22T00:58:49.969104  / # . /lava-3685469/environment/lava-368546=
9/bin/lava-test-runner /lava-3685469/1
    2023-06-22T00:58:49.970129  =

    2023-06-22T00:58:49.973589  / # /lava-3685469/bin/lava-test-runner /lav=
a-3685469/1
    2023-06-22T00:58:50.009422  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a01863ec9e68cc306158

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a01863ec9e68cc306161
        failing since 141 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.2-rc6-289-g1b7183933813)

    2023-06-22T01:12:32.049406  [   28.854091] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3685661_1.5.2.4.1>
    2023-06-22T01:12:32.154591  =

    2023-06-22T01:12:32.256711  / # #export SHELL=3D/bin/sh
    2023-06-22T01:12:32.257180  =

    2023-06-22T01:12:32.358606  / # export SHELL=3D/bin/sh. /lava-3685661/e=
nvironment
    2023-06-22T01:12:32.359093  =

    2023-06-22T01:12:32.460514  / # . /lava-3685661/environment/lava-368566=
1/bin/lava-test-runner /lava-3685661/1
    2023-06-22T01:12:32.461290  =

    2023-06-22T01:12:32.464638  / # /lava-3685661/bin/lava-test-runner /lav=
a-3685661/1
    2023-06-22T01:12:32.501060  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a090ddca8967c9306194

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328=
-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6493a090ddca8967c930619d
        failing since 141 days (last pass: v6.0-11312-g1778d6da389c, first =
fail: v6.2-rc6-289-g1b7183933813)

    2023-06-22T01:14:37.863076  [   32.484755] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3685696_1.5.2.4.1>
    2023-06-22T01:14:37.968410  =

    2023-06-22T01:14:38.070666  / # #export SHELL=3D/bin/sh
    2023-06-22T01:14:38.071930  =

    2023-06-22T01:14:38.173640  / # export SHELL=3D/bin/sh. /lava-3685696/e=
nvironment
    2023-06-22T01:14:38.174196  =

    2023-06-22T01:14:38.275798  / # . /lava-3685696/environment/lava-368569=
6/bin/lava-test-runner /lava-3685696/1
    2023-06-22T01:14:38.276473  =

    2023-06-22T01:14:38.279978  / # /lava-3685696/bin/lava-test-runner /lav=
a-3685696/1
    2023-06-22T01:14:38.315155  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a1b5de5233a353306211

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a1b5de5233a353306=
212
        failing since 134 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64939f506f9747ae7330615c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pi=
ne64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pi=
ne64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64939f506f9747ae73306=
15d
        new failure (last pass: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a1ef343bb8865b30613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a1ef343bb8865b306=
13e
        failing since 134 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64939cb6f57a514dde30619c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libr=
etech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libr=
etech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64939cb6f57a514dde306=
19d
        new failure (last pass: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a089861364c2093061ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-=
libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-=
libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a089861364c209306=
1f0
        new failure (last pass: v6.4-rc7-164-g1f02f25057f7) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a19f19c93c5ac9306143

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a19f19c93c5ac9306=
144
        failing since 0 day (last pass: v6.4-rc7-110-gdab158ce7741, first f=
ail: v6.4-rc7-214-g00072f89e53f9) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a1f16a72c8e4b6306149

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a1f16a72c8e4b6306=
14a
        failing since 134 days (last pass: v6.2-rc7-120-g11b3628314a5, firs=
t fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6493a7154274f4bc3230616f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.4-rc7-23=
5-g8d8d57edb1481/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6493a7154274f4bc32306=
170
        new failure (last pass: v6.4-rc7-214-g00072f89e53f9) =

 =20
