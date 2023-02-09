Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753AA6902D5
	for <lists+linux-next@lfdr.de>; Thu,  9 Feb 2023 10:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjBIJGP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Feb 2023 04:06:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjBIJGO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Feb 2023 04:06:14 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8A4113F0
        for <linux-next@vger.kernel.org>; Thu,  9 Feb 2023 01:06:10 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id ge7-20020a17090b0e0700b002312568942cso3133986pjb.3
        for <linux-next@vger.kernel.org>; Thu, 09 Feb 2023 01:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0kQp6YwFs/kR+aM7KSFQCVT1IUn+DRE9wKsMJds/jZE=;
        b=cg3d9tEJwy0xv2qAl4u2ZsodeP2k/A9lE96R83gfujLk17ghFOhGnrgkil359QZPOb
         UJD22039EtSpxHw4n2Qo0c/hze+5UYJv398zqkTB4hSf07DxGh5Gka5leayPQPs0AVIw
         /r3kPVGqDprG6mKJ/eP4tpwAt6oUpdt9xeLg8fajp2qPgNOVuIusrQ11QCJd2iPWWskX
         oclUKf15k60jxBHBlnlU7LZEtWR+VdK2V1PXnC0VqU4uZLJdhMwEMooIHEI05bwCD9iJ
         y+oiQ2TEDrPrRWAgGTjzbKi6ZLpTL6LQ88MeaEGCoZOVeH1YxqwNCIxhwrJ5UdFejXis
         +BhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kQp6YwFs/kR+aM7KSFQCVT1IUn+DRE9wKsMJds/jZE=;
        b=5V+/CqjpYDoR+ZVJjF2mdAAjll+LB0LDuH01uGzcJnkPP39X2QGpwMbsR+c98kf8Ff
         upU+prxyP9egpFN+xfkamo4NpLsj+bT2qeIHxVM8dRhzBKfrEDY8Ktvg0aalKxexUAsS
         zDMyjFOxaAAkRepe3UtWmlHvf6jziRNuSkMw9jWUL08vzCntqZ2bU+SOOrMDtOAKu9c8
         26eVEUOHwFBXqNw/VE1WLZ8EZvxIdR0gFPd2AHxaTJdFBWW48hSFjB5qV3UqEbCaz5aH
         VhFdlDwkN6mbA+QQlU9m+leRfZuwX1JcdV0j1U3dzZSoQ7NO7W7kOK7HzDd0izfWPbr+
         3/yg==
X-Gm-Message-State: AO0yUKX2EMaMBreG7XGahmrrT3Z1X7X/MPJLRKiPxOwLhEyTu0DYKH0I
        UosLB4PQq21PJEoWd44mDrfK7z1USwiu8sQh9zM9PA==
X-Google-Smtp-Source: AK7set+YmO0/6XOkwGMrOjtOgvVpY9DxG23+b3pR71TKV3zvtXP7mqOkbDXoJYHwxSLFpVLB3/zAKQ==
X-Received: by 2002:a17:902:ca83:b0:198:e39a:b9ca with SMTP id v3-20020a170902ca8300b00198e39ab9camr8249743pld.23.1675933567524;
        Thu, 09 Feb 2023 01:06:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ju18-20020a170903429200b001949b92f8a8sm904678plb.279.2023.02.09.01.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 01:06:07 -0800 (PST)
Message-ID: <63e4b77f.170a0220.a8188.15ea@mx.google.com>
Date:   Thu, 09 Feb 2023 01:06:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230209
X-Kernelci-Report-Type: test
Subject: next/master baseline: 916 runs, 205 regressions (next-20230209)
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

next/master baseline: 916 runs, 205 regressions (next-20230209)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 2          =

hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 2          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =

imx53-qsrb                   | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =

jetson-tk1                   | arm    | lab-baylibre    | clang-13 | cros:/=
/chrome...avour.config | 1          =

jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 5          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 19         =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

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

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 2          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 2          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 2          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230209/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230209
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      20f513df926fac0594a3b65f79d856bd64251861 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/63e47d4487e2ccdede8c8647

  Results:     4 PASS, 3 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e47d4487e2ccd=
ede8c864a
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:30.752403  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected<8>[   13.659845] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e47d4487e2ccde=
de8c864c
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:30.185391  / # =


    2023-02-09T04:57:30.191516  =


    2023-02-09T04:57:30.293179  / # #

    2023-02-09T04:57:30.298981  #

    2023-02-09T04:57:30.400000  / # export SHELL=3D/bin/sh

    2023-02-09T04:57:30.405780  export SHELL=3D/bin/sh

    2023-02-09T04:57:30.506540  / # . /lava-9074911/environment

    2023-02-09T04:57:30.512364  . /lava-9074911/environment

    2023-02-09T04:57:30.613284  / # /lava-9074911/bin/lava-test-runner /lav=
a-9074911/0

    2023-02-09T04:57:30.618973  /lava-9074911/bin/lava-test-runner /lava-90=
74911/0
 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48fbe8f693acec38c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48fbe8f693acec38c8=
64b
        failing since 145 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e491effed57830508c8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e491effed57830508c8=
664
        failing since 147 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/63e47d63e72b94e3bd8c8635

  Results:     4 PASS, 3 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C433TA-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C433TA-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e47d63e72b94e=
3bd8c8638
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:42.714671  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected<8>[   16.610883] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e47d63e72b94e3=
bd8c863a
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:42.134797  / # =


    2023-02-09T04:57:42.140234  =


    2023-02-09T04:57:42.241859  / # #

    2023-02-09T04:57:42.246782  #

    2023-02-09T04:57:42.347759  / # export SHELL=3D/bin/sh

    2023-02-09T04:57:42.353556  export SHELL=3D/bin/sh

    2023-02-09T04:57:42.454291  / # . /lava-9074918/environment

    2023-02-09T04:57:42.459883  . /lava-9074918/environment

    2023-02-09T04:57:42.560808  / # /lava-9074918/bin/lava-test-runner /lav=
a-9074918/0

    2023-02-09T04:57:42.566489  /lava-9074918/bin/lava-test-runner /lava-90=
74918/0
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/63e47d631f57f2d8b58c8632

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e47d631f57f2d=
8b58c8635
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:42.957821  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected from SLUB object 'skbuff_small_head' (offset 0, size =
82)!

    2023-02-09T04:57:42.967656  kern<8>[   15.650470] <LAVA_SIGNAL_TESTCASE=
 TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e47d631f57f2d8=
b58c8637
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:42.381633  / # =


    2023-02-09T04:57:42.389024  =


    2023-02-09T04:57:42.494889  / # #

    2023-02-09T04:57:42.501347  #

    2023-02-09T04:57:42.603582  / # export SHELL=3D/bin/sh

    2023-02-09T04:57:42.609700  export SHELL=3D/bin/sh

    2023-02-09T04:57:42.711676  / # . /lava-9074908/environment

    2023-02-09T04:57:42.717777  . /lava-9074908/environment

    2023-02-09T04:57:42.819746  / # /lava-9074908/bin/lava-test-runner /lav=
a-9074908/0

    2023-02-09T04:57:42.825817  /lava-9074908/bin/lava-test-runner /lava-90=
74908/0
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/63e47d4ffbf8aed9878c8630

  Results:     4 PASS, 3 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e47d4ffbf8aed=
9878c8633
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:36.478460  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected from SLUB object 'skbuff_small_head' (offset 0, size =
82)!

    2023-02-09T04:57:36.491553  kern  :emerg : usercopy: Kernel memory over=
write attempt detected to SLUB object 'skbuff_small_head' (offset 0, size 2=
0)!

    2023-02-09T04:57:36.508376  kern  :emerg : usercopy: Kernel memory over=
write attempt detected to SLUB<8>[   15.873619] <LAVA_SIGNAL_TESTCASE TEST_=
CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e47d4ffbf8aed9=
878c8635
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:35.615130  / # =


    2023-02-09T04:57:35.620315  =


    2023-02-09T04:57:35.721953  / # #

    2023-02-09T04:57:35.727195  #

    2023-02-09T04:57:35.827986  / # export SHELL=3D/bin/sh

    2023-02-09T04:57:35.833164  export SHELL=3D/bin/sh

    2023-02-09T04:57:35.934070  / # . /lava-9074903/environment

    2023-02-09T04:57:35.939783  . /lava-9074903/environment

    2023-02-09T04:57:36.040681  / # /lava-9074903/bin/lava-test-runner /lav=
a-9074903/0

    2023-02-09T04:57:36.045885  /lava-9074903/bin/lava-test-runner /lava-90=
74903/0
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/63e47d61fbf8aed9878c8641

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e47d61fbf8aed=
9878c8644
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:45.201804  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected<8>[   13.364782] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e47d61fbf8aed9=
878c8646
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:44.626901  / # =


    2023-02-09T04:57:44.633619  =


    2023-02-09T04:57:44.740425  / # #

    2023-02-09T04:57:44.746839  #

    2023-02-09T04:57:44.849431  / # export SHELL=3D/bin/sh

    2023-02-09T04:57:44.856122  export SHELL=3D/bin/sh

    2023-02-09T04:57:44.958079  / # . /lava-9074892/environment

    2023-02-09T04:57:44.964711  . /lava-9074892/environment

    2023-02-09T04:57:45.067025  / # /lava-9074892/bin/lava-test-runner /lav=
a-9074892/0

    2023-02-09T04:57:45.073556  /lava-9074892/bin/lava-test-runner /lava-90=
74892/0
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47eab187c2f36948c865f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e47eab187c2f36948c8668
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:03:20.425350  + set +x
    2023-02-09T05:03:20.429401  <8>[   18.393319] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 281943_1.5.2.4.1>
    2023-02-09T05:03:20.561788  / # #
    2023-02-09T05:03:20.664128  export SHELL=3D/bin/sh
    2023-02-09T05:03:20.664732  #
    2023-02-09T05:03:20.766258  / # export SHELL=3D/bin/sh. /lava-281943/en=
vironment
    2023-02-09T05:03:20.766851  =

    2023-02-09T05:03:20.868504  / # . /lava-281943/environment/lava-281943/=
bin/lava-test-runner /lava-281943/1
    2023-02-09T05:03:20.869293  =

    2023-02-09T05:03:20.875425  / # /lava-281943/bin/lava-test-runner /lava=
