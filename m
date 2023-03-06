Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E094E6AB4F6
	for <lists+linux-next@lfdr.de>; Mon,  6 Mar 2023 04:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjCFDMa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Mar 2023 22:12:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjCFDM3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Mar 2023 22:12:29 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49BDE3A9
        for <linux-next@vger.kernel.org>; Sun,  5 Mar 2023 19:12:23 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id h8so8754754plf.10
        for <linux-next@vger.kernel.org>; Sun, 05 Mar 2023 19:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678072343;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Np558ohHK/lAorceHwI4iHv+zr0PTpp8XGQKFn9nbOU=;
        b=gde9IzyGcFGfObVR3jKo1b1lB0xIAN6GlE0xF5YOWjgSYHShKy6O0eaoyGrHlZH2Bn
         5EG8EGLxmFVK2v/Pr5eJiiIJeyxezMOMArZ7GwTwC7OCcxF3veIn1B4W3iwZ1hAyTxTh
         NzaK5Xqt4syMtzoSeDxrKhH7TDxTTky1q+V0RItOKljLg6DsScuKZZF7GjTMwGu/oCHC
         G9WvDdx+UG/xwni3po1V0hmqyL0gKcNE/LpJQ2kKGjj1dvjCsWWBkuA/qOTRc5TFYJs6
         AMXmIjoyNYSkrePPnDqDtoxSwonTaMO5nOIh4JEdqO3n8Y2FIo8OQgtvA9PC92KOLanO
         YUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678072343;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Np558ohHK/lAorceHwI4iHv+zr0PTpp8XGQKFn9nbOU=;
        b=MV6n/NyknlfZzkFpP7Edh2UbLR8qhl7lCRWqUs94RVi9X8b1o0PgAK9zobk/8pwaZw
         xYULyrtgvAaxzvcQyFcwrIUAZhlgadJGjyrGvOLuaKeIYiWPVCPcx4Y8YR9/HlGglRq0
         9ON1Bz1HHR7KNsPsd63ZJUXr+iUbFDk3sqopdzMtCp4uUIUGfhnS7nbqXkALD7ZSOPUc
         4fmCbjuNOhGMpx6KBdATdITBAN8AzscgkOx2UfwoC0wy7B3ZII+aB1b55mUtGj/ZRM2+
         Q1ck7ua8sh0Ir4A3GfYs7B6bQqsamcx/Mt+Me4Y+J+zewIaCilKlgl/sOQjM/xUR8AGs
         piGw==
X-Gm-Message-State: AO0yUKU4wo7ccxAh7oojAg6sRlFBAs4Hu/s7VquTFQoVK1qgr211Y6si
        92HeS8jIMZsJqmOmRWwaNJAtM/qzX+NDPIqRFJEFUvqq
X-Google-Smtp-Source: AK7set9njHSm0yODoESyzFtvJnh+TvnzbYnD2gkaCWyUCYgS/8vf0B7A85wSyjqtps7bY1IY53U/wg==
X-Received: by 2002:a05:6a20:9390:b0:c6:ff46:c713 with SMTP id x16-20020a056a20939000b000c6ff46c713mr11577828pzh.57.1678072341484;
        Sun, 05 Mar 2023 19:12:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bm16-20020a056a00321000b005a84ef49c63sm5120784pfb.214.2023.03.05.19.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 19:12:21 -0800 (PST)
Message-ID: <64055a15.050a0220.7ebf9.9700@mx.google.com>
Date:   Sun, 05 Mar 2023 19:12:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.2-13684-gf93c476d9769
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 624 runs,
 127 regressions (v6.2-13684-gf93c476d9769)
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

next/pending-fixes baseline: 624 runs, 127 regressions (v6.2-13684-gf93c476=
d9769)

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

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
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

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-13684-gf93c476d9769/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-13684-gf93c476d9769
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f93c476d9769ed15c9282349fac7391cae0c9d90 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6405247ec117db1be48c86d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/=
baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/=
baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405247ec117db1be48c8=
6d4
        failing since 147 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640527bc74bd15b3408c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-=
