Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 505FD6A392C
	for <lists+linux-next@lfdr.de>; Mon, 27 Feb 2023 04:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjB0DBp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Feb 2023 22:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjB0DBo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Feb 2023 22:01:44 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5640312588
        for <linux-next@vger.kernel.org>; Sun, 26 Feb 2023 19:01:39 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id u5so1896689plq.7
        for <linux-next@vger.kernel.org>; Sun, 26 Feb 2023 19:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sTB/lhZK9Vm8DzedG/nbAOBoNf/aINltzInoOqXGErw=;
        b=h6LKy4kua5tOG5vvkBMcEDe0ZWemqgFRXglr27QFvfLETehreW+0Hn0LvQLLVuHd8h
         50h4h0wLSZJJOGK3S9+3K2xBQSQsp8YzWzkyHtKSndg8aMP7aT7KxJd8VLdVVJmCJgzf
         l7GuQ//ceaJWY8NYVfBsHsKb5qXrIzIEjDv63d64IDtZJVQ5h+aVpQqC9uq1DW6rLa6a
         KPHzlx9+YRDogc5ojqO50MLykAImQEFXGwc7EU8IQtxOmPaiE67/Qa9mRvVzjCZOkQZu
         nRlEWtMK/GjieW5VdsmQfQAItBValo8iqFKcS626a7tk/RoW8CNEP56PfVQYsertLdJb
         uBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTB/lhZK9Vm8DzedG/nbAOBoNf/aINltzInoOqXGErw=;
        b=KwUu4dct2dhp2+CBITGRM2Ddt8FlfyN9dYCpiny6rwuAYRpsULEJKVffnc/l1E/NxH
         igwCXG3n8T85pW0GXgdK7XAi8tR5Ie168KlszRgEwzaQw5wQYpSJTlPaczHkpQylt2bh
         TOb8pKGdiNa9JwizE4Ufj7p2S0vV6CSt+YXGRy9Jg2rWE9IYmIkRbHssU/qhGrpCO3/H
         865WfzWMi9yReBaw0xAzgudO0Zmdf+bmf5rbTeC4KtBthdCMgy3d29WiaaNRI06Wskij
         28HNzavDKvWiOCJLj6WVd0gcYhhNAAC+/aCvpfMRKkAZYEBswTzngrdKJxJI6gIQZuLI
         FFOQ==
X-Gm-Message-State: AO0yUKXmFQ4yq/wQRFx3CCUXyKVtmffD80C8ClWJSvVUKGCbOYnkm2FP
        cK715rndyFHb3UG163tazOaz33abZY0kG63utwEbyQ==
X-Google-Smtp-Source: AK7set/kR1nLfyqlnTFrvgzWFjCiKPall2cDhd3ZLxr7QM3M+JWKk0M0/FzcRl6RL3FyT8W2opl1vA==
X-Received: by 2002:a17:903:1108:b0:19c:c184:d208 with SMTP id n8-20020a170903110800b0019cc184d208mr16095712plh.66.1677466897151;
        Sun, 26 Feb 2023 19:01:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902c15100b0019c33775574sm3285985plj.198.2023.02.26.19.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 19:01:36 -0800 (PST)