-281943/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e483efe0930c871d8c8644

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e483efe0930c871d8c864d
        failing since 21 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-09T05:25:54.930230  + set +x<8>[   14.289654] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3310957_1.5.2.4.1>
    2023-02-09T05:25:54.930474  =

    2023-02-09T05:25:55.036854  / # #
    2023-02-09T05:25:55.138353  export SHELL=3D/bin/sh
    2023-02-09T05:25:55.138746  #
    2023-02-09T05:25:55.239910  / # export SHELL=3D/bin/sh. /lava-3310957/e=
nvironment
    2023-02-09T05:25:55.240356  =

    2023-02-09T05:25:55.341592  / # . /lava-3310957/environment/lava-331095=
7/bin/lava-test-runner /lava-3310957/1
    2023-02-09T05:25:55.342169  =

    2023-02-09T05:25:55.347403  / # /lava-3310957/bin/lava-test-runner /lav=
a-3310957/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48247f0feb987318c866a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e48247f0feb987318c8673
        failing since 21 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-09T05:18:14.299972  <8>[   14.659090] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3310888_1.5.2.4.1>
    2023-02-09T05:18:14.409423  / # #
    2023-02-09T05:18:14.512233  export SHELL=3D/bin/sh
    2023-02-09T05:18:14.513135  #
    2023-02-09T05:18:14.614928  / # export SHELL=3D/bin/sh. /lava-3310888/e=
nvironment
    2023-02-09T05:18:14.615696  =

    2023-02-09T05:18:14.616113  / # . /lava-3310888/environment<3>[   14.96=
8085] Bluetooth: hci0: command 0x0c03 tx timeout
    2023-02-09T05:18:14.717813  /lava-3310888/bin/lava-test-runner /lava-33=
10888/1
    2023-02-09T05:18:14.719067  =

    2023-02-09T05:18:14.724111  / # /lava-3310888/bin/lava-test-runner /lav=
a-3310888/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e482c9646a0433e38c8675

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e482c9646a0433e38c867e
        failing since 21 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-09T05:20:51.910823  <8>[   16.709755] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3310925_1.5.2.4.1>
    2023-02-09T05:20:52.020544  / # #
    2023-02-09T05:20:52.123838  export SHELL=3D/bin/sh
    2023-02-09T05:20:52.124305  #
    2023-02-09T05:20:52.225764  / # export SHELL=3D/bin/sh. /lava-3310925/e=
nvironment
    2023-02-09T05:20:52.226839  =

    2023-02-09T05:20:52.329228  / # . /lava-3310925/environment/lava-331092=
5/bin/lava-test-runner /lava-3310925/1
    2023-02-09T05:20:52.330654  =

    2023-02-09T05:20:52.335600  / # /lava-3310925/bin/lava-test-runner /lav=
a-3310925/1
    2023-02-09T05:20:52.419128  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48363a14de5ea668c8655

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e48363a14de5ea668c865e
        failing since 22 days (last pass: next-20221219, first fail: next-2=
0230117)

    2023-02-09T05:23:30.681957  <8>[   15.303325] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3310937_1.5.2.4.1>
    2023-02-09T05:23:30.788399  / # #
    2023-02-09T05:23:30.889745  export SHELL=3D/bin/sh
    2023-02-09T05:23:30.890107  #
    2023-02-09T05:23:30.991293  / # export SHELL=3D/bin/sh. /lava-3310937/e=
nvironment
    2023-02-09T05:23:30.991766  =

    2023-02-09T05:23:31.092989  / # . /lava-3310937/environment/lava-331093=
7/bin/lava-test-runner /lava-3310937/1
    2023-02-09T05:23:31.093993  =

    2023-02-09T05:23:31.098269  / # /lava-3310937/bin/lava-test-runner /lav=
a-3310937/1
    2023-02-09T05:23:31.190461  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/63e47d771f57f2d8b58c8653

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e47d771f57f2d=
8b58c8656
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:59.430228  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected<8>[   15.775646] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e47d771f57f2d8=
b58c8658
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:58.823120  / # =


    2023-02-09T04:57:58.826028  =


    2023-02-09T04:57:58.932336  / # #

    2023-02-09T04:57:58.936133  #

    2023-02-09T04:57:59.038433  / # export SHELL=3D/bin/sh

    2023-02-09T04:57:59.041421  export SHELL=3D/bin/sh

    2023-02-09T04:57:59.143005  / # . /lava-9074896/environment

    2023-02-09T04:57:59.146402  . /lava-9074896/environment

    2023-02-09T04:57:59.248349  / #/lava-9074896/bin/lava-test-runner /lava=
-9074896/0

    2023-02-09T04:57:59.251818   /lava-9074896/bin/lava-test-runner /lava-9=
