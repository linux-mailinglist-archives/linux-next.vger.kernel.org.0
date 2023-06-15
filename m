Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8F0731469
	for <lists+linux-next@lfdr.de>; Thu, 15 Jun 2023 11:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237827AbjFOJtD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Jun 2023 05:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245285AbjFOJtA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Jun 2023 05:49:00 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4715F1FC3
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2023 02:48:54 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-666748c1edfso1022741b3a.2
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2023 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1686822533; x=1689414533;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eUtvNIZv/6K0io6qh+MS6qp9VQi0D9ApbT5SftUloOo=;
        b=aJA87JptvwltxwZhV8YJlroMsQLDYvzRYQCrYbZ0t0tPgvL2jyjUxcg15W61lizT+u
         yyzZWnIKqHRiFM8VQ30brxt9sDl+d3o4Wu5YSLhpV24Iuuo9TC+yeTeQcBvPexGCqCWo
         Hj++RzkkQaHGW3LsB1UDXImPNRUJq00hmesA/oU8piTsq8KT4dkD2JA8LH/cgJwpn3jW
         7jOPcDYQxUJTUKRD9RwApjgxEzDBN+3my3AFGdV0hjbOnhg7UN4pMe+MqPRtPn4xlCOd
         1cBl0ipyKIFXNX/ArVmJna3O0r+ko0svaD17bMiNv1xwYty0IZHAo7JC6dDVTzcgYAUW
         C7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686822533; x=1689414533;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUtvNIZv/6K0io6qh+MS6qp9VQi0D9ApbT5SftUloOo=;
        b=Xms53lBXjXgm1d8mgQvUyiVc5FaD7Qxz1N8kcJTzQx2VNj+RlI94zAetpVzV0lK7M2
         5ojKEveELMXtX+lpXn0PqaudGevq3epriOzSEzoyx10LvuOBtCkJ90pqtq2Pqqnv6t0n
         0sNz8COudy/xDEph5Gxe8Hh7eQ2RLIP9bmOEU3JpxFJHKVEC5DrYAXvEsfHjkH8xTsLf
         Nx/TPj80oMnAxQZkCmtEnreFzqloYQEoiH1NqXqZnUoQ9V7qypKiEVaASouXdNTYF7pZ
         +wYHwReQAZ4w+tIDjeLWPl9tRFjoBPFqfzWfQzeSyq8SkIilKKkANRZ2T0FFE7/JckAJ
         7yKg==
X-Gm-Message-State: AC+VfDwtI5N0uaw0EV3js7tLtu9u8yKVb7HQQQzk81huB5TfE8pe7sgY
        389qkaouD2Qz04Y7pe/XKrAThlewUNxLRjI7ctpoKg==
X-Google-Smtp-Source: ACHHUZ597LghDKOfm9K9X76XX/CptYbdH56qbXxk8C4OwNQMlaqw9hM+MGMAvhS8PaEJychID8jN0g==
X-Received: by 2002:a05:6a20:8e1f:b0:10e:43e:e223 with SMTP id y31-20020a056a208e1f00b0010e043ee223mr4539423pzj.1.1686822531061;
        Thu, 15 Jun 2023 02:48:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g22-20020a1709029f9600b001b3bda30a49sm8485888plq.279.2023.06.15.02.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 02:48:50 -0700 (PDT)
Message-ID: <648ade82.170a0220.75867.13c4@mx.google.com>
Date:   Thu, 15 Jun 2023 02:48:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230615
Subject: next/master baseline: 735 runs, 129 regressions (next-20230615)
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

next/master baseline: 735 runs, 129 regressions (next-20230615)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | multi_=
v5_defconfig           | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

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

qemu_mips-malta              | mips   | lab-baylibre    | gcc-10   | malta_=
defconfig              | 1          =

qemu_mips-malta              | mips   | lab-broonie     | gcc-10   | malta_=
defconfig              | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | clang-17 | defcon=
fig                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+ima                | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 3          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230615/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230615
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      925294c9aa184801cc0a451b69a18dd0fe7d847d =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabd8e7529018de306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aabd8e7529018de306=
134
        failing since 29 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aacb71837695a8b306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aacb71837695a8b306=
132
        failing since 29 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648ac6efa271ca9fcb30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ac6efa271ca9fcb306=
12f
        failing since 274 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabf0f2343f7c50306145

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C433TA-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C433TA-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aabf0f2343f7c50306=
146
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648aa97b8441e6a967306146

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aa97b8441e6a96730614b
        failing since 78 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-06-15T06:02:20.517431  + set +x

    2023-06-15T06:02:20.524134  <8>[   15.312804] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10738568_1.4.2.3.1>

    2023-06-15T06:02:20.629440  / # #

    2023-06-15T06:02:20.730112  export SHELL=3D/bin/sh

    2023-06-15T06:02:20.730329  #

    2023-06-15T06:02:20.830798  / # export SHELL=3D/bin/sh. /lava-10738568/=