Message-ID: <63fc1d10.170a0220.64ed8.4e31@mx.google.com>
Date:   Sun, 26 Feb 2023 19:01:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.2-12625-g13efc3a9f23b
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 474 runs,
 94 regressions (v6.2-12625-g13efc3a9f23b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 474 runs, 94 regressions (v6.2-12625-g13efc3a9=
f23b)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 5          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-12625-g13efc3a9f23b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-12625-g13efc3a9f23b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      13efc3a9f23bac387df626bab53a62128296ea52 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe81b28adebce448c862f

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
3fbe81b28adebce448c8644
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-02-26T23:15:17.459775  <8>[   11.677248] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dpass>

    2023-02-26T23:15:17.462579  /usr/bin/tpm2_getcap

    2023-02-26T23:15:17.487960  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =


    2023-02-26T23:15:17.497282  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =


    2023-02-26T23:15:17.507398  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =


    2023-02-26T23:15:17.512317  ERROR: Esys_GetCapability(0xA000A) - tcti:I=
O failure

    2023-02-26T23:15:17.514784  ERROR: Unable to run tpm2_getcap

    2023-02-26T23:15:18.508705  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =


    2023-02-26T23:15:18.521470  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =


    2023-02-26T23:15:18.528211  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =

 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6cd2aa283f9fb8c86b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/=
baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/=
baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe6cd2aa283f9fb8c8=
6b2
        failing since 139 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbea5953aba00b688c8661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-=
am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-=
am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbea5953aba00b688c8=
662
        failing since 137 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe3f7668e23eb7a8c8664

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe3f7668e23eb7a8c866d
        failing since 46 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-02-26T22:57:38.095339  / # #

    2023-02-26T22:57:38.198834  export SHELL=3D/bin/sh

    2023-02-26T22:57:38.199784  #

    2023-02-26T22:57:38.301949  / # export SHELL=3D/bin/sh. /lava-9343217/e=
nvironment

    2023-02-26T22:57:38.303113  =


    2023-02-26T22:57:38.405544  / # . /lava-9343217/environment/lava-934321=
7/bin/lava-test-runner /lava-9343217/1

    2023-02-26T22:57:38.406817  =


    2023-02-26T22:57:38.414003  / # /lava-9343217/bin/lava-test-runner /lav=
a-9343217/1

    2023-02-26T22:57:38.531122  + export 'TESTRUN_ID=3D1_bootrr'

    2023-02-26T22:57:38.531639  + cd /lava-9343217/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe72c9c282370128c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe72c9c282370128c8=
630
        new failure (last pass: v6.2-8700-gab98cc06b683) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe9c77c0228ce738c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe9c77c0228ce738c8=
63f
        failing since 5 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-1218-g2d4a54ee969d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbeb2eae275559cb8c864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbeb2eae275559cb8c8=
64c
        failing since 111 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe9009ff33da33e8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe9009ff33da33e8c8=
630
        failing since 4 days (last pass: v6.2-3304-g34939120e353, first fai=
l: v6.2-6789-g74c3b2e0a611) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe96bd378388a988c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe96bd378388a988c8=
630
        new failure (last pass: v6.2-8700-gab98cc06b683) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe977d378388a988c8666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe977d378388a988c8=
667
        failing since 2 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-8700-gab98cc06b683) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbeade85d2e1cdfe8c867d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-=
imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-=
imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbeade85d2e1cdfe8c8=
67e
        failing since 164 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe7379c282370128c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/riscv/defconfig/gcc-10/lab-clabbe/baseline-jh7100-starfive-vi=
sionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/riscv/defconfig/gcc-10/lab-clabbe/baseline-jh7100-starfive-vi=
sionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe7379c282370128c8=
63b
        new failure (last pass: v6.2-8700-gab98cc06b683) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbeaf64c87e0b4168c8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-s=
tarfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-s=
tarfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbeaf64c87e0b4168c8=
639
        failing since 19 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =


  Details:     https://kernelci.org/test/plan/id/63fbe5244abec7fa1f8c8649

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe5244abec7fa1f8c8650
        failing since 3 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-02-26T23:02:45.912478  / # #
    2023-02-26T23:02:46.014766  export SHELL=3D/bin/sh
    2023-02-26T23:02:46.015482  #
    2023-02-26T23:02:46.116996  / # export SHELL=3D/bin/sh. /lava-286130/en=
vironment
    2023-02-26T23:02:46.117725  =

    2023-02-26T23:02:46.219170  / # . /lava-286130/environment/lava-286130/=
bin/lava-test-runner /lava-286130/1
    2023-02-26T23:02:46.219987  =

    2023-02-26T23:02:46.237253  / # /lava-286130/bin/lava-test-runner /lava=
-286130/1
    2023-02-26T23:02:46.292260  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-26T23:02:46.292661  + <8>[   43.171662] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 286130_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63fbe5244abec7fa1f8c8654
        failing since 3 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-02-26T23:02:48.388431  /lava-286130/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