074896/0
 =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/63e47d72e72b94e3bd8c864d

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e47d72e72b94e=
3bd8c8650
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:58:08.391310  <8>[   12.778003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-02-09T04:58:08.415077  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected<8>[   12.801224] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e47d72e72b94e3=
bd8c8652
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:58:07.872311  / # =


    2023-02-09T04:58:07.875456  =


    2023-02-09T04:58:07.982342  / ##

    2023-02-09T04:58:07.986546   #

    2023-02-09T04:58:08.089337  / # export SHELL=3D/bin/sh

    2023-02-09T04:58:08.092584  export SHELL=3D/bin/sh

    2023-02-09T04:58:08.194666  / # . /lava-9074906/environment

    2023-02-09T04:58:08.197163  . /lava-9074906/environment

    2023-02-09T04:58:08.299530  / # /lava-9074906/bin/lava-test-runner /lav=
a-9074906/0

    2023-02-09T04:58:08.302305  /lava-9074906/bin/lava-test-runner /lava-90=
74906/0
 =

    ... (8 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/63e484ac8ff6248c2a8c8649

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e484ac8ff6248c=
2a8c864c
        new failure (last pass: next-20230207)
        3 lines

    2023-02-09T05:28:59.425273  / # #
    2023-02-09T05:28:59.529712  #
    2023-02-09T05:28:59.631620  export SHELL=3D/bin/sh
    2023-02-09T05:28:59.733098  . /lava-1154910/environment
    2023-02-09T05:28:59.834476  /lava-1154910/bin/lava-test-runner /lava-11=
54910/0
    2023-02-09T05:28:59.835770  =

    2023-02-09T05:28:59.835978  / # =

    2023-02-09T05:28:59.836161  / # #
    2023-02-09T05:28:59.836339  / # export SHELL=3D/bin/sh
    2023-02-09T05:28:59.836522  / # . /lava-1154910/environment =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e484ac8ff6248=
c2a8c864e
        new failure (last pass: next-20230207)
        9 lines

    2023-02-09T05:29:00.143204  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected from SLUB object 'skbuff_small_head' (offset 0, size =
82)!
    2023-02-09T05:29:00.152289  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2023-02-09T05:29:00.163313  kern  :emerg : Code: aa1303e3 f000dd60 9134=
2000 97f4a6[   20.151097] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=
=3Dfail UNITS=3Dlines MEASUREMENT=3D9>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/63e481717601f689d78c863d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/risc=
v/defconfig+kselftest/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/risc=
v/defconfig+kselftest/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/riscv/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e481717601f68=
9d78c8640
        new failure (last pass: next-20230208)
        6 lines

    2023-02-09T05:15:19.467737  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected from SLUB object 'skbuff_small_head' (offset 0, size =
92)!
    2023-02-09T05:15:19.468926  kern  :emerg : Kernel BUG [#1]
    2023-02-09T05:15:19.471860  kern  :emerg : usercopy: Kernel memory over=
write attempt detected to SLUB object 'skbuff_small_head' (offset 0, size 2=
0)!
    2023-02-09T05:15:19.474595  kern  :emerg : Ke<8>[   28.650043] <LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D6>   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e481717601f689=
d78c8642
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T05:15:10.045999  / # =

    2023-02-09T05:15:10.046773  =

    2023-02-09T05:15:12.112686  / # #
    2023-02-09T05:15:12.113284  #
    2023-02-09T05:15:14.124734  / # export SHELL=3D/bin/sh
    2023-02-09T05:15:14.125220  export SHELL=3D/bin/sh
    2023-02-09T05:15:16.142132  / # . /lava-3310857/environment
    2023-02-09T05:15:16.142542  . /lava-3310857/environment
    2023-02-09T05:15:18.157308  / # /lava-3310857/bin/lava-test-runner /lav=
a-3310857/0
    2023-02-09T05:15:18.158478  /lava-3310857/bin/lava-test-runner /lava-33=
10857/0 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/63e47d3978ad1e6be58c8648

  Results:     17 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e47d3978ad1e6=
be58c864b
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:16.810534  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected from SLUB object 'skbuff_small_head' (offset 0, size =
82)!

    2023-02-09T04:57:16.821188  kern  :emerg : usercopy: Kernel memory over=
write attempt detected to SLUB object 'skbuff_small_head' (offset 0, size 2=
0)!

    2023-02-09T04:57:16.830375  kern  :em<8>[   14.031356] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e47d3978ad1e6b=
e58c864d
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:16.229253  / # =


    2023-02-09T04:57:16.231361  =


    2023-02-09T04:57:16.333004  / # #

    2023-02-09T04:57:16.335073  #

    2023-02-09T04:57:16.436269  / # export SHELL=3D/bin/sh

    2023-02-09T04:57:16.438610  export SHELL=3D/bin/sh

    2023-02-09T04:57:16.539479  / # . /lava-9074904/environment

    2023-02-09T04:57:16.541263  . /lava-9074904/environment

    2023-02-09T04:57:16.642794  / # /lava-9074904/bin/lava-test-runner /lav=
a-9074904/0

    2023-02-09T04:57:16.644642  /lava-9074904/bin/lava-test-runner /lava-90=
74904/0
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/63e47d4db6a7faef268c8635

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e47d4db6a7fae=
f268c8638
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:25.640040  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected from SLUB object 'skbuff_small_head' (offset 0, size =
82)!

    2023-02-09T04:57:25.652938  kern  :emerg : usercopy: Kernel memory over=
write attempt detected to SLUB object 'skbuff_small_head' (offset 0, size 2=
0)!

    2023-02-09T04:57:25.662766  kern  :em<8>[   15.178971] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e47d4db6a7faef=
268c863a
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:57:24.874722  / # =


    2023-02-09T04:57:24.879331  =


    2023-02-09T04:57:24.981164  / # #

    2023-02-09T04:57:24.985822  #

    2023-02-09T04:57:25.086799  / # export SHELL=3D/bin/sh

    2023-02-09T04:57:25.091432  export SHELL=3D/bin/sh

    2023-02-09T04:57:25.192331  / # . /lava-9074887/environment

    2023-02-09T04:57:25.196950  . /lava-9074887/environment

    2023-02-09T04:57:25.297760  / # /lava-9074887/bin/lava-test-runner /lav=
a-9074887/0

    2023-02-09T04:57:25.302358  /lava-9074887/bin/lava-test-runner /lava-90=
74887/0
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 2          =


  Details:     https://kernelci.org/test/plan/id/63e47d8682e91bc57c8c864e

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e47d8682e91bc=
57c8c8651
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:58:33.513225  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected<8>[   91.639438] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e47d8682e91bc5=
7c8c8653
        new failure (last pass: next-20230208)
        3 lines

    2023-02-09T04:58:32.931873  / # =


    2023-02-09T04:58:32.939106  =


    2023-02-09T04:58:33.046418  / # #

    2023-02-09T04:58:33.053402  #

    2023-02-09T04:58:33.156213  / # export SHELL=3D/bin/sh

    2023-02-09T04:58:33.163344  export SHELL=3D/bin/sh

    2023-02-09T04:58:33.265639  / # . /lava-9074888/environment

    2023-02-09T04:58:33.272382  . /lava-9074888/environment

    2023-02-09T04:58:33.374620  / # /lava-9074888/bin/lava-test-runner /lav=
a-9074888/0

    2023-02-09T04:58:33.381242  /lava-9074888/bin/lava-test-runner /lava-90=
74888/0
 =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e482ca646a0433e38c8680

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e482ca646a0433e38c8689
        failing since 9 days (last pass: next-20221206, first fail: next-20=
230130)

    2023-02-09T05:20:58.419387  + set +x
    2023-02-09T05:20:58.419560  [   13.196288] <LAVA_SIGNAL_ENDRUN 0_dmesg =
901691_1.5.2.3.1>
    2023-02-09T05:20:58.527084  / # #
    2023-02-09T05:20:58.628770  export SHELL=3D/bin/sh
    2023-02-09T05:20:58.629284  #
    2023-02-09T05:20:58.730454  / # export SHELL=3D/bin/sh. /lava-901691/en=
vironment
    2023-02-09T05:20:58.730944  =

    2023-02-09T05:20:58.832138  / # . /lava-901691/environment/lava-901691/=
bin/lava-test-runner /lava-901691/1
    2023-02-09T05:20:58.832830  =

    2023-02-09T05:20:58.835927  / # /lava-901691/bin/lava-test-runner /lava=
-901691/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e481da3aa3b642548c865c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e481da3aa3b642548c8665
        failing since 9 days (last pass: next-20221205, first fail: next-20=
230130)

    2023-02-09T05:16:53.135133  + set +x
    2023-02-09T05:16:53.135303  [   13.071369] <LAVA_SIGNAL_ENDRUN 0_dmesg =
901676_1.5.2.3.1>
    2023-02-09T05:16:53.242835  / # #
    2023-02-09T05:16:53.344410  export SHELL=3D/bin/sh
    2023-02-09T05:16:53.345022  #
    2023-02-09T05:16:53.446235  / # export SHELL=3D/bin/sh. /lava-901676/en=
vironment
    2023-02-09T05:16:53.446740  =

    2023-02-09T05:16:53.547894  / # . /lava-901676/environment/lava-901676/=
bin/lava-test-runner /lava-901676/1
    2023-02-09T05:16:53.548537  =

    2023-02-09T05:16:53.551980  / # /lava-901676/bin/lava-test-runner /lava=
-901676/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4822bf25cdd75d28c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e4822bf25cdd75d28c8638
        failing since 9 days (last pass: next-20221206, first fail: next-20=
230130)

    2023-02-09T05:18:15.338845  + set +x
    2023-02-09T05:18:15.339024  [   12.105671] <LAVA_SIGNAL_ENDRUN 0_dmesg =
901683_1.5.2.3.1>
    2023-02-09T05:18:15.446480  / # #
    2023-02-09T05:18:15.548430  export SHELL=3D/bin/sh
    2023-02-09T05:18:15.548861  #
    2023-02-09T05:18:15.650434  / # export SHELL=3D/bin/sh. /lava-901683/en=
vironment
    2023-02-09T05:18:15.651015  =

    2023-02-09T05:18:15.752289  / # . /lava-901683/environment/lava-901683/=
bin/lava-test-runner /lava-901683/1
    2023-02-09T05:18:15.753001  =

    2023-02-09T05:18:15.755880  / # /lava-901683/bin/lava-test-runner /lava=
-901683/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48279a2855c4dc38c865d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e4827aa2855c4dc38c8666
        failing since 9 days (last pass: next-20221206, first fail: next-20=
230130)

    2023-02-09T05:19:36.922765  + set +x
    2023-02-09T05:19:36.923212  [   13.165419] <LAVA_SIGNAL_ENDRUN 0_dmesg =
901685_1.5.2.3.1>
    2023-02-09T05:19:37.031603  / # #
    2023-02-09T05:19:37.133827  export SHELL=3D/bin/sh
    2023-02-09T05:19:37.134464  #
    2023-02-09T05:19:37.235696  / # export SHELL=3D/bin/sh. /lava-901685/en=
vironment
    2023-02-09T05:19:37.236315  =

    2023-02-09T05:19:37.337595  / # . /lava-901685/environment/lava-901685/=
bin/lava-test-runner /lava-901685/1
    2023-02-09T05:19:37.338301  =

    2023-02-09T05:19:37.341418  / # /lava-901685/bin/lava-test-runner /lava=
-901685/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e484f8ea2e02a7208c8728

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e484f8ea2e02a7208c8=
729
        failing since 183 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e484bcdf10a6fb2d8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e484bcdf10a6fb2d8c8=
632
        failing since 170 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48e02f1d5d4d5ca8c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48e02f1d5d4d5ca8c8=
64a
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48031c6e586ba2e8c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48031c6e586ba2e8c8=
641
        failing since 34 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e481dfe9b4a632878c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e481dfe9b4a632878c8=
631
        failing since 34 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e486ddad43589ed78c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e486ddad43589ed78c8=
637
        failing since 35 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48834baa5766cc78c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48834baa5766cc78c8=
630
        failing since 34 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4842fe28067822c8c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-bayli=
bre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-bayli=
bre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4842fe28067822c8c8=
64f
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e484e2ea2e02a7208c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e484e2ea2e02a7208c8=
63f
        failing since 169 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47f69595e423a5d8c8687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e47f69595e423a5d8c8=
688
        failing since 303 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e481e7309c9e3fb68c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e481e7309c9e3fb68c8=
64a
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/63e4862957fa211bed8c8630

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e4862957fa211=
bed8c8633
        new failure (last pass: next-20230207)
        9 lines

    2023-02-09T05:35:15.628738  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected from SLUB object 'skbuff_small_head' (offset 0, size =
82)!
    2023-02-09T05:35:15.629285  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2023-02-09T05:35:15.630077  kern  :emerg : Code: aa1303e3 f000dd60 9134=
2000 97f4a69e (d4210000) =

    2023-02-09T05:35:15.630487  kern  :emerg : usercopy: Kernel memory over=
write attempt detected to SLUB object 'skbuff_small_head' (offset 0, size 2=
0)!
    2023-02-09T05:35:15.632233  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#2] PREEMPT SMP
    2023-02-09T05:35:15.671981  kern  :emerg : Code: aa1303e3 f000dd60 9134=
2000 97f4a69e (d<8>[   38.692455] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demer=
g RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>
    2023-02-09T05:35:15.672543  4210000) =

    2023-02-09T05:35:15.673035  kern  :emerg : usercopy: Kernel memory over=
write attempt detected to SLUB obj<8>[   38.709194] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 282360_1.5.2.4.1>   =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e4862957fa211b=
ed8c8635
        new failure (last pass: next-20230207)
        3 lines

    2023-02-09T05:35:14.510875  / # =

    2023-02-09T05:35:14.531629  =

    2023-02-09T05:35:14.637978  / # #
    2023-02-09T05:35:14.659487  #
    2023-02-09T05:35:14.761936  / # export SHELL=3D/bin/sh
    2023-02-09T05:35:14.771354  export SHELL=3D/bin/sh
    2023-02-09T05:35:14.873300  / # . /lava-282360/environment
    2023-02-09T05:35:14.883203  . /lava-282360/environment
    2023-02-09T05:35:14.985178  / # /lava-282360/bin/lava-test-runner /lava=
-282360/0
    2023-02-09T05:35:14.995045  /lava-282360/bin/lava-test-runner /lava-282=
360/0 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63e483fc3dcf8389918c8719

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e483fc3dcf8389918c8720
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30208)

    2023-02-09T05:26:09.846907  / # #
    2023-02-09T05:26:09.948701  export SHELL=3D/bin/sh
    2023-02-09T05:26:09.949294  #
    2023-02-09T05:26:10.050510  / # export SHELL=3D/bin/sh. /lava-269746/en=
vironment
    2023-02-09T05:26:10.051096  =

    2023-02-09T05:26:10.152390  / # . /lava-269746/environment/lava-269746/=
bin/lava-test-runner /lava-269746/1
    2023-02-09T05:26:10.153177  =

    2023-02-09T05:26:10.158017  / # /lava-269746/bin/lava-test-runner /lava=
-269746/1
    2023-02-09T05:26:10.239290  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-09T05:26:10.239549  + <8>[   22.477453] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 269746_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e483fc3dcf8389918c8724
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30208)

    2023-02-09T05:26:12.322247  /lava-269746/1/../bin/lava-test-case
    2023-02-09T05:26:12.322540  <8>[   24.584516] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-09T05:26:12.322689  /lava-269746/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e483fc3dcf8389918c8726
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30208)

    2023-02-09T05:26:13.378586  /lava-269746/1/../bin/lava-test-case
    2023-02-09T05:26:13.378880  <8>[   25.621082] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-09T05:26:13.379030  /lava-269746/1/../bin/lava-test-case
    2023-02-09T05:26:13.379169  <8>[   25.637690] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-09T05:26:13.379307  /lava-269746/1/../bin/lava-test-case
    2023-02-09T05:26:13.379439  <8>[   25.656517] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-09T05:26:13.379573  /lava-269746/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e483fc3dcf8389918c872b
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30208)

    2023-02-09T05:26:14.454330  /lava-269746/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e483fc3dcf8389918c872c
        failing since 0 day (last pass: next-20230206, first fail: next-202=
30208)

    2023-02-09T05:26:14.458046  <8>[   26.732185] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-09T05:26:15.512251  /lava-269746/1/../bin/lava-test-case
    2023-02-09T05:26:15.512550  <8>[   27.752711] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-09T05:26:15.512700  /lava-269746/1/../bin/lava-test-case
    2023-02-09T05:26:15.512840  <8>[   27.768757] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-09T05:26:15.512978  /lava-269746/1/../bin/lava-test-case
    2023-02-09T05:26:15.513111  <8>[   27.787233] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-02-09T05:26:15.513244  /lava-269746/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/63e47f8b727a0c671b8c8706

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e47f8b727a0c671b8c870d
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:06:56.944338  / # #
    2023-02-09T05:06:57.046141  export SHELL=3D/bin/sh
    2023-02-09T05:06:57.046554  #
    2023-02-09T05:06:57.147963  / # export SHELL=3D/bin/sh. /lava-269705/en=
