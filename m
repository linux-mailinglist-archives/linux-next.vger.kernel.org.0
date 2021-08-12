Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039D33EA916
	for <lists+linux-next@lfdr.de>; Thu, 12 Aug 2021 19:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbhHLREn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Aug 2021 13:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbhHLREm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Aug 2021 13:04:42 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1382EC061756
        for <linux-next@vger.kernel.org>; Thu, 12 Aug 2021 10:04:16 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id t7-20020a17090a5d87b029017807007f23so16224997pji.5
        for <linux-next@vger.kernel.org>; Thu, 12 Aug 2021 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=k02Uf/vXX1dNLMYTLodpRhM9ZacCMkhXYeL7DlhP6m8=;
        b=y+UT7AW5isgd9fluMyZLIAXrzrowRaBNcMZOBL0zngScTKQhtC8gpFLPXYLZZAU1EU
         8BEIjuGecIQ9pLum/M9n1slI3eBSLdOo+MnQPG/5weC2wocHDP4O0IIA0mCX0prHYzBp
         LILrf7Gy/vyIq3+i9ExAQ8rYtDlJDRskH27PfRiKU80FryFrzlPvYWH0n/bW9Lyd477M
         dkmIMMrXd9JzA/lupDCpjwPVPfb2/I1QtUNOWIy8BErKfo7s6aTLaXZb68HDUCYOBOgB
         XMD3FQ8ZhSWfAmFLMZkkjpOjLXBGdeoL3xz694c1qkNGZcEFdD2LnhO+Jgpx+EZKuZrJ
         QQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=k02Uf/vXX1dNLMYTLodpRhM9ZacCMkhXYeL7DlhP6m8=;
        b=ieRcfoSBhGdCSTgQb4nbOMMegulvIYBpPxs74t9Lk7DmAItwg5NCkf2SzkAxPAEFBh
         FseUkMqJC9DQRR8eCvA5loaq5nC0rph1a/OppkyXE9A68QpRhLQeDyugg/4edAMRGKgv
         AN6EUDHmXNZYFqxLdB7FmOX0e7adpzo22OA8VUO0KUsfBaqzHkMHwZiZ3hP4c8UewhEu
         ko87jFZLMnxcvrdO0npkGRAZRESBqmIHQu4xYhgKxeiTzDV/MK0y4E6p5340D9SEkPFe
         6MYFTBcFjr2PxCVwurVkkyW8uJdwpV0CDZlK9LeTiEDRZM1jo2cYVmrOxFCjxqFDI8nU
         eZ8A==
X-Gm-Message-State: AOAM533GrgwrubJpIjz7qD86/qLdIA43JnQP/QtUNuNTnDItUESnUCu6
        RyNwbLVhxEWV4W2O2/CmXUlOjHMtEZWWWx/h
X-Google-Smtp-Source: ABdhPJy7P3uOglh3r1mPdkd9BAtFCwCTNUsRmRfPTaDHOcYQswxJHpddUymrOarNPKVWal+/WZ/7VA==
X-Received: by 2002:a17:903:32c1:b029:12d:6904:1635 with SMTP id i1-20020a17090332c1b029012d69041635mr4418988plr.28.1628787854672;
        Thu, 12 Aug 2021 10:04:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n18sm1854197pfu.3.2021.08.12.10.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 10:04:14 -0700 (PDT)
Message-ID: <6115548e.1c69fb81.a0eb6.4640@mx.google.com>
Date:   Thu, 12 Aug 2021 10:04:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210812
X-Kernelci-Report-Type: test
Subject: next/master baseline: 638 runs, 250 regressions (next-20210812)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 638 runs, 250 regressions (next-20210812)

Regressions Summary
-------------------

platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
asus-C433TA-AJ0005-rammus   | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch      | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =

bcm2836-rpi-2-b             | arm    | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b             | arm64  | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b             | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

bcm2837-rpi-3-b             | arm64  | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

bcm2837-rpi-3-b             | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b             | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1012a-rdb             | arm64  | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1012a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =

fsl-ls1012a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1012a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1028a-rdb             | arm64  | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1028a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 1          =

fsl-ls1028a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =

fsl-ls1028a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1043a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 1          =

fsl-ls1043a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =

fsl-ls1043a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

fsl-ls1043a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1043a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

fsl-ls1088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls2088a-rdb             | arm64  | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls2088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 1          =

fsl-ls2088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =

fsl-ls2088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

fsl-lx2160a-rdb             | arm64  | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-lx2160a-rdb             | arm64  | lab-nxp         | clang-12 | defconf=
ig                    | 1          =

fsl-lx2160a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

fsl-lx2160a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

hip07-d05                   | arm64  | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

hip07-d05                   | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

hip07-d05                   | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

hp-x360-12b-n4000-octopus   | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =

imx6dl-riotboard            | arm    | lab-pengutronix | clang-12 | multi_v=
7_defconfig           | 1          =