fbe5244abec7fa1f8c8656
        failing since 3 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-02-26T23:02:49.447578  /lava-286130/1/../bin/lava-test-case
    2023-02-26T23:02:49.448129  <8>[   46.316431] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63fbe5244abec7fa1f8c865b
        failing since 3 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-02-26T23:02:50.523403  /lava-286130/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63fbe5244abec7fa1f8c865c
        failing since 3 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-02-26T23:02:50.526993  <8>[   47.430695] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-26T23:02:51.578113  /lava-286130/1/../bin/lava-test-case
    2023-02-26T23:02:51.578393  <8>[   48.451598] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-26T23:02:51.578573  /lava-286130/1/../bin/lava-test-case
    2023-02-26T23:02:51.578741  <8>[   48.467957] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-26T23:02:51.578889  /lava-286130/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 5          =


  Details:     https://kernelci.org/test/plan/id/63fbe6dc59f7d929f58c8643

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe6dc59f7d929f58c864a
        new failure (last pass: v6.2-rc8-211-g05def2d212c6)

    2023-02-26T23:09:54.802597  <8>[   22.178582] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 286136_1.5.2.4.1>
    2023-02-26T23:09:54.906258  / # #
    2023-02-26T23:09:55.007866  export SHELL=3D/bin/sh
    2023-02-26T23:09:55.008377  #
    2023-02-26T23:09:55.109633  / # export SHELL=3D/bin/sh. /lava-286136/en=
vironment
    2023-02-26T23:09:55.110157  =

    2023-02-26T23:09:55.211902  / # . /lava-286136/environment/lava-286136/=
bin/lava-test-runner /lava-286136/1
    2023-02-26T23:09:55.212517  =

    2023-02-26T23:09:55.218335  / # /lava-286136/bin/lava-test-runner /lava=
-286136/1
    2023-02-26T23:09:55.285430  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63fbe6dc59f7d929f58c864e
        new failure (last pass: v6.2-rc8-211-g05def2d212c6)

    2023-02-26T23:09:57.380547  /lava-286136/1/../bin/lava-test-case
    2023-02-26T23:09:57.381228  <8>[   24.738336] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-26T23:09:57.382464  /lava-286136/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
fbe6dc59f7d929f58c8650
        new failure (last pass: v6.2-rc8-211-g05def2d212c6)

    2023-02-26T23:09:58.440533  /lava-286136/1/../bin/lava-test-case
    2023-02-26T23:09:58.440842  <8>[   25.778077] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-26T23:09:58.440998  /lava-286136/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63fbe6dc59f7d929f58c8655
        new failure (last pass: v6.2-rc8-211-g05def2d212c6)

    2023-02-26T23:09:59.515810  /lava-286136/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63fbe6dc59f7d929f58c8656
        new failure (last pass: v6.2-rc8-211-g05def2d212c6)

    2023-02-26T23:09:59.518994  <8>[   26.891056] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-26T23:10:00.573476  /lava-286136/1/../bin/lava-test-case
    2023-02-26T23:10:00.573878  <8>[   27.912374] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-26T23:10:00.574119  /lava-286136/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe510d974595d918c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12=
a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12=
a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe510d974595d918c8639
        new failure (last pass: v6.2-6789-g74c3b2e0a611)

    2023-02-26T23:02:21.611554  / # #
    2023-02-26T23:02:21.713497  export SHELL=3D/bin/sh
    2023-02-26T23:02:21.714058  #
    2023-02-26T23:02:21.815372  / # export SHELL=3D/bin/sh. /lava-3377088/e=
nvironment
    2023-02-26T23:02:21.815823  =

    2023-02-26T23:02:21.816091  / # <3>[  101.257304] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-26T23:02:21.917487  . /lava-3377088/environment/lava-3377088/bi=
n/lava-test-runner /lava-3377088/1
    2023-02-26T23:02:21.918247  =

    2023-02-26T23:02:21.931344  / # /lava-3377088/bin/lava-test-runner /lav=
a-3377088/1
    2023-02-26T23:02:21.991243  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe67888b883e47d8c86db

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-s=
ei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-s=
ei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe67888b883e47d8c86e4
        new failure (last pass: v6.2-rc8-211-g05def2d212c6)

    2023-02-26T23:08:17.104426  / # #
    2023-02-26T23:08:17.206929  export SHELL=3D/bin/sh
    2023-02-26T23:08:17.207774  #
    2023-02-26T23:08:17.309380  / # export SHELL=3D/bin/sh. /lava-3377125/e=
nvironment
    2023-02-26T23:08:17.309841  <3>[   18.393245] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-26T23:08:17.310082  =

    2023-02-26T23:08:17.411496  / # . /lava-3377125/environment/lava-337712=