environment

    2023-06-15T06:02:20.830998  =


    2023-06-15T06:02:20.931518  / # . /lava-10738568/environment/lava-10738=
568/bin/lava-test-runner /lava-10738568/1

    2023-06-15T06:02:20.931815  =


    2023-06-15T06:02:20.937546  / # /lava-10738568/bin/lava-test-runner /la=
va-10738568/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabae149bd9e94030616f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aabae149bd9e940306174
        failing since 78 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-15T06:11:32.764294  <8>[   10.994307] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10738892_1.4.2.3.1>

    2023-06-15T06:11:32.767773  + set +x

    2023-06-15T06:11:32.872210  / # #

    2023-06-15T06:11:32.972923  export SHELL=3D/bin/sh

    2023-06-15T06:11:32.973151  #

    2023-06-15T06:11:33.073686  / # export SHELL=3D/bin/sh. /lava-10738892/=
environment

    2023-06-15T06:11:33.073904  =


    2023-06-15T06:11:33.174438  / # . /lava-10738892/environment/lava-10738=
892/bin/lava-test-runner /lava-10738892/1

    2023-06-15T06:11:33.174790  =


    2023-06-15T06:11:33.181153  / # /lava-10738892/bin/lava-test-runner /la=
va-10738892/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aacb2d9d576ed2a30615d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aacb2d9d576ed2a306=
15e
        failing since 29 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabcab9e08da1ce30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aabcab9e08da1ce306=
12f
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabd594accae924306197

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aabd594accae924306=
198
        failing since 29 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648aa9821b0ae63b553061da

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aa9821b0ae63b553061df
        failing since 78 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-06-15T06:02:23.762913  <8>[   11.182996] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10738540_1.4.2.3.1>

    2023-06-15T06:02:23.763037  + set +x

    2023-06-15T06:02:23.867385  / # #

    2023-06-15T06:02:23.967931  export SHELL=3D/bin/sh

    2023-06-15T06:02:23.968117  #

    2023-06-15T06:02:24.068569  / # export SHELL=3D/bin/sh. /lava-10738540/=
environment

    2023-06-15T06:02:24.068733  =


    2023-06-15T06:02:24.169207  / # . /lava-10738540/environment/lava-10738=
540/bin/lava-test-runner /lava-10738540/1

    2023-06-15T06:02:24.169453  =


    2023-06-15T06:02:24.174518  / # /lava-10738540/bin/lava-test-runner /la=
va-10738540/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648aab5cde315fe932306167

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aab5cde315fe93230616c
        failing since 78 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-15T06:10:20.847583  <8>[   10.694032] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10738856_1.4.2.3.1>

    2023-06-15T06:10:20.852454  + set +x

    2023-06-15T06:10:20.958653  =


    2023-06-15T06:10:21.060678  / # #export SHELL=3D/bin/sh

    2023-06-15T06:10:21.061122  =


    2023-06-15T06:10:21.161879  / # export SHELL=3D/bin/sh. /lava-10738856/=
environment

    2023-06-15T06:10:21.162077  =


    2023-06-15T06:10:21.262657  / # . /lava-10738856/environment/lava-10738=
856/bin/lava-test-runner /lava-10738856/1

    2023-06-15T06:10:21.263021  =


    2023-06-15T06:10:21.268137  / # /lava-10738856/bin/lava-test-runner /la=
va-10738856/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabd2b9e08da1ce306151

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aabd2b9e08da1ce306=
152
        failing since 29 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/648aab603bf8d5deb030614a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aab603bf8d5deb0306=
14b
        failing since 134 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/648aa82f524cd093df306168

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/648aa82f524cd093df306184
        failing since 10 days (last pass: next-20230601, first fail: next-2=
0230605)

    2023-06-15T05:56:54.496305  /lava-614453/1/../bin/lava-test-case
    2023-06-15T05:56:54.550918  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | multi_=