imx6dl-riotboard            | arm    | lab-pengutronix | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6dl-riotboard            | arm    | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =

imx6dl-riotboard            | arm    | lab-pengutronix | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabresd               | arm    | lab-nxp         | clang-12 | multi_v=
7_defconfig           | 1          =

imx6q-sabresd               | arm    | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6q-sabresd               | arm    | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =

imx6q-var-dt6customboard    | arm    | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =

imx6q-var-dt6customboard    | arm    | lab-baylibre    | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6q-var-dt6customboard    | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

imx6q-var-dt6customboard    | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6qp-sabresd              | arm    | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6qp-sabresd              | arm    | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =

imx6qp-sabresd              | arm    | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6qp-wandboard-revd1      | arm    | lab-pengutronix | clang-12 | multi_v=
7_defconfig           | 1          =

imx6qp-wandboard-revd1      | arm    | lab-pengutronix | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6qp-wandboard-revd1      | arm    | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =

imx6sll-evk                 | arm    | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =

imx6sx-sdb                  | arm    | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                  | arm    | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =

imx6sx-sdb                  | arm    | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ull-14x14-evk           | arm    | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6ull-14x14-evk           | arm    | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx7d-sdb                   | arm    | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx7d-sdb                   | arm    | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =

imx7d-sdb                   | arm    | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx7ulp-evk                 | arm    | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx8mn-ddr4-evk             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

imx8mp-evk                  | arm64  | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                  | arm64  | lab-nxp         | clang-12 | defconf=
ig                    | 1          =

imx8mp-evk                  | arm64  | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 1          =

imx8mp-evk                  | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

jetson-tk1                  | arm    | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =

jetson-tk1                  | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                  | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

jetson-tk1                  | arm    | lab-baylibre    | gcc-8    | tegra_d=
efconfig              | 1          =

kontron-kbox-a-230-ls       | arm64  | lab-kontron     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls       | arm64  | lab-kontron     | clang-12 | defconf=
ig                    | 1          =

kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-8    | defconf=
ig+crypto             | 1          =

kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-8    | defconf=
ig+ima                | 1          =

kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-8    | defconf=
ig                    | 1          =

kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

kontron-sl28-var3-ads2      | arm64  | lab-kontron     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2      | arm64  | lab-kontron     | clang-12 | defconf=
ig                    | 1          =

kontron-sl28-var3-ads2      | arm64  | lab-kontron     | gcc-8    | defconf=
ig+crypto             | 1          =

kontron-sl28-var3-ads2      | arm64  | lab-kontron     | gcc-8    | defconf=
ig+ima                | 1          =

kontron-sl28-var3-ads2      | arm64  | lab-kontron     | gcc-8    | defconf=
ig                    | 1          =

kontron-sl28-var3-ads2      | arm64  | lab-kontron     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2      | arm64  | lab-kontron     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

mt8173-elm-hana             | arm64  | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana             | arm64  | lab-collabora   | clang-12 | defconf=
ig                    | 1          =

mt8173-elm-hana             | arm64  | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =

mt8173-elm-hana             | arm64  | lab-collabora   | gcc-8    | defconf=
ig+ima                | 1          =

mt8173-elm-hana             | arm64  | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

mt8173-elm-hana             | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana             | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

odroid-xu3                  | arm    | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =

odroid-xu3                  | arm    | lab-collabora   | gcc-8    | exynos_=
defconfig             | 1          =

odroid-xu3                  | arm    | lab-collabora   | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

odroid-xu3                  | arm    | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =

odroid-xu3                  | arm    | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qcom-qdf2400                | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qcom-qdf2400                | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =

qcom-qdf2400                | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =

qcom-qdf2400                | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =

qcom-qdf2400                | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qcom-qdf2400                | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb        | arm    | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb        | arm    | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb        | arm    | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb        | arm    | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-virt-gicv2         | arm    | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2         | arm    | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi    | arm    | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi    | arm    | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3         | arm    | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3         | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3         | arm    | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi    | arm    | lab-broonie     | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi    | arm    | lab-linaro-lkft | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi    | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi    | arm    | lab-broonie     | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi    | arm    | lab-linaro-lkft | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+ima                | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+ima                | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-collabora   | gcc-8    | defconf=
ig+ima                | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+ima                | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-collabora   | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+ima                | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+ima                | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+ima                | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_i386                   | i386   | lab-collabora   | gcc-8    | i386_de=
fconfig               | 1          =

qemu_i386-uefi              | i386   | lab-collabora   | gcc-8    | i386_de=
fconfig               | 1          =

qemu_x86_64                 | x86_64 | lab-collabora   | clang-12 | x86_64_=
defconfig             | 1          =

qemu_x86_64                 | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =

qemu_x86_64                 | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig+crypto      | 1          =

qemu_x86_64                 | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig+ima         | 1          =

qemu_x86_64                 | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig             | 1          =

qemu_x86_64-uefi            | x86_64 | lab-collabora   | clang-12 | x86_64_=
defconfig             | 1          =