am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-=
am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640527bc74bd15b3408c8=
636
        failing since 144 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6405251f9c0ac879d58c8654

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi=
-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi=
-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6405251f9c0ac879d58c865d
        failing since 2 days (last pass: v6.2-12625-g13efc3a9f23b, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-03-05T23:25:58.473806  + set +x
    2023-03-05T23:25:58.477667  <8>[   19.107355] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 102503_1.5.2.4.1>
    2023-03-05T23:25:58.612221  / # #
    2023-03-05T23:25:58.716108  export SHELL=3D/bin/sh
    2023-03-05T23:25:58.716874  #
    2023-03-05T23:25:58.818534  / # export SHELL=3D/bin/sh. /lava-102503/en=
vironment
    2023-03-05T23:25:58.819219  =

    2023-03-05T23:25:58.921086  / # . /lava-102503/environment/lava-102503/=
bin/lava-test-runner /lava-102503/1
    2023-03-05T23:25:58.922080  =

    2023-03-05T23:25:58.928073  / # /lava-102503/bin/lava-test-runner /lava=
-102503/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/640525682ee0b15cab8c866d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640525682ee0b15cab8c8676
        failing since 53 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-03-05T23:27:17.544022  / # #

    2023-03-05T23:27:17.646904  export SHELL=3D/bin/sh

    2023-03-05T23:27:17.647653  #

    2023-03-05T23:27:17.749719  / # export SHELL=3D/bin/sh. /lava-9442194/e=
nvironment

    2023-03-05T23:27:17.750533  =


    2023-03-05T23:27:17.852669  / # . /lava-9442194/environment/lava-944219=
4/bin/lava-test-runner /lava-9442194/1

    2023-03-05T23:27:17.853986  =


    2023-03-05T23:27:17.869393  / # /lava-9442194/bin/lava-test-runner /lav=
a-9442194/1

    2023-03-05T23:27:17.978324  + export 'TESTRUN_ID=3D1_bootrr'

    2023-03-05T23:27:17.978929  + cd /lava-9442194/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6405244287de4035d48c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405244287de4035d48c8=
630
        failing since 7 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640526581ecbc964498c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640526581ecbc964498c8=
633
        failing since 43 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/640522fe215d2a6e278c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubie=
truck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubie=
truck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640522fe215d2a6e278c8638
        failing since 47 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-05T23:16:57.795995  <8>[   15.560423] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3388395_1.5.2.4.1>
    2023-03-05T23:16:57.903900  / # #
    2023-03-05T23:16:58.005451  export SHELL=3D/bin/sh
    2023-03-05T23:16:58.005849  #
    2023-03-05T23:16:58.106970  / # export SHELL=3D/bin/sh. /lava-3388395/e=
nvironment
    2023-03-05T23:16:58.107356  =

    2023-03-05T23:16:58.107546  / # <3>[   15.806817] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-03-05T23:16:58.208889  . /lava-3388395/environment/lava-3388395/bi=
n/lava-test-runner /lava-3388395/1
    2023-03-05T23:16:58.209591  =

    2023-03-05T23:16:58.214669  / # /lava-3388395/bin/lava-test-runner /lav=
a-3388395/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6405262b383d8e32f78c863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6405262b383d8e32f78c8647
        failing since 47 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-05T23:30:35.730446  <8>[   15.081043] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3388516_1.5.2.4.1>
    2023-03-05T23:30:35.841795  / # #
    2023-03-05T23:30:35.945561  export SHELL=3D/bin/sh
    2023-03-05T23:30:35.947180  #
    2023-03-05T23:30:36.049714  / # export SHELL=3D/bin/sh. /lava-3388516/e=
nvironment
    2023-03-05T23:30:36.050152  =

    2023-03-05T23:30:36.151582  / # . /lava-3388516/environment/lava-338851=
6/bin/lava-test-runner /lava-3388516/1
    2023-03-05T23:30:36.152864  =

    2023-03-05T23:30:36.157656  / # /lava-3388516/bin/lava-test-runner /lav=
a-3388516/1
    2023-03-05T23:30:36.240057  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/640526c0e3ec2a5eb78c8664

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640526c0e3ec2a5eb78c866d
        failing since 47 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-05T23:32:46.334672  <8>[   16.674820] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3388528_1.5.2.4.1>
    2023-03-05T23:32:46.442907  / # #
    2023-03-05T23:32:46.545240  export SHELL=3D/bin/sh
    2023-03-05T23:32:46.545950  #
    2023-03-05T23:32:46.648000  / # export SHELL=3D/bin/sh. /lava-3388528/e=
nvironment
    2023-03-05T23:32:46.648778  =

    2023-03-05T23:32:46.750307  / # . /lava-3388528/environment/lava-338852=
8/bin/lava-test-runner /lava-3388528/1
    2023-03-05T23:32:46.751064  =

    2023-03-05T23:32:46.755888  / # /lava-3388528/bin/lava-test-runner /lav=
a-3388528/1
    2023-03-05T23:32:46.835339  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6405274bb2f3400c688c864e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6405274bb2f3400c688c8657
        failing since 47 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-05T23:35:20.491441  <8>[   24.898379] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3388548_1.5.2.4.1>
    2023-03-05T23:35:20.599033  / # #
    2023-03-05T23:35:20.700545  export SHELL=3D/bin/sh
    2023-03-05T23:35:20.700913  #
    2023-03-05T23:35:20.801783  / # export SHELL=3D/bin/sh. /lava-3388548/e=
nvironment
    2023-03-05T23:35:20.802147  =

    2023-03-05T23:35:20.903282  / # . /lava-3388548/environment/lava-338854=
8/bin/lava-test-runner /lava-3388548/1
    2023-03-05T23:35:20.903847  =

    2023-03-05T23:35:20.910749  / # /lava-3388548/bin/lava-test-runner /lav=
a-3388548/1
    2023-03-05T23:35:21.009067  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/640527d8b7b59779cb8c863c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruc=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruc=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640527d8b7b59779cb8c8645
        failing since 47 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-05T23:37:35.742066  <8>[   15.566171] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3388575_1.5.2.4.1>
    2023-03-05T23:37:35.849649  / # #
    2023-03-05T23:37:35.951183  export SHELL=3D/bin/sh
    2023-03-05T23:37:35.951860  #
    2023-03-05T23:37:36.053170  / # export SHELL=3D/bin/sh. /lava-3388575/e=
nvironment
    2023-03-05T23:37:36.053584  =

    2023-03-05T23:37:36.053826  / # <3>[   15.806898] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-03-05T23:37:36.155494  . /lava-3388575/environment/lava-3388575/bi=
n/lava-test-runner /lava-3388575/1
    2023-03-05T23:37:36.156139  =

    2023-03-05T23:37:36.160998  / # /lava-3388575/bin/lava-test-runner /lav=
a-3388575/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/640521998a02f7f6778c8631

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/640521998a02f7f=
6778c8634
        failing since 2 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-13370-g5872d227b73f)
        30 lines

    2023-03-05T23:10:56.376722  kern  :alert : Register r6 information: NUL=
L pointer
    2023-03-05T23:10:56.421772  kern  :alert : Register r7 information: non=
-paged memory
    2023-03-05T23:10:56.421996  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4d0c200 pointer offset 4 size 512
    2023-03-05T23:10:56.422129  kern  :alert : Register r9 information: non=