vironment
    2023-02-09T05:06:57.148393  =

    2023-02-09T05:06:57.249728  / # . /lava-269705/environment/lava-269705/=
bin/lava-test-runner /lava-269705/1
    2023-02-09T05:06:57.250400  =

    2023-02-09T05:06:57.256607  / # /lava-269705/bin/lava-test-runner /lava=
-269705/1
    2023-02-09T05:06:57.322664  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-09T05:06:57.323072  + <8>[   22.407077] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 269705_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e47f8b727a0c671b8c8711
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:06:59.419705  /lava-269705/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e47f8b727a0c671b8c8713
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:07:00.475691  /lava-269705/1/../bin/lava-test-case
    2023-02-09T05:07:00.476058  <8>[   25.553265] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e47f8b727a0c671b8c8718
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:07:01.550825  /lava-269705/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e47f8b727a0c671b8c8719
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:07:01.553854  <8>[   26.663399] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-09T05:07:02.610249  /lava-269705/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63e48000443c191a8c8c8630

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e48000443c191a8c8c8637
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:09:07.032798  / # #
    2023-02-09T05:09:07.134834  export SHELL=3D/bin/sh
    2023-02-09T05:09:07.135316  #
    2023-02-09T05:09:07.236721  / # export SHELL=3D/bin/sh. /lava-269707/en=
vironment
    2023-02-09T05:09:07.237154  =

    2023-02-09T05:09:07.338598  / # . /lava-269707/environment/lava-269707/=
bin/lava-test-runner /lava-269707/1
    2023-02-09T05:09:07.339317  =

    2023-02-09T05:09:07.344738  / # /lava-269707/bin/lava-test-runner /lava=
-269707/1
    2023-02-09T05:09:07.412682  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-09T05:09:07.412980  + <8>[   22.517382] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 269707_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e48000443c191a8c8c863b
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:09:09.503831  /lava-269707/1/../bin/lava-test-case
    2023-02-09T05:09:09.504215  <8>[   24.619921] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-09T05:09:09.504465  /lava-269707/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e48000443c191a8c8c863d
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:09:10.560458  /lava-269707/1/../bin/lava-test-case
    2023-02-09T05:09:10.560846  <8>[   25.657500] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-09T05:09:10.561096  /lava-269707/1/../bin/lava-test-case
    2023-02-09T05:09:10.561329  <8>[   25.673799] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e48000443c191a8c8c8642
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:09:10.620667  <8>[   25.749428] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2023-02-09T05:09:11.638957  /lava-269707/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e48000443c191a8c8c8643
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:09:11.642173  <8>[   26.771516] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-09T05:09:12.698515  /lava-269707/1/../bin/lava-test-case
    2023-02-09T05:09:12.698912  <8>[   27.792204] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-09T05:09:12.699158  /lava-269707/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/63e48079501ed953328c863a

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e48079501ed953328c8641
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:10:55.973675  / # #
    2023-02-09T05:10:56.075672  export SHELL=3D/bin/sh
    2023-02-09T05:10:56.076226  #
    2023-02-09T05:10:56.177599  / # export SHELL=3D/bin/sh. /lava-269716/en=
vironment
    2023-02-09T05:10:56.178357  =

    2023-02-09T05:10:56.279817  / # . /lava-269716/environment/lava-269716/=
bin/lava-test-runner /lava-269716/1
    2023-02-09T05:10:56.280700  =

    2023-02-09T05:10:56.285081  / # /lava-269716/bin/lava-test-runner /lava=
-269716/1
    2023-02-09T05:10:56.352793  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-09T05:10:56.353452  + <8>[   22.400714] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 269716_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e48079501ed953328c8645
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:10:58.447029  /lava-269716/1/../bin/lava-test-case
    2023-02-09T05:10:58.447307  <8>[   24.506998] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-09T05:10:58.447461  /lava-269716/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e48079501ed953328c8647
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:10:59.507069  /lava-269716/1/../bin/lava-test-case
    2023-02-09T05:10:59.507437  <8>[   25.544712] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-09T05:10:59.507692  /lava-269716/1/../bin/lava-test-case
    2023-02-09T05:10:59.507922  <8>[   25.562495] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e48079501ed953328c864c
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:11:00.582288  /lava-269716/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e48079501ed953328c864d
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:11:00.585547  <8>[   26.659184] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-09T05:11:01.639946  /lava-269716/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63e480f14a74a4d45a8c8642

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e480f14a74a4d45a8c8649
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:12:54.779560  <8>[   21.916101] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 269719_1.5.2.4.1>
    2023-02-09T05:12:54.883987  / # #
    2023-02-09T05:12:54.985505  export SHELL=3D/bin/sh
    2023-02-09T05:12:54.985972  #
    2023-02-09T05:12:55.087138  / # export SHELL=3D/bin/sh. /lava-269719/en=
vironment
    2023-02-09T05:12:55.087489  =

    2023-02-09T05:12:55.188692  / # . /lava-269719/environment/lava-269719/=
bin/lava-test-runner /lava-269719/1
    2023-02-09T05:12:55.189301  =

    2023-02-09T05:12:55.195013  / # /lava-269719/bin/lava-test-runner /lava=
-269719/1
    2023-02-09T05:12:55.261118  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e480f14a74a4d45a8c864d
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:12:57.355206  /lava-269719/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e480f14a74a4d45a8c864f
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:12:58.412829  /lava-269719/1/../bin/lava-test-case
    2023-02-09T05:12:58.413200  <8>[   25.512002] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-09T05:12:58.413446  /lava-269719/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e480f14a74a4d45a8c8654
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:12:59.488371  /lava-269719/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e480f14a74a4d45a8c8655
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:12:59.492326  <8>[   26.624474] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-09T05:13:00.548922  /lava-269719/1/../bin/lava-test-case
    2023-02-09T05:13:00.549328  <8>[   27.644471] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-09T05:13:00.549569  /lava-269719/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e485781aae93f5f28c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e485781aae93f5f28c8=
637
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =


  Details:     https://kernelci.org/test/plan/id/63e486064986f796848c862f

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e486064986f796848c8636
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:34:35.705463  <8>[   42.993357] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 269766_1.5.2.4.1>
    2023-02-09T05:34:35.809539  / # #
    2023-02-09T05:34:35.911438  export SHELL=3D/bin/sh
    2023-02-09T05:34:35.912131  #
    2023-02-09T05:34:36.013382  / # export SHELL=3D/bin/sh. /lava-269766/en=
vironment
    2023-02-09T05:34:36.014636  =

    2023-02-09T05:34:36.116368  / # . /lava-269766/environment/lava-269766/=
bin/lava-test-runner /lava-269766/1
    2023-02-09T05:34:36.117321  =

    2023-02-09T05:34:36.121223  / # /lava-269766/bin/lava-test-runner /lava=