qemu_x86_64-uefi            | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =

qemu_x86_64-uefi            | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig+crypto      | 1          =

qemu_x86_64-uefi            | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig+ima         | 1          =

qemu_x86_64-uefi            | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig             | 1          =

qemu_x86_64-uefi-mixed      | x86_64 | lab-collabora   | clang-12 | x86_64_=
defconfig             | 1          =

qemu_x86_64-uefi-mixed      | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed      | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed      | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig             | 1          =

r8a774c0-ek874              | arm64  | lab-cip         | clang-12 | defconf=
ig                    | 1          =

r8a774c0-ek874              | arm64  | lab-cip         | gcc-8    | defconf=
ig+crypto             | 1          =

r8a774c0-ek874              | arm64  | lab-cip         | gcc-8    | defconf=
ig+ima                | 1          =

rk3328-rock64               | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64     | arm64  | lab-clabbe      | clang-12 | defconf=
ig                    | 1          =

sun50i-a64-bananapi-m64     | arm64  | lab-clabbe      | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64     | arm64  | lab-clabbe      | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus      | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

sun50i-a64-pine64-plus      | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2  | arm64  | lab-clabbe      | gcc-8    | defconf=
ig+ima                | 1          =

sun50i-h6-orangepi-one-plus | arm64  | lab-clabbe      | gcc-8    | defconf=
ig                    | 1          =

tegra124-nyan-big           | arm    | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =

tegra124-nyan-big           | arm    | lab-collabora   | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big           | arm    | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =

tegra124-nyan-big           | arm    | lab-collabora   | gcc-8    | tegra_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210812/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210812
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9b992972fb9c2a1bc3fb25bab70da8a4385e3abe =



Test Regressions
---------------- =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
asus-C433TA-AJ0005-rammus   | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/611516694f261469f6b1367b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-asus-C433TA=
-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-asus-C433TA=
-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611516694f261469f6b13=
67c
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
asus-C436FA-Flip-hatch      | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6115167a4f261469f6b13689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-asus-C436FA=
-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-asus-C436FA=
-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115167a4f261469f6b13=
68a
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b             | arm    | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61151dbad785c0c4fab13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151dbad785c0c4fab13=
674
        failing since 168 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b             | arm64  | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611517995d27e70ca2b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611517995d27e70ca2b13=
662
        failing since 56 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b             | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611518ee0c023e40c2b13693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611518ee0c023e40c2b13=
694
        failing since 56 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b             | arm64  | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151cebf41d2cf513b1366c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151cebf41d2cf513b13=
66d
        failing since 56 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b             | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151e3f72ed9d4e5bb13684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151e3f72ed9d4e5bb13=
685
        failing since 56 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
bcm2837-rpi-3-b             | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151f93b9cf6b8612b13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151f93b9cf6b8612b13=
675
        failing since 56 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1012a-rdb             | arm64  | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115187450bd63e7b8b13689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-ls1012=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-ls1012=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115187450bd63e7b8b13=
68a
        new failure (last pass: next-20210803) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1012a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61151f8bb9cf6b8612b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-fsl-ls1012a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-fsl-ls1012a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151f8bb9cf6b8612b13=
66f
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1012a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611523eaa9cfcf3c17b1366b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1012a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1012a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611523eaa9cfcf3c17b13=
66c
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1012a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611525ba228fda330eb1367f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1012a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1012a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611525ba228fda330eb13=
680
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1028a-rdb             | arm64  | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115183ee434aa5eb8b13682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-ls1028=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-ls1028=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115183ee434aa5eb8b13=
683
        new failure (last pass: next-20210809) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1028a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ccfe2d5bb26e2b13685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-ls1028a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-ls1028a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ccfe2d5bb26e2b13=
686
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1028a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61151e4b72ed9d4e5bb1368a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-fsl-ls1028a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-fsl-ls1028a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151e4b72ed9d4e5bb13=
68b
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1028a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115230feda80c0911b1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1028a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1028a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115230feda80c0911b13=
66e
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1043a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151cf76ba578395db13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151cf76ba578395db13=
663
        new failure (last pass: next-20210809) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1043a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61151e5e650839e768b1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151e5e650839e768b13=