5/bin/lava-test-runner /lava-3377125/1
    2023-02-26T23:08:17.412958  =

    2023-02-26T23:08:17.423544  / # /lava-3377125/bin/lava-test-runner /lav=
a-3377125/1
    2023-02-26T23:08:17.484390  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe4df6f0e307b528c8655

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe4df6f0e307b528c865e
        new failure (last pass: v6.2-6789-g74c3b2e0a611)

    2023-02-26T23:01:39.895845  / # #
    2023-02-26T23:01:39.997532  export SHELL=3D/bin/sh
    2023-02-26T23:01:39.997885  #
    2023-02-26T23:01:40.099172  / # export SHELL=3D/bin/sh. /lava-3377085/e=
nvironment
    2023-02-26T23:01:40.099518  =

    2023-02-26T23:01:40.200832  / # . /lava-3377085/environment/lava-337708=
5/bin/lava-test-runner /lava-3377085/1
    2023-02-26T23:01:40.201470  =

    2023-02-26T23:01:40.207281  / # /lava-3377085/bin/lava-test-runner /lav=
a-3377085/1
    2023-02-26T23:01:40.279179  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-26T23:01:40.279518  + cd /lava-3377085/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe68dc7672346aa8c863f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-n=
anopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-n=
anopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe68dc7672346aa8c8648
        new failure (last pass: v6.2-rc8-211-g05def2d212c6)

    2023-02-26T23:08:40.509192  / # #
    2023-02-26T23:08:40.611040  export SHELL=3D/bin/sh
    2023-02-26T23:08:40.611507  #
    2023-02-26T23:08:40.712839  / # export SHELL=3D/bin/sh. /lava-3377129/e=
nvironment
    2023-02-26T23:08:40.713438  =

    2023-02-26T23:08:40.814953  / # . /lava-3377129/environment/lava-337712=
9/bin/lava-test-runner /lava-3377129/1
    2023-02-26T23:08:40.815630  =

    2023-02-26T23:08:40.820601  / # /lava-3377129/bin/lava-test-runner /lav=
a-3377129/1
    2023-02-26T23:08:40.892526  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-26T23:08:40.892823  + cd /lava-3377129/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbeb378bb2ea57a28c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbeb378bb2ea57a28c8638
        failing since 2 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-02-26T23:28:29.732769  + set +x<8>[   18.874337] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3377270_1.5.2.4.1>
    2023-02-26T23:28:29.836283  / # #
    2023-02-26T23:28:29.937962  export SHELL=3D/bin/sh
    2023-02-26T23:28:29.938310  #
    2023-02-26T23:28:30.039625  / # export SHELL=3D/bin/sh. /lava-3377270/e=
nvironment
    2023-02-26T23:28:30.040005  =

    2023-02-26T23:28:30.040236  / # <3>[   19.141207] mmc0: error -84 whils=
t initialising SD card
    2023-02-26T23:28:30.141616  . /lava-3377270/environment/lava-3377270/bi=
n/lava-test-runner /lava-3377270/1
    2023-02-26T23:28:30.142233  =

    2023-02-26T23:28:30.153385  / # /lava-3377270/bin/lava-test-runner /lav=
a-3377270/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe532a8c53e2fee8c863c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe532a8c53e2fee8c8645
        new failure (last pass: v6.2-6789-g74c3b2e0a611)

    2023-02-26T23:02:58.888426  / # #
    2023-02-26T23:02:58.990142  export SHELL=3D/bin/sh
    2023-02-26T23:02:58.990569  #
    2023-02-26T23:02:59.091951  / # export SHELL=3D/bin/sh. /lava-3377101/e=
nvironment
    2023-02-26T23:02:59.092435  =

    2023-02-26T23:02:59.193944  / # . /lava-3377101/environment/lava-337710=
1/bin/lava-test-runner /lava-3377101/1
    2023-02-26T23:02:59.194626  =

    2023-02-26T23:02:59.199864  / # /lava-3377101/bin/lava-test-runner /lav=
a-3377101/1
    2023-02-26T23:02:59.278811  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-26T23:02:59.279368  + cd /lava-3377101/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6982b4f2cd3578c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s8=
05x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s8=
05x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe6982b4f2cd3578c8638
        new failure (last pass: v6.2-rc8-211-g05def2d212c6)

    2023-02-26T23:08:49.962448  / # #
    2023-02-26T23:08:50.064113  export SHELL=3D/bin/sh
    2023-02-26T23:08:50.064485  #
    2023-02-26T23:08:50.165825  / # export SHELL=3D/bin/sh. /lava-3377127/e=