-269766/1
    2023-02-09T05:34:36.189315  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (19 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e486064986f796848c863a
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:34:38.282437  /lava-269766/1/../bin/lava-test-case
    2023-02-09T05:34:38.282743  <8>[   45.559321] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-09T05:34:38.282897  /lava-269766/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e486064986f796848c863c
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:34:39.342293  /lava-269766/1/../bin/lava-test-case
    2023-02-09T05:34:39.342579  <8>[   46.596960] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-09T05:34:39.342731  /lava-269766/1/../bin/lava-test-case
    2023-02-09T05:34:39.342874  <8>[   46.614640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-09T05:34:39.343015  /lava-269766/1/../bin/lava-test-case
    2023-02-09T05:34:39.343151  <8>[   46.634229] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-09T05:34:39.343288  /lava-269766/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e486064986f796848c8641
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:34:40.418745  /lava-269766/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e486064986f796848c8642
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:34:40.421928  <8>[   47.711902] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-09T05:34:41.476461  /lava-269766/1/../bin/lava-test-case
    2023-02-09T05:34:41.476849  <8>[   48.732050] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-09T05:34:41.477090  /lava-269766/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 5          =


  Details:     https://kernelci.org/test/plan/id/63e487f9a31878bb3f8c8676

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e487f9a31878bb3f8c867d
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:43:09.550471  / # #
    2023-02-09T05:43:09.652413  export SHELL=3D/bin/sh
    2023-02-09T05:43:09.652920  #
    2023-02-09T05:43:09.754552  / # export SHELL=3D/bin/sh. /lava-269778/en=
vironment
    2023-02-09T05:43:09.755315  =

    2023-02-09T05:43:09.856765  / # . /lava-269778/environment/lava-269778/=
bin/lava-test-runner /lava-269778/1
    2023-02-09T05:43:09.857745  =

    2023-02-09T05:43:09.862908  / # /lava-269778/bin/lava-test-runner /lava=
-269778/1
    2023-02-09T05:43:09.930047  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-09T05:43:09.930370  + <8>[   22.481540] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 269778_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e487f9a31878bb3f8c8681
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:43:12.024104  /lava-269778/1/../bin/lava-test-case
    2023-02-09T05:43:12.024443  <8>[   24.587490] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-09T05:43:12.024645  /lava-269778/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e487f9a31878bb3f8c8683
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:43:13.083531  /lava-269778/1/../bin/lava-test-case
    2023-02-09T05:43:13.083925  <8>[   25.625523] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e487f9a31878bb3f8c8688
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:43:14.159202  /lava-269778/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e487f9a31878bb3f8c8689
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207)

    2023-02-09T05:43:14.162447  <8>[   26.739427] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-09T05:43:15.221064  /lava-269778/1/../bin/lava-test-case
    2023-02-09T05:43:15.221461  <8>[   27.760647] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-09T05:43:15.221720  /lava-269778/1/../bin/lava-test-case
    2023-02-09T05:43:15.221944  <8>[   27.777826] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-09T05:43:15.222163  /lava-269778/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/63e47f89727a0c671b8c86cb

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63e47f89727a0c671b8c86dc
        failing since 20 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-09T05:07:05.480241  /lava-269704/1/../bin/lava-test-case
    2023-02-09T05:07:05.483451  <8>[   17.834487] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
47f89727a0c671b8c86de
        failing since 20 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-09T05:07:06.492133  <8>[   18.880482] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-driver-present RESULT=3Dpass>
    2023-02-09T05:07:07.491470  /lava-269704/1/../bin/lava-test-case
    2023-02-09T05:07:07.491847  <8>[   19.908200] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-09T05:07:07.492100  /lava-269704/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63e480782a293579038c8656

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63e480782a293579038c8667
        failing since 20 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-09T05:11:01.258295  /lava-269714/1/../bin/lava-test-case
    2023-02-09T05:11:01.261479  <8>[   17.832887] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
480782a293579038c8669
        failing since 20 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-09T05:11:03.270447  /lava-269714/1/../bin/lava-test-case
    2023-02-09T05:11:03.270831  <8>[   19.906423] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-09T05:11:03.271081  /lava-269714/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63e480f3316b50e19e8c863a

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63e480f3316b50e19e8c864b
        failing since 20 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-09T05:12:56.099828  /lava-269721/1/../bin/lava-test-case
    2023-02-09T05:12:56.102945  <8>[   17.838338] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
480f3316b50e19e8c864d
        failing since 20 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-09T05:12:58.112157  /lava-269721/1/../bin/lava-test-case
    2023-02-09T05:12:58.112542  <8>[   19.912107] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-09T05:12:58.112789  /lava-269721/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 19         =


  Details:     https://kernelci.org/test/plan/id/63e484b08ff6248c2a8c8658

  Results:     58 PASS, 19 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e484b08ff6248c=
2a8c865b
        new failure (last pass: next-20230207)
        3 lines

    2023-02-09T05:28:17.873317  / # #
    2023-02-09T05:28:17.977620  #
    2023-02-09T05:28:18.079492  export SHELL=3D/bin/sh
    2023-02-09T05:28:18.180803  . /lava-269753/environment
    2023-02-09T05:28:18.282159  /lava-269753/bin/lava-test-runner /lava-269=
753/0
    2023-02-09T05:28:18.283654  =

    2023-02-09T05:28:18.283914  / # =

    2023-02-09T05:28:18.284143  / # #
    2023-02-09T05:28:18.284367  / # export SHELL=3D/bin/sh
    2023-02-09T05:28:18.284588  / # . /lava-269753/environment =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e484b08ff6248=
c2a8c865d
        new failure (last pass: next-20230207)
        9 lines

    2023-02-09T05:28:18.575410  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected from SLUB object 'skbuff_small_head' (offset 0, size =
82)!
    2023-02-09T05:28:18.575703  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2023-02-09T05:28:18.575943  kern  :emerg : Code: a<8>[   15.667202] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D9>
    2023-02-09T05:28:18.576171  a1303e3 f000dd60 91342000 97f4a69e (d421000=
0)    =


  * baseline.bootrr.pwm-fan-driver-present: https://kernelci.org/test/case/=
id/63e484b08ff6248c2a8c8662
        new failure (last pass: next-20230207)

    2023-02-09T05:28:20.365372  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:20.386363  <8>[   17.476848] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpwm-fan-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-driver-present: https://kernelci.org/t=
est/case/id/63e484b08ff6248c2a8c8663
        new failure (last pass: next-20230207)

    2023-02-09T05:28:23.507237  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:23.531270  <8>[   20.624517] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dblocked>
    2023-02-09T05:28:24.554873  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:24.579796  <8>[   21.672857] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.asoc-simple-card-driver-present: https://kernelci.org/t=
est/case/id/63e484b08ff6248c2a8c8663
        new failure (last pass: next-20230207)

    2023-02-09T05:28:23.507237  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:23.531270  <8>[   20.624517] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dasoc-simple-card-probed RESULT=3Dblocked>
    2023-02-09T05:28:24.554873  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:24.579796  <8>[   21.672857] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dasoc-simple-card-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
63e484b08ff6248c2a8c8666
        new failure (last pass: next-20230207)

    2023-02-09T05:29:00.764067  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:29:00.786931  <8>[   57.880196] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.wm8904-driver-present: https://kernelci.org/test/case/i=
d/63e484b08ff6248c2a8c8667
        new failure (last pass: next-20230207)

    2023-02-09T05:28:27.798558  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:27.823593  <8>[   24.916845] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-probed RESULT=3Dblocked>
    2023-02-09T05:28:28.847203  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:28.871175  <8>[   25.964280] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dwm8904-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.fsl-sai-driver-present: https://kernelci.org/test/case/=
id/63e484b08ff6248c2a8c8668
        new failure (last pass: next-20230207)

    2023-02-09T05:28:29.894760  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:29.918673  <8>[   27.011813] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dwm8904-probed RESULT=3Dblocked>
    2023-02-09T05:28:30.942364  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:30.966384  <8>[   28.059624] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl-sai-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.caam-driver-present: https://kernelci.org/test/case/id/=
63e484b08ff6248c2a8c868f
        new failure (last pass: next-20230207)

    2023-02-09T05:28:36.009482  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:36.038469  <8>[   33.131470] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-driver-present: https://kernelci.org/test/case/=
id/63e484b08ff6248c2a8c8690
        new failure (last pass: next-20230207)

    2023-02-09T05:28:37.062025  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:37.085931  <8>[   34.178925] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam-probed RESULT=3Dblocked>
    2023-02-09T05:28:38.109694  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:38.134604  <8>[   35.227893] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.qoriq_thermal-driver-present: https://kernelci.org/test=
/case/id/63e484b08ff6248c2a8c8694
        new failure (last pass: next-20230207)

    2023-02-09T05:28:43.503598  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:43.530626  <8>[   40.623636] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dqoriq_thermal-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/63e484b08ff6248c2a8c8699
        new failure (last pass: next-20230207)

    2023-02-09T05:28:45.792761  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:45.818540  <8>[   42.911359] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-wdt-driver-present: https://kernelci.org/test/=
case/id/63e484b08ff6248c2a8c869c
        new failure (last pass: next-20230207)

    2023-02-09T05:28:47.985959  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:48.011953  <8>[   45.105159] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-wdt-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-fan-driver-present: https://kernelci.org/test/=
case/id/63e484b08ff6248c2a8c869d
        new failure (last pass: next-20230207)

    2023-02-09T05:28:49.035480  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:49.060450  <8>[   46.153419] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dblocked>
    2023-02-09T05:28:50.084092  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:50.109096  <8>[   47.201600] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-fan-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-pwm-driver-present: https://kernelci.org/test/=
case/id/63e484b08ff6248c2a8c869e
        new failure (last pass: next-20230207)

    2023-02-09T05:28:51.132720  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:51.156541  <8>[   48.249711] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-fan-probed RESULT=3Dblocked>
    2023-02-09T05:28:52.180263  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:52.205254  <8>[   49.297899] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-pwm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.sl28cpld-gpio-driver-present: https://kernelci.org/test=
/case/id/63e484b08ff6248c2a8c869f
        new failure (last pass: next-20230207)

    2023-02-09T05:28:53.228884  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:53.254901  <8>[   50.347750] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-pwm0-probed RESULT=3Dblocked>
    2023-02-09T05:28:54.278544  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:54.304475  <8>[   51.397205] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-pwm1-probed RESULT=3Dblocked>
    2023-02-09T05:28:55.328067  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:28:55.352310  <8>[   52.445614] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-gpio-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.at24-driver-present: https://kernelci.org/test/case/id/=
63e484b08ff6248c2a8c8666
        new failure (last pass: next-20230207)

    2023-02-09T05:29:00.764067  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:29:00.786931  <8>[   57.880196] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.rtc-rv8803-driver-present: https://kernelci.org/test/ca=
se/id/63e484b08ff6248c2a8c86a2
        new failure (last pass: next-20230207)

    2023-02-09T05:29:01.810578  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:29:01.834438  <8>[   58.927831] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-eeprom0-probed RESULT=3Dblocked>
    2023-02-09T05:29:02.858189  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:29:02.884194  <8>[   59.976807] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dat24-eeprom1-probed RESULT=3Dblocked>
    2023-02-09T05:29:03.907843  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:29:03.932113  <8>[   61.025041] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drtc-rv8803-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.layerscape-sfp-driver-present: https://kernelci.org/tes=
t/case/id/63e484b08ff6248c2a8c86a3
        new failure (last pass: next-20230207)

    2023-02-09T05:29:04.955416  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:29:04.980362  <8>[   62.073047] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drtc-rv8803-rtc-probed RESULT=3Dblocked>
    2023-02-09T05:29:06.004006  /lava-269753/1/../bin/lava-test-case
    2023-02-09T05:29:06.029055  <8>[   63.121511] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlayerscape-sfp-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e486879051fe59f98c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e486879051fe59f98c8=
63f
        failing since 12 days (last pass: next-20230123, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47d4d87e2ccdede8c8670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e47d4d87e2ccdede8c8=
671
        failing since 15 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63e480206d8b32c0ec8c86a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e480206d8b32c0ec8c8=
6a7
        failing since 15 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4811ea1fb7204c18c8696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4811ea1fb7204c18c8=
697
        failing since 15 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e483510de1179d908c8637

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e483510de1179d908c8640
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:23:20.437993  / # #
    2023-02-09T05:23:20.539781  export SHELL=3D/bin/sh
    2023-02-09T05:23:20.540161  <3>[   18.041346] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:23:20.540397  #
    2023-02-09T05:23:20.641665  / # export SHELL=3D/bin/sh. /lava-3310995/e=
nvironment
    2023-02-09T05:23:20.642048  =

    2023-02-09T05:23:20.744056  / # . /lava-3310995/environment/lava-331099=
5/bin/lava-test-runner /lava-3310995/1
    2023-02-09T05:23:20.745182  =

    2023-02-09T05:23:20.758376  / # /lava-3310995/bin/lava-test-runner /lav=
a-3310995/1
    2023-02-09T05:23:20.820337  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47f67595e423a5d8c8663

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e47f67595e423a5d8c866c
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:06:37.458911  / # #
    2023-02-09T05:06:37.560543  export SHELL=3D/bin/sh
    2023-02-09T05:06:37.560960  #
    2023-02-09T05:06:37.662177  / # export SHELL=3D/bin/sh. /lava-3310606/e=
nvironment
    2023-02-09T05:06:37.662589  =

    2023-02-09T05:06:37.662802  / # <3>[   18.254461] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:06:37.764064  . /lava-3310606/environment/lava-3310606/bi=
n/lava-test-runner /lava-3310606/1
    2023-02-09T05:06:37.764728  =

    2023-02-09T05:06:37.772012  / # /lava-3310606/bin/lava-test-runner /lav=
a-3310606/1
    2023-02-09T05:06:37.815125  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47fcb80e96cb5508c8642

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e47fcb80e96cb5508c864b
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:08:03.289639  / # #
    2023-02-09T05:08:03.391424  export SHELL=3D/bin/sh
    2023-02-09T05:08:03.391923  #
    2023-02-09T05:08:03.493334  / # export SHELL=3D/bin/sh<3>[   18.204580]=
 brcmfmac: b. /lava-3310630/environment
    2023-02-09T05:08:03.493787  rcmf_sdio_htclk: HT Avail timeout (1000000)=
: clkctl 0x50
    2023-02-09T05:08:03.494059  =

    2023-02-09T05:08:03.595376  / # . /lava-3310630/environment/lava-331063=
0/bin/lava-test-runner /lava-3310630/1
    2023-02-09T05:08:03.595986  =

    2023-02-09T05:08:03.603033  / # /lava-3310630/bin/lava-test-runner /lav=
a-3310630/1
    2023-02-09T05:08:03.673899  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4801dd7b2111e118c865a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e4801dd7b2111e118c8663
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:09:36.432192  <8>[   18.024596] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3310725_1.5.2.4.1>
    2023-02-09T05:09:36.536205  / # #
    2023-02-09T05:09:36.638280  export SHELL=3D/bin/sh
    2023-02-09T05:09:36.638657  #
    2023-02-09T05:09:36.740041  / # export SHELL=3D/bin/sh. /lava-3310725/e=
nvironment
    2023-02-09T05:09:36.740811  =

    2023-02-09T05:09:36.741273  / # <3>[   18.270951] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:09:36.843075  . /lava-3310725/environment/lava-3310725/bi=
n/lava-test-runner /lava-3310725/1
    2023-02-09T05:09:36.843769  =

    2023-02-09T05:09:36.861627  / # /lava-3310725/bin/lava-test-runner /lav=
a-3310725/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e480cf9a33c962c08c863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e480cf9a33c962c08c8647
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:12:37.507000  / # #
    2023-02-09T05:12:37.608676  export SHELL=3D/bin/sh
    2023-02-09T05:12:37.609406  #
    2023-02-09T05:12:37.711153  / # export SHELL=3D/bin/sh. /lava-3310819/e=
nvironment
    2023-02-09T05:12:37.711692  =

    2023-02-09T05:12:37.711932  / # <3>[   18.231055] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:12:37.814522  . /lava-3310819/environment/lava-3310819/bi=
n/lava-test-runner /lava-3310819/1
    2023-02-09T05:12:37.815242  =

    2023-02-09T05:12:37.826191  / # /lava-3310819/bin/lava-test-runner /lav=
a-3310819/1
    2023-02-09T05:12:37.887077  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e485d074822f37c68c8632

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e485d074822f37c68c863b
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:34:01.647200  <8>[  103.579359] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3311086_1.5.2.4.1>
    2023-02-09T05:34:01.752531  / # #
    2023-02-09T05:34:01.854273  export SHELL=3D/bin/sh
    2023-02-09T05:34:01.854823  #
    2023-02-09T05:34:01.956122  / # export SHELL=3D/bin/sh. /lava-3311086/e=
nvironment
    2023-02-09T05:34:01.956710  =

    2023-02-09T05:34:01.956942  / # <3>[  103.823769] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:34:02.058188  . /lava-3311086/environment/lava-3311086/bi=
n/lava-test-runner /lava-3311086/1
    2023-02-09T05:34:02.058850  =

    2023-02-09T05:34:02.062395  / # /lava-3311086/bin/lava-test-runner /lav=
a-3311086/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48774be7cc259f88c863f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e48774be7cc259f88c8648
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:40:57.132873  <8>[   17.967967] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3311166_1.5.2.4.1>
    2023-02-09T05:40:57.236763  / # #
    2023-02-09T05:40:57.338542  export SHELL=3D/bin/sh
    2023-02-09T05:40:57.338955  #
    2023-02-09T05:40:57.440390  / # export SHELL=3D/bin/sh. /lava-3311166/e=
nvironment
    2023-02-09T05:40:57.441155  <3>[   18.194912] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:40:57.441635  =

    2023-02-09T05:40:57.543463  / # . /lava-3311166/environment/lava-331116=
6/bin/lava-test-runner /lava-3311166/1
    2023-02-09T05:40:57.544577  =

    2023-02-09T05:40:57.563303  / # /lava-3311166/bin/lava-test-runner /lav=
a-3311166/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e485389c50a61d948c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e485389c50a61d948c8=
63d
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48554dc6e0186618c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48554dc6e0186618c8=
65f
        failing since 15 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4854bdc6e0186618c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4854bdc6e0186618c8=
643
        failing since 15 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48549dc6e0186618c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48549dc6e0186618c8=
63e
        failing since 15 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48663bd3c09f1cc8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48663bd3c09f1cc8c8=
637
        failing since 2 days (last pass: next-20230203, first fail: next-20=
230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4839e047019e4338c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e4839e047019e4338c8638
        failing since 21 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-09T05:24:00.846871  / # #
    2023-02-09T05:24:00.948548  export SHELL=3D/bin/sh
    2023-02-09T05:24:00.949037  #
    2023-02-09T05:24:01.050521  / # export SHELL=3D/bin/sh. /lava-3310970/e=
nvironment
    2023-02-09T05:24:01.050995  =

    2023-02-09T05:24:01.152511  / # . /lava-3310970/environment/lava-331097=
0/bin/lava-test-runner /lava-3310970/1
    2023-02-09T05:24:01.153340  =

    2023-02-09T05:24:01.158097  / # /lava-3310970/bin/lava-test-runner /lav=
a-3310970/1
    2023-02-09T05:24:01.238913  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-09T05:24:01.239514  + cd /lava-3310970/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47f8fd6126b02958c8650

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e47f8fd6126b02958c8659
        failing since 21 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-09T05:07:03.331625  <8>[   18.431256] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-02-09T05:07:03.331864  + set +x
    2023-02-09T05:07:03.333926  <8>[   18.436128] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3310609_1.5.2.4.1>
    2023-02-09T05:07:03.439321  / # #
    2023-02-09T05:07:03.541056  export SHELL=3D/bin/sh
    2023-02-09T05:07:03.541410  #
    2023-02-09T05:07:03.642769  / # export SHELL=3D/bin/sh. /lava-3310609/e=
nvironment
    2023-02-09T05:07:03.643219  =

    2023-02-09T05:07:03.744734  / # . /lava-3310609/environment/lava-331060=
9/bin/lava-test-runner /lava-3310609/1
    2023-02-09T05:07:03.745374   =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48011443c191a8c8c86d6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e48011443c191a8c8c86df
        failing since 21 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-09T05:09:04.950356  + set<8>[   18.302329] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3310640_1.5.2.4.1>
    2023-02-09T05:09:04.950647   +x
    2023-02-09T05:09:05.056176  / # #
    2023-02-09T05:09:05.157889  export SHELL=3D/bin/sh
    2023-02-09T05:09:05.158297  #
    2023-02-09T05:09:05.259698  / # export SHELL=3D/bin/sh. /lava-3310640/e=
nvironment
    2023-02-09T05:09:05.260099  =

    2023-02-09T05:09:05.361552  / # . /lava-3310640/environment/lava-331064=
0/bin/lava-test-runner /lava-3310640/1
    2023-02-09T05:09:05.362252  =

    2023-02-09T05:09:05.373667  / # /lava-3310640/bin/lava-test-runner /lav=
a-3310640/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48079e00d8ec7218c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e48079e00d8ec7218c8639
        failing since 21 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-09T05:11:04.409702  / # #
    2023-02-09T05:11:04.511380  export SHELL=3D/bin/sh
    2023-02-09T05:11:04.511732  #
    2023-02-09T05:11:04.613049  / # export SHELL=3D/bin/sh. /lava-3310693/e=
nvironment
    2023-02-09T05:11:04.613438  =

    2023-02-09T05:11:04.714802  / # . /lava-3310693/environment/lava-331069=
3/bin/lava-test-runner /lava-3310693/1
    2023-02-09T05:11:04.715427  =

    2023-02-09T05:11:04.721037  / # /lava-3310693/bin/lava-test-runner /lav=
a-3310693/1
    2023-02-09T05:11:04.792822  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-09T05:11:04.793089  + cd /lava-3310693/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4810686b79ce0918c8650

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e4810686b79ce0918c8659
        failing since 21 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-09T05:13:09.668148  + set +x<8>[   18.387142] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3310820_1.5.2.4.1>
    2023-02-09T05:13:09.773683  / # #
    2023-02-09T05:13:09.875631  export SHELL=3D/bin/sh
    2023-02-09T05:13:09.876130  #
    2023-02-09T05:13:09.977545  / # export SHELL=3D/bin/sh. /lava-3310820/e=
nvironment
    2023-02-09T05:13:09.978089  =

    2023-02-09T05:13:10.079556  / # . /lava-3310820/environment/lava-331082=
0/bin/lava-test-runner /lava-3310820/1
    2023-02-09T05:13:10.080367  =

    2023-02-09T05:13:10.084975  / # /lava-3310820/bin/lava-test-runner /lav=
a-3310820/1
    2023-02-09T05:13:10.156837  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48536f0615e3f238c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48536f0615e3f238c8=
645
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e485b35701233c2c8c863c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e485b35701233c2c8c8645
        failing since 21 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-09T05:33:14.904507  =

    2023-02-09T05:33:15.006161  / # #export SHELL=3D/bin/sh
    2023-02-09T05:33:15.006548  =

    2023-02-09T05:33:15.107938  / # export SHELL=3D/bin/sh. /lava-3311104/e=
nvironment
    2023-02-09T05:33:15.108308  =

    2023-02-09T05:33:15.209697  / # . /lava-3311104/environment/lava-331110=
4/bin/lava-test-runner /lava-3311104/1
    2023-02-09T05:33:15.210451  =

    2023-02-09T05:33:15.214997  / # /lava-3311104/bin/lava-test-runner /lav=
a-3311104/1
    2023-02-09T05:33:15.286924  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-09T05:33:15.287293  + cd /lava-3311104/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4879d33025cb8d88c8636

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e4879d33025cb8d88c863f
        failing since 21 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-09T05:41:37.412385  + set +x<8>[   17.572361] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3311171_1.5.2.4.1>
    2023-02-09T05:41:37.517736  / # #
    2023-02-09T05:41:37.619659  export SHELL=3D/bin/sh
    2023-02-09T05:41:37.620200  #
    2023-02-09T05:41:37.721581  / # export SHELL=3D/bin/sh. /lava-3311171/e=
nvironment
    2023-02-09T05:41:37.722113  =

    2023-02-09T05:41:37.722355  / # <3>[   17.820254] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:41:37.823698  . /lava-3311171/environment/lava-3311171/bi=
n/lava-test-runner /lava-3311171/1
    2023-02-09T05:41:37.824501  =

    2023-02-09T05:41:37.832052  / # /lava-3311171/bin/lava-test-runner /lav=
a-3311171/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48534f0615e3f238c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48534f0615e3f238c8=
642
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e485ae5fe330e8d08c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e485ae5fe330e8d08c8=
657
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48532beeeca30c28c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48532beeeca30c28c8=
654
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48556c5d06b186b8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48556c5d06b186b8c8=
630
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48537f0615e3f238c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48537f0615e3f238c8=
648
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4870efa62fd7dd98c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4870efa62fd7dd98c8=
63d
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e483dddfac559b728c8651

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e483dddfac559b728c865a
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:25:20.252909  / # #
    2023-02-09T05:25:20.355802  export SHELL=3D/bin/sh
    2023-02-09T05:25:20.356847  #
    2023-02-09T05:25:20.458946  / # export SHELL=3D/bin/sh. /lava-3310979/e=
nvironment
    2023-02-09T05:25:20.460111  =

    2023-02-09T05:25:20.460678  / # <3>[   17.983176] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:25:20.562801  . /lava-3310979/environment/lava-3310979/bi=
n/lava-test-runner /lava-3310979/1
    2023-02-09T05:25:20.563471  =

    2023-02-09T05:25:20.574388  / # /lava-3310979/bin/lava-test-runner /lav=
a-3310979/1
    2023-02-09T05:25:20.631321  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47fa3d6126b02958c867c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e47fa3d6126b02958c8685
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:07:22.918395  / # #
    2023-02-09T05:07:23.020203  export SHELL=3D/bin/sh
    2023-02-09T05:07:23.020781  #
    2023-02-09T05:07:23.122306  / # export SHELL=3D/bin/sh. /lava-3310652/e=
nvironment
    2023-02-09T05:07:23.122734  =

    2023-02-09T05:07:23.122987  / # <3>[   18.130639] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:07:23.224324  . /lava-3310652/environment/lava-3310652/bi=
n/lava-test-runner /lava-3310652/1
    2023-02-09T05:07:23.225599  =

    2023-02-09T05:07:23.237126  / # /lava-3310652/bin/lava-test-runner /lav=
a-3310652/1
    2023-02-09T05:07:23.292040  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47fbe527c01286e8c863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e47fbe527c01286e8c8645
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:07:45.744580  / # #
    2023-02-09T05:07:45.846673  export SHELL=3D/bin/sh
    2023-02-09T05:07:45.847127  #
    2023-02-09T05:07:45.948439  / # export SHELL=3D/bin/sh. /lava-3310619/e=
nvironment
    2023-02-09T05:07:45.948892  =

    2023-02-09T05:07:45.949135  / # <3>[   18.125196] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:07:46.050967  . /lava-3310619/environment/lava-3310619/bi=
n/lava-test-runner /lava-3310619/1
    2023-02-09T05:07:46.051611  =

    2023-02-09T05:07:46.061517  / # /lava-3310619/bin/lava-test-runner /lav=
a-3310619/1
    2023-02-09T05:07:46.120347  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48007443c191a8c8c86a0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e48007443c191a8c8c86a9
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:09:21.354871  / # #
    2023-02-09T05:09:21.456405  export SHELL=3D/bin/sh
    2023-02-09T05:09:21.456868  #
    2023-02-09T05:09:21.558217  / # export SHELL=3D/bin/sh. /lava-3310723/e=
nvironment
    2023-02-09T05:09:21.558991  =

    2023-02-09T05:09:21.559322  / # <3>[   18.247108] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:09:21.660827  . /lava-3310723/environment/lava-3310723/bi=
n/lava-test-runner /lava-3310723/1
    2023-02-09T05:09:21.661565  =

    2023-02-09T05:09:21.674986  / # /lava-3310723/bin/lava-test-runner /lav=
a-3310723/1
    2023-02-09T05:09:21.730939  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48118a1fb7204c18c8649

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e48118a1fb7204c18c8652
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:13:33.109824  =

    2023-02-09T05:13:33.212695  / # #
    2023-02-09T05:13:33.314137  export SHELL=3D/bin/sh
    2023-02-09T05:13:33.314491  #
    2023-02-09T05:13:33.415609  / # export SHELL=3D/bin/sh. /lava-3310811/e=
nvironment
    2023-02-09T05:13:33.416018  =

    2023-02-09T05:13:33.416201  / # <3>[   18.064954] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:13:33.517567  . /lava-3310811/environment/lava-3310811/bi=
n/lava-test-runner /lava-3310811/1
    2023-02-09T05:13:33.518666  =

    2023-02-09T05:13:33.524688  / # /lava-3310811/bin/lava-test-runner /lav=
a-3310811/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4858c6ef6ff60758c8661

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e4858c6ef6ff60758c866a
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:32:48.361009  <8>[  102.189468] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3311098_1.5.2.4.1>
    2023-02-09T05:32:48.471556  / # #
    2023-02-09T05:32:48.575018  export SHELL=3D/bin/sh
    2023-02-09T05:32:48.576070  #
    2023-02-09T05:32:48.576634  / # export SHELL=3D/bin/sh<3>[  102.406989]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:32:48.678771  . /lava-3311098/environment
    2023-02-09T05:32:48.679257  =

    2023-02-09T05:32:48.780944  / # . /lava-3311098/environment/lava-331109=
8/bin/lava-test-runner /lava-3311098/1
    2023-02-09T05:32:48.781634  =

    2023-02-09T05:32:48.797122  / # /lava-3311098/bin/lava-test-runner /lav=
a-3311098/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48594df82aaaee98c8648

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e48594df82aaaee98c8651
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:32:44.914045  + set +<8>[   17.762822] <LAVA_SIGNAL_ENDRU=
N 0_dmesg 3311129_1.5.2.4.1>
    2023-02-09T05:32:44.914284  x
    2023-02-09T05:32:45.018130  / # #
    2023-02-09T05:32:45.119888  export SHELL=3D/bin/sh
    2023-02-09T05:32:45.120694  #
    2023-02-09T05:32:45.222058  / # export SHELL=3D/bin/sh. /lava-3311129/e=
nvironment
    2023-02-09T05:32:45.222498  =

    2023-02-09T05:32:45.222755  / # . /lava-3311129/environment<3>[   18.07=
0497] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:32:45.324000  /lava-3311129/bin/lava-test-runner /lava-33=
11129/1
    2023-02-09T05:32:45.324650   =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48614562fecbb7e8c867c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e48614562fecbb7e8c8685
        failing since 21 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-09T05:35:01.480437  / # #
    2023-02-09T05:35:01.582646  export SHELL=3D/bin/sh
    2023-02-09T05:35:01.583358  #
    2023-02-09T05:35:01.684869  / # export SHELL=3D/bin/sh. /lava-3311192/e=
nvironment
    2023-02-09T05:35:01.685626  =

    2023-02-09T05:35:01.685896  / # <3>[   18.164841] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-09T05:35:01.787281  . /lava-3311192/environment/lava-3311192/bi=
n/lava-test-runner /lava-3311192/1
    2023-02-09T05:35:01.788184  =

    2023-02-09T05:35:01.804625  / # /lava-3311192/bin/lava-test-runner /lav=
a-3311192/1
    2023-02-09T05:35:01.859518  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4861aca317e77388c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4861aca317e77388c8=
631
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48443e28067822c8c867b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48443e28067822c8c8=
67c
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48763be7cc259f88c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48763be7cc259f88c8=
632
        failing since 15 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e485ecd49db9361e8c8665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e485ecd49db9361e8c8=
666
        failing since 12 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48444e28067822c8c8681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48444e28067822c8c8=
682
        failing since 15 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e486dd8da0890dea8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e486dd8da0890dea8c8=
631
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e485d574822f37c68c865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e485d574822f37c68c8=
65b
        failing since 0 day (last pass: next-20230207, first fail: next-202=
30208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48444e28067822c8c867e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48444e28067822c8c8=
67f
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e486f8977e23373f8c866d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e486f8977e23373f8c8=
66e
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48057cdfda080fa8c8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48057cdfda080fa8c8=
65a
        failing since 169 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4995953106257308c8664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4995953106257308c8=
665
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4a477870211a0228c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4a477870211a0228c8=
63d
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4855dc5d06b186b8c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4855dc5d06b186b8c8=
648
        failing since 148 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48554dc6e0186618c8661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48554dc6e0186618c8=
662
        failing since 148 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e484aa8e77fc7cce8c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e484aa8e77fc7cce8c8=
651
        failing since 148 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4857b6ef6ff60758c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4857b6ef6ff60758c8=
630
        failing since 148 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48556c5d06b186b8c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48556c5d06b186b8c8=
633
        failing since 148 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48595159c25b5a28c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48595159c25b5a28c8=
631
        failing since 148 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e485409c50a61d948c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e485409c50a61d948c8=
642
        failing since 148 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48597df82aaaee98c8669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48597df82aaaee98c8=
66a
        failing since 148 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63e485a562a8da1ac98c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e485a562a8da1ac98c8=
632
        failing since 148 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47dd531878f1b508c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e47dd531878f1b508c8=
64b
        failing since 0 day (last pass: next-20230207, first fail: next-202=
30208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/63e493a6a7b61701328c8664

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e493a6a7b61701=
328c8667
        new failure (last pass: next-20230207)
        3 lines

    2023-02-09T06:32:37.301241  / # #
    2023-02-09T06:32:37.404542  #
    2023-02-09T06:32:38.865111  export SHELL=3D/bin/sh
    2023-02-09T06:32:40.767583  . /lava-845050/environment
    2023-02-09T06:32:44.222422  /lava-845050/bin/lava-test-runner /lava-845=
050/0
    2023-02-09T06:32:44.245382  =

    2023-02-09T06:32:44.245827  / # =

    2023-02-09T06:32:44.246240  / # #
    2023-02-09T06:32:44.246643  / # export SHELL=3D/bin/sh
    2023-02-09T06:32:44.247041  / # . /lava-845050/environment =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e493a6a7b6170=
1328c8669
        new failure (last pass: next-20230207)
        9 lines

    2023-02-09T06:32:44.706125  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected from SLUB object 'skbuff_small_head' (offset 0, size =
82)!
    2023-02-09T06:32:44.706978  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2023-02-09T06:32:44.727700  kern  :emerg : Code: aa1303e3 f000dd60 9134=
2000 97f4a69e (d4210000) =

    2023-02-09T06:32:44.728227  kern  :emerg : usercopy: Kernel memory over=
write attempt detected to SLUB object 'skbuff_small_head' (offset 0, size 2=
0)<8>[  121.432098] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D9>
    2023-02-09T06:32:44.728665  !   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e49f0e3b89fe62408c8680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e49f0e3b89fe62408c8=
681
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/63e485a5159c25b5a28c865b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e485a5159c25b5=
a28c865e
        new failure (last pass: next-20230207)
        3 lines

    2023-02-09T05:32:56.696322  / # #
    2023-02-09T05:32:56.799658  #
    2023-02-09T05:32:58.262150  export SHELL=3D/bin/sh
    2023-02-09T05:33:00.168228  . /lava-845052/environment
    2023-02-09T05:33:03.626464  /lava-845052/bin/lava-test-runner /lava-845=
052/0
    2023-02-09T05:33:03.647557  =

    2023-02-09T05:33:03.647678  / # =

    2023-02-09T05:33:03.647776  / # #
    2023-02-09T05:33:03.647868  / # export SHELL=3D/bin/sh
    2023-02-09T05:33:03.647957  / # . /lava-845052/environment =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e485a5159c25b=
5a28c8660
        new failure (last pass: next-20230207)
        9 lines

    2023-02-09T05:33:04.235348  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected from SLUB object 'skbuff_small_head' (offset 0, size =
82)!
    2023-02-09T05:33:04.235570  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2023-02-09T05:33:04.235676  kern  :emerg : Code: aa1303e3 f000dd60 9134=
2000 97f4a69e (d4210000) =

    2023-02-09T05:33:04.235773  kern  :emerg : usercopy: Kernel memory over=
write attempt detected to SLUB object 'skbuff_small_head' (offset 0, size 2=
0)!
    2023-02-09T05:33:04.235867  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#2] PREEMPT SMP
    2023-02-09T05:33:04.278501  kern  :emerg : Code: aa1303e3 f000dd60 <8>[=
  129.771690] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNIT=
S=3Dlines MEASUREMENT=3D9>
    2023-02-09T05:33:04.278721  91342000 97f4a69e (d4210000) =

    2023-02-09T05:33:04.278824  kern  :emerg : usercopy: Kernel memory over=
write attempt <8>[  129.787847] <LAVA_SIGNAL_ENDRUN 0_dmesg 845052_1.5.2.4.=
1>
    2023-02-09T05:33:04.278918  detected to SLUB object 'skbuff_small_head'=
 (offset 0, size 20)!
    2023-02-09T05:33:04.279007  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#3] PREEMPT SMP =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48a412ea1854e968c8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48a412ea1854e968c8=
639
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/63e485479c50a61d948c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e485479c50a61d948c8=
647
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/63e486aebd0c867a998c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e486aebd0c867a998c8=
638
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e489856f4da715358c8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e489856f4da715358c8=
653
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4805bc281a08fef8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4805bc281a08fef8c8=
63e
        failing since 78 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e483d0f654446b358c866a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e483d0f654446b358c8=
66b
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4881c9a684359398c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4881c9a684359398c8=
63d
        failing since 1 day (last pass: next-20230207, first fail: next-202=
30208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47fcea30dec5ef78c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e47fcea30dec5ef78c8=
64e
        failing since 78 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48537dfc59075ef8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48537dfc59075ef8c8=
63f
        failing since 6 days (last pass: next-20230131, first fail: next-20=
230203) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4855cd59c0133708c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4855cd59c0133708c8=
642
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e487137d94436e178c8641

  Results:     65 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63e487137d94436=
e178c8645
        new failure (last pass: next-20230208)
        9 lines

    2023-02-09T05:39:00.795496  <8>[    9.053867] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-02-09T05:39:00.821604  kern  :alert : BUG: Bad page map in process=
 udevd  pte:27b84910 <8>[    9.078877] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48623ca317e77388c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48623ca317e77388c8=
63b
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4842de28067822c8c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4842de28067822c8c8=
647
        new failure (last pass: next-20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4873b8ef7197d908c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4873b8ef7197d908c8=
63e
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4856c97442909c88c865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-c=
labbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-c=
labbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4856c97442909c88c8=
65b
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e486c0bd0c867a998c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e486c0bd0c867a998c8=
654
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48508cc7c6213098c8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-c=
ollabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-c=
ollabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48508cc7c6213098c8=
65a
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e481d46c34533d1e8c868e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e481d46c34533d1e8c8=
68f
        new failure (last pass: next-20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48530f0615e3f238c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48530f0615e3f238c8=
632
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e486f6977e23373f8c866a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e486f6977e23373f8c8=
66b
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e486e293d3b70c2e8c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e486e293d3b70c2e8c8=
659
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48094b5a6bdcb5a8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48094b5a6bdcb5a8c8=
63f
        new failure (last pass: next-20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e489a5dc4430f5488c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e489a5dc4430f5488c8=
645
        new failure (last pass: next-20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48565a4b8169a448c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48565a4b8169a448c8=
63c
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e48599498a44f0948c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e48599498a44f0948c8=
64a
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e4853ddfc59075ef8c8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e4853ddfc59075ef8c8=
644
        failing since 1 day (last pass: next-20230206, first fail: next-202=
30207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47fcad3ab83e0068c8648

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e47fcad3ab83e0068c8651
        failing since 15 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-02-09T05:08:04.222176  <8>[    9.637624] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3310685_1.5.2.4.1>
    2023-02-09T05:08:04.327423  / # #
    2023-02-09T05:08:04.429246  export SHELL=3D/bin/sh
    2023-02-09T05:08:04.429593  #
    2023-02-09T05:08:04.530932  / # export SHELL=3D/bin/sh. /lava-3310685/e=
nvironment
    2023-02-09T05:08:04.531289  =

    2023-02-09T05:08:04.632518  / # . /lava-3310685/environment/lava-331068=
5/bin/lava-test-runner /lava-3310685/1
    2023-02-09T05:08:04.633115  =

    2023-02-09T05:08:04.638872  / # /lava-3310685/bin/lava-test-runner /lav=
a-3310685/1
    2023-02-09T05:08:04.785790  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e47f71727a0c671b8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e47f71727a0c671b8c8=
630
        failing since 77 days (last pass: next-20221121, first fail: next-2=
0221123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 2          =


  Details:     https://kernelci.org/test/plan/id/63e4844faafcf8c8dd8c8649

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/63e4844faafcf8c8=
dd8c864c
        new failure (last pass: next-20230207)
        3 lines

    2023-02-09T05:27:25.789176  / # #
    2023-02-09T05:27:25.893616  #
    2023-02-09T05:27:25.995544  export SHELL=3D/bin/sh
    2023-02-09T05:27:26.096915  . /lava-845047/environment
    2023-02-09T05:27:26.198231  /lava-845047/bin/lava-test-runner /lava-845=
047/0
    2023-02-09T05:27:26.199673  =

    2023-02-09T05:27:26.199931  / # =

    2023-02-09T05:27:26.200170  / # #
    2023-02-09T05:27:26.200403  / # export SHELL=3D/bin/sh
    2023-02-09T05:27:26.200634  / # . /lava-845047/environment =

    ... (12 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63e4844faafcf8c=
8dd8c864e
        new failure (last pass: next-20230207)
        9 lines

    2023-02-09T05:27:26.663620  kern  :emerg : usercopy: Kernel memory expo=
sure attempt detected from SLUB object 'skbuff_small_head' (offset 0, size =
82)!
    2023-02-09T05:27:26.664194  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000800 [#1] PREEMPT SMP
    2023-02-09T05:27:26.685601  kern  :emerg : Code: aa1303e3 f000dd60 9134=
2000 97f4a69e (d4210000) =

    2023-02-09T05:27:26.686159  kern  :emerg : usercopy: Kernel memory over=
write attempt detected to SLUB object 'skbuff_small_head' (offset 0, size 2=
0)!
    2023-02-09T05:27:26.707616  kern  :emerg : Internal error: Oops - BUG: =
00000000f2000<8>[   17.495911] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>
    2023-02-09T05:27:26.707925  800 [#2] PREEMPT SMP   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e486e48da0890dea8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230209/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e486e48da0890dea8c8=
637
        new failure (last pass: next-20230208) =

 =20