67f
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1043a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151fda95967b8d14b13668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151fda95967b8d14b13=
669
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1043a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115216a7060240078b13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1043a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1043a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115216a7060240078b13=
674
        failing since 0 day (last pass: next-20210810, first fail: next-202=
10811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1043a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152323eda80c0911b1367a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1043a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1043a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152323eda80c0911b13=
67b
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61152400616724084db13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152400616724084db13=
662
        failing since 265 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611525b814202d7a49b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611525b814202d7a49b13=
662
        failing since 265 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115275b99598c6383b13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115275b99598c6383b13=
664
        failing since 265 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls2088a-rdb             | arm64  | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115187050bd63e7b8b13684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-ls2088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-ls2088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115187050bd63e7b8b13=
685
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls2088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151bc9a9cea02b60b1366c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151bc9a9cea02b60b13=
66d
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls2088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61151d96d785c0c4fab13665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-fsl-ls2088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-fsl-ls2088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151d96d785c0c4fab13=
666
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-ls2088a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152008c3514ebdc7b1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls2088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls2088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152008c3514ebdc7b13=
670
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb             | arm64  | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115188a240699d729b1367d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-lx2160=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-fsl-lx2160=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115188a240699d729b13=
67e
        failing since 16 days (last pass: next-20210714, first fail: next-2=
0210726) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb             | arm64  | lab-nxp         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6115194977c5ef5091b1367c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115194977c5ef5091b13=
67d
        failing since 16 days (last pass: next-20210712, first fail: next-2=
0210726) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151c7f7d1accbb26b13681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151c7f7d1accbb26b13=
682
        failing since 15 days (last pass: next-20210714, first fail: next-2=
0210727) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151de692e3d954c3b13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151de692e3d954c3b13=
668
        failing since 23 days (last pass: next-20210714, first fail: next-2=
0210719) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
hip07-d05                   | arm64  | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61152525f91d44af08b13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152525f91d44af08b13=
663
        failing since 42 days (last pass: next-20210624, first fail: next-2=
0210629) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
hip07-d05                   | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611528135c224e1679b1368b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611528135c224e1679b13=
68c
        failing since 42 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
hip07-d05                   | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152af879e8c0e826b13681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152af879e8c0e826b13=
682
        failing since 42 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
hp-x360-12b-n4000-octopus   | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6115167932a8761795b136a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-hp-x360-12b=
-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-hp-x360-12b=
-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115167932a8761795b13=
6a2
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard            | arm    | lab-pengutronix | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b155f63fee9b9b1368a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b155f63fee9b9b13=
68b
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard            | arm    | lab-pengutronix | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61151878a3b39f4bc9b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151878a3b39f4bc9b13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard            | arm    | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151c568480051ea3b13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151c568480051ea3b13=
663
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard            | arm    | lab-pengutronix | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6115204cc3514ebdc7b136a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx6dl-rio=
tboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx6dl-rio=
tboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115204cc3514ebdc7b13=
6a1
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd               | arm    | lab-nxp         | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151afec64d2a1784b1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151afec64d2a1784b13=
66e
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd               | arm    | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/611517c4f3d2bafc5ab136c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611517c4f3d2bafc5ab13=
6ca
        failing since 290 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd               | arm    | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151c2eb259de7dbeb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151c2eb259de7dbeb13=
662
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard    | arm    | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/611519bde010803d20b13676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-imx6q-var-dt6customboard.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-imx6q-var-dt6customboard.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519bde010803d20b13=
677
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard    | arm    | lab-baylibre    | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61151725aa41813456b1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151725aa41813456b13=
67f
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard    | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b0e5f63fee9b9b13678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b0e5f63fee9b9b13=
679
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard    | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61151c628480051ea3b136b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151c628480051ea3b13=
6b5
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6qp-sabresd              | arm    | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61151758d5ab32c831b13678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151758d5ab32c831b13=
679
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6qp-sabresd              | arm    | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ca7d0154c85ffb13689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ca7d0154c85ffb13=
68a
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6qp-sabresd              | arm    | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ee9440b307f8db13668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ee9440b307f8db13=
669
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1      | arm    | lab-pengutronix | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/611519b260a7456baab13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-pengutronix/baseline-imx6qp-wandboard-revd1=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-pengutronix/baseline-imx6qp-wandboard-revd1=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519b260a7456baab13=
663
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1      | arm    | lab-pengutronix | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61151719aa41813456b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6qp-wandboard-revd1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6qp-wandboard-revd1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115171aaa41813456b13=
66f
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1      | arm    | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b01c64d2a1784b13680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6qp-wandboard-revd1.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b01c64d2a1784b13=
681
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6sll-evk                 | arm    | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151c430cec41de64b1368d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151c430cec41de64b13=
68e
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                  | arm    | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6115186c50bd63e7b8b1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115186c50bd63e7b8b13=
67f
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                  | arm    | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151bcb2f0207f71eb13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151bcb2f0207f71eb13=
665
        new failure (last pass: next-20210809) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                  | arm    | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61151d31143cbc9744b136eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151d31143cbc9744b13=
6ec
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6ull-14x14-evk           | arm    | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/611519d4e010803d20b13695

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519d4e010803d20b13=
696
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6ull-14x14-evk           | arm    | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6115202d3dcd1ea41fb136f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115202d3dcd1ea41fb13=
6f6
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                   | arm    | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61151762d2b894f5afb13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151762d2b894f5afb13=
664
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                   | arm    | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ba3b88ad769b0b13681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ba3b88ad769b0b13=
682
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                   | arm    | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61151c1cd0a9b42e22b1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151c1cd0a9b42e22b13=
67f
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                 | arm    | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61151d59ede59ba24eb136af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151d59ede59ba24eb13=
6b0
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk             | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61151b956ab472cd97b13690

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61151b956ab472c=
d97b13694
        failing since 2 days (last pass: next-20210806, first fail: next-20=
210809)
        12 lines

    2021-08-12T13:00:38.859084  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.423863] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-08-12T13:00:38.859306  0098
    2021-08-12T13:00:38.859440  kern  :alert : Mem abort info:
    2021-08-12T13:00:38.859565  kern  :alert :   ESR =3D 0x96000046
    2021-08-12T13:00:38.859687  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61151b956ab472c=