nvironment
    2023-02-26T23:08:50.166285  =

    2023-02-26T23:08:50.267644  / # . /lava-3377127/environment/lava-337712=
7/bin/lava-test-runner /lava-3377127/1
    2023-02-26T23:08:50.268344  =

    2023-02-26T23:08:50.273652  / # /lava-3377127/bin/lava-test-runner /lav=
a-3377127/1
    2023-02-26T23:08:50.355550  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-26T23:08:50.356031  + cd /lava-3377127/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbeb398bb2ea57a28c863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbeb398bb2ea57a28c8646
        failing since 2 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-02-26T23:28:42.604015  / # #
    2023-02-26T23:28:42.706112  export SHELL=3D/bin/sh
    2023-02-26T23:28:42.706613  #
    2023-02-26T23:28:42.808109  / # export SHELL=3D/bin/sh. /lava-3377273/e=
nvironment
    2023-02-26T23:28:42.808647  =

    2023-02-26T23:28:42.910208  / # . /lava-3377273/environment/lava-337727=
3/bin/lava-test-runner /lava-3377273/1
    2023-02-26T23:28:42.911083  =

    2023-02-26T23:28:42.928929  / # /lava-3377273/bin/lava-test-runner /lav=
a-3377273/1
    2023-02-26T23:28:42.994828  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-26T23:28:42.995419  + cd /lava-3377273/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe512e6949129158c863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1=
-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1=
-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe512e6949129158c8646
        new failure (last pass: v6.2-6789-g74c3b2e0a611)

    2023-02-26T23:02:25.308422  / # #
    2023-02-26T23:02:25.409923  export SHELL=3D/bin/sh
    2023-02-26T23:02:25.410289  #
    2023-02-26T23:02:25.511483  / # export SHELL=3D/bin/sh. /lava-3377090/e=
nvironment
    2023-02-26T23:02:25.511877  =

    2023-02-26T23:02:25.512063  / # <3>[  104.697523] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-26T23:02:25.613237  . /lava-3377090/environment/lava-3377090/bi=
n/lava-test-runner /lava-3377090/1
    2023-02-26T23:02:25.613793  =

    2023-02-26T23:02:25.627071  / # /lava-3377090/bin/lava-test-runner /lav=
a-3377090/1
    2023-02-26T23:02:25.684979  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe679eacabe56cf8c8635

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-se=
i610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-se=
i610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe679eacabe56cf8c863e
        new failure (last pass: v6.2-rc8-211-g05def2d212c6)

    2023-02-26T23:08:18.395847  / # #
    2023-02-26T23:08:18.498027  export SHELL=3D/bin/sh
    2023-02-26T23:08:18.498423  #
    2023-02-26T23:08:18.599772  / # export SHELL=3D/bin/sh. /lava-3377133/e=
nvironment
    2023-02-26T23:08:18.600189  =

    2023-02-26T23:08:18.600435  / # <3>[   18.161530] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-26T23:08:18.701614  . /lava-3377133/environment/lava-3377133/bi=
n/lava-test-runner /lava-3377133/1
    2023-02-26T23:08:18.702122  =

    2023-02-26T23:08:18.713600  / # /lava-3377133/bin/lava-test-runner /lav=
a-3377133/1
    2023-02-26T23:08:18.772595  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/63fbe809b8e502213d8c8654

  Results:     165 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/63f=