-paged memory
    2023-03-05T23:10:56.422242  kern  :alert : Register r10 information: NU=
LL pointer
    2023-03-05T23:10:56.422351  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf470000 allocated at load_module+0x898/0=
x1b10
    2023-03-05T23:10:56.424880  kern  :alert : Register r12 information: no=
n-paged memory
    2023-03-05T23:10:56.512839  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-03-05T23:10:56.513282  kern  :emerg : Process udevd (pid: 71, stac=
k limit =3D 0xf3f7facc)
    2023-03-05T23:10:56.513434  kern  :emerg : Stack: (0xc8915cf8 to 0xc891=
6000) =

    ... (6 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/640521998a02f7f=
6778c8635
        failing since 406 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-03-05T23:10:56.330081  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-03-05T23:10:56.330326  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-03-05T23:10:56.330460  kern  :alert : 8<--- cut here ---
    2023-03-05T23:10:56.330782  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-03-05T23:10:56.330903  kern  :alert : [00000060] *pgd=3Dc4a2e831, =
*pte=3D00000000, *ppte=3D00000000
    2023-03-05T23:10:56.331011  kern  :alert : Register r0 information: non=
-paged memory
    2023-03-05T23:10:56.373500  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8914000 allocated at kernel_clone+0x98/0x=
3a0
    2023-03-05T23:10:56.373953  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-05T23:10:56.374107  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-05T23:10:56.374225  kern  :alert : R<8><LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/640524f7758351e0978c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640524f7758351e0978c8=
63d
        failing since 69 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6405229f0f2ac3613e8c869b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-im=
x53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-im=
x53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6405229f0f2ac3613e8c86a4
        failing since 34 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-03-05T23:15:21.416729  + set +x
    2023-03-05T23:15:21.416901  [   13.091526] <LAVA_SIGNAL_ENDRUN 0_dmesg =
916321_1.5.2.3.1>
    2023-03-05T23:15:21.524964  / # #
    2023-03-05T23:15:21.626496  export SHELL=3D/bin/sh
    2023-03-05T23:15:21.626919  #
    2023-03-05T23:15:21.728171  / # export SHELL=3D/bin/sh. /lava-916321/en=
vironment
    2023-03-05T23:15:21.728654  =

    2023-03-05T23:15:21.830326  / # . /lava-916321/environment/lava-916321/=
bin/lava-test-runner /lava-916321/1
    2023-03-05T23:15:21.830882  =

    2023-03-05T23:15:21.834262  / # /lava-916321/bin/lava-test-runner /lava=
-916321/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640524b9685e9146668c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pe=
ngutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pe=
ngutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640524b9685e9146668c8638
        failing since 34 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-03-05T23:24:17.660653  + set +x
    2023-03-05T23:24:17.660817  [   12.880291] <LAVA_SIGNAL_ENDRUN 0_dmesg =
916334_1.5.2.3.1>
    2023-03-05T23:24:17.768687  / # #
    2023-03-05T23:24:17.870222  export SHELL=3D/bin/sh
    2023-03-05T23:24:17.870694  #
    2023-03-05T23:24:17.971644  / # export SHELL=3D/bin/sh. /lava-916334/en=
vironment
    2023-03-05T23:24:17.972046  =

    2023-03-05T23:24:18.073288  / # . /lava-916334/environment/lava-916334/=
bin/lava-test-runner /lava-916334/1
    2023-03-05T23:24:18.073844  =

    2023-03-05T23:24:18.077154  / # /lava-916334/bin/lava-test-runner /lava=
-916334/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6405250a9c0ac879d58c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/=
baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/=
baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6405250a9c0ac879d58c8638
        failing since 34 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-03-05T23:25:38.228190  + set +x
    2023-03-05T23:25:38.228409  [   12.128140] <LAVA_SIGNAL_ENDRUN 0_dmesg =
916344_1.5.2.3.1>
    2023-03-05T23:25:38.335649  / # #
    2023-03-05T23:25:38.437893  export SHELL=3D/bin/sh
    2023-03-05T23:25:38.438486  #
    2023-03-05T23:25:38.539953  / # export SHELL=3D/bin/sh. /lava-916344/en=
vironment
    2023-03-05T23:25:38.540565  =

    2023-03-05T23:25:38.641860  / # . /lava-916344/environment/lava-916344/=
bin/lava-test-runner /lava-916344/1
    2023-03-05T23:25:38.642550  =

    2023-03-05T23:25:38.645619  / # /lava-916344/bin/lava-test-runner /lava=
-916344/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64052596cbd21c5f238c8649

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64052596cbd21c5f238c8652
        failing since 34 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-03-05T23:28:02.855333  + set +x
    2023-03-05T23:28:02.855497  [   16.292966] <LAVA_SIGNAL_ENDRUN 0_dmesg =
916354_1.5.2.3.1>
    2023-03-05T23:28:02.963472  / # #
    2023-03-05T23:28:03.064981  export SHELL=3D/bin/sh
    2023-03-05T23:28:03.065426  #
    2023-03-05T23:28:03.166602  / # export SHELL=3D/bin/sh. /lava-916354/en=
vironment
    2023-03-05T23:28:03.167007  =

    2023-03-05T23:28:03.268209  / # . /lava-916354/environment/lava-916354/=
bin/lava-test-runner /lava-916354/1
    2023-03-05T23:28:03.268761  =

    2023-03-05T23:28:03.271988  / # /lava-916354/bin/lava-test-runner /lava=
-916354/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64052638383d8e32f78c868a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-=
qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-=
qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64052638383d8e32f78c8693
        failing since 34 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-03-05T23:30:41.206707  [   13.035927] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-03-05T23:30:41.213556  + set +x
    2023-03-05T23:30:41.213705  [   13.047043] <LAVA_SIGNAL_ENDRUN 0_dmesg =
916365_1.5.2.3.1>
    2023-03-05T23:30:41.320989  / # #
    2023-03-05T23:30:41.422475  export SHELL=3D/bin/sh
    2023-03-05T23:30:41.422907  #
    2023-03-05T23:30:41.524000  / # export SHELL=3D/bin/sh. /lava-916365/en=
vironment
    2023-03-05T23:30:41.524388  =

    2023-03-05T23:30:41.625616  / # . /lava-916365/environment/lava-916365/=
bin/lava-test-runner /lava-916365/1
    2023-03-05T23:30:41.626211   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64052814020f5eefe38c8667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-=
imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052814020f5eefe38c8=
668
        failing since 119 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640527c4f28548940d8c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-=
imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-=
imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640527c4f28548940d8c8=
650
        failing since 171 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6405244adc888e14de8c8655

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405244adc888e14de8c8=
656
        failing since 310 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64052090437b55d9898c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/riscv/defconfig/gcc-10/lab-clabbe/baseline-jh7100-starfive-vi=
sionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/riscv/defconfig/gcc-10/lab-clabbe/baseline-jh7100-starfive-vi=
sionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052090437b55d9898c8=
63d
        failing since 6 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640523119e52fd32f78c8671

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640523119e52fd32f78c867a
        failing since 9 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-05T23:17:14.501133  / # #
    2023-03-05T23:17:14.603148  export SHELL=3D/bin/sh
    2023-03-05T23:17:14.603614  #
    2023-03-05T23:17:14.705023  / # export SHELL=3D/bin/sh. /lava-3388429/e=
nvironment
    2023-03-05T23:17:14.705545  =

    2023-03-05T23:17:14.705918  / # <3>[   18.477452] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-05T23:17:14.807352  . /lava-3388429/environment/lava-3388429/bi=
n/lava-test-runner /lava-3388429/1
    2023-03-05T23:17:14.808094  =

    2023-03-05T23:17:14.814119  / # /lava-3388429/bin/lava-test-runner /lav=
a-3388429/1
    2023-03-05T23:17:14.877096  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64052699860209ddb98c8674

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-s=
ei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-s=
ei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64052699860209ddb98c867d
        failing since 7 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-05T23:32:15.835877  / # #
    2023-03-05T23:32:15.938626  export SHELL=3D/bin/sh
    2023-03-05T23:32:15.939302  #
    2023-03-05T23:32:16.040997  / # export SHELL=3D/bin/sh. /lava-3388603/e=
nvironment
    2023-03-05T23:32:16.041447  =

    2023-03-05T23:32:16.041701  / # <3>[   18.394513] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-05T23:32:16.143053  . /lava-3388603/environment/lava-3388603/bi=
n/lava-test-runner /lava-3388603/1
    2023-03-05T23:32:16.144376  =

    2023-03-05T23:32:16.161950  / # /lava-3388603/bin/lava-test-runner /lav=
a-3388603/1
    2023-03-05T23:32:16.203181  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/640528b3e45301b1ce8c8641

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei51=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei51=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640528b3e45301b1ce8c864a
        failing since 9 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-05T23:41:14.854583  <8>[   18.197297] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3388664_1.5.2.4.1>
    2023-03-05T23:41:14.958625  / # #
    2023-03-05T23:41:15.061377  export SHELL=3D/bin/sh
    2023-03-05T23:41:15.062165  #
    2023-03-05T23:41:15.163563  / # export SHELL=3D/bin/sh. /lava-3388664/e=
nvironment
    2023-03-05T23:41:15.164021  =

    2023-03-05T23:41:15.164363  <3>[   18.433549] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-03-05T23:41:15.265937  / # . /lava-3388664/environment/lava-338866=
4/bin/lava-test-runner /lava-3388664/1
    2023-03-05T23:41:15.266689  =

    2023-03-05T23:41:15.277720  / # /lava-3388664/bin/lava-test-runner /lav=
a-3388664/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640523322667a5c48a8c865a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640523322667a5c48a8c8663
        failing since 9 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-05T23:17:36.429951  / # #
    2023-03-05T23:17:36.531753  export SHELL=3D/bin/sh
    2023-03-05T23:17:36.532190  #
    2023-03-05T23:17:36.633505  / # export SHELL=3D/bin/sh. /lava-3388432/e=
nvironment
    2023-03-05T23:17:36.633947  =

    2023-03-05T23:17:36.735460  / # . /lava-3388432/environment/lava-338843=
2/bin/lava-test-runner /lava-3388432/1
    2023-03-05T23:17:36.736151  =

    2023-03-05T23:17:36.740771  / # /lava-3388432/bin/lava-test-runner /lav=
a-3388432/1
    2023-03-05T23:17:36.812648  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-05T23:17:36.812947  + cd /lava-3388432/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/640526ade654467aff8c8781

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-n=
anopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-n=
anopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640526ade654467aff8c878a
        failing since 7 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-05T23:32:37.727294  + set +x<8>[   18.307872] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3388586_1.5.2.4.1>
    2023-03-05T23:32:37.832497  / #
    2023-03-05T23:32:37.934529  # #export SHELL=3D/bin/sh
    2023-03-05T23:32:37.935023  =

    2023-03-05T23:32:38.036370  / # export SHELL=3D/bin/sh. /lava-3388586/e=
nvironment
    2023-03-05T23:32:38.036847  =

    2023-03-05T23:32:38.138175  / # . /lava-3388586/environment/lava-338858=
6/bin/lava-test-runner /lava-3388586/1
    2023-03-05T23:32:38.138796  =

    2023-03-05T23:32:38.143990  / # /lava-3388586/bin/lava-test-runner /lav=
a-3388586/1
    2023-03-05T23:32:38.215831  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64052711e3da87a1228c8652

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64052711e3da87a1228c865b
        failing since 9 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-05T23:34:27.681040  <8>[   18.576911] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3388637_1.5.2.4.1>
    2023-03-05T23:34:27.786259  / # #
    2023-03-05T23:34:27.887955  export SHELL=3D/bin/sh
    2023-03-05T23:34:27.888331  #
    2023-03-05T23:34:27.989647  / # export SHELL=3D/bin/sh. /lava-3388637/e=
nvironment
    2023-03-05T23:34:27.990017  =

    2023-03-05T23:34:28.091337  / # . /lava-3388637/environment/lava-338863=
7/bin/lava-test-runner /lava-3388637/1
    2023-03-05T23:34:28.091977  =

    2023-03-05T23:34:28.096702  / # /lava-3388637/bin/lava-test-runner /lav=
a-3388637/1
    2023-03-05T23:34:28.168597  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/640528cc57f85add3e8c8645

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanop=
i-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanop=
i-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640528cc57f85add3e8c864e
        failing since 9 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-05T23:41:35.345117  / # #
    2023-03-05T23:41:35.446994  export SHELL=3D/bin/sh
    2023-03-05T23:41:35.447392  #
    2023-03-05T23:41:35.548545  / # export SHELL=3D/bin/sh. /lava-3388681/e=
nvironment
    2023-03-05T23:41:35.549073  =

    2023-03-05T23:41:35.650442  / # . /lava-3388681/environment/lava-338868=
1/bin/lava-test-runner /lava-3388681/1
    2023-03-05T23:41:35.651093  =

    2023-03-05T23:41:35.656317  / # /lava-3388681/bin/lava-test-runner /lav=
a-3388681/1
    2023-03-05T23:41:35.728091  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-05T23:41:35.728380  + cd /lava-3388681/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6405232b2667a5c48a8c864a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6405232b2667a5c48a8c8653
        failing since 9 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-05T23:17:48.048580  / # #
    2023-03-05T23:17:48.150239  export SHELL=3D/bin/sh
    2023-03-05T23:17:48.150581  #
    2023-03-05T23:17:48.251882  / # export SHELL=3D/bin/sh. /lava-3388419/e=
nvironment
    2023-03-05T23:17:48.252227  =

    2023-03-05T23:17:48.353566  / # . /lava-3388419/environment/lava-338841=
9/bin/lava-test-runner /lava-3388419/1
    2023-03-05T23:17:48.354157  =

    2023-03-05T23:17:48.359877  / # /lava-3388419/bin/lava-test-runner /lav=
a-3388419/1
    2023-03-05T23:17:48.439755  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-05T23:17:48.440230  + cd /lava-3388419/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/640526b0e654467aff8c879c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s8=
05x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s8=
05x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640526b0e654467aff8c87a5
        failing since 7 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-05T23:32:40.763513  <8>[   18.205652] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3388590_1.5.2.4.1>
    2023-03-05T23:32:40.869140  / # #
    2023-03-05T23:32:40.970852  export SHELL=3D/bin/sh
    2023-03-05T23:32:40.971200  #
    2023-03-05T23:32:41.072511  / # export SHELL=3D/bin/sh. /lava-3388590/e=
nvironment
    2023-03-05T23:32:41.072862  =

    2023-03-05T23:32:41.174193  / # . /lava-3388590/environment/lava-338859=
0/bin/lava-test-runner /lava-3388590/1
    2023-03-05T23:32:41.174801  =

    2023-03-05T23:32:41.180033  / # /lava-3388590/bin/lava-test-runner /lav=
a-3388590/1
    2023-03-05T23:32:41.257921  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6405273ad011b45dd88c8636

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6405273ad011b45dd88c863f
        failing since 9 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-05T23:34:56.565541  <8>[   18.124520] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3388625_1.5.2.4.1>
    2023-03-05T23:34:56.670849  / # #
    2023-03-05T23:34:56.772530  export SHELL=3D/bin/sh
    2023-03-05T23:34:56.772879  #
    2023-03-05T23:34:56.874193  / # export SHELL=3D/bin/sh. /lava-3388625/e=
nvironment
    2023-03-05T23:34:56.874545  =

    2023-03-05T23:34:56.975882  / # . /lava-3388625/environment/lava-338862=
5/bin/lava-test-runner /lava-3388625/1
    2023-03-05T23:34:56.976540  =

    2023-03-05T23:34:56.982238  / # /lava-3388625/bin/lava-test-runner /lav=
a-3388625/1
    2023-03-05T23:34:57.059037  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/640528c95de5bb5e788c8653

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640528c95de5bb5e788c865c
        failing since 9 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-05T23:41:40.717775  / # #
    2023-03-05T23:41:40.819442  export SHELL=3D/bin/sh
    2023-03-05T23:41:40.819786  #
    2023-03-05T23:41:40.921095  / # export SHELL=3D/bin/sh. /lava-3388651/e=
nvironment
    2023-03-05T23:41:40.921444  =

    2023-03-05T23:41:41.022767  / # . /lava-3388651/environment/lava-338865=
1/bin/lava-test-runner /lava-3388651/1
    2023-03-05T23:41:41.023365  =

    2023-03-05T23:41:41.029081  / # /lava-3388651/bin/lava-test-runner /lav=
a-3388651/1
    2023-03-05T23:41:41.106084  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-05T23:41:41.106578  + cd /lava-3388651/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64052802020f5eefe38c8646

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/=
baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/=
baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64052802020f5ee=
fe38c8649
        new failure (last pass: v6.2-13370-g5872d227b73f)
        2 lines

    2023-03-05T23:38:10.102157  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2023-03-05T23:38:10.112344  kern  :emerg : Code: d2800028 d2e02809 f2e0=
0808 17f<8>[   19.111297] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=
=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-03-05T23:38:10.115582  fffd1 (d4210<8>[   19.120253] <LAVA_SIGNAL_=
ENDRUN 0_dmesg 102602_1.5.2.4.1>
    2023-03-05T23:38:10.118994  000) =

    2023-03-05T23:38:10.123040  + set +x   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/64052802020f5eef=
e38c864b
        new failure (last pass: v6.2-13370-g5872d227b73f)
        1 lines

    2023-03-05T23:38:09.435729  / # =

    2023-03-05T23:38:09.448923  =

    2023-03-05T23:38:09.595320  / # #
    2023-03-05T23:38:09.608872  #
    2023-03-05T23:38:09.723816  / # export SHELL=3D/bin/sh
    2023-03-05T23:38:09.737832  export SHELL=3D/bin/sh
    2023-03-05T23:38:09.848229  / # . /lava-102602/environment
    2023-03-05T23:38:09.861161  . /lava-102602/environment
    2023-03-05T23:38:09.971348  / # /lava-102602/bin/lava-test-runner /lava=
-102602/0
    2023-03-05T23:38:09.990294  /lava-102602/bin/lava-test-runner /lava-102=
602/0 =

    ... (8 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/640528d55de5bb5e788c8660

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/b=
aseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/b=
aseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/640528d55de5bb5=
e788c8663
        new failure (last pass: v6.2-13370-g5872d227b73f)
        2 lines =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/640528d55de5bb5e=
788c8665
        new failure (last pass: v6.2-13370-g5872d227b73f)
        1 lines

    2023-03-05T23:41:50.312095  / # =

    2023-03-05T23:41:50.319842  =

    2023-03-05T23:41:50.424098  / # #
    2023-03-05T23:41:50.431823  #
    2023-03-05T23:41:50.534990  / # export SHELL=3D/bin/sh
    2023-03-05T23:41:50.543826  export SHELL=3D/bin/sh
    2023-03-05T23:41:50.645092  / # . /lava-408360/environment
    2023-03-05T23:41:50.655707  . /lava-408360/environment
    2023-03-05T23:41:50.757398  / # /lava-408360/bin/lava-test-runner /lava=
-408360/0
    2023-03-05T23:41:50.767705  /lava-408360/bin/lava-test-runner /lava-408=
360/0 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6405231242a4f4f02d8c864a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6405231242a4f4f02d8c8653
        failing since 9 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-05T23:17:15.184126  + set +x<8>[   17.892771] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3388430_1.5.2.4.1>
    2023-03-05T23:17:15.286765  / # #
    2023-03-05T23:17:15.388721  export SHELL=3D/bin/sh
    2023-03-05T23:17:15.389240  #
    2023-03-05T23:17:15.490611  / # export SHELL=3D/bin/sh. /lava-3388430/e=
nvironment
    2023-03-05T23:17:15.491113  =

    2023-03-05T23:17:15.491398  / # <3>[   18.136227] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-05T23:17:15.592810  . /lava-3388430/environment/lava-3388430/bi=
n/lava-test-runner /lava-3388430/1
    2023-03-05T23:17:15.593633  =

    2023-03-05T23:17:15.597916  / # /lava-3388430/bin/lava-test-runner /lav=
a-3388430/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64052697556d3b8d0f8c863b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-se=
i610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-se=
i610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64052697556d3b8d0f8c8644
        failing since 7 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-05T23:32:17.639159  / # #
    2023-03-05T23:32:17.740573  export SHELL=3D/bin/sh
    2023-03-05T23:32:17.740941  #
    2023-03-05T23:32:17.842093  / # export SHELL=3D/bin/sh. /lava-3388596/e=
nvironment
    2023-03-05T23:32:17.842415  =

    2023-03-05T23:32:17.842573  / # <3>[   18.316825] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-05T23:32:17.943775  . /lava-3388596/environment/lava-3388596/bi=
n/lava-test-runner /lava-3388596/1
    2023-03-05T23:32:17.944516  =

    2023-03-05T23:32:17.952555  / # /lava-3388596/bin/lava-test-runner /lav=
a-3388596/1
    2023-03-05T23:32:18.013476  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/640528b256ef2cc7828c864d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640528b256ef2cc7828c8656
        failing since 9 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-05T23:41:16.270114  <8>[   17.914331] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3388657_1.5.2.4.1>
    2023-03-05T23:41:16.374222  / # #
    2023-03-05T23:41:16.476910  export SHELL=3D/bin/sh
    2023-03-05T23:41:16.477282  #
    2023-03-05T23:41:16.578443  / # export SHELL=3D/bin/sh. /lava-3388657/e=
nvironment
    2023-03-05T23:41:16.578716  =

    2023-03-05T23:41:16.578884  / # <3>[   18.158233] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-05T23:41:16.680038  . /lava-3388657/environment/lava-3388657/bi=
n/lava-test-runner /lava-3388657/1
    2023-03-05T23:41:16.680598  =

    2023-03-05T23:41:16.684665  / # /lava-3388657/bin/lava-test-runner /lav=
a-3388657/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6405272e1fe1c267758c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405272e1fe1c267758c8=
646
        failing since 40 days (last pass: v6.2-rc5-157-g1f16e03afb18, first=
 fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/64052242a956ad126d8c86d4

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/640=
52242a956ad126d8c8728
        failing since 9 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-05T23:13:49.577070  /lava-9442033/1/../bin/lava-test-case

    2023-03-05T23:13:49.587281  <8>[   25.043893] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/64052242a956ad126d8c877a
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-03-05T23:13:46.719755  /lava-9442033/1/../bin/lava-test-case

    2023-03-05T23:13:46.730940  <8>[   22.187334] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/64052242a956ad126d8c877b
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-03-05T23:13:44.674200    nv:           0

    2023-03-05T23:13:44.674297    extensive:    0

    2023-03-05T23:13:44.677581    flushed:      0

    2023-03-05T23:13:44.677678    cHandles:     0x1

    2023-03-05T23:13:44.680951    rHandle:      0

    2023-03-05T23:13:44.681048    V:            0

    2023-03-05T23:13:44.684048    Res:          0x0

    2023-03-05T23:13:44.684145  TPM2_CC_PolicyNvWritten:

    2023-03-05T23:13:44.687436    value: 0x200018F

    2023-03-05T23:13:44.690881    commandIndex: 0x18f
 =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64052740b2f3400c688c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052740b2f3400c688c8=
638
        failing since 26 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6405225373c84d0e028c863d

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/6405225473c84d0e028c86f3
        failing since 2 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-13370-g5872d227b73f)

    2023-03-05T23:13:58.061151  /lava-9442016/1/../bin/lava-test-case

    2023-03-05T23:13:58.067481  <8>[   21.912716] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/6405225473c84d0e028c86f4
        failing since 2 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-13370-g5872d227b73f)

    2023-03-05T23:13:57.041237  /lava-9442016/1/../bin/lava-test-case

    2023-03-05T23:13:57.047943  <8>[   20.892835] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/6405225473c84d0e028c86f5
        failing since 2 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-13370-g5872d227b73f)

    2023-03-05T23:13:55.013306    rHandle:      0

    2023-03-05T23:13:55.013387    V:            0

    2023-03-05T23:13:55.016562    Res:          0x0

    2023-03-05T23:13:55.016650  TPM2_CC_GetTestResult:

    2023-03-05T23:13:55.019879    value: 0x17C

    2023-03-05T23:13:55.019957    commandIndex: 0x17c

    2023-03-05T23:13:55.022989    reserved1:    0x0

    2023-03-05T23:13:55.023064    nv:           0

    2023-03-05T23:13:55.026186    extensive:    0

    2023-03-05T23:13:55.026260    flushed:      0
 =

    ... (107 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64052744b2f3400c688c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052744b2f3400c688c8=
63e
        failing since 26 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64051f00c0ec0e1de88c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64051f00c0ec0e1de88c8=
657
        failing since 144 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64052ce9987f40c3da8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-=
lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-=
lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052ce9987f40c3da8c8=
630
        failing since 26 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640527c8abe33c9be08c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640527c8abe33c9be08c8=
635
        failing since 144 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64052a41e3f1710b658c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052a41e3f1710b658c8=
652
        failing since 144 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640527b3f28548940d8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640527b3f28548940d8c8=
632
        failing since 144 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640527c788fe4486bf8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640527c788fe4486bf8c8=
631
        failing since 144 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64052a40a7f558041f8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052a40a7f558041f8c8=
632
        failing since 144 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640527b274bd15b3408c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640527b274bd15b3408c8=
630
        failing since 144 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640527c574bd15b3408c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640527c574bd15b3408c8=
647
        failing since 144 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64052a3fe3f1710b658c864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052a3fe3f1710b658c8=
64c
        failing since 144 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640527ca88fe4486bf8c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qem=
u_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640527ca88fe4486bf8c8=
636
        failing since 144 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64052a52a7f558041f8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu=
_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052a52a7f558041f8c8=
63f
        failing since 144 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6405244287de4035d48c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405244287de4035d48c8=
633
        failing since 2 days (last pass: v6.2-rc8-150-g30cd52e17d48, first =
fail: v6.2-13370-g5872d227b73f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6405247a8ee629756b8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405247a8ee629756b8c8=
632
        failing since 2 days (last pass: v6.2-rc8-150-g30cd52e17d48, first =
fail: v6.2-13370-g5872d227b73f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/64052301215d2a6e278c865b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i=
386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i=
386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052301215d2a6e278c8=
65c
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/640523b61790d6d3248c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640523b61790d6d3248c8=
631
        new failure (last pass: v6.2-13370-g5872d227b73f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/640524b1a9ac1205f28c8669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i3=
86-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i3=
86-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640524b1a9ac1205f28c8=
66a
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/640525a26acd5460a08c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640525a26acd5460a08c8=
630
        new failure (last pass: v6.2-13370-g5872d227b73f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/640523755bb3672bdb8c8674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_=
i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_=
i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640523755bb3672bdb8c8=
675
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/640523c528c1c4a7878c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640523c528c1c4a7878c8=
631
        new failure (last pass: v6.2-13370-g5872d227b73f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/640523655bb3672bdb8c863d

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-=
malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-=
malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/640523655bb3672=
bdb8c8641
        new failure (last pass: v6.2-13370-g5872d227b73f)
        1 lines

    2023-03-05T23:18:56.971871  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 3facc370, epc =3D=3D 8020471c, ra =3D=
=3D 802070e0
    2023-03-05T23:18:56.972063  =


    2023-03-05T23:18:56.993307  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-03-05T23:18:56.993446  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/640520d0689ee1c6248c865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640520d0689ee1c6248c8=
65b
        failing since 14 days (last pass: v6.2-rc6-351-gf42837eac380f, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6405221198f7e416508c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405221198f7e416508c8=
659
        failing since 14 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/6405222498f7e416508c8683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405222498f7e416508c8=
684
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/6405224d2f9ae0f2e88c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405224d2f9ae0f2e88c8=
636
        failing since 14 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640522b4d680057b228c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640522b4d680057b228c8=
640
        failing since 16 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/640523538d8739ac698c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640523538d8739ac698c8=
64d
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/6405240460556347d08c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405240460556347d08c8=
659
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/640525803ba5b95cd78c8681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640525803ba5b95cd78c8=
682
        failing since 14 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/640520c8689ee1c6248c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640520c8689ee1c6248c8=
64e
        failing since 14 days (last pass: v6.2-rc6-351-gf42837eac380f, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6405226c0b5112d1ef8c8779

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405226c0b5112d1ef8c8=
77a
        failing since 14 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/640522950f2ac3613e8c8666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640522950f2ac3613e8c8=
667
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/640523fd60556347d08c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640523fd60556347d08c8=
64a
        failing since 14 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640523fe9a33965bc48c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640523fe9a33965bc48c8=
63d
        failing since 16 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/6405258dcbd21c5f238c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405258dcbd21c5f238c8=
636
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/6405265508094969b98c86be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405265508094969b98c8=
6bf
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/640528aeac38209ee28c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640528aeac38209ee28c8=
63e
        failing since 14 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/640520a9689ee1c6248c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640520a9689ee1c6248c8=
635
        failing since 14 days (last pass: v6.2-rc6-351-gf42837eac380f, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/640521fa998c80a2f68c86d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640521fa998c80a2f68c8=
6d9
        failing since 14 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/6405222598f7e416508c8689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405222598f7e416508c8=
68a
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/640522710b5112d1ef8c877c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640522710b5112d1ef8c8=
77d
        failing since 14 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6405229d0f2ac3613e8c868a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405229d0f2ac3613e8c8=
68b
        failing since 16 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/6405239d46101506c48c8671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405239d46101506c48c8=
672
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/640524059a33965bc48c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640524059a33965bc48c8=
651
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6405255a7f26f1aed88c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x8=
6_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x8=
6_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405255a7f26f1aed88c8=
65f
        failing since 14 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/640520d102c71f5bc98c8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640520d102c71f5bc98c8=
644
        failing since 14 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6405220f65994d23798c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405220f65994d23798c8=
63b
        failing since 19 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/6405222598f7e416508c8686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405222598f7e416508c8=
687
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/6405224c2f9ae0f2e88c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405224c2f9ae0f2e88c8=
630
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640522b5d680057b228c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640522b5d680057b228c8=
64e
        failing since 14 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/64052354f74a97f0f18c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052354f74a97f0f18c8=
631
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/6405240560556347d08c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405240560556347d08c8=
65f
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/640525bc62831994418c8674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640525bc62831994418c8=
675
        failing since 14 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/640520c9689ee1c6248c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640520c9689ee1c6248c8=
651
        failing since 14 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64052245a956ad126d8c87e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052245a956ad126d8c8=
7e7
        failing since 19 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/640522a93885023bee8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640522a93885023bee8c8=
632
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/640523ad2e140c46288c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640523ad2e140c46288c8=
633
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64052425bcd6224c9a8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052425bcd6224c9a8c8=
631
        failing since 14 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/640525a1cbd21c5f238c866d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640525a1cbd21c5f238c8=
66e
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/640526561ecbc964498c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640526561ecbc964498c8=
630
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/640528c2ac38209ee28c8685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640528c2ac38209ee28c8=
686
        failing since 14 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/640520bd3ec436b0678c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640520bd3ec436b0678c8=
645
        failing since 14 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/640521f8998c80a2f68c86d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640521f8998c80a2f68c8=
6d6
        failing since 19 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/6405222665994d23798c865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405222665994d23798c8=
65d
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/6405224d2f9ae0f2e88c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405224d2f9ae0f2e88c8=
633
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6405229f0f2ac3613e8c8698

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405229f0f2ac3613e8c8=
699
        failing since 14 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/640523b52e140c46288c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640523b52e140c46288c8=
646
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/64052415344370ea328c86b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052415344370ea328c8=
6b5
        failing since 19 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6405256d66addead158c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x8=
6_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x8=
6_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405256d66addead158c8=
630
        failing since 14 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640525b862831994418c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640525b862831994418c8=
651
        failing since 80 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6405239f46101506c48c8683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405239f46101506c48c8=
684
        failing since 80 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6405272bfc07164cad8c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6405272bfc07164cad8c8=
645
        failing since 26 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64052741b2f3400c688c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052741b2f3400c688c8=
63b
        failing since 26 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64052730fc07164cad8c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabo=
ra/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64052730fc07164cad8c8=
64b
        failing since 26 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/640529d9e165b518788c8670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananap=
i-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananap=
i-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640529d9e165b518788c8=
671
        new failure (last pass: v6.2-13370-g5872d227b73f) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6405227c82431dbe3f8c869b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6405227c82431dbe3f8c86a4
        failing since 2 days (last pass: v6.2-12625-g13efc3a9f23b, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-03-05T23:14:54.223247  / # #
    2023-03-05T23:14:54.328790  export SHELL=3D/bin/sh
    2023-03-05T23:14:54.330369  #
    2023-03-05T23:14:54.434462  / # export SHELL=3D/bin/sh. /lava-3388386/e=
nvironment
    2023-03-05T23:14:54.436159  =

    2023-03-05T23:14:54.539650  / # . /lava-3388386/environment/lava-338838=
6/bin/lava-test-runner /lava-3388386/1
    2023-03-05T23:14:54.542349  =

    2023-03-05T23:14:54.548271  / # /lava-3388386/bin/lava-test-runner /lav=
a-3388386/1
    2023-03-05T23:14:54.689181  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-05T23:14:54.690247  + cd /lava-3388386/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640523ec830ffa25258c8676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13684-=
gf93c476d9769/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640523ec830ffa25258c8=
677
        failing since 80 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