d97b13695
        failing since 2 days (last pass: next-20210806, first fail: next-20=
210809)
        2 lines

    2021-08-12T13:00:38.860388  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-08-12T13:00:38.860494  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-08-12T13:00:38.860612  kern  :alert :<8>[   14.450655] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                  | arm64  | lab-nxp         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611518ce5cf4ebe94fb13670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611518ce5cf4ebe94fb13=
671
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                  | arm64  | lab-nxp         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b05c64d2a1784b13696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b05c64d2a1784b13=
697
        failing since 15 days (last pass: next-20210719, first fail: next-2=
0210727) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                  | arm64  | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ccdd7510436bdb1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ccdd7510436bdb13=
66e
        failing since 2 days (last pass: next-20210809, first fail: next-20=
210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                  | arm64  | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152194edf9f8aa09b1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152194edf9f8aa09b13=
67f
        failing since 0 day (last pass: next-20210810, first fail: next-202=
10811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                  | arm    | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151bb11e39f001d1b1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151bb11e39f001d1b13=
66e
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                  | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151778d2b894f5afb13671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-baylibre/ba=
seline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-baylibre/ba=
seline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151778d2b894f5afb13=
672
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                  | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6115212a42550f6007b1375f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115212a42550f6007b13=
760
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                  | arm    | lab-baylibre    | gcc-8    | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/61151d056ba578395db13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
tegra_defconfig/gcc-8/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
tegra_defconfig/gcc-8/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151d056ba578395db13=
668
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls       | arm64  | lab-kontron     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611517b5c03940b86fb1367a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611517b5c03940b86fb13=
67b
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls       | arm64  | lab-kontron     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151a9aee25550843b1367b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151a9aee25550843b13=
67c
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151efb54438b9b65b13672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151efb54438b9b65b13=
673
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61152077b322ffac5cb13679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152077b322ffac5cb13=
67a
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61152505228fda330eb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152505228fda330eb13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115280d5c224e1679b1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115280d5c224e1679b13=
67f
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152b06615d5ccd3ab1366a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152b06615d5ccd3ab13=
66b
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2      | arm64  | lab-kontron     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115194677c5ef5091b13676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115194677c5ef5091b13=
677
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2      | arm64  | lab-kontron     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151c55b259de7dbeb13692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151c55b259de7dbeb13=
693
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2      | arm64  | lab-kontron     | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151f4b91b9ec3b1ab13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151f4b91b9ec3b1ab13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2      | arm64  | lab-kontron     | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/611520b3b322ffac5cb13688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611520b3b322ffac5cb13=
689
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2      | arm64  | lab-kontron     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611523d3785202a2d8b13679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611523d3785202a2d8b13=
67a
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2      | arm64  | lab-kontron     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611526cc03bf8ccd76b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611526cc03bf8ccd76b13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2      | arm64  | lab-kontron     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152b412ffe0638eab13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152b412ffe0638eab13=
663
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana             | arm64  | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115179a08d7878a79b1367d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115179a08d7878a79b13=
67e
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana             | arm64  | lab-collabora   | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6115192e285fe7e1d9b13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115192e285fe7e1d9b13=
663
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana             | arm64  | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151a5dc9eb4c3252b13670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151a5dc9eb4c3252b13=
671
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana             | arm64  | lab-collabora   | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61151bfc2f0207f71eb13776

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151bfc2f0207f71eb13=
777
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana             | arm64  | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151d3e6ba578395db1367c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151d3e6ba578395db13=
67d
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana             | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ef554438b9b65b1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ef554438b9b65b13=
66e
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana             | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152093b322ffac5cb13682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152093b322ffac5cb13=
683
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                  | arm    | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b996ab472cd97b1369d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b996ab472cd97b13=
69e
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                  | arm    | lab-collabora   | gcc-8    | exynos_=
defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61152c9558a67ece63b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152c9558a67ece63b13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                  | arm    | lab-collabora   | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611518e15cf4ebe94fb13677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611518e15cf4ebe94fb13=
678
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                  | arm    | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6115228a66571de3deb1366a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115228a66571de3deb13=
66b
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                  | arm    | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6115285bce965f5bb9b13676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-xu3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-xu3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115285bce965f5bb9b13=
677
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115179b5d27e70ca2b13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qc=
om-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qc=
om-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115179b5d27e70ca2b13=
668
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611518ef0c023e40c2b13696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611518ef0c023e40c2b13=
697
        failing since 16 days (last pass: next-20210720, first fail: next-2=
0210726) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151a48044de6c82fb136c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151a48044de6c82fb13=
6ca
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151d13635afe1634b1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151d13635afe1634b13=
67f
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151e6ceb2aa8c774b13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qcom-=
qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qcom-=
qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151e6ceb2aa8c774b13=
664
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151fd495967b8d14b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qcom-q=
df2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qcom-q=
df2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151fd495967b8d14b13=
662
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb        | arm    | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/611512b018349becf6b13666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611512b018349becf6b13=
667
        failing since 267 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb        | arm    | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/611512a31074fa6b2bb13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611512a31074fa6b2bb13=
663
        failing since 267 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb        | arm    | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6115161b1676240099b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115161b1676240099b13=
662
        failing since 267 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb        | arm    | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61152f8d309adaab57b13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152f8d309adaab57b13=
674
        failing since 267 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2         | arm    | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61152438c85c46ae1cb13666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152438c85c46ae1cb13=
667
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2         | arm    | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6115212f80ea695b2db13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115212f80ea695b2db13=
668
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi    | arm    | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151c8a7d1accbb26b13687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151c8a7d1accbb26b13=
688
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi    | arm    | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61152700a15df4801db13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152700a15df4801db13=
662
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3         | arm    | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/611524a3c85c46ae1cb1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611524a3c85c46ae1cb13=
66e
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3         | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151e6b72ed9d4e5bb136a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151e6b72ed9d4e5bb13=
6a5
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3         | arm    | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61152143b1bb8236aab13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152143b1bb8236aab13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi    | arm    | lab-broonie     | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151d0a143cbc9744b136c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151d0a143cbc9744b13=
6c1
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi    | arm    | lab-linaro-lkft | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6115332854d0a803d4b13665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115332854d0a803d4b13=
666
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi    | arm    | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/611520c3e2ad45f721b13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611520c3e2ad45f721b13=
665
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi    | arm    | lab-broonie     | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61151f62dea34e3d63b1366c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151f62dea34e3d63b13=
66d
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi    | arm    | lab-linaro-lkft | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61153401f29c7e3e3fb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61153401f29c7e3e3fb13=
662
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611517a05d27e70ca2b13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611517a05d27e70ca2b13=
674
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611519b9e32082688ab13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519b9e32082688ab13=
664
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611517baf3d2bafc5ab136c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611517baf3d2bafc5ab13=
6c4
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611519d5a7eeb9f1a2b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519d5a7eeb9f1a2b13=
662
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151c778480051ea3b136e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-qemu=
_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-qemu=
_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151c778480051ea3b13=
6e4
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611531bd95b074a387b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611531bd95b074a387b13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61153272f371fd1ed1b1366a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61153272f371fd1ed1b13=
66b
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b73da14a2504bb1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b73da14a2504bb13=
67f
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61151cdbd7510436bdb13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151cdbd7510436bdb13=
674
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151f6fdea34e3d63b13682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151f6fdea34e3d63b13=
683
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115211339c0219ebdb1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115211339c0219ebdb13=
66e
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611522cd5798f58a07b1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611522cd5798f58a07b13=
670
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151bde120a524bebb13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151bde120a524bebb13=
664
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61151d9678e1ce0f81b13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151d9678e1ce0f81b13=
663
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6115207bb322ffac5cb1367c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115207bb322ffac5cb13=
67d
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115229766571de3deb13670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115229766571de3deb13=
671
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115248ceaf171ca07b13669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115248ceaf171ca07b13=
66a
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/611523eea9cfcf3c17b13671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611523eea9cfcf3c17b13=
672
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-collabora   | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/611525a2f91d44af08b1366c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611525a2f91d44af08b13=
66d
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611529fcc29044c52db1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611529fcc29044c52db13=
670
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152cf954f27f4df7b13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152cf954f27f4df7b13=
663
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61153327fe99d33d53b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61153327fe99d33d53b13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6115339eef9428ed26b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115339eef9428ed26b13=
662
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6115343d0b065f9a8fb13675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115343d0b065f9a8fb13=
676
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611534cba9696c8d2ab13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611534cba9696c8d2ab13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115352e9b1e79e465b1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115352e9b1e79e465b13=
670
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115179d5d27e70ca2b1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115179d5d27e70ca2b13=
66e
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6115197ea879261078b1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115197ea879261078b13=
670
        failing since 16 days (last pass: next-20210720, first fail: next-2=
0210726) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611517b9f89ce3c495b13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611517b9f89ce3c495b13=
664
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611519c260a7456baab13675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519c260a7456baab13=
676
        failing since 16 days (last pass: next-20210720, first fail: next-2=
0210726) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b47f27b25e12db13678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b47f27b25e12db13=
679
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151fcb7d74874adfb1368b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151fcb7d74874adfb13=
68c
        failing since 16 days (last pass: next-20210720, first fail: next-2=
0210726) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611531ab707350329db13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611531ab707350329db13=
674
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6115326019d55e2895b13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115326019d55e2895b13=
663
        failing since 16 days (last pass: next-20210720, first fail: next-2=
0210726) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b367b13efe924b136a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b367b13efe924b13=
6aa
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151fbf884453acf0b1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151fbf884453acf0b13=
670
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152217a6b607fe62b1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152217a6b607fe62b13=
66e
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611522b8f136f5e1d3b13669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611522b8f136f5e1d3b13=
66a
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ba26ab472cd97b136af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ba26ab472cd97b13=
6b0
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611520df39c0219ebdb13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611520df39c0219ebdb13=
664
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611523103a04d256c6b13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611523103a04d256c6b13=
668
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152464714d9eb6a2b136b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152464714d9eb6a2b13=
6b3
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61152293afff9d840db13671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152293afff9d840db13=
672
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611528df90c380163fb13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611528df90c380163fb13=
663
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152ba84647de0ec0b136a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152ba84647de0ec0b13=
6a4
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152cb12c64cce541b1368a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152cb12c64cce541b13=
68b
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61153311a51c65f421b13684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61153311a51c65f421b13=
685
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61153451ac7bd7684db13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61153451ac7bd7684db13=
662
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611534f1a9696c8d2ab13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611534f1a9696c8d2ab13=
668
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115352d9c2ecc00f2b13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115352d9c2ecc00f2b13=
668
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611517a35d27e70ca2b13679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611517a35d27e70ca2b13=
67a
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151969f92cfee488b136c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151969f92cfee488b13=
6c7
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611517a4c03940b86fb13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611517a4c03940b86fb13=
668
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611519c13b60a8afdbb13770

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519c13b60a8afdbb13=
771
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-collabora   | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151f8391b9ec3b1ab1367f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151f8391b9ec3b1ab13=
680
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611531d2ca10e9c717b136d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611531d2ca10e9c717b13=
6d4
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6115325f0c573ea08bb1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115325f0c573ea08bb13=
66e
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b72f2d4788b08b13688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b72f2d4788b08b13=
689
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61151e1aaad0680a59b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151e1aaad0680a59b13=
662
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ebb1dd8d1af67b13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ebb1dd8d1af67b13=
668
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611520d7e2ad45f721b13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611520d7e2ad45f721b13=
675
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115236c22fa66b7e4b13669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115236c22fa66b7e4b13=
66a
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151bca2f0207f71eb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151bca2f0207f71eb13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ec213224bebe6b13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ec213224bebe6b13=
668
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151f8a7d74874adfb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151f8a7d74874adfb13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611522abf136f5e1d3b13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611522abf136f5e1d3b13=
665
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611524dc1563a34ab9b13662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611524dc1563a34ab9b13=
663
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611527903479882e6eb1367d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611527903479882e6eb13=
67e
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611529ab103e43b37ab13686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611529ab103e43b37ab13=
687
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61153326a51c65f421b13688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61153326a51c65f421b13=
689
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/611533b3ef9428ed26b13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611533b3ef9428ed26b13=
668
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61153415965c1d3a80b13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61153415965c1d3a80b13=
664
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611534cab4def5bff1b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611534cab4def5bff1b13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611535698fe13b4b3eb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611535698fe13b4b3eb13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611517a55d27e70ca2b1367f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611517a55d27e70ca2b13=
680
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611519cfe32082688ab13678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519cfe32082688ab13=
679
        failing since 16 days (last pass: next-20210720, first fail: next-2=
0210726) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151809fbed34e983b136ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151809fbed34e983b13=
6af
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151a39bc0bb64cd3b136f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151a39bc0bb64cd3b13=
6f2
        failing since 16 days (last pass: next-20210720, first fail: next-2=
0210726) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ca8d0154c85ffb1368c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ca8d0154c85ffb13=
68d
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611520e4e2ad45f721b1367a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611520e4e2ad45f721b13=
67b
        failing since 16 days (last pass: next-20210720, first fail: next-2=
0210726) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611531e795b074a387b136f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-linaro-lkft/baseline-qe=
mu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611531e795b074a387b13=
6f6
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6115328619d55e2895b13665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115328619d55e2895b13=
666
        failing since 16 days (last pass: next-20210720, first fail: next-2=
0210726) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b237b13efe924b1368d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b237b13efe924b13=
68e
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ecf13224bebe6b1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ecf13224bebe6b13=
66e
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611521647060240078b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611521647060240078b13=
66f
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611522a466571de3deb13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611522a466571de3deb13=
675
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151bb61e39f001d1b13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151bb61e39f001d1b13=
674
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151fb27d74874adfb13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151fb27d74874adfb13=
674
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611522c0f136f5e1d3b13670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611522c0f136f5e1d3b13=
671
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6115243beaf171ca07b13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115243beaf171ca07b13=
665
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6115228266571de3deb13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115228266571de3deb13=
665
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611527b6e7d45a9eb1b13681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611527b6e7d45a9eb1b13=
682
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152a40b400fe4a2eb13665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152a40b400fe4a2eb13=
666
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61152c6b727315b077b136b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152c6b727315b077b13=
6b3
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/611532ea19d55e2895b1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611532ea19d55e2895b13=
66e
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6115342a965c1d3a80b13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115342a965c1d3a80b13=
668
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611534ddb4def5bff1b13668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611534ddb4def5bff1b13=
669
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-linaro-lkft | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611535199c2ecc00f2b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611535199c2ecc00f2b13=
662
        failing since 19 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_i386                   | i386   | lab-collabora   | gcc-8    | i386_de=
fconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61152b0da39c6cf054b1368e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/i386=
/i386_defconfig/gcc-8/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/i386=
/i386_defconfig/gcc-8/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152b0da39c6cf054b13=
68f
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_i386-uefi              | i386   | lab-collabora   | gcc-8    | i386_de=
fconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61152b5a2ffe0638eab136d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/i386=
/i386_defconfig/gcc-8/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/i386=
/i386_defconfig/gcc-8/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152b5a2ffe0638eab13=
6d4
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64                 | x86_64 | lab-collabora   | clang-12 | x86_64_=
defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61152256afff9d840db13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152256afff9d840db13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64                 | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/611519cee32082688ab13675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519cee32082688ab13=
676
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64                 | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/611519e4de686ad7d5b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519e4de686ad7d5b13=
66f
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64                 | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61151e0692e3d954c3b13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151e0692e3d954c3b13=
674
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64                 | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151e2872ed9d4e5bb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151e2872ed9d4e5bb13=
662
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64-uefi            | x86_64 | lab-collabora   | clang-12 | x86_64_=
defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6115211d39c0219ebdb13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115211d39c0219ebdb13=
674
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64-uefi            | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61151875710c88553bb13697

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151875710c88553bb13=
698
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64-uefi            | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b115f63fee9b9b1367b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b115f63fee9b9b13=
67c
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64-uefi            | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61151cc9d7510436bdb13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151cc9d7510436bdb13=
668
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64-uefi            | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151f73dea34e3d63b13688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151f73dea34e3d63b13=
689
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64-uefi-mixed      | x86_64 | lab-collabora   | clang-12 | x86_64_=
defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6115213480ea695b2db13679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115213480ea695b2db13=
67a
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64-uefi-mixed      | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61151889a3b39f4bc9b1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151889a3b39f4bc9b13=
67f
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64-uefi-mixed      | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b247b13efe924b13690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b247b13efe924b13=
691
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_x86_64-uefi-mixed      | x86_64 | lab-collabora   | gcc-8    | x86_64_=
defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151e65ed24878c64b13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151e65ed24878c64b13=
665
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874              | arm64  | lab-cip         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/611519215ff6408b22b13755

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519215ff6408b22b13=
756
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874              | arm64  | lab-cip         | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61151b01c64d2a1784b1367d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+crypto/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151b01c64d2a1784b13=
67e
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874              | arm64  | lab-cip         | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61151c698480051ea3b136d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151c698480051ea3b13=
6d3
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64               | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ab4c9cdd6f7fbb13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ab4c9cdd6f7fbb13=
668
        failing since 58 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64     | arm64  | lab-clabbe      | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151932285fe7e1d9b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151932285fe7e1d9b13=
66f
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64     | arm64  | lab-clabbe      | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151c677d1accbb26b13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151c677d1accbb26b13=
664
        failing since 182 days (last pass: next-20210209, first fail: next-=
20210210) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64     | arm64  | lab-clabbe      | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151de375f44880dbb13665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151de375f44880dbb13=
666
        failing since 0 day (last pass: next-20210810, first fail: next-202=
10811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus      | arm64  | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6115193277c5ef5091b13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6115193277c5ef5091b13=
668
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus      | arm64  | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151df975f44880dbb13677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151df975f44880dbb13=
678
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2  | arm64  | lab-clabbe      | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61151ad7fcddac840eb1366b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151ad7fcddac840eb13=
66c
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus | arm64  | lab-clabbe      | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61151da77e04b66ecbb13671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151da77e04b66ecbb13=
672
        new failure (last pass: next-20210811) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big           | arm    | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/611519af3b60a8afdbb13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210804103842+fed41=
342a82f-1~exp1~20210804084624.136)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611519af3b60a8afdbb13=
674
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big           | arm    | lab-collabora   | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61151780d2b894f5afb1367a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61151780d2b894f5afb13=
67b
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big           | arm    | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61152279afff9d840db13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61152279afff9d840db13=
668
        new failure (last pass: next-20210810) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big           | arm    | lab-collabora   | gcc-8    | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/611520702eefe28210b13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210812/arm/=
tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210812/arm/=
tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611520702eefe28210b13=
665
        new failure (last pass: next-20210811) =

 =20