be809b8e502213d8c86a7
        failing since 4 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-3304-g34939120e353)

    2023-02-26T23:14:51.592905  /lava-9343506/1/../bin/lava-test-case

    2023-02-26T23:14:51.602901  <8>[   24.292371] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/63fbe809b8e502213d8c86f9
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-02-26T23:14:48.731097  /lava-9343506/1/../bin/lava-test-case

    2023-02-26T23:14:48.741502  <8>[   21.431136] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/63fbe809b8e502213d8c86fa
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-02-26T23:14:46.688230    reserved1:    0x0

    2023-02-26T23:14:46.688320    nv:           0

    2023-02-26T23:14:46.691361    extensive:    0

    2023-02-26T23:14:46.691451    flushed:      0

    2023-02-26T23:14:46.694518    cHandles:     0x0

    2023-02-26T23:14:46.694607    rHandle:      0

    2023-02-26T23:14:46.697741    V:            0

    2023-02-26T23:14:46.697830    Res:          0x0

    2023-02-26T23:14:46.701424  TPM2_CC_PolicyPCR:

    2023-02-26T23:14:46.704433    value: 0x200017F
 =

    ... (81 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/63fbe7a75eb92951648c86c5

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/63fbe7a75eb92951648c877b
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-02-26T23:13:07.558710  /lava-9343510/1/../bin/lava-test-case

    2023-02-26T23:13:07.565777  <8>[   22.684887] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/63fbe7a75eb92951648c877c
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-02-26T23:13:06.539685  /lava-9343510/1/../bin/lava-test-case

    2023-02-26T23:13:06.546488  <8>[   21.665987] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/63fbe7a75eb92951648c877d
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-02-26T23:13:04.509655    V:            0

    2023-02-26T23:13:04.509736    Res:          0x0

    2023-02-26T23:13:04.512783  TPM2_CC_TestParms:

    2023-02-26T23:13:04.512869    value: 0x18A

    2023-02-26T23:13:04.516062    commandIndex: 0x18a

    2023-02-26T23:13:04.519437    reserved1:    0x0

    2023-02-26T23:13:04.519516    nv:           0

    2023-02-26T23:13:04.523000    extensive:    0

    2023-02-26T23:13:04.523089    flushed:      0

    2023-02-26T23:13:04.526224    cHandles:     0x0
 =

    ... (51 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe9344cf379a85b8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe9344cf379a85b8c8=
632
        failing since 137 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbea94ebf23ca1f78c8678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbea94ebf23ca1f78c8=
679
        failing since 137 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbebfd037bb422498c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbebfd037bb422498c8=
64b
        failing since 137 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbea6d54b4b6b98e8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbea6d54b4b6b98e8c8=
630
        failing since 137 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbebd56f66f761498c8681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbebd56f66f761498c8=
682
        failing since 137 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbea968ea2221f708c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbea968ea2221f708c8=
631
        failing since 137 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbec8980102b6ce08c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbec8980102b6ce08c8=
63c
        failing since 137 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbea95ebf23ca1f78c867d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbea95ebf23ca1f78c8=
67e
        failing since 137 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbec1125367a88228c865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbec1125367a88228c8=
65d
        failing since 137 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbea6c12ee65caf68c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i=
386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i=
386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbea6c12ee65caf68c8=
654
        failing since 7 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe698c7672346aa8c8664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe698c7672346aa8c8=
665
        failing since 9 days (last pass: v6.2-rc7-233-gd885c5e298888, first=
 fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbeb5d8bb2ea57a28c866b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i3=
86-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i3=
86-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbeb5d8bb2ea57a28c8=
66c
        failing since 7 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe553e042f52a078c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe553e042f52a078c8=
633
        failing since 9 days (last pass: v6.2-rc7-233-gd885c5e298888, first=
 fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbea3ab371ada9c68c867f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_=
i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_=
i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbea3ab371ada9c68c8=
680
        failing since 7 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe5076756ce6dd28c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe5076756ce6dd28c8=
642
        failing since 12 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe5e30a22fe820a8c8737

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe5e30a22fe820a8c8=
738
        failing since 9 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6d32aa283f9fb8c86c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe6d32aa283f9fb8c8=
6c8
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6e859f7d929f58c86bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe6e859f7d929f58c8=
6be
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe7d826b9df561a8c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe7d826b9df561a8c8=
646
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe93106152f468e8c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe93106152f468e8c8=
64d
        failing since 7 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbeb985f32b1d5a08c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbeb985f32b1d5a08c8=
650
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe51cb44c808f798c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe51cb44c808f798c8=
635
        failing since 12 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6e859f7d929f58c86c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe6e859f7d929f58c8=
6c1
        failing since 9 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe83cbd8f8a7ab18c87a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe83cbd8f8a7ab18c8=
7a8
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe88eda5106dadb8c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe88eda5106dadb8c8=
633
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe9a6d378388a988c8708

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe9a6d378388a988c8=
709
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbeaa98ea2221f708c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbeaa98ea2221f708c8=
636
        failing since 7 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbed15b1059167b78c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbed15b1059167b78c8=
631
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe4dae1f940ec1f8c866d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe4dae1f940ec1f8c8=
66e
        failing since 12 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe5c61bf9d78a8d8c86b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe5c61bf9d78a8d8c8=
6b2
        failing since 9 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6cb2aa283f9fb8c867a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe6cb2aa283f9fb8c8=
67b
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe90e9ff33da33e8c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe90e9ff33da33e8c8=
636
        failing since 7 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe5086756ce6dd28c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe5086756ce6dd28c8=
654
        failing since 12 days (last pass: v6.2-rc6-289-g1b7183933813, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe5e40a22fe820a8c873d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe5e40a22fe820a8c8=
73e
        failing since 7 days (last pass: v6.2-rc7-233-gd885c5e298888, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6d579cf93c8708c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe6d579cf93c8708c8=
631
        failing since 7 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6e759f7d929f58c86ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe6e759f7d929f58c8=
6bb
        failing since 7 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe7d733c96e9bfc8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe7d733c96e9bfc8c8=
632
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe92f06152f468e8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe92f06152f468e8c8=
63f
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbeb99874179ce868c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbeb99874179ce868c8=
636
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe51dd974595d918c8685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe51dd974595d918c8=
686
        failing since 12 days (last pass: v6.2-rc6-289-g1b7183933813, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6ea59f7d929f58c86ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe6ea59f7d929f58c8=
6cf
        failing since 7 days (last pass: v6.2-rc7-233-gd885c5e298888, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe83e33784791cf8c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe83e33784791cf8c8=
643
        failing since 7 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe88dda5106dadb8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe88dda5106dadb8c8=
630
        failing since 7 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe9a5e3acb09d338c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe9a5e3acb09d338c8=
658
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbea9454b4b6b98e8c869b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbea9454b4b6b98e8c8=
69c
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbed3d9d83de25398c8682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbed3d9d83de25398c8=
683
        failing since 12 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe4fd274788fcee8c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe4fd274788fcee8c8=
646
        failing since 12 days (last pass: v6.2-rc6-289-g1b7183933813, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe5c71bf9d78a8d8c86b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe5c71bf9d78a8d8c8=
6b5
        failing since 7 days (last pass: v6.2-rc7-233-gd885c5e298888, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6b62cb41634b68c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x8=
6_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x8=
6_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe6b62cb41634b68c8=
641
        failing since 7 days (last pass: v6.2-rc7-318-g73d40d27ae59c, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6ca2aa283f9fb8c8677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe6ca2aa283f9fb8c8=
678
        failing since 7 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first =
fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe42c0d23f0dafa8c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d=
-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d=
-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe42c0d23f0dafa8c8=
651
        failing since 5 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-1218-g2d4a54ee969d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe7652a6b9a02c08c865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe7652a6b9a02c08c8=
65b
        failing since 73 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe6630f99b1e1308c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe6630f99b1e1308c8=
640
        failing since 73 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe77beeae4557528c8649

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63fbe77beeae4557528c864e
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-02-26T23:12:45.592478  / # =


    2023-02-26T23:12:45.598659  =


    2023-02-26T23:12:45.700305  / # #

    2023-02-26T23:12:45.700563  <6>[   16.188331] Bluetooth: hci0: QCA Prod=
uct ID   :0x0000000a

    2023-02-26T23:12:45.700637  <6>[   16.194170] Bluetooth: hci0: QCA SOC =
Version  :0x40010320

    2023-02-26T23:12:45.700702  <6>[   16.200000] Bluetooth: hci0: QCA ROM =
Version  :0x00000302

    2023-02-26T23:12:45.700763  <6>[   16.205814] Bluetooth: hci0: QCA Patc=
h Version:0x00000de9

    2023-02-26T23:12:45.700822  <6>[   16.225710] Bluetooth: hci0: QCA cont=
roller version 0x03200302

    2023-02-26T23:12:45.700881  <6>[   16.232038] Bluetooth: hci0: QCA Down=
loading qca/crbtfw32.tlv

    2023-02-26T23:12:45.700938  <6>[   16.234317] usb 2-1.3: new SuperSpeed=
 USB device number 3 using xhci-hcd
 =

    ... (61 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63fbe729ace0d2d1958c8666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-12625-=
g13efc3a9f23b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63fbe729ace0d2d1958c8=
667
        failing since 73 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