v5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648aab3b8e6cdbdc49306134

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/648aab3b8e6cdbdc4930614f
        failing since 10 days (last pass: next-20230601, first fail: next-2=
0230605)

    2023-06-15T06:09:34.914723  /lava-614543/1/../bin/lava-test-case
    2023-06-15T06:09:34.956337  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/648aa8ba0e51349914306166

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aa8ba0e51349914306=
167
        failing since 10 days (last pass: next-20230601, first fail: next-2=
0230605) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaec0bdb657cf45306153

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaec0bdb657cf45306=
154
        failing since 78 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaf061cd4bd116e306155

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaf061cd4bd116e306=
156
        failing since 76 days (last pass: next-20230330, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaafbf66e358cc730612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaafbf66e358cc7306=
12f
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/648aa7c43762788623306155

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/648aa7c43762788=
62330615c
        failing since 121 days (last pass: next-20230208, first fail: next-=
20230213)
        30 lines

    2023-06-15T05:54:34.949420  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4f5c600 pointer offset 4 size 512
    2023-06-15T05:54:34.982306  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-15T05:54:34.982881  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-15T05:54:34.983264  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2d3000 allocated at load_module+0x6b0/0=
x1954
    2023-06-15T05:54:34.985474  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-15T05:54:35.089465  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-15T05:54:35.090263  kern  :emerg : Process udevd (pid: 65, stac=
k limit =3D 0xcaf4d564)
    2023-06-15T05:54:35.090659  kern  :emerg : Stack: (0xc8901cf8 to 0xc890=
2000)
    2023-06-15T05:54:35.091005  kern  :emerg : 1ce0:                       =
                                c4f5c600 c0773820
    2023-06-15T05:54:35.091335  kern  :emerg : 1d00: 00000000 c03b2c6c 0000=
0000 631a64cf 0000005d 631a64cf c0773820 bf2d3220 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad001ed1818dc030616a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad001ed1818dc0306=
16b
        failing since 29 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aacc11837695a8b3061a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aacc11837695a8b306=
1a9
        failing since 29 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaba2f42da485b2306256

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaba2f42da485b2306=
257
        failing since 29 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabc1ae190501d930614f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aabc1ae190501d9306=
150
        failing since 29 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/648aa9e0b1e163f3e2306161

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aa9e0b1e163f3e2306166
        failing since 78 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-06-15T06:04:16.921264  + set +x

    2023-06-15T06:04:16.927583  <8>[   10.731195] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10738599_1.4.2.3.1>

    2023-06-15T06:04:17.032026  / # #

    2023-06-15T06:04:17.132833  export SHELL=3D/bin/sh

    2023-06-15T06:04:17.133042  #

    2023-06-15T06:04:17.233542  / # export SHELL=3D/bin/sh. /lava-10738599/=
environment

    2023-06-15T06:04:17.233772  =


    2023-06-15T06:04:17.334394  / # . /lava-10738599/environment/lava-10738=
599/bin/lava-test-runner /lava-10738599/1

    2023-06-15T06:04:17.334709  =


    2023-06-15T06:04:17.338947  / # /lava-10738599/bin/lava-test-runner /la=
va-10738599/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabc8ae190501d930620d

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aabc8ae190501d9306212
        failing since 78 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-15T06:12:11.342290  + set +x

    2023-06-15T06:12:11.349226  <8>[   11.730676] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10738871_1.4.2.3.1>

    2023-06-15T06:12:11.453463  / # #

    2023-06-15T06:12:11.554170  export SHELL=3D/bin/sh

    2023-06-15T06:12:11.554364  #

    2023-06-15T06:12:11.654852  / # export SHELL=3D/bin/sh. /lava-10738871/=
environment

    2023-06-15T06:12:11.655071  =


    2023-06-15T06:12:11.755554  / # . /lava-10738871/environment/lava-10738=
871/bin/lava-test-runner /lava-10738871/1

    2023-06-15T06:12:11.755864  =


    2023-06-15T06:12:11.760525  / # /lava-10738871/bin/lava-test-runner /la=
va-10738871/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabcbb9e08da1ce306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aabcbb9e08da1ce306=
132
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648aab53de315fe932306141

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aab53de315fe932306146
        failing since 78 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-15T06:10:16.442304  + set<8>[   10.890321] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10738857_1.4.2.3.1>

    2023-06-15T06:10:16.442399   +x

    2023-06-15T06:10:16.544022  #

    2023-06-15T06:10:16.644805  / # #export SHELL=3D/bin/sh

    2023-06-15T06:10:16.645006  =


    2023-06-15T06:10:16.745542  / # export SHELL=3D/bin/sh. /lava-10738857/=
environment

    2023-06-15T06:10:16.745718  =


    2023-06-15T06:10:16.846248  / # . /lava-10738857/environment/lava-10738=
857/bin/lava-test-runner /lava-10738857/1

    2023-06-15T06:10:16.846600  =


    2023-06-15T06:10:16.852120  / # /lava-10738857/bin/lava-test-runner /la=
va-10738857/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aacba1837695a8b30619a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aacba1837695a8b306=
19b
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabb8ae190501d930613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aabb8ae190501d9306=
13e
        failing since 29 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad8283a068761d306162

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad8283a068761d306=
163
        failing since 309 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad8083a068761d30615e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad8083a068761d306=
15f
        failing since 296 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaf4d2d88ea911d3061d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaf4d2d88ea911d306=
1d1
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648aafd9482a8cdc07306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aafd9482a8cdc07306=
145
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648aafc78a4e2e4afc306177

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aafc78a4e2e4afc306=
178
        failing since 429 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/648aafb1d0a717ce4f306190

  Results:     92 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
48aafb1d0a717ce4f3061c6
        failing since 1 day (last pass: next-20230607, first fail: next-202=
30613)

    2023-06-15T06:28:44.896049  /lava-357787/1/../bin/lava-test-case
    2023-06-15T06:28:44.899340  <8>[   44.794751] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
48aafb1d0a717ce4f3061c7
        failing since 1 day (last pass: next-20230607, first fail: next-202=
30613)

    2023-06-15T06:28:45.917433  /lava-357787/1/../bin/lava-test-case
    2023-06-15T06:28:45.920661  <8>[   45.816550] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
48aafb1d0a717ce4f3061c8
        failing since 1 day (last pass: next-20230607, first fail: next-202=
30613)

    2023-06-15T06:28:46.957136  /lava-357787/1/../bin/lava-test-case
    2023-06-15T06:28:46.957684  <8>[   46.838233] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2023-06-15T06:28:46.958177  /lava-357787/1/../bin/lava-test-case
    2023-06-15T06:28:46.958587  <8>[   46.855800] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsp805-wdt-driver-present RESULT=3Dpass>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/648aafb37c33437b17306163

  Results:     100 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
48aafb37c33437b173061a0
        failing since 1 day (last pass: next-20230607, first fail: next-202=
30613)

    2023-06-15T06:28:43.051803  /lava-357788/1/../bin/lava-test-case
    2023-06-15T06:28:43.054989  <8>[   41.316498] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
48aafb37c33437b173061a1
        failing since 1 day (last pass: next-20230607, first fail: next-202=
30613)

    2023-06-15T06:28:44.073584  /lava-357788/1/../bin/lava-test-case
    2023-06-15T06:28:44.076759  <8>[   42.338199] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
48aafb37c33437b173061a2
        failing since 1 day (last pass: next-20230607, first fail: next-202=
30613)

    2023-06-15T06:28:45.136790  /lava-357788/1/../bin/lava-test-case
    2023-06-15T06:28:45.137352  <8>[   43.359801] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2023-06-15T06:28:45.137675  /lava-357788/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabb321ba2db1dc306137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aabb321ba2db1dc306=
138
        failing since 29 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad3211c7894fed30613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad3211c7894fed306=
13e
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648aafdadf94ec39f3306145

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aafdadf94ec39f3306=
146
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab084809a68376c306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab084809a68376c306=
13a
        failing since 1 day (last pass: next-20230613, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab10db7f647069a306147

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab10db7f647069a306=
148
        failing since 141 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab0ae9ec758e1d730614a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab0ae9ec758e1d7306=
14b
        failing since 141 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab0ab9ec758e1d7306147

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab0ab9ec758e1d7306=
148
        failing since 141 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab03fd8bdddce3e30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab03fd8bdddce3e306=
12f
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab0c1312be1697830613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab0c1312be16978306=
13d
        failing since 127 days (last pass: next-20230203, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab336413225c3e930613b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab336413225c3e9306=
13c
        new failure (last pass: next-20230613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab744b383c2347330612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab744b383c23473306=
130
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab0b7ee50904a23306191

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab0b7ee50904a23306=
192
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648abd060647b9e42830612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648abd060647b9e428306=
130
        new failure (last pass: next-20230613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad7a4dcfda38733061bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad7a4dcfda3873306=
1bd
        failing since 141 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad66ed5bb871423061ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad66ed5bb87142306=
1af
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/648aa96a8441e6a96730612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aa96a8441e6a967306=
130
        new failure (last pass: next-20230613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648aabb8dcadf9339f30614a

  Results:     182 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-simple-dp-aux-probed: https://kernelci.org/test/c=
ase/id/648aabb8dcadf9339f306191
        failing since 0 day (last pass: next-20230613, first fail: next-202=
30614)

    2023-06-15T06:12:02.645816  <8>[   23.148179] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-simple-dp-aux-driver-present RESULT=3Dpass>

    2023-06-15T06:12:03.658260  /lava-10738943/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648aac5a60e747bc06306270

  Results:     182 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-simple-dp-aux-probed: https://kernelci.org/test/c=
ase/id/648aac5a60e747bc063062b7
        new failure (last pass: next-20230614)

    2023-06-15T06:14:42.725645  <8>[   23.066783] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-simple-dp-aux-driver-present RESULT=3Dpass>

    2023-06-15T06:14:43.739398  /lava-10739150/1/../bin/lava-test-case

    2023-06-15T06:14:43.749189  <8>[   24.092239] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-simple-dp-aux-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad2d9a48eb7bec30616f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad2d9a48eb7bec306=
170
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648ac807b4ee1a2a1f306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ac807b4ee1a2a1f306=
132
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648acee70b2d49f36530612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648acee70b2d49f365306=
12f
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad8c19c6300e96306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad8c19c6300e96306=
135
        failing since 274 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaec6bdb657cf45306283

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaec6bdb657cf45306=
284
        failing since 274 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aada8deca49610630612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aada8deca496106306=
130
        failing since 274 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aadb4c1258dcae9306164

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aadb4c1258dcae9306=
165
        failing since 272 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaeee8ce6b1f88a306135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaeee8ce6b1f88a306=
136
        failing since 272 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aadbdba61d99c6930614b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aadbdba61d99c69306=
14c
        failing since 272 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aadb5deca49610630613b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aadb5deca496106306=
13c
        failing since 272 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaeef84eff5d5d9306175

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaeef84eff5d5d9306=
176
        failing since 272 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aadd0b380528b103061c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aadd0b380528b10306=
1ca
        failing since 272 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad8d4dcfda38733061c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad8d4dcfda3873306=
1ca
        failing since 274 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaec7bdb657cf45306286

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaec7bdb657cf45306=
287
        failing since 274 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/648aadbcba61d99c69306148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aadbcba61d99c69306=
149
        failing since 274 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-baylibre    | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/648aab220e15dc532c30617c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/mips=
/malta_defconfig/gcc-10/lab-baylibre/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/mips=
/malta_defconfig/gcc-10/lab-baylibre/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aab220e15dc532c306=
17d
        failing since 6 days (last pass: next-20230608, first fail: next-20=
230609) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-broonie     | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/648aac0ad57b80129b306162

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/mips=
/malta_defconfig/gcc-10/lab-broonie/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/mips=
/malta_defconfig/gcc-10/lab-broonie/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aac0ad57b80129b306=
163
        failing since 6 days (last pass: next-20230608, first fail: next-20=
230609) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaaeb7b624c75ab306135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaaeb7b624c75ab306=
136
        failing since 6 days (last pass: next-20230608, first fail: next-20=
230609) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648aab154a54a7595830613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aab154a54a75958306=
13e
        failing since 1 day (last pass: next-20230609, first fail: next-202=
30613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab0ebaca92fe75230612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774a1-hihope-rzg2=
m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774a1-hihope-rzg2=
m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab0ebaca92fe752306=
130
        failing since 0 day (last pass: next-20230613, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648ac7bb896a65d15530612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230611112039+2802=
739dfd84-1~exp1~20230611112149.703))
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ac7bb896a65d155306=
130
        new failure (last pass: next-20230607) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab77b81d0b6bb93306130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-=
ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-=
ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab77b81d0b6bb93306=
131
        failing since 0 day (last pass: next-20230607, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648ac17b2a4569043830612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ac17b2a45690438306=
12f
        new failure (last pass: next-20230601) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad0a43ef903785306159

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad0a43ef903785306=
15a
        failing since 0 day (last pass: next-20230613, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab71eaa313735e930613a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230611112039+2802=
739dfd84-1~exp1~20230611112149.703))
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab71eaa313735e9306=
13b
        failing since 1 day (last pass: next-20230608, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaead357f0ec320306189

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaead357f0ec320306=
18a
        failing since 1 day (last pass: next-20230613, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab051895c7994c6306138

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab051895c7994c6306=
139
        failing since 1 day (last pass: next-20230609, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab1f524c130c041306196

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab1f524c130c041306=
197
        failing since 0 day (last pass: next-20230613, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab425d765d2572a306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab425d765d2572a306=
13a
        failing since 0 day (last pass: next-20230613, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab592c252d70fee306154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab592c252d70fee306=
155
        failing since 1 day (last pass: next-20230613, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab09f9ec758e1d730612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab09f9ec758e1d7306=
130
        failing since 204 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 3          =


  Details:     https://kernelci.org/test/plan/id/648aa96e1b0ae63b5530614f

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/648aa96e1b0ae63b55306165
        failing since 29 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-15T06:03:13.188026  =


    2023-06-15T06:03:14.201507  /lava-10738567/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/648aa96e1b0ae63b5530617b
        failing since 29 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-15T06:03:12.740985  /lava-10738567/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/648aa96e1b0ae63b5530617c
        failing since 29 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-15T06:03:10.704417  /lava-1<8>[   20.905263] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-06-15T06:03:10.707240  0738567/1/../bin/lava-test-case

    2023-06-15T06:03:10.713323  BusyBox v1.31.1 (2023-06-09 10:32:04 UTC) m=
ulti-call binary.

    2023-06-15T06:03:10.713688  =


    2023-06-15T06:03:10.718135  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-06-15T06:03:10.718356  =


    2023-06-15T06:03:10.723341  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-06-15T06:03:10.725946  FIRST, INC default to 1.

    2023-06-15T06:03:10.726002  =


    2023-06-15T06:03:10.729220  	-w	Pad to last with leading zeros
 =

    ... (5 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 3          =


  Details:     https://kernelci.org/test/plan/id/648aac67b8485a8749306134

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/648aac67b8485a874930614a
        failing since 29 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-15T06:15:47.747469  <8>[   21.858876] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-driver-present RESULT=3Dpass>

    2023-06-15T06:15:48.761705  /lava-10738710/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/648aac67b8485a8749306160
        failing since 29 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-15T06:15:46.284055  <8>[   20.395860] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwmmc_rockchip-sdmmc-probed RESULT=3Dfail>

    2023-06-15T06:15:47.297213  /lava-10738710/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/648aac67b8485a8749306161
        failing since 29 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-15T06:15:45.260578  	-w	P<8>[   19.371041] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-06-15T06:15:45.263493  ad to last with leading zeros

    2023-06-15T06:15:45.265976  	-s SEP	String separator

    2023-06-15T06:15:45.269752  /lava-10738710/1/../bin/lava-test-case

    2023-06-15T06:15:45.275905  BusyBox v1.31.1 (2023-06-09 10:32:04 UTC) m=
ulti-call binary.

    2023-06-15T06:15:45.276122  =


    2023-06-15T06:15:45.280311  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-06-15T06:15:45.280761  =


    2023-06-15T06:15:45.285730  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-06-15T06:15:45.288349  FIRST, INC default to 1.
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/648aad57ed5bb87142306141

  Results:     63 PASS, 7 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-iodomain-grf-probed: https://kernelci.org/test=
/case/id/648aad57ed5bb87142306157
        failing since 29 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-15T06:19:52.657173  <8>[   21.512018] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-iodomain-driver-present RESULT=3Dpass>

    2023-06-15T06:19:53.670553  /lava-10739345/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdio0-probed: https://kernelci.org/test/=
case/id/648aad57ed5bb8714230616d
        failing since 29 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-15T06:19:51.202842  <8>[   20.058020] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwmmc_rockchip-sdmmc-probed RESULT=3Dfail>

    2023-06-15T06:19:52.216813  /lava-10739345/1/../bin/lava-test-case
   =


  * baseline.bootrr.dwmmc_rockchip-sdmmc-probed: https://kernelci.org/test/=
case/id/648aad57ed5bb8714230616e
        failing since 29 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-15T06:19:50.180705  	-w	P<8>[   19.034137] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Ddwmmc_rockchip-driver-present RESULT=3Dpass>

    2023-06-15T06:19:50.183509  ad to last with leading zeros

    2023-06-15T06:19:50.185971  	-s SEP	String separator

    2023-06-15T06:19:50.190148  /lava-10739345/1/../bin/lava-test-case

    2023-06-15T06:19:50.196154  BusyBox v1.31.1 (2023-06-09 10:32:04 UTC) m=
ulti-call binary.

    2023-06-15T06:19:50.196205  =


    2023-06-15T06:19:50.200500  Usage: seq [-w] [-s SEP] [FIRST [INC]] LAST

    2023-06-15T06:19:50.200716  =


    2023-06-15T06:19:50.205770  Print numbers from FIRST to LAST, in steps =
of INC.

    2023-06-15T06:19:50.208348  FIRST, INC default to 1.
 =

    ... (6 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaf3967e029109230612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaf3967e0291092306=
12f
        failing since 204 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/648aa9ae2f19ff01473061ae

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aa9ae2f19ff01473061b3
        failing since 6 days (last pass: next-20221012, first fail: next-20=
230609)

    2023-06-15T06:03:17.846819  [    5.229824] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3664961_1.5.2.4.1>
    2023-06-15T06:03:17.954349  =

    2023-06-15T06:03:18.055873  / # #export SHELL=3D/bin/sh
    2023-06-15T06:03:18.056294  =

    2023-06-15T06:03:18.157863  / # export SHELL=3D/bin/sh. /lava-3664961/e=
nvironment
    2023-06-15T06:03:18.158622  =

    2023-06-15T06:03:18.260635  / # . /lava-3664961/environment/lava-366496=
1/bin/lava-test-runner /lava-3664961/1
    2023-06-15T06:03:18.261303  =

    2023-06-15T06:03:18.264767  / # /lava-3664961/bin/lava-test-runner /lav=
a-3664961/1
    2023-06-15T06:03:18.323360  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648aafc74bf9df2df830618a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aafc74bf9df2df830618f
        failing since 134 days (last pass: next-20221012, first fail: next-=
20230201)

    2023-06-15T06:29:07.689953  [   29.687524] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3665217_1.5.2.4.1>
    2023-06-15T06:29:07.799998  =

    2023-06-15T06:29:07.902384  / # #export SHELL=3D/bin/sh
    2023-06-15T06:29:07.902804  =

    2023-06-15T06:29:08.004289  / # export SHELL=3D/bin/sh. /lava-3665217/e=
nvironment
    2023-06-15T06:29:08.004847  =

    2023-06-15T06:29:08.106544  / # . /lava-3665217/environment/lava-366521=
7/bin/lava-test-runner /lava-3665217/1
    2023-06-15T06:29:08.107461  =

    2023-06-15T06:29:08.110929  / # /lava-3665217/bin/lava-test-runner /lav=
a-3665217/1
    2023-06-15T06:29:08.158705  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaba00f4cfb61c930615d

  Results:     85 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rk808-clkout-driver-present: https://kernelci.org/test/=
case/id/648aaba00f4cfb61c930618b
        failing since 29 days (last pass: next-20230512, first fail: next-2=
0230517)

    2023-06-15T06:11:20.957340  <8>[   31.609468] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drk3x-i2c8-probed RESULT=3Dpass>

    2023-06-15T06:11:21.984559  /lava-10738932/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648aac2cf024d90d1e30617a

  Results:     85 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rk808-clkout-driver-present: https://kernelci.org/test/=
case/id/648aac2cf024d90d1e3061a8
        failing since 29 days (last pass: next-20230515, first fail: next-2=
0230516)

    2023-06-15T06:13:54.654821  /lava-10739130/1/../bin/lava-test-case

    2023-06-15T06:13:54.666861  <8>[   32.450705] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drk808-clkout-driver-present RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad1a43ef90378530616b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad1a43ef903785306=
16c
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab03211d566ae7e306309

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab03211d566ae7e306=
30a
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaca3d9d576ed2a306130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaca3d9d576ed2a306=
131
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aacea3468872acc306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aacea3468872acc306=
13a
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad021ed1818dc0306189

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-k=
ingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-k=
ingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad021ed1818dc0306=
18a
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaca4f4eb160a42306132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaca4f4eb160a42306=
133
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad2e11c7894fed30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aad2e11c7894fed306=
130
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/648aae076acf0e5167306130

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-l=
azor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-l=
azor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aae076acf0e5167306=
131
        new failure (last pass: next-20230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab9952ddf95c2a830612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230611112039+2802=
739dfd84-1~exp1~20230611112149.703))
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab9952ddf95c2a8306=
12f
        failing since 1 day (last pass: next-20230608, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab311d4b1e69382306197

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230611112039+2802=
739dfd84-1~exp1~20230611112149.703))
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab311d4b1e69382306=
198
        failing since 1 day (last pass: next-20230608, first fail: next-202=
30614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab124f6a44a5b7e306149

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab124f6a44a5b7e306=
14a
        failing since 1 day (last pass: next-20230608, first fail: next-202=
30613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab729aa313735e9306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab729aa313735e9306=
141
        failing since 8 days (last pass: next-20230606, first fail: next-20=
230607) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaeec1cd4bd116e30613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aaeec1cd4bd116e306=
13d
        failing since 1 day (last pass: next-20230608, first fail: next-202=
30613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab055d8bdddce3e30613b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab055d8bdddce3e306=
13c
        failing since 127 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab1bb1d7e1a8b68306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab1bb1d7e1a8b68306=
132
        failing since 8 days (last pass: next-20230606, first fail: next-20=
230607) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab4785dc9d120d5306178

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab4785dc9d120d5306=
179
        failing since 1 day (last pass: next-20230609, first fail: next-202=
30613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab107b7f647069a30613b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230611112039+2802=
739dfd84-1~exp1~20230611112149.703))
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab107b7f647069a306=
13c
        failing since 8 days (last pass: next-20230605, first fail: next-20=
230607) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648aa9b5de42c2706130612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aa9b5de42c27061306133
        failing since 8 days (last pass: next-20230525, first fail: next-20=
230607)

    2023-06-15T06:03:13.692458  / # #
    2023-06-15T06:03:13.793909  export SHELL=3D/bin/sh
    2023-06-15T06:03:13.794275  #
    2023-06-15T06:03:13.895556  / # export SHELL=3D/bin/sh. /lava-3664951/e=
nvironment
    2023-06-15T06:03:13.895951  =

    2023-06-15T06:03:13.997095  / # . /lava-3664951/environment/lava-366495=
1/bin/lava-test-runner /lava-3664951/1
    2023-06-15T06:03:13.997754  =

    2023-06-15T06:03:14.013225  / # /lava-3664951/bin/lava-test-runner /lav=
a-3664951/1
    2023-06-15T06:03:14.132768  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-15T06:03:14.133302  + cd /lava-3664951/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648aaa21c074f5079c30615e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aaa21c074f5079c306163
        failing since 8 days (last pass: next-20230525, first fail: next-20=
230607)

    2023-06-15T06:04:58.387116  <8>[   13.969096] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-06-15T06:04:58.387463  + set +x
    2023-06-15T06:04:58.388665  <8>[   13.979963] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664970_1.5.2.4.1>
    2023-06-15T06:04:58.496576  / # #
    2023-06-15T06:04:58.599409  export SHELL=3D/bin/sh
    2023-06-15T06:04:58.599720  #
    2023-06-15T06:04:58.700963  / # export SHELL=3D/bin/sh. /lava-3664970/e=
nvironment
    2023-06-15T06:04:58.701893  =

    2023-06-15T06:04:58.803856  / # . /lava-3664970/environment/lava-366497=
0/bin/lava-test-runner /lava-3664970/1
    2023-06-15T06:04:58.805485   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648aafd4482a8cdc07306137

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aafd4482a8cdc0730613c
        failing since 8 days (last pass: next-20230517, first fail: next-20=
230607)

    2023-06-15T06:29:04.539044  / # #
    2023-06-15T06:29:04.640474  export SHELL=3D/bin/sh
    2023-06-15T06:29:04.640821  #
    2023-06-15T06:29:04.742036  / # export SHELL=3D/bin/sh. /lava-3665151/e=
nvironment
    2023-06-15T06:29:04.742373  =

    2023-06-15T06:29:04.843617  / # . /lava-3665151/environment/lava-366515=
1/bin/lava-test-runner /lava-3665151/1
    2023-06-15T06:29:04.844129  =

    2023-06-15T06:29:04.888763  / # /lava-3665151/bin/lava-test-runner /lav=
a-3665151/1
    2023-06-15T06:29:04.971629  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-15T06:29:04.972308  + cd /lava-3665151/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/648aab1d0e15dc532c306162

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aab1d0e15dc532c306167
        failing since 13 days (last pass: next-20230516, first fail: next-2=
0230601)

    2023-06-15T06:08:57.238228  / # #
    2023-06-15T06:08:57.343726  export SHELL=3D/bin/sh
    2023-06-15T06:08:57.345234  #
    2023-06-15T06:08:57.448566  / # export SHELL=3D/bin/sh. /lava-3664941/e=
nvironment
    2023-06-15T06:08:57.450072  =

    2023-06-15T06:08:57.553473  / # . /lava-3664941/environment/lava-366494=
1/bin/lava-test-runner /lava-3664941/1
    2023-06-15T06:08:57.556167  =

    2023-06-15T06:08:57.563413  / # /lava-3664941/bin/lava-test-runner /lav=
a-3664941/1
    2023-06-15T06:08:57.690111  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-15T06:08:57.691166  + cd /lava-3664941/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/648aad64ed5bb871423061a0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648aad64ed5bb871423061a5
        failing since 13 days (last pass: next-20230516, first fail: next-2=
0230601)

    2023-06-15T06:18:06.403875  <8>[   14.016712] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3664979_1.5.2.4.1>
    2023-06-15T06:18:06.523795  / # #
    2023-06-15T06:18:06.629372  export SHELL=3D/bin/sh
    2023-06-15T06:18:06.630947  #
    2023-06-15T06:18:06.734358  / # export SHELL=3D/bin/sh. /lava-3664979/e=
nvironment
    2023-06-15T06:18:06.735987  =

    2023-06-15T06:18:06.839333  / # . /lava-3664979/environment/lava-366497=
9/bin/lava-test-runner /lava-3664979/1
    2023-06-15T06:18:06.842074  =

    2023-06-15T06:18:06.848282  / # /lava-3664979/bin/lava-test-runner /lav=
a-3664979/1
    2023-06-15T06:18:06.970138  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab7f1b80b0e6f1c30617b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/648ab7f1b80b0e6f1c306180
        failing since 13 days (last pass: next-20230516, first fail: next-2=
0230601)

    2023-06-15T07:03:18.544731  / # #
    2023-06-15T07:03:18.650294  export SHELL=3D/bin/sh
    2023-06-15T07:03:18.651865  #
    2023-06-15T07:03:18.755171  / # export SHELL=3D/bin/sh. /lava-3665141/e=
nvironment
    2023-06-15T07:03:18.756762  =

    2023-06-15T07:03:18.860120  / # . /lava-3665141/environment/lava-366514=
1/bin/lava-test-runner /lava-3665141/1
    2023-06-15T07:03:18.862734  =

    2023-06-15T07:03:18.869244  / # /lava-3665141/bin/lava-test-runner /lav=
a-3665141/1
    2023-06-15T07:03:18.992955  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-15T07:03:18.994017  + cd /lava-3665141/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/648aacf9c5833596e2306154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648aacf9c5833596e2306=
155
        failing since 8 days (last pass: next-20230601, first fail: next-20=
230606) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/648ab02d11d566ae7e3062ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230615/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/648ab02d11d566ae7e306=
2f0
        failing since 7 days (last pass: next-20230605, first fail: next-20=
230608) =

 =20
