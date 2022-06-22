Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01D64554AC6
	for <lists+linux-next@lfdr.de>; Wed, 22 Jun 2022 15:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbiFVNTA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jun 2022 09:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbiFVNS7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jun 2022 09:18:59 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F4D2F01F
        for <linux-next@vger.kernel.org>; Wed, 22 Jun 2022 06:18:55 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id d129so16073951pgc.9
        for <linux-next@vger.kernel.org>; Wed, 22 Jun 2022 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LRQUuJDwPXGAifrIY8nAFSDRlisCsIEejSZH0AyD1sM=;
        b=nCZS5YYwQmEbIAXbPiKBKf2TlSeHa3o8FsSUneN0QEdbsrPCbIhr4+J0PXs5KqaQVZ
         2y53/uuSnFRIZ2UCvt1rqjaD02YiSquZ929fzdY3uZ5elOD4Ab3+5xBdFukbh7mFqAXI
         kx4qGGp2uZzGE6plWmmilT71VOTRp9tGVZTAuGI3iynEmVyqx8XIiLrzRI55zU2OCEG1
         MWKRpYN3cNJnqu24GSHWlQ4KKbgB+5rTSPHqjPoJLxc+aSkhAUNxwn2wuUYVilzqWQaA
         y3mEkc21ISeJJyASU8VCwGAFCWgfdgoOueUcF8eqeKaIB1IgbB5MgjE7KVlqZKFbHHsZ
         Kthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LRQUuJDwPXGAifrIY8nAFSDRlisCsIEejSZH0AyD1sM=;
        b=DiF0HufwPhzSOWDYLb+CbUKR0cgo7rL6UmlaWrQhWORkWBSpmgcOxxT0a30iLPtnoz
         wxQm26XwNU07n74vTyoNIOoPwaBVD8GwAyG/4gzdFqVZ8w4W5FuRCg/ebPwzHFrAeeHY
         fcLebW4v4XoOovzqMvGBwXvLS5QsmuFOqNSZJjMMMkIYRsvgPCLgmVlDXvPvxqSEtRwZ
         ogXQxsOISGFEaOaaX0yJH8FoUl0R13r22ym8lQjfdPK2udC5DQzu+e5GXnKMU4GpYboQ
         +BSJbTowdvInEBztO9K/q9z18LbRB7NM7whmE7lkLk31qmzVl4JC8TzDf7V5SREIN9N/
         XVAw==
X-Gm-Message-State: AJIora+kxBhMK53O5YiVdAtqNi09pSWLLTaXcM1W0CPlp1mTUwjjpIGy
        HnLd/YwNgwDGK9ZGp6oxd4ra57oK1DN0loOa2DE=
X-Google-Smtp-Source: AGRyM1tOKuxBelXQ5q9Iqv+cF/LPohh6wfP8y4wKAvAb3QOEUBTX3Vaf+UTOTOjJs1a85duPeEGU+A==
X-Received: by 2002:a63:b64d:0:b0:40c:e4df:dc02 with SMTP id v13-20020a63b64d000000b0040ce4dfdc02mr3015790pgt.450.1655903934032;
        Wed, 22 Jun 2022 06:18:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ji1-20020a170903324100b0016a15842cf5sm7901601plb.121.2022.06.22.06.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 06:18:53 -0700 (PDT)
Message-ID: <62b316bd.1c69fb81.87f28.b59a@mx.google.com>
Date:   Wed, 22 Jun 2022 06:18:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220622
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 699 runs, 291 regressions (next-20220622)
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

next/master baseline: 699 runs, 291 regressions (next-20220622)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig           | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | omap2pl=
us_defconfig          | 1          =

at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | at91_dt=
_defconfig            | 1          =

at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | multi_v=
5_defconfig           | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | omap2pl=
us_defconfig          | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | omap2pl=
us_defconfig          | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 2          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 2          =

imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6qp-sabresd               | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6qp-sabresd               | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6qp-sabresd               | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6qp-sabresd               | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 2          =

imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =

kontron-bl-imx8mm            | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 3          =

kontron-bl-imx8mm            | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 3          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 4          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 4          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =

meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 2          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 2          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | exynos_=
defconfig             | 1          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 2          =

odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | clang-13 | defconf=
ig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig                    | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+crypto             | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | clang-13 | cros://=
chrome...avour.config | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 2          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 5          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | clang-13 | cros://=
chrome...avour.config | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+ima                | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 2          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 2          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 2          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 2          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 2          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 2          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 2          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 2          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 2          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220622/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220622
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ac0ba5454ca85162c08dc429fef1999e077ca976 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b30698722502253da39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b30698722502253da39=
bd9
        failing since 6 days (last pass: next-20220601, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b307edc4c25bdc10a39bdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b307edc4c25bdc10a39=
bde
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b309057b4463e2cca39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b309057b4463e2cca39=
bda
        failing since 0 day (last pass: next-20220610, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62b3094dc1137ae844a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b3094dc1137ae844a39=
bcf
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b307ecc4c25bdc10a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b307ecc4c25bdc10a39=
bdb
        failing since 4 days (last pass: next-20220610, first fail: next-20=
220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e3bbca5a258780a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e3bbca5a258780a39=
bdb
        failing since 12 days (last pass: next-20220602, first fail: next-2=
0220610) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | at91_dt=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2dccb85578d371fa39be2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2dccb85578d371fa39=
be3
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
at91sam9g20ek                | arm   | lab-broonie     | gcc-10   | multi_v=
5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2de306e52c73f4da39bf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2de306e52c73f4da39=
bf9
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e34575344aa9c4a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e34575344aa9c4a39=
bdd
        failing since 6 days (last pass: next-20220602, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e5eda24f62b019a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e5eda24f62b019a39=
bce
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e74253b4d31c62a39be7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e74253b4d31c62a39=
be8
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e1b7bd9ee1e10ea39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e1b7bd9ee1e10ea39=
bdc
        failing since 6 days (last pass: next-20220602, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4c373dc930e7ea39bea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e4c373dc930e7ea39=
beb
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e5ef420b08388ca39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e5ef420b08388ca39=
bdc
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e499517834b126a39c01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e499517834b126a39=
c02
        failing since 4 days (last pass: next-20220610, first fail: next-20=
220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e34d9e9bc66293a39bd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e34d9e9bc66293a39=
bd5
        failing since 4 days (last pass: next-20220610, first fail: next-20=
220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e73f87116b77eaa39be0

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e73f87116b7=
7eaa39be7
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        34 lines

    2022-06-22T09:55:56.096652  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c2449240 pointer offset 0 size 192
    2022-06-22T09:55:56.107696  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c4c9c500 pointer offset 64 size 128
    2022-06-22T09:55:56.118827  kern  :alert : Register r2 information: sla=
b kmalloc-128 start c4c9c580 pointer offset 0 size 128
    2022-06-22T09:55:56.124305  kern  :alert : Register r3 information: sla=
b kmalloc-512 start c21fe400 pointer offset 0 size 512
    2022-06-22T09:55:56.135440  kern  :alert : Register r4 information: sla=
b kmalloc-64 start c4c7f740 pointer offset 0 size 64
    2022-06-22T09:55:56.141058  kern  :alert : <8>[   43.862146] <LAVA_SIGN=
AL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D=
34>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e73f87116b7=
7eaa39be8
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:55:56.070680  kern  :alert : 8<--- cut here ---
    2022-06-22T09:55:56.076110  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c21fe400
    2022-06-22T09:55:56.091102  kern  :alert : [c21fe400] *pgd=3D4200041e(b=
ad<8>[   43.809619] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:55:56.091489  )   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ead824ce701a20a39c1c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ead824ce701=
a20a39c25
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        16 lines

    2022-06-22T10:11:17.556716  kern  :alert : 8<--- cut here ---
    2022-06-22T10:11:17.562180  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c230b800
    2022-06-22T10:11:17.567761  kern  :alert : [c230b800] *pgd=3D4221141e(b=
ad)
    2022-06-22T10:11:17.577103  kern  :alert : Register r0 i<8>[   43.22392=
4] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D16>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2ece1940b00a79aa39be8

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2ece1940b00a=
79aa39bef
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        35 lines

    2022-06-22T10:19:58.432587  n  :alert : Register r1 information: slab k=
malloc-128 start c4f95000 pointer offset 64 size 128
    2022-06-22T10:19:58.443616  kern  :alert : Register r2 information: sla=
b kmalloc-128 start c4f95080 pointer offset 0 size 128
    2022-06-22T10:19:58.449442  kern  :alert : Register r3 information: sla=
b kmalloc-1k start c230a800 pointer offset 0 size 1024
    2022-06-22T10:19:58.460268  kern  :alert : Register r4 information: sla=
b kmalloc-64 start c4e978c0 pointer offset 0 size 64
    2022-06-22T10:19:58.465747  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2022-06-22T10:19:58.471333  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c230a800 pointer offset 0 size 1024
    2022-06-22T10:19:58.482483  kern  :alert : Regis<8>[   43.154058] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D35>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ece1940b00a=
79aa39bf0
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T10:19:58.399287  kern  :alert : 8<--- cut here ---
    2022-06-22T10:19:58.404735  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c230a800
    2022-06-22T10:19:58.410340  kern  :alert : [c230a800] *pgd=3D4221141e(b=
ad)
    2022-06-22T10:19:58.415788  kern  :alert : Register r0 information: sla=
b kmalloc-192
    2022-06-22T10:19:58.426972  ker<8>[   43.096870] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2de976287d0ed40a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2de976287d0ed40a39=
bce
        new failure (last pass: next-20220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f215e379eb2125a39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f215e379eb2125a39=
be1
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e3aab45b5a1f30a39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e3aab45b5a1f30a39=
be9
        failing since 12 days (last pass: next-20220607, first fail: next-2=
0220610) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e0cb6b8dc5adbca39c02

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e0cb6b8dc5a=
dbca39c0a
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:28:38.886845  kern  :alert : 8<--- cut here ---
    2022-06-22T09:28:38.887413  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c20e8810
    2022-06-22T09:28:38.887764  kern  :a<8>[   23.478555] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:28:38.888089  lert : [c20e8810] *pgd=3D1200041e(bad)
    2022-06-22T09:28:38.888397  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c2086cc0 pointer offset 0 size 192
    2022-06-22T09:28:38.888702  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c3612600 pointer offset 64 size 128   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e12e2b5082f2c4a39be6

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e12f2b5082f=
2c4a39bee
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:30:12.233037  kern  :alert : 8<--- cut here ---
    2022-06-22T09:30:12.241047  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2171010   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e1c1bd9ee1e10ea39bea

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e1c1bd9ee1e=
10ea39bf2
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:32:32.483191  kern  :alert : 8<--- cut here ---
    2022-06-22T09:32:32.491811  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2171010
    2022-06-22T09:32:32.500937  kern  :alert : [c2171010] *pgd=3D1201141e<8=
>[   18.994018] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:32:32.501503  (bad)   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4f15b392658dea39bcf

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e4f15b39265=
8dea39bd7
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        32 lines

    2022-06-22T09:45:55.966425  <8>[   26.961997] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-06-22T09:45:56.017040  kern  :alert : 8<--- cut here ---
    2022-06-22T09:45:56.017348  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c20f6410
    2022-06-22T09:45:56.017868  kern  :a<8>[   27.005005] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D32>
    2022-06-22T09:45:56.018123  lert : [c20f6410] *pgd=3D1200041e(bad)
    2022-06-22T09:45:56.018360  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c2095a80 pointer offset 0 size 192   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e5c672b1a1fcffa39bd0

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6q-s=
abresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6q-s=
abresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e5c672b1a1f=
cffa39bd8
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:49:16.919401  kern  :alert : 8<--- cut here ---
    2022-06-22T09:49:16.961318  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2171010
    2022-06-22T09:49:16.961723  kern  :alert : [c2171010] *pgd=3D1201141e<8=
>[   20.041924] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:49:16.961841  (bad)
    2022-06-22T09:49:16.961944  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c208f840 pointer offset 0 size 192
    2022-06-22T09:49:16.962045  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c264bc80 pointer offset 64 size 128   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e6e685787cc8d3a39be5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e6e685787cc=
8d3a39bed
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        32 lines

    2022-06-22T09:54:05.547455  kern  :alert : 8<--- cut here ---
    2022-06-22T09:54:05.547667  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2184410
    2022-06-22T09:54:05.548004  kern  :alert : [c2184410] *pgd=3D1201141e<8=
>[   22.573708] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D32>
    2022-06-22T09:54:05.548135  (bad)
    2022-06-22T09:54:05.548237  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c209e600 pointer offset 0 size 192
    2022-06-22T09:54:05.548336  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c4aa3180 pointer offset 64 size 128   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e6e685787cc=
8d3a39bee
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        82 lines

    2022-06-22T09:54:05.549015  kern  :alert : Register r2 information: NUL=
L pointer
    2022-06-22T09:54:05.590444  kern  :alert : Register r3 information: sla=
b kmalloc-1k start c2184400 pointer offset 16 size 1024
    2022-06-22T09:54:05.590822  kern  :alert : Register r4 information: sla=
b kmalloc-64 start c241fcc0 pointer offset 0 size 64
    2022-06-22T09:54:05.590935  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c4aa3100 pointer offset 0 size 128
    2022-06-22T09:54:05.591049  kern  :alert : Register r6 information: 2-p=
age vmalloc region starting at 0xf0b04000 allocated at kernel_clone+0x8c/0x=
3a8
    2022-06-22T09:54:05.633613  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c2184400 pointer offset 16 size 1024
    2022-06-22T09:54:05.633884  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-06-22T09:54:05.634208  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2022-06-22T09:54:05.634322  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2022-06-22T09:54:05.634441  kern  :alert : Register r11 information: sl=
ab task_struct start c2494c80 pointer offset 0 =

    ... (87 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e628bee0ec1f75a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e628bee0ec1f75a39=
bcf
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e1dc7e821583ada39c13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-imx6q-var-dt=
6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-imx6q-var-dt=
6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e1dc7e821583ada39=
c14
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e349da3358f7b0a39c1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-im=
x6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-im=
x6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e349da3358f7b0a39=
c1c
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4c3582f3d1e1ea39bf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e4c3582f3d1e1ea39=
bf6
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e6dc85787cc8d3a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6q-var-dt6custombo=
ard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6q-var-dt6custombo=
ard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e6dc85787cc8d3a39=
bd3
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-sabresd               | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e6e845e96f9cd2a39bf3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e6e845e96f9cd2a39=
bf4
        failing since 12 days (last pass: next-20220601, first fail: next-2=
0220610) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-sabresd               | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e3dec5795086a2a39bce

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6qp-sabresd.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e3dec579508=
6a2a39bd6
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:41:31.173991  kern  :alert : 8<--- cut here ---
    2022-06-22T09:41:31.174226  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c20aa810
    2022-06-22T09:41:31.174690  kern  :a<8>[   24.218602] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:41:31.175037  lert : [c20aa810] *pgd=3D1200041e(bad)
    2022-06-22T09:41:31.175364  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c2088000 pointer offset 0 size 192   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-sabresd               | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e48e517834b126a39bf3

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6qp-=
sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6qp-=
sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e48e517834b=
126a39bfb
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        32 lines

    2022-06-22T09:44:31.900489  kern  :alert : 8<--- cut here ---
    2022-06-22T09:44:31.943092  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2184410
    2022-06-22T09:44:31.943497  kern  :alert : [c2184410] *pgd=3D1201141e<8=
>[   23.435840] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D32>
    2022-06-22T09:44:31.943777  (bad)   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-sabresd               | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e5413eccea0688a39be4

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e5413eccea0=
688a39bec
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:47:24.397915  kern  :alert : 8<--- cut here ---
    2022-06-22T09:47:24.440006  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2171010
    2022-06-22T09:47:24.440519  kern  :alert : [c2171010] *pgd=3D1201141e<8=
>[   20.350394] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:47:24.440631  (bad)
    2022-06-22T09:47:24.440733  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c208fb40 pointer offset 0 size 192
    2022-06-22T09:47:24.440843  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c4bdfa00 pointer offset 64 size 128   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e2c544eb324761a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e2c544eb324761a39=
bce
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e7f5fd604708e2a39c55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e7f5fd604708e2a39=
c56
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e486517834b126a39be5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e486517834b=
126a39bed
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:43:59.907546  kern  :alert : 8<--- cut here ---
    2022-06-22T09:43:59.949783  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c20bc010
    2022-06-22T09:43:59.950165  kern  :alert : [c20bc010] *pgd=3D8200041e<8=
>[   30.611962] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:43:59.950424  (bad)   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e55ba000c452d4a39bf7

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6sx-=
sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6sx-=
sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e55ba000c45=
2d4a39bff
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:47:53.727407  kern  :alert : 8<--- cut here ---
    2022-06-22T09:47:53.769822  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2109410
    2022-06-22T09:47:53.770310  kern  :alert : [c2109410] *pgd=3D8201141e<8=
>[   33.880796] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:47:53.770514  (bad)
    2022-06-22T09:47:53.770679  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c2094180 pointer offset 0 size 192
    2022-06-22T09:47:53.770857  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c3a55800 pointer offset 64 size 128   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e61d2dec2606e9a39bd5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e61d2dec260=
6e9a39bdd
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:51:04.161965  kern  :alert : 8<--- cut here ---
    2022-06-22T09:51:04.162271  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2109410
    2022-06-22T09:51:04.162804  kern  :alert : [c2109410] *pgd=3D8201141e<8=
>[   33.901449] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:51:04.163055  (bad)
    2022-06-22T09:51:04.163290  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c2094180 pointer offset 0 size 192
    2022-06-22T09:51:04.163524  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c395f500 pointer offset 64 size 128   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e832d24bb77572a39c55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e832d24bb77572a39=
c56
        failing since 4 days (last pass: next-20220610, first fail: next-20=
220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4de2af7fa8035a39bfa

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e4de2af7fa8=
035a39c02
        failing since 0 day (last pass: next-20220601, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:45:49.944329  kern  :alert : 8<--- cut here ---
    2022-06-22T09:45:49.944654  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c20d4410
    2022-06-22T09:45:49.944780  kern  :alert : [c20d4410] *pgd=3D8200041e(b=
ad)
    2022-06-22T09:45:49.966335  kern  :alert : Register r0 information: sla=
b kmalloc-19<8>[   31.953593] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RE=
SULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e59eff23d26e58a39bd1

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e59eff23d26=
e58a39bd9
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:48:51.388688  kern  :alert : 8<--- cut here ---
    2022-06-22T09:48:51.389164  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2185010
    2022-06-22T09:48:51.389374  kern  :alert : [c2185010] *pgd=3D8201141e(b=
ad)
    2022-06-22T09:48:51.410643  kern  :alert : Register r0 information: sla=
b kmalloc-19<8>[   32.602982] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RE=
SULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e682a3d24753f5a39c52

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e682a3d2475=
3f5a39c5a
        failing since 0 day (last pass: next-20220610, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:52:52.542778  kern  :alert : 8<--- cut here ---
    2022-06-22T09:52:52.543097  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2185010
    2022-06-22T09:52:52.543620  kern  :alert : [c2185010] *pgd=3D8201141e(b=
ad)
    2022-06-22T09:52:52.565038  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c2082300 pointer offset<8>[   33.457428] <LAVA_SIGNAL_T=
ESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:52:52.565342   0 size 192
    2022-06-22T09:52:52.565635  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c7ade500 pointer offset 64 size 128   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f27965594fdbb5a39be6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f27965594fdbb5a39=
be7
        failing since 43 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2eb21e2df828058a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6ul-pi=
co-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6ul-pi=
co-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2eb21e2df828058a39=
bd9
        failing since 43 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ee7d8103c4acd6a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2ee7d8103c4acd6a39=
bd0
        failing since 43 days (last pass: next-20211207, first fail: next-2=
0220509) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ef0bf930c6c3f8a39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2ef0bf930c6c3f8a39=
bd7
        failing since 43 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e121915d93ba2fa39bf2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e121915d93b=
a2fa39bfa
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:29:40.856714  kern  :alert : 8<--- cut here ---
    2022-06-22T09:29:40.857419  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c20c8c10
    2022-06-22T09:29:40.857785  kern  :alert : [c20c8c10] *pgd=3D8200041e<8=
>[   23.260982] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:29:40.858123  (bad)
    2022-06-22T09:29:40.858457  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c20a2e40 pointer offset 0 size 192
    2022-06-22T09:29:40.858787  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c3c88600 pointer offset 64 size 128   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e1fc1dda4a5e2ca39bce

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e1fc1dda4a5=
e2ca39bd6
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:33:23.265419  kern  :alert : 8<--- cut here ---
    2022-06-22T09:33:23.265589  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2198810
    2022-06-22T09:33:23.265947  kern  :alert : [c2198810] *pgd=3D8201141e<8=
>[   19.847069] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:33:23.266069  (bad)
    2022-06-22T09:33:23.266186  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c20ab9c0 pointer offset 0 size 192   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e2d644eb324761a39c2b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e2d644eb324=
761a39c33
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:37:04.567152  kern  :alert : 8<--- cut here ---
    2022-06-22T09:37:04.567615  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c2198810
    2022-06-22T09:37:04.567754  kern  :alert : [c2198810] *pgd=3D8201141e<8=
>[   19.935776] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:37:04.567890  (bad)
    2022-06-22T09:37:04.568018  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c20ab9c0 pointer offset 0 size 192   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e8fd287b7d1acba39c10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e8fd287b7d1acba39=
c11
        failing since 12 days (last pass: next-20220601, first fail: next-2=
0220610) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e6d912928a7944a39bd2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e6d912928a7=
944a39bda
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:54:06.759949  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ff<8>[   20.378197] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D9>
    2022-06-22T09:54:06.761281  ff000000299810
    2022-06-22T09:54:06.762299  kern  :alert : Mem abort info:
    2022-06-22T09:54:06.763346  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:54:06.764441  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:54:06.765450  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:54:06.766639  kern  :alert :   EA =3D 0, S1PTW =3D<8>[   =
20.405946] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:54:06.767670   0   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2ebb4878d0929d5a39c9b

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2ebb4878d092=
9d5a39ca2
        new failure (last pass: next-20220621)
        2 lines

    2022-06-22T10:14:46.860270  kern  :alert :   EA =3D 0, S1PTW =3D<8>[   =
20.314483] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-06-22T10:14:46.861482   0
    2022-06-22T10:14:46.862487  kern  :alert :   FSC =3D 0x0f: <8>[   20.32=
5565] <LAVA_SIGNAL_ENDRUN 0_dmesg 2120091_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ebb4878d092=
9d5a39ca3
        new failure (last pass: next-20220621)
        9 lines

    2022-06-22T10:14:46.817438  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ff<8>[   20.285175] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D9>
    2022-06-22T10:14:46.818513  ff000000299810
    2022-06-22T10:14:46.819527  kern  :alert : Mem abort info:
    2022-06-22T10:14:46.820690  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T10:14:46.821713  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T10:14:46.822727  kern  :alert :   SET =3D 0, FnV =3D 0   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e38b9116de668ba39bcd

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e38b9116de6=
68ba39bd5
        new failure (last pass: next-20220621)
        9 lines

    2022-06-22T09:40:07.867719  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ff<8>[   24.655698] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D9>
    2022-06-22T09:40:07.867974  ff00002008d410
    2022-06-22T09:40:07.868116  kern  :alert : Mem abort info:
    2022-06-22T09:40:07.868258  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:40:07.868371  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:40:07.868481  kern  :alert :   SET =3D 0, FnV =3D 0   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b306fc786435c905a39bf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b306fc786435c905a39=
bf3
        failing since 1 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b309e034b7445b64a39bef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b309e034b7445b64a39=
bf0
        failing since 1 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b30b48cb14a98660a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b30b48cb14a98660a39=
bd0
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b30fa9269fb0fa06a39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b30fa9269fb0fa06a39=
bdf
        failing since 71 days (last pass: next-20220401, first fail: next-2=
0220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b301e7eab7cab972a39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b301e7eab7cab972a39=
bd2
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-bl-imx8mm            | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 3          =


  Details:     https://kernelci.org/test/plan/id/62b2e8a8b11b76744da39bd1

  Results:     40 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-bl-imx8mm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-bl-imx8mm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.spi-nor-probed: https://kernelci.org/test/case/id/62b2e=
8a8b11b76744da39bfb
        new failure (last pass: next-20220621)

    2022-06-22T10:02:04.848962  /lava-130907/1/../bin/lava-test-case
    2022-06-22T10:02:04.849332  <8>[   48.279870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dspi-nor-probed RESULT=3Dfail>
    2022-06-22T10:02:04.849548  + set<8>[   48.290691] <LAVA_SIGNAL_ENDRUN =
1_bootrr 130907_1.5.2.4.5>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e8a8b11b767=
44da39bfe
        new failure (last pass: next-20220621)
        9 lines

    2022-06-22T10:02:01.473421  kern  :alert : Unable to handle kernel exec=
ute from non-executab<8>[   44.896691] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>
    2022-06-22T10:02:01.473730  le memory at virtual address ffff0000002bcc=
10
    2022-06-22T10:02:01.473977  kern  :alert : Mem abort info:
    2022-06-22T10:02:01.474215  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T10:02:01.474449  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T10:02:01.474681  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e8a8b11b767=
44da39bff
        new failure (last pass: next-20220621)
        2 lines

    2022-06-22T10:02:01.476687  k<8>[   44.922546] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-bl-imx8mm            | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 3          =


  Details:     https://kernelci.org/test/plan/id/62b2ecccace02925eaa39be3

  Results:     40 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-bl-imx8mm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-bl-imx8mm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.spi-nor-probed: https://kernelci.org/test/case/id/62b2e=
cccace02925eaa39c0d
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)

    2022-06-22T10:19:43.800087  /lava-130940/1/../bin/lava-test-case
    2022-06-22T10:19:43.800397  <8>[   48.317593] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dspi-nor-probed RESULT=3Dfail>
    2022-06-22T10:19:43.800546  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ecccace0292=
5eaa39c10
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T10:19:40.417448  kern  :alert : Unable to handle kernel exec=
ute from non-executab<8>[   44.926892] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>
    2022-06-22T10:19:40.417802  le memory at virtual address ffff0000002bcc=
10
    2022-06-22T10:19:40.417982  kern  :alert : Mem abort info:
    2022-06-22T10:19:40.418152  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T10:19:40.418295  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T10:19:40.418434  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2ecccace0292=
5eaa39c11
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines

    2022-06-22T10:19:40.420690  k<8>[   44.953533] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 4          =


  Details:     https://kernelci.org/test/plan/id/62b2e538574de344d4a39c01

  Results:     48 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62b2e538574de344d4a39c0f
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616)

    2022-06-22T09:47:10.630563  /lava-130905/1/../bin/lava-test-case
    2022-06-22T09:47:10.630981  <8>[   19.444887] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-06-22T09:47:10.631223  /lava-130905/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62b=
2e538574de344d4a39c11
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616)

    2022-06-22T09:47:11.672386  /lava-130905/1/../bin/lava-test-case
    2022-06-22T09:47:11.673039  <8>[   20.491687] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-06-22T09:47:11.673291  /lava-130905/1/../bin/lava-test-case
    2022-06-22T09:47:11.673517  <8>[   20.512818] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-06-22T09:47:11.673739  /lava-130905/1/../bin/lava-test-case
    2022-06-22T09:47:11.673952  <8>[   20.534294] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-06-22T09:47:11.674190  /lava-130905/1/../bin/lava-test-case   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e538574de34=
4d4a39c36
        new failure (last pass: next-20220616)
        9 lines

    2022-06-22T09:47:07.880771  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ff<8>[   16.582002] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D9>
    2022-06-22T09:47:07.881092  ff0000c00b8010
    2022-06-22T09:47:07.881333  kern  :alert : Mem abort info:
    2022-06-22T09:47:07.881563  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:47:07.881789  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:47:07.882014  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:47:07.882234  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e538574de34=
4d4a39c37
        new failure (last pass: next-20220616)
        2 lines

    2022-06-22T09:47:07.923910  kern  :alert :   FSC =3D 0x0f<8>[   16.6130=
13] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D2>
    2022-06-22T09:47:07.924242  : level 3 permission fault
    2022-06-22T09:47:07.924486  kern <8>[   16.625682] <LAVA_SIGNAL_ENDRUN =
0_dmesg 130905_1.5.2.4.1>
    2022-06-22T09:47:07.924719   :alert : swapper pgtable: 4k pages, 48-bit=
 VAs, pgdp=3D0000000041eb3000
    2022-06-22T09:47:07.924946  kern  :alert : [ffff0000c00b8010] pgd=3D180=
000013fff8003, p4d=3D180000013fff8003, pud=3D180000013f9ff003, pmd=3D180000=
013f9fe003, pte=3D00680001000b8707
    2022-06-22T09:47:07.925172  kern  :emerg : Internal error: Oops: 860000=
0f [#1] PREEMPT SMP   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 4          =


  Details:     https://kernelci.org/test/plan/id/62b2e59c4239ca950da39bf9

  Results:     47 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62b2e59c4239ca950da39c07
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616)

    2022-06-22T09:49:06.880039  /lava-130910/1/../bin/lava-test-case
    2022-06-22T09:49:06.880473  <8>[   19.553385] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62b=
2e59c4239ca950da39c09
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616)

    2022-06-22T09:49:07.842695  /lava-130910/1/../bin/lava-test-case
    2022-06-22T09:49:07.881684  <8>[   20.600715] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-06-22T09:49:07.881984  /lava-130910/1/../bin/lava-test-case   =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/62b=
2e59c4239ca950da39c0c
        new failure (last pass: next-20220621)

    2022-06-22T09:49:08.944658  /lava-130910/1/../bin/lava-test-case
    2022-06-22T09:49:08.944954  <8>[   21.668210] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-06-22T09:49:08.945104  /lava-130910/1/../bin/lava-test-case
    2022-06-22T09:49:08.945244  <8>[   21.689362] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-06-22T09:49:08.945385  /lava-130910/1/../bin/lava-test-case
    2022-06-22T09:49:08.945521  <8>[   21.711883] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-06-22T09:49:08.945656  /lava-130910/1/../bin/lava-test-case   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e59c4239ca9=
50da39c2e
        new failure (last pass: next-20220621)
        9 lines

    2022-06-22T09:49:04.125394  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ff<8>[   16.690701] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D9>
    2022-06-22T09:49:04.125768  ff0000c00b8010
    2022-06-22T09:49:04.126013  kern  :alert : Mem abort info:
    2022-06-22T09:49:04.126244  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:49:04.126473  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:49:04.126699  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:49:04.126921  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e72c5ec1f7f995a39bd6

  Results:     48 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62b2e72c5ec1f7f995a39be4
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616)

    2022-06-22T09:55:43.896353  /lava-130933/1/../bin/lava-test-case
    2022-06-22T09:55:43.936419  <8>[   19.272455] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-06-22T09:55:43.936680  /lava-130933/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62b=
2e72c5ec1f7f995a39be6
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616)

    2022-06-22T09:55:44.896290  /lava-130933/1/../bin/lava-test-case
    2022-06-22T09:55:44.962724  <8>[   20.311834] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-06-22T09:55:44.963076  /lava-130933/1/../bin/lava-test-case
    2022-06-22T09:55:44.963270  <8>[   20.330410] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-06-22T09:55:44.963458  /lava-130933/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e82f0db3f4f79fa39bde

  Results:     48 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e82f0db3f4f=
79fa39c13
        new failure (last pass: next-20220621)
        9 lines

    2022-06-22T10:00:00.318170  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ff<8>[   16.523598] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D9>
    2022-06-22T10:00:00.318517  ff0000c00b8010
    2022-06-22T10:00:00.318760  kern  :alert : Mem abort info:
    2022-06-22T10:00:00.318992  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T10:00:00.319221  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T10:00:00.319448  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T10:00:00.319671  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e895a50c779a4ba39bfe

  Results:     49 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62b2e895a50c779a4ba39c0c
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616)

    2022-06-22T10:01:36.218135  /lava-130942/1/../bin/lava-test-case
    2022-06-22T10:01:36.218441  <8>[   19.003872] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-06-22T10:01:36.218595  /lava-130942/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62b=
2e895a50c779a4ba39c0e
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616)

    2022-06-22T10:01:37.225169  /lava-130942/1/../bin/lava-test-case
    2022-06-22T10:01:37.225546  <8>[   20.035200] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-06-22T10:01:37.225792  /lava-130942/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e0d5ac05abdd43a39bd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e0d5ac05abdd43a39=
bd6
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e23d489fee9d02a39bd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e23d489fee9d02a39=
bd4
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e409d6e03995cea39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e409d6e03995cea39=
be0
        new failure (last pass: next-20220621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e55d8120f864b9a39c76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e55d8120f864b9a39=
c77
        new failure (last pass: next-20220621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e6b1105ae9ad02a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e6b1105ae9ad02a39=
bdd
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2dfd6dec76e71dca39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2dfd6dec76e71dca39=
be5
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e038176f91b816a39bec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e038176f91b816a39=
bed
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e32fda3358f7b0a39c08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e32fda3358f7b0a39=
c09
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e3bdca5a258780a39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e3bdca5a258780a39=
be0
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4c1e705078562a39c44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e4c1e705078562a39=
c45
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e07991d97717b5a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e07991d97717b5a39=
bcf
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e0d6b7c44a7045a39bd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e0d6b7c44a7045a39=
bd4
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e59cf12254f6bea39bf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e59cf12254f6bea39=
bf3
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e959d84e57311ba39bf7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e959d84e57311ba39=
bf8
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ed587194e14a56a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2ed587194e14a56a39=
bdb
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f1e2e296f68e0da39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f1e2e296f68e0da39=
bdb
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f349cd0a5b77b5a39c00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f349cd0a5b77b5a39=
c01
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f5c9f4584f90cfa39c12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim=
3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim=
3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f5c9f4584f90cfa39=
c13
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e92b002d7cca85a39bdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e92b002d7cca85a39=
bde
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ec0ad073d73b32a39be2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2ec0ad073d73b32a39=
be3
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ef4661e9e4c857a39bec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2ef4661e9e4c857a39=
bed
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f31fb4a4ac87dda39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f31fb4a4ac87dda39=
be9
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f5504ced1d0dcda39bf9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vi=
m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vi=
m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f5504ced1d0dcda39=
bfa
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e2ce37053e2793a39be2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e2ce37053e2=
793a39be9
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        4 lines

    2022-06-22T09:36:59.433393  kern  :alert : Mem abort info:
    2022-06-22T09:36:59.433633  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:36:59.433798  kern  :alert :   EC =3D 0x21: IABT (curren<=
8>[   19.198669] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail U=
NITS=3Dlines MEASUREMENT=3D4>
    2022-06-22T09:36:59.433920  t EL), I<8>[   19.206557] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 2119776_1.5.2.4.1>
    2022-06-22T09:36:59.434033  L =3D 32 bits
    2022-06-22T09:36:59.434140  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:36:59.434244  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:36:59.434346  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e2ce37053e2=
793a39bea
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        18 lines

    2022-06-22T09:36:59.393610  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff<8>[   19.179019] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D18>
    2022-06-22T09:36:59.393840  000000239410   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e5c1170e57fb5ea39bef

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e5c1170e57f=
b5ea39bf7
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:49:36.224306  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff<8>[   18.872996] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D9>
    2022-06-22T09:49:36.224694  000040aacc10
    2022-06-22T09:49:36.225004  kern  :alert : Mem abort info:
    2022-06-22T09:49:36.225261  kern  :alert :   ESR =3D 0x000000008600000f=
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e6117e94049b64a39bd5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e6117e94049=
b64a39bdc
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e6117e94049=
b64a39bdd
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:50:56.268077  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff<8>[   18.971785] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D9>
    2022-06-22T09:50:56.268398  0000008fcc10
    2022-06-22T09:50:56.268624  kern  :alert : Mem abort info:
    2022-06-22T09:50:56.268809  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:50:56.268983  kern  :alert :   EC =3D <8>[   18.989692] <=
LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASU=
REMENT=3D2>
    2022-06-22T09:50:56.269166  0x21:<8>[   18.998291] <LAVA_SIGNAL_ENDRUN =
0_dmesg 2120033_1.5.2.4.1>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e6612f21d2b01ca39bdb

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e6612f21d2b=
01ca39be2
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e6612f21d2b=
01ca39be3
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:52:16.497431  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff<8>[   19.077850] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D9>
    2022-06-22T09:52:16.497761  0000008fbc10
    2022-06-22T09:52:16.497960  kern  :alert : Mem abort info:
    2022-06-22T09:52:16.498110  kern  :alert <8>[   19.094066] <LAVA_SIGNAL=
_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:52:16.498258  :   ESR =3D 0x0<8>[   19.101240] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 2120062_1.5.2.4.1>
    2022-06-22T09:52:16.498402  00000008600000f   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e16a7dbef49371a39bf7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e16a7dbef49371a39=
bf8
        new failure (last pass: next-20220506) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e49f517834b126a39c05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e49f517834b126a39=
c06
        new failure (last pass: next-20220506) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e77e568b14e119a39fcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e77e568b14e119a39=
fce
        failing since 0 day (last pass: next-20220506, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e8f8287b7d1acba39c0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e8f8287b7d1acba39=
c0b
        failing since 0 day (last pass: next-20220506, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e61b057c337718a39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e61b057c337718a39=
be1
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e80fd24bb77572a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e80fd24bb77572a39=
bce
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2eaaadffbdb44f5a39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2eaaadffbdb44f5a39=
be5
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ed609a5b76abf5a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2ed609a5b76abf5a39=
bd3
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2efb926558c93e6a39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2efb926558c93e6a39=
bdb
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f199f558194c42a39fa7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f199f558194c42a39=
fa8
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e103f452eeb30fa39bf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e103f452eeb30fa39=
bf3
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e30e1ed0428e42a39c0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e30e1ed0428e42a39=
c0d
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e424fd5593d83aa39c28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e424fd5593d83aa39=
c29
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e59eff23d26e58a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e59eff23d26e58a39=
bcf
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e61c057c337718a39be5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e61c057c337718a39=
be6
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2df8a7895f2bb70a39bd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2df8a7895f2bb70a39=
bd5
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e0762fb2fad3fba39bea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e0762fb2fad3fba39=
beb
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e0ff036b74b5a1a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e0ff036b74b5a1a39=
bd0
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e2d06ed4063a8ca39bef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e2d06ed4063a8ca39=
bf0
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e421020afa5b67a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e421020afa5b67a39=
bdd
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4bf73dc930e7ea39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e4bf73dc930e7ea39=
be5
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e59d4239ca950da39c32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e59d4239ca950da39=
c33
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2df8741bc420b91a39bf1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2df8741bc420b91a39=
bf2
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e05d83e5a75ec8a39be3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e05d83e5a75ec8a39=
be4
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e0eab7c44a7045a39c42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e0eab7c44a7045a39=
c43
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4223c7cfbfd67a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e4223c7cfbfd67a39=
bce
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4a973dc930e7ea39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e4a973dc930e7ea39=
bdc
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e5a0ff23d26e58a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e5a0ff23d26e58a39=
bdd
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e24af0ba555749a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-me=
son8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-me=
son8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e24af0ba555749a39=
bce
        new failure (last pass: next-20220524) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e35b9e9bc66293a39c38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e35b9e9bc66293a39=
c39
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4d3735a3b50b7a39c4c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e4d3735a3b50b7a39=
c4d
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e1744a8b0b89b9a39bd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e1744a8b0b89b9a39=
bd8
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2df62034a227802a39da2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2df62034a227802a39=
da3
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e273157ad89ae4a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e273157ad89ae4a39=
bce
        failing since 40 days (last pass: next-20220506, first fail: next-2=
0220512) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e06c83e5a75ec8a39c53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e06c83e5a75ec8a39=
c54
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | exynos_=
defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e86bdc9f6478e4a39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e86bdc9f6478e4a39=
bda
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2ecd6940b00a79aa39bd9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-odroid-xu3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-odroid-xu3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2ecd6940b00a=
79aa39be0
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        84 lines

    2022-06-22T10:19:47.412737   [c20c9410] *pgd=3D4200041e(bad)
    2022-06-22T10:19:47.413353  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c20a7240 pointer offset 0 size 192
    2022-06-22T10:19:47.413793  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c20f9780 pointer offset 64 size 128
    2022-06-22T10:19:47.434473  kern  :alert : Register r2 information: NUL=
L pointer
    2022-06-22T10:19:47.434972  kern  :alert : Register r3 information: sla=
b kmalloc-1k start c20c9400 pointer offset 16 size 1024
    2022-06-22T10:19:47.435406  kern  :alert : Register r4 information: sla=
b kmalloc-64 start c33f7640 pointer offset 0 size 64
    2022-06-22T10:19:47.456321  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c2272680 pointer offset 0 size 128
    2022-06-22T10:19:47.456857  kern  :alert : Register r6 information: 2-p=
age vmalloc region starting at 0xf0d10000 allocated at kernel_clone+0x8c/0x=
354
    2022-06-22T10:19:47.478419  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c20c9400 pointer offset 16 size 1024
    2022-06-22T10:19:47.478919  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (94 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ecd6940b00a=
79aa39be1
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        32 lines

    2022-06-22T10:19:47.389572  kern  :alert : 8<--- cut here ---
    2022-06-22T10:19:47.390068  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c20c9410
    2022-06-22T10:19:47.390500  kern  :alert :<8>[   31.865643] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3=
2>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2ed7d75de814bc7a39bd0

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2ed7d75de814=
bc7a39bd7
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        42 lines

    2022-06-22T10:22:29.628173  kern  :alert : Register r2 information: NUL=
L pointer
    2022-06-22T10:22:29.628653  kern  :alert : Register r3 information: sla=
b kmalloc-1k start c25c2c00 pointer offset 16 size 1024
    2022-06-22T10:22:29.629109  kern  :alert : Register r4 information: sla=
b kmalloc-64 start c2225cc0 pointer offset 0 size 64
    2022-06-22T10:22:29.650193  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c31cfe80 pointer offset 0 size 128
    2022-06-22T10:22:29.650676  kern  :alert : Register r6 information: 2-p=
age vmalloc region starting at 0xf0e98000 allocated at kernel_clone+0x41/0x=
2e0
    2022-06-22T10:22:29.673468  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c25c2c00 pointer offset 16 size 1024
    2022-06-22T10:22:29.673969  kern  :alert : Register r8 information: non=
-slab/vmalloc memory
    2022-06-22T10:22:29.674378  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2022-06-22T10:22:29.674781  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2022-06-22T10:22:29.695450  kern  :alert : Register r11 information: sl=
ab task_struct start c461a200 pointer offset 0 =

    ... (42 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ed7d75de814=
bc7a39bd8
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        16 lines

    2022-06-22T10:22:29.584475  kern  :alert : 8<--- cut here ---
    2022-06-22T10:22:29.584905  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c25c2c10
    2022-06-22T10:22:29.585318  kern  :alert : [c25c2c10] *pgd=3D4241141e(b=
ad)
    2022-06-22T10:22:29.606223  kern  :a<8>[   22.964168] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T10:22:29.606576  lert : Register r0 information: slab kmallo=
c-192 start c20b7d80 pointer offset 0 size 192
    2022-06-22T10:22:29.606884  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c31cff00 pointer offset 64 size 128   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2efce26558c93e6a39bf5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2efce26558c9=
3e6a39bfc
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        84 lines

    2022-06-22T10:32:39.136014  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c20b7d80 pointer offset 0 size 192
    2022-06-22T10:32:39.136552  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c253d780 pointer offset 64 size 128
    2022-06-22T10:32:39.136967  kern  :alert : Register r2 information: NUL=
L pointer
    2022-06-22T10:32:39.157571  kern  :alert : Register r3 information: sla=
b kmalloc-1k start c25c2c00 pointer offset 16 size<6>[   23.624814] smsc95x=
x v2.0.0
    2022-06-22T10:32:39.158106   1024
    2022-06-22T10:32:39.158511  kern  :alert : Register r4 information: sla=
b kmalloc-64 start c2128c80
    2022-06-22T10:32:39.158906  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c253d700 pointer offset 0 size 128
    2022-06-22T10:32:39.159293  kern  :alert : Register r6 information:
    2022-06-22T10:32:39.179815  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c25c2c00 pointer offset 16 size 1024
    2022-06-22T10:32:39.180285  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (98 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2efce26558c9=
3e6a39bfd
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        32 lines

    2022-06-22T10:32:39.090529  kern  :alert : 8<--- cut here ---
    2022-06-22T10:32:39.091045  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c25c2c10
    2022-06-22T10:32:39.091471  kern  :alert : [c25c2c10] *pgd=3D4241141e(b=
ad)
    2022-06-22T10:32:39.091865  kern  :alert : 8<--- cut here ---
    2022-06-22T10:32:39.112281  kern  :alert : Unable to handl<8>[   23.577=
970] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D32>
    2022-06-22T10:32:39.112622  e kernel paging request at virtual address =
c25ccc10
    2022-06-22T10:32:39.112901  kern  :alert : [c25ccc10] *pgd=3D4241141e   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f2d2e45361f71fa39bdb

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2f2d2e45361f=
71fa39be3
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        32 lines

    2022-06-22T10:45:16.649757  <6>[   23.210906] usb 3-1.1: new high-speed=
 USB device number 3 using exynos-ehci
    2022-06-22T10:45:16.676454  kern  :alert : 8<--- cut here ---
    2022-06-22T10:45:16.676730  kern  :alert : Unable to handle kernel exec=
ution of memory at virtual address c25cac10
    2022-06-22T10:45:16.698273  kern  :alert : [c25cac10] *pgd=3D8000004020=
7003, *pmd=3D4000004240071d(bad)<8>[   23.238581] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D32>
    2022-06-22T10:45:16.698550  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c20b7d80 pointer offset 0 size 192
    2022-06-22T10:45:16.698860  kern  :alert : Register r1 information:
    2022-06-22T10:45:16.699141  kern  :alert : 8<--- cut here ---   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e39ce13419a652a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e39ce13419a652a39=
bdd
        failing since 0 day (last pass: next-20220602, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e8c3a8312bd6e7a39be7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e8c3a8312bd6e7a39=
be8
        failing since 4 days (last pass: next-20220602, first fail: next-20=
220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2eaa8dffbdb44f5a39bdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2eaa8dffbdb44f5a39=
be0
        failing since 0 day (last pass: next-20220602, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | omap2pl=
us_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e6f777af04e7bda39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e6f777af04e7bda39=
bce
        failing since 4 days (last pass: next-20220602, first fail: next-20=
220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e0652fb2fad3fba39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e0652fb2fad3fba39=
bce
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | clang-13 | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e27b157ad89ae4a39be1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e27b157ad89ae4a39=
be2
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e05983e5a75ec8a39bd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e05983e5a75ec8a39=
bd6
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e0d306dbc702c6a39be3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e0d306dbc702c6a39=
be4
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e1c173abbbc526a39bd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e1c173abbbc526a39=
bd8
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e36b0ec305bbeaa39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e36b0ec305bbeaa39=
bcf
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e3f1d6e03995cea39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e3f1d6e03995cea39=
bda
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4e626d61c4a15a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e4e626d61c4a15a39=
bce
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e5216dc0a7cc86a39c4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e5216dc0a7cc86a39=
c4c
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e5d542025ec162a39bea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e5d542025ec162a39=
beb
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e626f20fbf81aea39bee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e626f20fbf81aea39=
bef
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e7f299b3a908dca39c00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e7f299b3a908dca39=
c01
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e9aaa6fa72eccca39bed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e9aaa6fa72eccca39=
bee
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ead6865477bb34a39bf1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2ead6865477bb34a39=
bf2
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e9532930452987a39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e9532930452987a39=
be9
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ec234abbf58f4aa39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2ec234abbf58f4aa39=
bd9
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ed8fa2da40c972a39bd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2ed8fa2da40c972a39=
bd5
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f4bfdd20209b28a39bf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f4bfdd20209b28a39=
bf3
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f522ad2ebd35ada39c06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f522ad2ebd35ada39=
c07
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f6936638c77d17a39bce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f6936638c77d17a39=
bcf
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2f9647dd121aaaea39c0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2f9647dd121aaaea39=
c0b
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b3007f308ec016b3a39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b3007f308ec016b3a39=
bd7
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | clang-13 | cros://=
chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e7c9fd2a1fe237a39c6c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e7c9fd2a1fe237a39=
c6d
        new failure (last pass: next-20220519) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e37d0ec305bbeaa39bdf

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e37d0ec305b=
beaa39be6
        new failure (last pass: next-20220518)
        2 lines

    2022-06-22T09:39:49.133993  kern  :emerg : Internal error: Oops: 960000=
4e [#1] PREEMPT SMP
    2022-06-22T09:39:49.137523  kern  :emerg : Code: b9403262 b9408420 4b02=
0000 11000400 (b9008420) =

    2022-06-22T09:39:49.142025  [   69.292065] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:39:49.142252  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e37d0ec305b=
beaa39be7
        new failure (last pass: next-20220518)
        12 lines

    2022-06-22T09:39:49.114489  kern  :alert : Unable to handle kernel writ=
e to read-only memory at virtual address ffff800009728074
    2022-06-22T09:39:49.115031  kern  :alert : Mem abort info:
    2022-06-22T09:39:49.115310  kern  :alert :   ESR =3D 0x000000009600004e
    2022-06-22T09:39:49.115584  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:39:49.115973  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:39:49.116154  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:39:49.116551  kern  :alert :   FSC =3D 0x0e: level 2 perm=
ission fault
    2022-06-22T09:39:49.116964  kern  :alert : Data abort info:
    2022-06-22T09:39:49.117167  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
04e
    2022-06-22T09:39:49.117400  kern  :alert :   CM =3D 0, WnR =3D 1 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e50d67adccb5cba39bfa

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e50d67adccb=
5cba39c01
        failing since 0 day (last pass: next-20220519, first fail: next-202=
20621)
        4 lines

    2022-06-22T09:46:30.914767  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:46:30.914937  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:46:30.915118  kern  :alert :   FSC =3D 0x0e: level 2 perm=
ission fault
    2022-06-22T09:46:30.915317  kern  :alert : Data abort info:
    2022-06-22T09:46:30.915494  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
04e
    2022-06-22T09:46:30.915676  kern  :alert :   CM =3D 0, WnR =3D 1
    2022-06-22T09:46:30.915844  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D00000000038b3000
    2022-06-22T09:46:30.919630  kern  :alert : [ffff800009728074] pgd=3D100=
000007ffff003, p4d=3D100000007ffff003, pud=3D100000007fffe003, pmd=3D006000=
0003600781
    2022-06-22T09:46:30.926791  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP
    2022-06-22T09:46:30.927677  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93)  =

    ... (4 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e50d67adccb=
5cba39c02
        failing since 0 day (last pass: next-20220519, first fail: next-202=
20621)
        24 lines

    2022-06-22T09:46:30.906590  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-22T09:46:30.907062  kern  :alert : Mem abort info:
    2022-06-22T09:46:30.907267  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-22T09:46:30.907663  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:46:30.908072  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:46:30.908334  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:46:30.908583  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-22T09:46:30.908995  kern  :alert : Data abort info:
    2022-06-22T09:46:30.909177  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-22T09:46:30.909586  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (7 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e932002d7cca85a39bed

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e932002d7cc=
a85a39bf4
        failing since 0 day (last pass: next-20220518, first fail: next-202=
20621)
        4 lines

    2022-06-22T10:04:12.881635  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T10:04:12.881856  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault
    2022-06-22T10:04:12.882022  kern  :alert : Data abort info:
    2022-06-22T10:04:12.882240  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
04f
    2022-06-22T10:04:12.882400  kern  :alert :   CM =3D 0, WnR =3D 1
    2022-06-22T10:04:12.882542  kern  :alert : swapper pgtable: 64k pages, =
48-bit VAs, pgdp=3D0000000003950000
    2022-06-22T10:04:12.886320  kern  :alert : [ffff80000974919c] pgd=3D100=
000007fff0003, p4d=3D100000007fff0003, pud=3D100000007fff0003, pmd=3D100000=
007ffe0003, pte=3D0060000003740783
    2022-06-22T10:04:12.895549  kern  :emerg : Internal error: Oops: 960000=
07 [#1] PREEMPT SMP
    2022-06-22T10:04:12.896339  kern  :emerg : Code: aa0003f4 a9025bf5 aa00=
03f6 aa0103f5 (f8418e93) =

    2022-06-22T10:04:12.896874  kern  :emerg : Internal error: Oops: 960000=
4f [#2] PREEMPT SMP =

    ... (3 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e932002d7cc=
a85a39bf5
        failing since 0 day (last pass: next-20220518, first fail: next-202=
20621)
        24 lines

    2022-06-22T10:04:12.873049  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-22T10:04:12.873613  kern  :alert : Mem abort info:
    2022-06-22T10:04:12.873892  kern  :alert :   ESR =3D 0x0000000096000007
    2022-06-22T10:04:12.874197  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-22T10:04:12.874494  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T10:04:12.874701  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T10:04:12.874961  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2022-06-22T10:04:12.875421  kern  :alert : Data abort info:
    2022-06-22T10:04:12.875601  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2022-06-22T10:04:12.875974  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (8 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2eaae027c61f8efa39bd9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2eaae027c61f=
8efa39be2
        failing since 0 day (last pass: next-20220519, first fail: next-202=
20621)
        24 lines

    2022-06-22T10:10:35.045616  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000005
    2022-06-22T10:10:35.046119  kern  :alert : Mem abort info:
    2022-06-22T10:10:35.046345  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-22T10:10:35.046753  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-22T10:10:35.047160  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T10:10:35.047352  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T10:10:35.047578  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-22T10:10:35.048007  kern  :alert : Data abort info:
    2022-06-22T10:10:35.048189  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-22T10:10:35.048575  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (7 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2ec02a48e8b51b4a39c27

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2ec02a48e8b5=
1b4a39c2e
        failing since 0 day (last pass: next-20220516, first fail: next-202=
20621)
        2 lines

    2022-06-22T10:16:26.192480  kern  :emerg : Internal error: Oops: 960000=
4e [#1] PREEMPT SMP
    2022-06-22T10:16:26.196027  kern  :emerg : Code: b9403262 b9408420 4b02=
0000 11000400 (b9008420) =

    2022-06-22T10:16:26.200675  [   65.305572] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T10:16:26.200921  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ec02a48e8b5=
1b4a39c2f
        failing since 0 day (last pass: next-20220516, first fail: next-202=
20621)
        12 lines

    2022-06-22T10:16:26.172781  kern  :alert : Unable to handle kernel writ=
e to read-only memory at virtual address ffff80000973ccd4
    2022-06-22T10:16:26.173277  kern  :alert : Mem abort info:
    2022-06-22T10:16:26.173553  kern  :alert :   ESR =3D 0x000000009600004e
    2022-06-22T10:16:26.173764  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-22T10:16:26.174230  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T10:16:26.174459  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T10:16:26.174858  kern  :alert :   FSC =3D 0x0e: level 2 perm=
ission fault
    2022-06-22T10:16:26.175589  kern  :alert : Data abort info:
    2022-06-22T10:16:26.175829  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
04e
    2022-06-22T10:16:26.176238  kern  :alert :   CM =3D 0, WnR =3D 1 =

    ... (3 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e91f002d7cca85a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e91f002d7cca85a39=
bd3
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ebb739b68d37a8a39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2ebb739b68d37a8a39=
bd1
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 5          =


  Details:     https://kernelci.org/test/plan/id/62b2e67da3d24753f5a39bf2

  Results:     83 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62b2e67da3d24753f5a39c37
        failing since 55 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-06-22T09:52:38.077162  /lava-6666512/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62b2e67da3d24753f5a39c38
        failing since 55 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-06-22T09:52:35.999734  <8>[   49.700855] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-06-22T09:52:37.032732  /lava-6666512/1/../bin/lava-test-case
    2022-06-22T09:52:37.045509  <8>[   50.746617] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62b2e67da3d24753f5a39c39
        failing since 55 days (last pass: next-20220422, first fail: next-2=
0220427)

    2022-06-22T09:52:35.986571  /lava-6666512/1/../bin/lava-test-case   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e67da3d2475=
3f5a39c4e
        new failure (last pass: next-20220616)
        2 lines

    2022-06-22T09:52:22.335053  at virtual address 0000000000000008
    2022-06-22T09:52:22.337988  kern  :alert : Mem abort info:
    2022-06-22T09:52:22.342840  kern  :alert :   ESR =3D 0x0000000096000006
    2022-06-22T09:52:22.347915  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:52:22.351459  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:52:22.355790  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:52:22.360819  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-06-22T09:52:22.364498  kern  :alert : Data abort info:
    2022-06-22T09:52:22.368222  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-06-22T09:52:22.379072  kern  :<8>[   36.074084] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e67da3d2475=
3f5a39c4f
        new failure (last pass: next-20220616)
        12 lines

    2022-06-22T09:52:22.292797  <8>[   35.993593] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-06-22T09:52:22.331544  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   36.032313] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62b2e09353b20f5e5da39bde

  Results:     83 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62b2e09353b20f5e5da39c23
        failing since 56 days (last pass: next-20220421, first fail: next-2=
0220426)

    2022-06-22T09:27:25.226932  /lava-6666332/1/../bin/lava-test-case
    2022-06-22T09:27:25.239705  <8>[   52.519301] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62b2e09353b20f5e5da39c24
        failing since 56 days (last pass: next-20220421, first fail: next-2=
0220426)

    2022-06-22T09:27:24.183229  /lava-6666332/1/../bin/lava-test-case
    2022-06-22T09:27:24.195878  <8>[   51.475389] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62b2e09353b20f5e5da39c25
        failing since 56 days (last pass: next-20220421, first fail: next-2=
0220426)

    2022-06-22T09:27:23.139960  /lava-6666332/1/../bin/lava-test-case
    2022-06-22T09:27:23.152330  <8>[   50.431851] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e09353b20f5=
e5da39c3b
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        12 lines

    2022-06-22T09:27:09.506093  <8>[   36.783969] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-06-22T09:27:09.536522  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | clang-13 | cros://=
chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e38be13419a652a39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-c=
ollabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-c=
ollabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e38be13419a652a39=
bd2
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e03e173f983356a39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e03e173f983356a39=
be9
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e0c5df28de468ea39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e0c5df28de468ea39=
be5
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e408212165bcfea39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e408212165bcfea39=
bce
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4f467adccb5cba39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e4f467adccb5cba39=
bd1
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e596f12254f6bea39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e596f12254f6bea39=
be5
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e0f3b7c44a7045a39c45

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e0f3b7c44a7045a39=
c46
        failing since 18 days (last pass: next-20220602, first fail: next-2=
0220603) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e25bf0ba555749a39bea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e25bf0ba555749a39=
beb
        failing since 6 days (last pass: next-20220610, first fail: next-20=
220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e66baf0383eedea39bec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e66baf0383eedea39=
bed
        failing since 27 days (last pass: next-20220524, first fail: next-2=
0220526) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e7d3b1a906a0dea39bd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e7d3b1a906a0dea39=
bd8
        new failure (last pass: next-20220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b3018b79b99f2807a39bf0

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b3018b79b99f2=
807a39bf8
        new failure (last pass: next-20220610)
        12 lines

    2022-06-22T11:48:16.817366  kern  :alert : Unable to handle kernel writ=
e to read-only memory at virtual address ffff80000973c254
    2022-06-22T11:48:16.828410  kern  :alert : Mem abort i<8>[   46.948392]=
 <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEA=
SUREMENT=3D12>
    2022-06-22T11:48:16.829003  nfo:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b30330043e080406a39bdf

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b30330043e080=
406a39be6
        new failure (last pass: next-20220617)
        2 lines

    2022-06-22T11:55:17.912458  kern  :alert :   ESR =3D 0x000000009600004f
    2022-06-22T11:55:17.917940  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-22T11:55:17.918529  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T11:55:17.923397  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T11:55:17.929003  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault
    2022-06-22T11:55:17.929586  kern  :alert : Data abort info:
    2022-06-22T11:55:17.934401  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
04f
    2022-06-22T11:55:17.945440  kern  :<8>[   46.982823] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T11:55:17.946023  alert :   CM =3D 0, WnR =3D 1   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b30330043e080=
406a39be7
        new failure (last pass: next-20220617)
        12 lines

    2022-06-22T11:55:17.895871  kern  :alert : Unable to handle kernel writ=
e to read-only memory at virtual address ffff80000975d37c
    2022-06-22T11:55:17.906866  kern  :alert : Mem abort i<8>[   46.946763]=
 <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEA=
SUREMENT=3D12>
    2022-06-22T11:55:17.907448  nfo:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62b3044783539ce4d5a39bea

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b3044783539ce=
4d5a39bf1
        new failure (last pass: next-20220617)
        2 lines

    2022-06-22T11:59:55.834037  kern  :alert :   ESR =3D 0x000000009600004e
    2022-06-22T11:59:55.839577  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-06-22T11:59:55.839913  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T11:59:55.845112  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T11:59:55.850682  kern  :alert :   FSC =3D 0x0e: level 2 perm=
ission fault
    2022-06-22T11:59:55.861826  kern  :alert : Data <8>[   47.118634] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D2>
    2022-06-22T11:59:55.862169  abort info:
    2022-06-22T11:59:55.862405  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
04e   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b3044783539ce=
4d5a39bf2
        new failure (last pass: next-20220617)
        12 lines

    2022-06-22T11:59:55.817476  kern  :alert : Unable to handle kernel writ=
e to read-only memory at virtual address ffff800009750eb4
    2022-06-22T11:59:55.828479  kern  :alert : Mem abort i<8>[   47.086137]=
 <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEA=
SUREMENT=3D12>
    2022-06-22T11:59:55.828817  nfo:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e16bb8a2137bc5a39bf2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e16bb8a2137=
bc5a39bf9
        new failure (last pass: next-20220616)
        2 lines

    2022-06-22T09:30:48.550094  kern  :alert : Me<8>[   20.145318] <LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D9>
    2022-06-22T09:30:48.550317  m abort info:
    2022-06-22T09:30:48.550523  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:30:48.550724  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:30:48.550925  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:30:48.551123  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:30:48.551319  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault
    2022-06-22T09:30:48.593991  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D0000000041ab3000
    2022-06-22T09:30:48.594475  kern  :alert : [ffff000002a24010] pgd=3D180=
00000bfff8003, p4d=3D18000000bfff8003, pud=3D18000000bfff7003, pmd=3D180000=
00bffec003, pte=3D<8>[   20.192579] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dem=
erg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:30:48.594710  0068000042a24707 =

    ... (2 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e16bb8a2137=
bc5a39bfa
        new failure (last pass: next-20220616)
        9 lines

    2022-06-22T09:30:48.548870  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff000002a24010   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e1f4ffac28483aa39bf9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e1f4ffac284=
83aa39c00
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:33:26.327632  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D0000000041ab3000
    2022-06-22T09:33:26.328123  kern  :alert : [ffff000002a24010] pgd=3D180=
00000bfff8003, p4d=3D18000000bfff8003, pud=3D18000000bfff7003, pmd=3D180000=
00bffec003, pte=3D0068000042a24707
    2022-06-22T09:33:26.328367  kern  :emerg : Internal error: Oops: 860000=
0f [#1] PREEMPT SMP
    2022-06-22T09:33:26.328625  kern  :emerg : Code: 028d4800 ffff0000 ffff=
fff<8>[   20.368050] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfa=
il UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:33:26.328880  f 00000000 (028d4800) =

    2022-06-22T09:33:26.329130  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e1f4ffac284=
83aa39c01
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:33:26.275658  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff000002a24010
    2022-06-22T09:33:26.276175  kern  :alert : Me<8>[   20.309434] <LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D9>
    2022-06-22T09:33:26.276418  m abort info:
    2022-06-22T09:33:26.276675  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:33:26.276928  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:33:26.277178  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:33:26.277423  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:33:26.277667  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e3509e9bc66293a39bdb

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e3509e9bc66=
293a39be2
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:38:51.464818  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault
    2022-06-22T09:38:51.512015  kern  :alert : swapper pgtable: 64k pages, =
48-bit VAs, pgdp=3D0000000041b50000
    2022-06-22T09:38:51.512522  kern  :alert : [ffff00002079c010] pgd=3D180=
00000bffd0003, p4d=3D18000000bffd0003, pud=3D18000000bffd0003, pmd=3D180000=
00bffb0003, pte=3D0068000060790707
    2022-06-22T09:38:51.512756  kern  :emerg : Internal error: Oops: 860000=
0f [#1] PREEMPT SMP
    2022-06-22T09:38:51.512970  kern  :emerg : Code: 207b4100 ffff0000 ffff=
ffff 00000000 (207b4100) =

    2022-06-22T09:38:51.513180  <8>[   20.305037] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:38:51.513386  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e3509e9bc66=
293a39be3
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:38:51.461480  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff00002079c010
    2022-06-22T09:38:51.461742  kern  :alert : Mem abort info:
    2022-06-22T09:38:51.461964  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:38:51.462399  kern  <8>[   20.243436] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>
    2022-06-22T09:38:51.462624  :alert :   EC =3D 0x21: IABT (current EL), =
IL =3D 32 bits
    2022-06-22T09:38:51.462834  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:38:51.463038  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e3d02a07fefb0ba39c12

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e3d02a07fef=
b0ba39c19
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:41:24.345292  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:41:24.345544  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:41:24.345780  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:41:24.346472  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault
    2022-06-22T09:41:24.386310  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D0000000041aca000
    2022-06-22T09:41:24.386599  kern  :alert : [ffff000002a24010] pgd=3D180=
00000bfff8003, p4d=3D18000000bfff8003, pud=3D18000000bfff7003, pmd=3D180000=
00bffec003, pte=3D<8>[   20.262352] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dem=
erg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:41:24.386860  0068000042a24707   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e3d02a07fef=
b0ba39c1a
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:41:24.343214  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff000002a24010
    2022-06-22T09:41:24.343508  kern  :alert : Me<8>[   20.215020] <LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D9>
    2022-06-22T09:41:24.343762  m abort info:
    2022-06-22T09:41:24.343998  kern  :alert :   ESR =3D 0x000000008600000f=
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2df7b0932857fd8a39bf1

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2df7b0932857=
fd8a39bf8
        new failure (last pass: next-20220616)
        2 lines

    2022-06-22T09:22:46.614350  :alert :   EC =3D 0x21: IABT (current EL), =
IL =3D 32 bits
    2022-06-22T09:22:46.614773  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:22:46.619921  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:22:46.625504  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault
    2022-06-22T09:22:46.630992  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D0000000041ab3000
    2022-06-22T09:22:46.641812  kern  :alert : [ffff000002a24010] pgd=3D180=
00000bfff8003, p4d=3D18000000bfff8003, pud=3D18000000bfff7003, pmd=3D180000=
00bffec003, pte=3D0068000042a24707
    2022-06-22T09:22:46.647741  kern  :emerg : Internal error: Oops: 860000=
0f [#1] PREEMPT SMP
    2022-06-22T09:22:46.653359  kern  :emerg : Code: 028d4800 ffff0000 ffff=
ffff 00000000 (028d4800) =

    2022-06-22T09:22:46.664553  <8>[   20.302277] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2df7b0932857=
fd8a39bf9
        new failure (last pass: next-20220616)
        9 lines

    2022-06-22T09:22:46.591931  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff000002a24010
    2022-06-22T09:22:46.597633  kern  :alert : Mem abort info:
    2022-06-22T09:22:46.598052  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:22:46.608828  kern  <8>[   20.243832] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2dff3b11d84a7fba39bcd

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2dff3b11d84a=
7fba39bd4
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:25:02.002386  :alert :   EC =3D 0x21: IABT (current EL), =
IL =3D 32 bits
    2022-06-22T09:25:02.002805  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:25:02.007929  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:25:02.013488  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault
    2022-06-22T09:25:02.019034  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D0000000041ab3000
    2022-06-22T09:25:02.030201  kern  :alert : [ffff000002a24010] pgd=3D180=
00000bfff8003, p4d=3D18000000bfff8003, pud=3D18000000bfff7003, pmd=3D180000=
00bffec003, pte=3D0068000042a24707
    2022-06-22T09:25:02.035754  kern  :emerg : Internal error: Oops: 860000=
0f [#1] PREEMPT SMP
    2022-06-22T09:25:02.041251  kern  :emerg : Code: 028d4800 ffff0000 ffff=
ffff 00000000 (028d4800) =

    2022-06-22T09:25:02.052558  <8>[   20.379614] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2dff3b11d84a=
7fba39bd5
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:25:01.980165  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff000002a24010
    2022-06-22T09:25:01.985682  kern  :alert : Mem abort info:
    2022-06-22T09:25:01.986098  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:25:01.996817  kern  <8>[   20.320910] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e328da3358f7b0a39bed

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e328da3358f=
7b0a39bf4
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:38:29.740994  :alert :   EC =3D 0x21: IABT (current EL), =
IL =3D 32 bits
    2022-06-22T09:38:29.746417  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:38:29.746843  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:38:29.755536  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault
    2022-06-22T09:38:29.761076  kern  :alert : swapper pgtable: 64k pages, =
48-bit VAs, pgdp=3D0000000041b50000
    2022-06-22T09:38:29.768740  kern  :alert : [ffff00002079c010] pgd=3D180=
00000bffd0003
    2022-06-22T09:38:29.774250  kern  :emerg : Internal error: Oops: 860000=
0f [#1] PREEMPT SMP
    2022-06-22T09:38:29.779193  kern  :emerg : Code: 207b4100 ffff0000 ffff=
ffff 00000000 (207b4100) =

    2022-06-22T09:38:29.795373  <8>[   20.284473] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:38:29.795806  + set +x   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e328da3358f=
7b0a39bf5
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:38:29.720987  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff00002079c010
    2022-06-22T09:38:29.726453  kern  :alert : Mem abort info:
    2022-06-22T09:38:29.726876  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:38:29.735400  kern  <8>[   20.222959] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e3c82a07fefb0ba39bf9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e3c82a07fef=
b0ba39c00
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:41:05.727226  :alert :   EC =3D 0x21: IABT (current EL), =
IL =3D 32 bits
    2022-06-22T09:41:05.732761  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:41:05.733174  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:41:05.741806  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault
    2022-06-22T09:41:05.747325  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D0000000041aca000
    2022-06-22T09:41:05.758400  kern  :alert : [ffff000002a24010] pgd=3D180=
00000bfff8003, p4d=3D18000000bfff8003, pud=3D18000000bfff7003, pmd=3D180000=
00bffec003, pte=3D0068000042a24707
    2022-06-22T09:41:05.764149  kern  :emerg : Internal error: Oops: 860000=
0f [#1] PREEMPT SMP
    2022-06-22T09:41:05.771143  kern  :emerg : Code: 028d4800 ffff0000 ffff=
ffff 00000000 (028d4800) =

    2022-06-22T09:41:05.787515  <8>[   20.284086] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e3c82a07fef=
b0ba39c01
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:41:05.707184  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff000002a24010
    2022-06-22T09:41:05.712727  kern  :alert : Mem abort info:
    2022-06-22T09:41:05.713141  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:41:05.721675  kern  <8>[   20.216036] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e4b8582f3d1e1ea39bde

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e4b8582f3d1=
e1ea39be5
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:45:05.793439  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:45:05.798999  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:45:05.799406  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:45:05.804549  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:45:05.810137  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault
    2022-06-22T09:45:05.815757  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D0000000041ac9000
    2022-06-22T09:45:05.826866  kern  :alert : [ffff000002a24010] pgd=3D180=
00000bfff8003, p4d=3D18000000bfff8003, pud=3D18000000bfff7003, pmd=3D180000=
00bffec003, pte=3D0068000042a24707
    2022-06-22T09:45:05.843434  kern  :emerg : Internal error: Oops: 860000=
0f <8>[   20.328430] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfa=
il UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:45:05.843848  [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e4b8582f3d1=
e1ea39be6
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:45:05.776788  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff000002a24010
    2022-06-22T09:45:05.787914  kern  :alert : Me<8>[   20.273154] <LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D9>
    2022-06-22T09:45:05.788327  m abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e0d52c258829d3a39bd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e0d52c258829d3a39=
bd8
        new failure (last pass: next-20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e2293eee1eb5a3a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e2293eee1eb5a3a39=
bd3
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e37f0ec305bbeaa39bee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e37f0ec305bbeaa39=
bef
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e6282dec2606e9a39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e6282dec2606e9a39=
bf5
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e78e7a8cfa28daa39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e78e7a8cfa28daa39=
bd7
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e84cc5204f085ea39be2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e84cc5204f0=
85ea39bea
        new failure (last pass: next-20220616)
        9 lines

    2022-06-22T10:00:12.334387  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff[   20.214255] <LAVA_S=
IGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D9>
    2022-06-22T10:00:12.334745  f000002ab1c10
    2022-06-22T10:00:12.334956  kern  :alert : Mem abort info:
    2022-06-22T10:00:12.335150  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T10:00:12.335360  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T10:00:12.335555  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T10:00:12.335750  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e84cc5204f0=
85ea39beb
        new failure (last pass: next-20220616)
        2 lines

    2022-06-22T10:00:12.376341  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fa[   20.246471] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=
=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T10:00:12.376697  ult
    2022-06-22T10:00:12.376901  kern  :aler[   20.256237] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 280056_1.5.2.4.1>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e8c4c3380f486fa39bf7

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e8c4c3380f4=
86fa39bff
        new failure (last pass: next-20220621)
        9 lines

    2022-06-22T10:02:14.246713  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff[   20.150508] <LAVA_S=
IGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D9>
    2022-06-22T10:02:14.247113  f000002ab1c10
    2022-06-22T10:02:14.247429  kern  :alert : Mem abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e8c4c3380f4=
86fa39c00
        new failure (last pass: next-20220621)
        2 lines

    2022-06-22T10:02:14.248991  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T10:02:14.249301  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T10:02:14.249583  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T10:02:14.249857  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e93cc3f766aa44a39bf2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e93cc3f766a=
a44a39bfa
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T10:04:12.419994  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff00003f40e410
    2022-06-22T10:04:12.420590  k[   20.201215] <LAVA_SIGNAL_TESTCASE TEST_=
CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D9>
    2022-06-22T10:04:12.420840  ern  :alert : Mem abort info:
    2022-06-22T10:04:12.421044  kern  :alert :   ESR =3D 0x000000008600000f=
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2ea2d707c654da0a39bfb

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ea2d707c654=
da0a39c03
        new failure (last pass: next-20220617)
        9 lines

    2022-06-22T10:08:14.556279  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff[   20.433374] <LAVA_S=
IGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D9>
    2022-06-22T10:08:14.556655  f000002ab1c10
    2022-06-22T10:08:14.556955  kern  :alert : Mem abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2ea2d707c654=
da0a39c04
        new failure (last pass: next-20220617)
        2 lines

    2022-06-22T10:08:14.558520  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T10:08:14.558810  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T10:08:14.559090  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T10:08:14.559378  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e0165e61dc753ba39be9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e0165e61dc7=
53ba39bf0
        new failure (last pass: next-20220616)
        2 lines

    2022-06-22T09:25:18.186809  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:25:18.187029  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:25:18.187234  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:25:18.187435  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:25:18.228389  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fa<8>[   20.233258] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESUL=
T=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:25:18.228639  ult
    2022-06-22T09:25:18.228858  kern  :aler<8>[   20.243989] <LAVA_SIGNAL_E=
NDRUN 0_dmesg 2119745_1.5.2.4.1>
    2022-06-22T09:25:18.229071  t : swapper pgtable: 4k pages, 48-bit VAs, =
pgdp=3D0000000041ab3000
    2022-06-22T09:25:18.229275  kern  :alert : [ffff000002a26410] pgd=3D180=
00000bfff8003, p4d=3D18000000bfff8003, pud=3D18000000bfff7003, pmd=3D180000=
00bffec003, pte=3D0068000042a26707
    2022-06-22T09:25:18.229475  kern  :emerg : Internal error: Oops: 860000=
0f [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e0165e61dc7=
53ba39bf1
        new failure (last pass: next-20220616)
        9 lines

    2022-06-22T09:25:18.185168  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff<8>[   20.201379] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D9>
    2022-06-22T09:25:18.185435  f000002a26410
    2022-06-22T09:25:18.185653  kern  :alert : Mem abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e09fa4e38345fea39bf9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e09fa4e3834=
5fea39c00
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:27:35.176934  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:27:35.177161  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:27:35.177373  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:27:35.218253  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fa<8>[   20.225723] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESUL=
T=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:27:35.218553  ult
    2022-06-22T09:27:35.218773  kern  :aler<8>[   20.236409] <LAVA_SIGNAL_E=
NDRUN 0_dmesg 2119799_1.5.2.4.1>
    2022-06-22T09:27:35.218985  t : swapper pgtable: 4k pages, 48-bit VAs, =
pgdp=3D0000000041ab3000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e09fa4e3834=
5fea39c01
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:27:35.174892  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff<8>[   20.193881] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D9>
    2022-06-22T09:27:35.175166  f000002a26410
    2022-06-22T09:27:35.175391  kern  :alert : Mem abort info:
    2022-06-22T09:27:35.175604  kern  :alert :   ESR =3D 0x000000008600000f=
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e4a173dc930e7ea39bce

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e4a173dc930=
e7ea39bd6
        new failure (last pass: next-20220621)
        9 lines

    2022-06-22T09:44:50.703623  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff<8>[   20.216414] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D9>
    2022-06-22T09:44:50.703922  f000002a26410
    2022-06-22T09:44:50.704195  kern  :alert : Mem abort info:
    2022-06-22T09:44:50.704437  kern  :alert :   ESR =3D 0x000000008600000f=
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e523e4535c51c3a39be2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e523e4535c5=
1c3a39be9
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:46:51.820810  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:46:51.821033  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:46:51.821239  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:46:51.861925  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fa<8>[   20.333129] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESUL=
T=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:46:51.862184  ult
    2022-06-22T09:46:51.862407  kern  :alert : swapper pgta<8>[   20.343499=
] <LAVA_SIGNAL_ENDRUN 0_dmesg 2120075_1.5.2.4.1>
    2022-06-22T09:46:51.862620  ble: 4k pages, 48-bit VAs, pgdp=3D000000004=
1ac9000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e523e4535c5=
1c3a39bea
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:46:51.818928  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff<8>[   20.300786] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D9>
    2022-06-22T09:46:51.819193  f000002a26410
    2022-06-22T09:46:51.819410  kern  :alert : Mem abort info:
    2022-06-22T09:46:51.819617  kern  :alert :   ESR =3D 0x000000008600000f=
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2dfd13853d890b0a39bce

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2dfd13853d89=
0b0a39bd6
        new failure (last pass: next-20220616)
        9 lines

    2022-06-22T09:24:20.229668  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff<8>[   20.137687] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D9>
    2022-06-22T09:24:20.230015  f000002ad6410
    2022-06-22T09:24:20.230226  kern  :alert : Mem abort info:
    2022-06-22T09:24:20.230422  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:24:20.230612  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:24:20.230797  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:24:20.230979  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2dfd13853d89=
0b0a39bd7
        new failure (last pass: next-20220616)
        2 lines

    2022-06-22T09:24:20.272435  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fa<8>[   20.169878] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESUL=
T=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:24:20.272762  ult
    2022-06-22T09:24:20.272963  kern  :aler<8>[   20.180328] <LAVA_SIGNAL_E=
NDRUN 0_dmesg 280062_1.5.2.4.1>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e0359d31846eafa39be5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e0359d31846=
eafa39bed
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:25:51.360443  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff<8>[   20.190074] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D9>
    2022-06-22T09:25:51.360913  f000002ad6410
    2022-06-22T09:25:51.361284  kern  :alert : Mem abort info:
    2022-06-22T09:25:51.361595  kern  :alert :   ESR =3D 0x000000008600000f=
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e0359d31846=
eafa39bee
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:25:51.363283  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:25:51.363604  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:25:51.363894  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:25:51.413342  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fa<8>[   20.222017] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESUL=
T=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:25:51.413793  ult
    2022-06-22T09:25:51.414193  kern  :aler<8>[   20.232751] <LAVA_SIGNAL_E=
NDRUN 0_dmesg 280071_1.5.2.4.1>
    2022-06-22T09:25:51.414532  t : swapper pgtable: 4k pages, 48-bit VAs, =
pgdp=3D0000000041ab3000
    2022-06-22T09:25:51.414898  kern  :alert : [ffff000002ad6410] pgd=3D180=
00000ffff8003
    2022-06-22T09:25:51.415212  kern  :emerg : Internal error: Oops: 860000=
0f [#1] PREEMPT SMP
    2022-06-22T09:25:51.415553  kern  :emerg : Code: 02a48100 ffff0000 ffff=
ffff 00000000 (02a48100)  =

    ... (1 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e3050ae9071753a39bd6

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e3050ae9071=
753a39bde
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:37:49.475350  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff<8>[   20.229661] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D9>
    2022-06-22T09:37:49.475724  f00002079a410
    2022-06-22T09:37:49.475923  kern  :alert : Mem abort info:
    2022-06-22T09:37:49.476111  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:37:49.476308  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:37:49.476493  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:37:49.476672  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e3060ae9071=
753a39bdf
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:37:49.490196  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault
    2022-06-22T09:37:49.516132  kern  :alert : swapper pgta<8>[   20.263503=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D2>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e3a7b45b5a1f30a39bd6

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e3a7b45b5a1=
f30a39bde
        new failure (last pass: next-20220621)
        9 lines

    2022-06-22T09:40:31.350385  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff<8>[   20.216062] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D9>
    2022-06-22T09:40:31.350734  f000002ad6410
    2022-06-22T09:40:31.350959  kern  :alert : Mem abort info:
    2022-06-22T09:40:31.351147  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:40:31.351349  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:40:31.351533  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:40:31.351712  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e481517834b126a39bd7

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e482517834b=
126a39bdf
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        9 lines

    2022-06-22T09:44:11.798351  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff<8>[   20.307236] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D9>
    2022-06-22T09:44:11.798810  f000002ad6410
    2022-06-22T09:44:11.799082  kern  :alert : Mem abort info:
    2022-06-22T09:44:11.799340  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:44:11.799584  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e482517834b=
126a39be0
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        2 lines

    2022-06-22T09:44:11.801033  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:44:11.801345  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:44:11.850493  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fa<8>[   20.339251] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESUL=
T=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2022-06-22T09:44:11.850963  ult   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2df779dd251751fa39be0

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2df779dd2517=
51fa39be7
        new failure (last pass: next-20220616)
        4 lines

    2022-06-22T09:22:45.878964  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D<8>[   20.041134] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dem=
erg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D4>
    2022-06-22T09:22:45.879219  00000000418b3000
    2022-06-22T09:22:45.879517  kern  :alert :<8>[   20.051637] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 6666267_1.5.2.4.1>
    2022-06-22T09:22:45.879773   [ffff0000026d6410] pgd=3D18000000ffff8003,=
 p4d=3D18000000ffff8003, pud=3D18000000ffff7003, pmd=3D18000000fffee003, pt=
e=3D00680000426d6707
    2022-06-22T09:22:45.880066  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-06-22T09:22:45.880329  kern  :alert : Mem abort info:   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2df779dd2517=
51fa39be8
        new failure (last pass: next-20220616)
        21 lines

    2022-06-22T09:22:45.836003  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff0000026d6410
    2022-06-22T09:22:45.836385  k<8>[   20.004260] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D21>
    2022-06-22T09:22:45.836694  ern  :alert : Mem abort info:
    2022-06-22T09:22:45.836949  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:22:45.837236  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:22:45.837531  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:22:45.837826  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:22:45.838116  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e00a07cf408f6ea39c2c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e00a07cf408=
f6ea39c33
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        4 lines

    2022-06-22T09:25:20.210149  kern  :alert : swapper pgta<8>[   20.022026=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D4>
    2022-06-22T09:25:20.210375  ble: 4k pages, 48-bit VAs, pgdp=3D<8>[   20=
.033414] <LAVA_SIGNAL_ENDRUN 0_dmesg 6666364_1.5.2.4.1>
    2022-06-22T09:25:20.210634  00000000418b3000
    2022-06-22T09:25:20.210831  kern  :alert : [ffff000002626410] pgd=3D180=
00000bfff8003, p4d=3D18000000bfff8003, pud=3D18000000bfff7003, pmd=3D180000=
00bffee003, pte=3D0068000042626707
    2022-06-22T09:25:20.211022  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-06-22T09:25:20.211207  kern  :alert : Mem abort info:   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e00a07cf408=
f6ea39c34
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        21 lines

    2022-06-22T09:25:20.167471  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address fff<8>[   19.987971] <LAV=
A_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREM=
ENT=3D21>
    2022-06-22T09:25:20.167701  f000002626410
    2022-06-22T09:25:20.168067  kern  :alert : Mem abort info:
    2022-06-22T09:25:20.168264  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:25:20.168611  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:25:20.168806  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:25:20.169016  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:25:20.169295  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e3322c086aa539a39bd7

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e3322c086aa=
539a39bde
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        4 lines

    2022-06-22T09:38:47.506744  kern  :alert : swapper pgtable: 64k pages, =
48-bit VAs, pgdp=3D000000004195000<8>[   20.063240] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D4>
    2022-06-22T09:38:47.507021  0
    2022-06-22T09:38:47.507218  kern  :alert <8>[   20.073685] <LAVA_SIGNAL=
_ENDRUN 0_dmesg 6666636_1.5.2.4.1>
    2022-06-22T09:38:47.507412  : [ffff00002079a410] pgd=3D18000000bffd0003=
, p4d=3D18000000bffd0003, pud=3D18000000bffd0003, pmd=3D18000000bffb0003, p=
te=3D0068000060790707
    2022-06-22T09:38:47.507608  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e3322c086aa=
539a39bdf
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        21 lines

    2022-06-22T09:38:47.463827  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff00002079a410
    2022-06-22T09:38:47.464166  k<8>[   20.025746] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D21>
    2022-06-22T09:38:47.464366  ern  :alert : Mem abort info:
    2022-06-22T09:38:47.464577  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:38:47.464792  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:38:47.464984  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:38:47.465204  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:38:47.465391  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e3c4e04caa2433a39be3

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e3c4e04caa2=
433a39beb
        new failure (last pass: next-20220621)
        21 lines

    2022-06-22T09:41:16.448309  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff000002626410
    2022-06-22T09:41:16.448859  k<8>[   20.012468] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D21>
    2022-06-22T09:41:16.449389  ern  :alert : Mem abort info:
    2022-06-22T09:41:16.449808  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:41:16.450219  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:41:16.450624  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:41:16.451023  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:41:16.451421  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2e4ac28a4978de7a39bea

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2e4ac28a4978=
de7a39bf1
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        4 lines

    2022-06-22T09:45:05.677157  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D<8>[   20.137866] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dem=
erg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D4>
    2022-06-22T09:45:05.677404  00000000418c9000<8>[   20.149033] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 6666731_1.5.2.4.1>
    2022-06-22T09:45:05.677611  =

    2022-06-22T09:45:05.677805  kern  :alert : [ffff000002626410] pgd=3D180=
00000bfff8003, p4d=3D18000000bfff8003, pud=3D18000000bfff7003, pmd=3D180000=
00bffee003, pte=3D0068000042626707
    2022-06-22T09:45:05.678000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-06-22T09:45:05.678190  kern  :alert : Mem abort info:   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e4ac28a4978=
de7a39bf2
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        21 lines

    2022-06-22T09:45:05.633650  kern  :alert : Unable to handle kernel exec=
ute from non-executable memory at virtual address ffff000002626410
    2022-06-22T09:45:05.633886  k<8>[   20.101517] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D21>
    2022-06-22T09:45:05.634103  ern  :alert : Mem abort info:
    2022-06-22T09:45:05.634323  kern  :alert :   ESR =3D 0x000000008600000f
    2022-06-22T09:45:05.634515  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-06-22T09:45:05.634704  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-06-22T09:45:05.634891  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-06-22T09:45:05.635074  kern  :alert :   FSC =3D 0x0f: level 3 perm=
ission fault   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e3695c9318c7baa39c05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-a83t-ban=
anapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-a83t-ban=
anapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e3695c9318c7baa39=
c06
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e5e9e62604b046a39be0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e5e9e62604b046a39=
be1
        failing since 4 days (last pass: next-20220616, first fail: next-20=
220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e75187116b77eaa39c77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e75187116b77eaa39=
c78
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e19d3f5c401e67a39bd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2e19d3f5c401e67a39=
bd2
        new failure (last pass: next-20220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e22b3eee1eb5a3a39bd5

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-ban=
anapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-ban=
anapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e22b3eee1eb=
5a3a39bdd
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:34:21.168348  kern  :alert : 8<--- cut here ---
    2022-06-22T09:34:21.168841  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c21f5e00
    2022-06-22T09:34:21.169085  kern  :alert : [c21f5e00] *pgd=3D4200041e(b=
ad<8>[   46.628270] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:34:21.169315  )
    2022-06-22T09:34:21.169547  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c2010780 pointer offset 0 size 192   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e2b97b7aaa2c4ea39c01

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e2b97b7aaa2=
c4ea39c09
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:36:33.932263  kern  :alert : 8<--- cut here ---
    2022-06-22T09:36:33.972300  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c30b2800
    2022-06-22T09:36:33.972581  kern  :alert : [c30b2800] *pgd=3D4301141e(b=
ad<8>[   43.864533] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:36:33.972810  )
    2022-06-22T09:36:33.973033  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c2083300 pointer offset 0 size 192   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2e1b0bd9ee1e10ea39bcd

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-lib=
retech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-lib=
retech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2e1b0bd9ee1e=
10ea39bd5
        failing since 0 day (last pass: next-20220527, first fail: next-202=
20621)
        16 lines

    2022-06-22T09:32:04.948344  kern  :alert : 8<--- cut here ---
    2022-06-22T09:32:04.948603  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c209b410
    2022-06-22T09:32:04.948832  kern  :alert : [c209b410] *pgd=3D4200041e(b=
ad<8>[   14.937666] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T09:32:04.949052  )   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2df91409d00b075a39bd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2df91409d00b075a39=
bd4
        new failure (last pass: next-20220526) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ed60c433aec00aa39bde

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-h3-orang=
epi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-h3-orang=
epi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ed60c433aec=
00aa39be6
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T10:21:43.386769  kern  :alert : 8<--- cut here ---
    2022-06-22T10:21:43.392197  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c209b010
    2022-06-22T10:21:43.407029  kern  :alert : [c209b010] *pgd=3D4200041e(b=
ad<8>[   19.745988] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T10:21:43.407713  )   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2edb17616b86f08a39bde

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2edb17616b86=
f08a39be6
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        16 lines

    2022-06-22T10:23:30.794250  kern  :alert : 8<--- cut here ---
    2022-06-22T10:23:30.799684  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c216b010
    2022-06-22T10:23:30.808987  kern  :ale<8>[   17.026346] <LAVA_SIGNAL_TE=
STCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/62b2ee287a685065baa39c0d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ee287a68506=
5baa39c15
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T10:25:13.821650  kern  :alert : 8<--- cut here ---
    2022-06-22T10:25:13.826934  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c216b010
    2022-06-22T10:25:13.836147  kern  :ale<8>[   17.716461] <LAVA_SIGNAL_TE=
STCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62b2ee287a68506=
5baa39c16
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        42 lines

    2022-06-22T10:25:13.841827  rt : [c216b010] *pgd=3D4201141e(bad)
    2022-06-22T10:25:13.852652  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c2586780 pointer offset 0 size 192
    2022-06-22T10:25:13.856550  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c30d2d80 pointer offset 64 size 128
    2022-06-22T10:25:13.861941  kern  :alert : Register r2 information: NUL=
L pointer
    2022-06-22T10:25:13.872935  kern  :alert : Register r3 information: sla=
b kmalloc-1k start c216b000 pointer offset 16 size 1024
    2022-06-22T10:25:13.882151  kern  :alert : Register r4 information: sla=
b kmalloc-64 start c504a800 pointer offset 0 size 64
    2022-06-22T10:25:13.887694  kern  :alert : Register r5 information: sla=
b kmalloc-128 start c30d2d00 pointer offset 0 size 128
    2022-06-22T10:25:13.902395  kern  :alert : Register r6 information: 2-p=
age vmalloc region starting at 0xf0de0000 allocated at kernel_clone+0x8c/0x=
3a8
    2022-06-22T10:25:13.907802  kern  :alert : Register r7 information: sla=
b kmalloc-1k start c216b000 pointer offset 16 size 1024
    2022-06-22T10:25:13.913299  kern  :alert : Register r8 information: non=
-slab/vmalloc memory =

    ... (43 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ece89ab559b92ca39be8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62b2ece89ab559b92ca39=
be9
        new failure (last pass: next-20220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ee3cb32e94f149a39bd9

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-r40-bana=
napi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-r40-bana=
napi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ee3cb32e94f=
149a39be1
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T10:25:37.498094  kern  :alert : 8<--- cut here ---
    2022-06-22T10:25:37.498490  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c21d8200
    2022-06-22T10:25:37.499063  kern  :alert : [c21d8200] *pgd=3D4200041e(b=
ad<8>[   51.883178] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T10:25:37.499385  )
    2022-06-22T10:25:37.499685  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c244f0c0 pointer offset 0 size 192
    2022-06-22T10:25:37.500018  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c27cc700 pointer offset 64 size 128   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2eec8f1eec6a11fa39c5f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2eec8f1eec6a=
11fa39c67
        failing since 0 day (last pass: next-20220617, first fail: next-202=
20621)
        16 lines

    2022-06-22T10:27:55.756572  kern  :alert : 8<--- cut here ---
    2022-06-22T10:27:55.756968  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c31f7400
    2022-06-22T10:27:55.757541  kern  :alert : [c31f7400] *pgd=3D4301141e(b=
ad<8>[   51.034979] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D16>
    2022-06-22T10:27:55.757850  )
    2022-06-22T10:27:55.758152  kern  :alert : Register r0 information: sla=
b kmalloc-192 start c25e83c0 pointer offset 0 size 192
    2022-06-22T10:27:55.758509  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c495c500 pointer offset 64 size 128   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62b2ef403650847f8ba39d16

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220622/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220610.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62b2ef403650847=
f8ba39d1e
        failing since 0 day (last pass: next-20220616, first fail: next-202=
20621)
        16 lines

    2022-06-22T10:30:10.896004  kern  :alert : 8<--- cut here ---
    2022-06-22T10:30:10.896404  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address c3237400
    2022-06-22T10:30:10.896980  kern  :alert : [c3237400] *pgd=3D4321141e(b=
ad)
    2022-06-22T10:30:10.897303  kern  :alert : Register r0 i<8>[   50.88709=
3] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D16>
    2022-06-22T10:30:10.897613  nformation: slab kmalloc-192 start c269e3c0=
 pointer offset 0 size 192
    2022-06-22T10:30:10.897947  kern  :alert : Register r1 information: sla=
b kmalloc-128 start c2342980 pointer offset 64 size 128   =

 =20
