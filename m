Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2036E6919
	for <lists+linux-next@lfdr.de>; Tue, 18 Apr 2023 18:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjDRQOX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Apr 2023 12:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjDRQOX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Apr 2023 12:14:23 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646429015
        for <linux-next@vger.kernel.org>; Tue, 18 Apr 2023 09:14:22 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b8b19901fso1462127b3a.3
        for <linux-next@vger.kernel.org>; Tue, 18 Apr 2023 09:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681834461; x=1684426461;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5shusuf2H6ErIqSeoQXB+Z//BTe/HMqhTfl04pKhtco=;
        b=cveyIpF9RWMTPebaAjT8viRNtyOdUdGDffy8fRwICvuMjHHov585MqDve+fVVU4qNB
         lS3em89PX6GW5AL53JH1a+hYt06S+/lq3XcG5k3nVSY6WltjogZcVVfaL8B6VXKRsUiB
         Q3byYJ+1N+IlK5vLjIIo+VIichwYwegnMkiVSDhLGqFkdfNQabDWCPNOGx61MMrrd0jF
         4nPSdqq/5voZ5whuefuGgcdBUqixadHkRnqQMf71gwiWcF8STU6zJ/RN0Wrpwn2fstAq
         Oz/UJFFvi7e0cF8y8QA94KwcLksOrMQu1xl3pnRrOfSLCRE2HBN8Xa1W/I0ZB3Zapa0+
         54yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681834461; x=1684426461;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5shusuf2H6ErIqSeoQXB+Z//BTe/HMqhTfl04pKhtco=;
        b=NfXK3yqgL2MHC0q5Wlh7CK/Kj5ycddwhT3zkH5gAX8g4Xn9cBZCFdvm2eQeVkfeYhr
         pIQ0kDD+chDhkaJfA/NoOiKMZTVQvTLTOnTuEQUVgFZXAidhxTCVrwRrzalzkEWyT2yl
         AwI03bHD9b7+aHjfGbAmsIT8+XLeahRGPjbq/tpiuypnXYCOObMNCxya0ySfX5FO6MU9
         Xu1xU2GQ6MhYKiJpwhQtaWdp4qMiAruABWDxXZiKa0EWi6JbCkwdcdFNc2Z5+G+lg3jk
         SKwehAQH6INmINaHO75rm+baBES/4HLQlLBG27h5R2Qq6MOwG1+2fJcBT5Bp08YH8J/K
         Fq3g==
X-Gm-Message-State: AAQBX9evo9DMrzF/rqydotSlhUO4GVCeg1cASCAV/7tNoseYoune54fV
        1UGVctQIHOWbbkYH/sAxcPqlCYOUHT+GketYIYXrGjcw
X-Google-Smtp-Source: AKy350ZfM1HMEmEdZObfhs0J6cBG+LgwiZJAauAfgDZikSxeRCbD54cpHpZ0XZ+yBtHm3hShtIlu7w==
X-Received: by 2002:a05:6a00:21ce:b0:633:88de:7272 with SMTP id t14-20020a056a0021ce00b0063388de7272mr403239pfj.2.1681834458258;
        Tue, 18 Apr 2023 09:14:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s26-20020a62e71a000000b005a90f2cce30sm2248460pfh.49.2023.04.18.09.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 09:14:17 -0700 (PDT)
Message-ID: <643ec1d9.620a0220.49fd9.566f@mx.google.com>
Date:   Tue, 18 Apr 2023 09:14:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230417
X-Kernelci-Report-Type: test
Subject: next/master baseline: 647 runs, 552 regressions (next-20230417)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 647 runs, 552 regressions (next-20230417)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | sama=
5_defconfig              | 1          =

at91sam9g20ek                | arm    | lab-broonie     | clang-17   | mult=
i_v5_defconfig           | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10     | mult=
i_v5_defconfig           | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10     | omap=
2plus_defconfig          | 1          =

beaglebone-black             | arm    | lab-broonie     | clang-17   | mult=
i_v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip         | clang-17   | mult=
i_v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10     | mult=
i_v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10     | omap=
2plus_defconfig          | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10     | omap=
2plus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

da850-lcdk                   | arm    | lab-baylibre    | clang-17   | mult=
i_v5_defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10     | davi=
nci_all_defconfig        | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v5_defconfig           | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | clang-17   | mult=
i_v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | clang-17   | mult=
i_v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | clang-17   | mult=
i_v7_defconfig           | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-udoo                   | arm    | lab-broonie     | clang-17   | mult=
i_v7_defconfig           | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | clang-17   | mult=
i_v7_defconfig           | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | clang-17   | mult=
i_v7_defconfig           | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                    | arm    | lab-nxp         | clang-17   | mult=
i_v7_defconfig           | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | clang-17   | mult=
i_v7_defconfig           | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

jetson-tk1                   | arm    | lab-baylibre    | clang-13   | cros=
://chrome...avour.config | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | tegr=
a_defconfig              | 1          =

k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 1          =

k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | clang-17   | mult=
i_v7_defconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | clang-17   | mult=
i_v7_defconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 7          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-17   | defc=
onfig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 2          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 2          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 2          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 2          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-13   | defc=
onfig+arm64-chromebook   | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | clang-13   | defc=
onfig+arm64-chromebook   | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | clang-17   | defc=
onfig                    | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+arm64-chromebook   | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+arm64-chromebook   | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 7          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 7          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 2          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 2          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson8b-odroidc1             | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

meson8b-odroidc1             | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

meson8b-odroidc1             | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

odroid-xu3                   | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10     | exyn=
os_defconfig             | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_i386                    | i386   | lab-baylibre    | clang-17   | i386=
_defconfig               | 1          =

qemu_i386                    | i386   | lab-collabora   | clang-17   | i386=
_defconfig               | 1          =

qemu_i386                    | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig               | 1          =

qemu_i386                    | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_i386                    | i386   | lab-collabora   | gcc-10     | i386=
_defconfig               | 1          =

qemu_i386                    | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | clang-17   | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | clang-17   | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | clang-17   | x86_=
64_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | clang-17   | x86_=
64_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-17   | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-17   | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-17   | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-17   | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10     | shmo=
bile_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-17   | defc=
onfig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13   | cros=
://chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-13   | cros=
://chrome...avour.config | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 25         =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 25         =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17   | defc=
onfig                    | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 2          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17   | defc=
onfig                    | 7          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 7          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17   | defc=
onfig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230417/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230417
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4aa1da8d99724f6c0b762b58a71cee7c5e2e109b =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8dd31ea302a85e2e8600

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8dd31ea302a85e2e8611
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:32:07.458242  + <8>[   10.106108] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10030166_1.4.2.3.1>

    2023-04-18T12:32:07.458393  set +x

    2023-04-18T12:32:07.564859  / # #

    2023-04-18T12:32:07.667220  export SHELL=3D/bin/sh

    2023-04-18T12:32:07.667738  #

    2023-04-18T12:32:07.769242  / # export SHELL=3D/bin/sh. /lava-10030166/=
environment

    2023-04-18T12:32:07.770141  =


    2023-04-18T12:32:07.872246  / # . /lava-10030166/environment/lava-10030=
166/bin/lava-test-runner /lava-10030166/1

    2023-04-18T12:32:07.872590  =


    2023-04-18T12:32:07.877187  / # /lava-10030166/bin/lava-test-runner /la=
va-10030166/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ed113f6fedafb2e8630

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ed113f6fedafb2e8641
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:36:12.700438  + set<8>[   10.466869] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10030322_1.4.2.3.1>

    2023-04-18T12:36:12.700529   +x

    2023-04-18T12:36:12.804892  / # #

    2023-04-18T12:36:12.905950  export SHELL=3D/bin/sh

    2023-04-18T12:36:12.906138  #

    2023-04-18T12:36:13.007115  / # export SHELL=3D/bin/sh. /lava-10030322/=
environment

    2023-04-18T12:36:13.007326  =


    2023-04-18T12:36:13.108325  / # . /lava-10030322/environment/lava-10030=
322/bin/lava-test-runner /lava-10030322/1

    2023-04-18T12:36:13.108599  =


    2023-04-18T12:36:13.113199  / # /lava-10030322/bin/lava-test-runner /la=
va-10030322/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8e0659685a64742e8702

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8e0659685a64742e8707
        failing since 20 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-18T12:32:57.164197  <8>[   10.394243] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030148_1.4.2.3.1>

    2023-04-18T12:32:57.167405  + set +x

    2023-04-18T12:32:57.269473  =


    2023-04-18T12:32:57.370522  / # #export SHELL=3D/bin/sh

    2023-04-18T12:32:57.370741  =


    2023-04-18T12:32:57.471666  / # export SHELL=3D/bin/sh. /lava-10030148/=
environment

    2023-04-18T12:32:57.471946  =


    2023-04-18T12:32:57.572903  / # . /lava-10030148/environment/lava-10030=
148/bin/lava-test-runner /lava-10030148/1

    2023-04-18T12:32:57.573201  =


    2023-04-18T12:32:57.577948  / # /lava-10030148/bin/lava-test-runner /la=
va-10030148/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f0a2eb1cc70c62e8655

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8f0a2eb1cc70c62e865a
        failing since 20 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-18T12:37:10.649269  + set +x

    2023-04-18T12:37:10.655580  <8>[   10.312212] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030338_1.4.2.3.1>

    2023-04-18T12:37:10.764422  / # #

    2023-04-18T12:37:10.867048  export SHELL=3D/bin/sh

    2023-04-18T12:37:10.867785  #

    2023-04-18T12:37:10.969689  / # export SHELL=3D/bin/sh. /lava-10030338/=
environment

    2023-04-18T12:37:10.970398  =


    2023-04-18T12:37:11.072101  / # . /lava-10030338/environment/lava-10030=
338/bin/lava-test-runner /lava-10030338/1

    2023-04-18T12:37:11.073209  =


    2023-04-18T12:37:11.078159  / # /lava-10030338/bin/lava-test-runner /la=
va-10030338/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8dd1f90d407a232e85fc

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8dd1f90d407a232e8601
        failing since 20 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-18T12:32:03.967868  + <8>[   11.326219] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10030163_1.4.2.3.1>

    2023-04-18T12:32:03.968302  set +x

    2023-04-18T12:32:04.075808  / # #

    2023-04-18T12:32:04.178204  export SHELL=3D/bin/sh

    2023-04-18T12:32:04.178933  #

    2023-04-18T12:32:04.280803  / # export SHELL=3D/bin/sh. /lava-10030163/=
environment

    2023-04-18T12:32:04.281448  =


    2023-04-18T12:32:04.383312  / # . /lava-10030163/environment/lava-10030=
163/bin/lava-test-runner /lava-10030163/1

    2023-04-18T12:32:04.384410  =


    2023-04-18T12:32:04.389092  / # /lava-10030163/bin/lava-test-runner /la=
va-10030163/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ed59499c03bf52e8626

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-CM140=
0CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-CM140=
0CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ed59499c03bf52e862b
        failing since 20 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-18T12:36:17.368945  + <8>[   11.482348] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10030393_1.4.2.3.1>

    2023-04-18T12:36:17.369400  set +x

    2023-04-18T12:36:17.477252  / # #

    2023-04-18T12:36:17.578522  export SHELL=3D/bin/sh

    2023-04-18T12:36:17.579292  #

    2023-04-18T12:36:17.681007  / # export SHELL=3D/bin/sh. /lava-10030393/=
environment

    2023-04-18T12:36:17.681242  =


    2023-04-18T12:36:17.782375  / # . /lava-10030393/environment/lava-10030=
393/bin/lava-test-runner /lava-10030393/1

    2023-04-18T12:36:17.783585  =


    2023-04-18T12:36:17.788170  / # /lava-10030393/bin/lava-test-runner /la=
va-10030393/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8dd3f90d407a232e8607

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8dd3f90d407a232e860c
        failing since 20 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-18T12:32:09.998784  <8>[    9.960570] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030165_1.4.2.3.1>

    2023-04-18T12:32:10.002009  + set +x

    2023-04-18T12:32:10.104278  =


    2023-04-18T12:32:10.205383  / # #export SHELL=3D/bin/sh

    2023-04-18T12:32:10.205628  =


    2023-04-18T12:32:10.306569  / # export SHELL=3D/bin/sh. /lava-10030165/=
environment

    2023-04-18T12:32:10.306816  =


    2023-04-18T12:32:10.407814  / # . /lava-10030165/environment/lava-10030=
165/bin/lava-test-runner /lava-10030165/1

    2023-04-18T12:32:10.408155  =


    2023-04-18T12:32:10.413082  / # /lava-10030165/bin/lava-test-runner /la=
va-10030165/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ed3d125b844012e867b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ed3d125b844012e8680
        failing since 20 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-18T12:36:16.086303  <8>[   10.520513] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030337_1.4.2.3.1>

    2023-04-18T12:36:16.089712  + set +x

    2023-04-18T12:36:16.194616  / # #

    2023-04-18T12:36:16.297282  export SHELL=3D/bin/sh

    2023-04-18T12:36:16.298088  #

    2023-04-18T12:36:16.400001  / # export SHELL=3D/bin/sh. /lava-10030337/=
environment

    2023-04-18T12:36:16.400863  =


    2023-04-18T12:36:16.502695  / # . /lava-10030337/environment/lava-10030=
337/bin/lava-test-runner /lava-10030337/1

    2023-04-18T12:36:16.503996  =


    2023-04-18T12:36:16.509778  / # /lava-10030337/bin/lava-test-runner /la=
va-10030337/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e968ac225d93b942e8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e968ac225d93b942e8=
638
        new failure (last pass: next-20230406) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90e9dc309cd6b62e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90e9dc309cd6b62e8=
603
        new failure (last pass: next-20230406) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91a6d7db67e2532e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91a6d7db67e2532e8=
5ec
        new failure (last pass: next-20230406) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9834d6ae2a858d2e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-at=
91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-at=
91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9834d6ae2a858d2e8=
5fe
        new failure (last pass: next-20230406) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | sama=
5_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f1fb9d792355d2e866d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f1fb9d792355d2e8=
66e
        failing since 76 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | clang-17   | mult=
i_v5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93f384dcffa9c62e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v5_defconfig/clang-17/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v5_defconfig/clang-17/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93f384dcffa9c62e8=
5ec
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10     | mult=
i_v5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f2e15b147008e2e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f2e15b147008e2e8=
606
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e976bc0465bbb002e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e976bc0465bbb002e8=
5ff
        failing since 20 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9984fa5f4b6f922e860b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9984fa5f4b6f922e8=
60c
        failing since 18 days (last pass: next-20230330, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10     | omap=
2plus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8e553bd8621a4d2e8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8e553bd8621a4d2e8=
646
        failing since 19 days (last pass: next-20230327, first fail: next-2=
0230330) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-broonie     | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e943cb70b88e96b2e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e943cb70b88e96b2e8=
600
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-cip         | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643eb07e1ac7aa69bd2e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eb07e1ac7aa69bd2e8=
619
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90e80a524be4172e8606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90e80a524be4172e8=
607
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e92bfdf306090e92e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e92bfdf306090e92e8=
5ef
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e958d61699bb59a2e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e958d61699bb59a2e8=
5ec
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9e21a61241d0562e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9e21a61241d0562e8=
5e7
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643ea1363e9d7431972e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ea1363e9d7431972e8=
5fe
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643eb5aeb0a5909a942e863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eb5aeb0a5909a942e8=
640
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10     | omap=
2plus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8d81685d6cd6a62e863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8d81685d6cd6a62e8=
63e
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10     | omap=
2plus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9d126621919b022e8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9d126621919b022e8=
655
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
cubietruck                   | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e957a137e4083272e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e957a137e4083272e8=
5f7
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90eacf5e0a31322e862d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90eacf5e0a31322e8=
62e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9215cbc0c21aed2e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9215cbc0c21aed2e8=
5f2
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e95f50b0eb703942e8624

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e95f50b0eb703942e8=
625
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643e900eb47a5695a02e863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e900eb47a5695a02e8=
63b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | clang-17   | mult=
i_v5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9310d999c1a8242e8607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v5_defconfig/clang-17/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v5_defconfig/clang-17/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9310d999c1a8242e8=
608
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10     | davi=
nci_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/643e92adcb6f6345442e860f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e92adcb6f634=
5442e8616
        failing since 64 days (last pass: next-20230208, first fail: next-2=
0230213)
        29 lines

    2023-04-18T12:52:43.659137  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4d3a200 pointer offset 4 size 512
    2023-04-18T12:52:43.692895  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-18T12:52:43.693160  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-18T12:52:43.693362  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2a6000 allocated at load_module+0x6b0/0=
x1954
    2023-04-18T12:52:43.695996  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-18T12:52:43.800843  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-18T12:52:43.801621  kern  :emerg : Process udevd (pid: 65, stac=
k limit =3D 0xf7778836)
    2023-04-18T12:52:43.802393  kern  :emerg : Stack: (0xc8901d08 to 0xc890=
2000)
    2023-04-18T12:52:43.802759  kern  :emerg : 1d00:                   c4d3=
a200 c0773860 00000000 c03afa20 00000000 09032a82
    2023-04-18T12:52:43.803151  kern  :emerg : 1d20: 0000005d 09032a82 c077=
3860 bf2a6220 00000000 00000000 00000000 00000001 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f0cb9d792355d2e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v5_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v5_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f0cb9d792355d2e8=
5ff
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8e16ed3cadb48a2e85e6

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8e16ed3cadb48a2e85f7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:33:04.759658  + <8>[   11.070354] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10030181_1.4.2.3.1>

    2023-04-18T12:33:04.759748  set +x

    2023-04-18T12:33:04.864729  / # #

    2023-04-18T12:33:04.965680  export SHELL=3D/bin/sh

    2023-04-18T12:33:04.965892  #

    2023-04-18T12:33:05.066692  / # export SHELL=3D/bin/sh. /lava-10030181/=
environment

    2023-04-18T12:33:05.066921  =


    2023-04-18T12:33:05.167880  / # . /lava-10030181/environment/lava-10030=
181/bin/lava-test-runner /lava-10030181/1

    2023-04-18T12:33:05.168200  =


    2023-04-18T12:33:05.172645  / # /lava-10030181/bin/lava-test-runner /la=
va-10030181/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ece9499c03bf52e85e6

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ece9499c03bf52e85f7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:36:16.360130  + <8>[    9.778540] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10030373_1.4.2.3.1>

    2023-04-18T12:36:16.360712  set +x

    2023-04-18T12:36:16.468981  / # #

    2023-04-18T12:36:16.572061  export SHELL=3D/bin/sh

    2023-04-18T12:36:16.572931  #

    2023-04-18T12:36:16.674972  / # export SHELL=3D/bin/sh. /lava-10030373/=
environment

    2023-04-18T12:36:16.675905  =


    2023-04-18T12:36:16.778171  / # . /lava-10030373/environment/lava-10030=
373/bin/lava-test-runner /lava-10030373/1

    2023-04-18T12:36:16.779644  =


    2023-04-18T12:36:16.781602  / # /lava-10030373/bin/lava-test-runner /la=
va-10030373/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f3a6ee999f70d2e861f

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8f3a6ee999f70d2e8630
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:37:57.192933  + <8>[   10.486916] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10030189_1.4.2.3.1>

    2023-04-18T12:37:57.193020  set +x

    2023-04-18T12:37:57.297588  / # #

    2023-04-18T12:37:57.398666  export SHELL=3D/bin/sh

    2023-04-18T12:37:57.398934  #

    2023-04-18T12:37:57.499950  / # export SHELL=3D/bin/sh. /lava-10030189/=
environment

    2023-04-18T12:37:57.500181  =


    2023-04-18T12:37:57.601165  / # . /lava-10030189/environment/lava-10030=
189/bin/lava-test-runner /lava-10030189/1

    2023-04-18T12:37:57.601472  =


    2023-04-18T12:37:57.606089  / # /lava-10030189/bin/lava-test-runner /la=
va-10030189/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f7006ef7bd2822e860d

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-14-db00=
03na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8f7106ef7bd2822e861e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:38:50.529754  + <8>[   11.083175] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10030329_1.4.2.3.1>

    2023-04-18T12:38:50.529859  set +x

    2023-04-18T12:38:50.634583  / # #

    2023-04-18T12:38:50.737825  export SHELL=3D/bin/sh

    2023-04-18T12:38:50.738524  #

    2023-04-18T12:38:50.840140  / # export SHELL=3D/bin/sh. /lava-10030329/=
environment

    2023-04-18T12:38:50.840948  =


    2023-04-18T12:38:50.942860  / # . /lava-10030329/environment/lava-10030=
329/bin/lava-test-runner /lava-10030329/1

    2023-04-18T12:38:50.944397  =


    2023-04-18T12:38:50.948591  / # /lava-10030329/bin/lava-test-runner /la=
va-10030329/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8e57d4b0c6ca102e85f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8e57d4b0c6ca102e85f9
        failing since 20 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-18T12:34:13.872105  + set +x

    2023-04-18T12:34:13.878541  <8>[    8.156913] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030179_1.4.2.3.1>

    2023-04-18T12:34:13.983219  / # #

    2023-04-18T12:34:14.084144  export SHELL=3D/bin/sh

    2023-04-18T12:34:14.084310  #

    2023-04-18T12:34:14.185233  / # export SHELL=3D/bin/sh. /lava-10030179/=
environment

    2023-04-18T12:34:14.185386  =


    2023-04-18T12:34:14.286317  / # . /lava-10030179/environment/lava-10030=
179/bin/lava-test-runner /lava-10030179/1

    2023-04-18T12:34:14.286573  =


    2023-04-18T12:34:14.290916  / # /lava-10030179/bin/lava-test-runner /la=
va-10030179/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ee772158010072e861e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ee772158010072e8623
        failing since 20 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-18T12:36:27.709413  + set +x

    2023-04-18T12:36:27.715501  <8>[   11.149098] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030402_1.4.2.3.1>

    2023-04-18T12:36:27.820400  / # #

    2023-04-18T12:36:27.921476  export SHELL=3D/bin/sh

    2023-04-18T12:36:27.921712  #

    2023-04-18T12:36:28.022715  / # export SHELL=3D/bin/sh. /lava-10030402/=
environment

    2023-04-18T12:36:28.022929  =


    2023-04-18T12:36:28.123914  / # . /lava-10030402/environment/lava-10030=
402/bin/lava-test-runner /lava-10030402/1

    2023-04-18T12:36:28.124227  =


    2023-04-18T12:36:28.128656  / # /lava-10030402/bin/lava-test-runner /la=
va-10030402/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ddc866fd992392e8602

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ddc866fd992392e8607
        failing since 20 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-18T12:32:07.261885  <8>[   10.837293] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030174_1.4.2.3.1>

    2023-04-18T12:32:07.264706  + set +x

    2023-04-18T12:32:07.366334  #

    2023-04-18T12:32:07.366630  =


    2023-04-18T12:32:07.467615  / # #export SHELL=3D/bin/sh

    2023-04-18T12:32:07.467814  =


    2023-04-18T12:32:07.568714  / # export SHELL=3D/bin/sh. /lava-10030174/=
environment

    2023-04-18T12:32:07.568958  =


    2023-04-18T12:32:07.669919  / # . /lava-10030174/environment/lava-10030=
174/bin/lava-test-runner /lava-10030174/1

    2023-04-18T12:32:07.670189  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ecbd125b844012e8649

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ecbd125b844012e864e
        failing since 20 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-18T12:36:12.870362  <8>[   10.327747] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030350_1.4.2.3.1>

    2023-04-18T12:36:12.873921  + set +x

    2023-04-18T12:36:12.975652  #

    2023-04-18T12:36:13.076888  / # #export SHELL=3D/bin/sh

    2023-04-18T12:36:13.077059  =


    2023-04-18T12:36:13.177944  / # export SHELL=3D/bin/sh. /lava-10030350/=
environment

    2023-04-18T12:36:13.178148  =


    2023-04-18T12:36:13.279110  / # . /lava-10030350/environment/lava-10030=
350/bin/lava-test-runner /lava-10030350/1

    2023-04-18T12:36:13.279437  =


    2023-04-18T12:36:13.284056  / # /lava-10030350/bin/lava-test-runner /la=
va-10030350/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8dcbea20e2485d2e860b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8dcbea20e2485d2e8610
        failing since 20 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-18T12:31:46.968487  + <8>[    8.379488] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10030195_1.4.2.3.1>

    2023-04-18T12:31:46.968586  set +x

    2023-04-18T12:31:47.072952  / # #

    2023-04-18T12:31:47.173952  export SHELL=3D/bin/sh

    2023-04-18T12:31:47.174170  #

    2023-04-18T12:31:47.275094  / # export SHELL=3D/bin/sh. /lava-10030195/=
environment

    2023-04-18T12:31:47.275308  =


    2023-04-18T12:31:47.376217  / # . /lava-10030195/environment/lava-10030=
195/bin/lava-test-runner /lava-10030195/1

    2023-04-18T12:31:47.376519  =


    2023-04-18T12:31:47.381088  / # /lava-10030195/bin/lava-test-runner /la=
va-10030195/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ee572158010072e860f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ee572158010072e8614
        failing since 20 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-18T12:36:36.305706  + <8>[   10.765931] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 10030349_1.4.2.3.1>

    2023-04-18T12:36:36.305801  set +x

    2023-04-18T12:36:36.411070  / # #

    2023-04-18T12:36:36.511897  export SHELL=3D/bin/sh

    2023-04-18T12:36:36.512110  #

    2023-04-18T12:36:36.613081  / # export SHELL=3D/bin/sh. /lava-10030349/=
environment

    2023-04-18T12:36:36.613310  =


    2023-04-18T12:36:36.714294  / # . /lava-10030349/environment/lava-10030=
349/bin/lava-test-runner /lava-10030349/1

    2023-04-18T12:36:36.714635  =


    2023-04-18T12:36:36.719848  / # /lava-10030349/bin/lava-test-runner /la=
va-10030349/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e97cc047061594f2e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e97cc047061594f2e8=
5f2
        new failure (last pass: next-20230308) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9114e539c444822e8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9114e539c444822e8=
632
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9269b51f07eda62e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9269b51f07eda62e8=
5ed
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93bd4b55998da02e8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93bd4b55998da02e8=
631
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e99343eaa1ff3e22e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e99343eaa1ff3e22e8=
602
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e97cd047061594f2e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e97cd047061594f2e8=
5f5
        new failure (last pass: next-20230308) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9115b49fb1bc452e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9115b49fb1bc452e8=
5ea
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9269dab36a6b972e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9269dab36a6b972e8=
5f5
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93be9b1b1f5efe2e8629

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93be9b1b1f5efe2e8=
62a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643e96790aac1b55102e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e96790aac1b55102e8=
600
        failing since 251 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9920bf84c15fbb2e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9920bf84c15fbb2e8=
619
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e941378e5ca9a072e8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e941378e5ca9a072e8=
634
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9065777a72c8af2e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9065777a72c8af2e8=
5f0
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e909fa546f6225b2e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6dl-udoo.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6dl-udoo.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e909fa546f6225b2e8=
5ed
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91cd2f68fd23ff2e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91cd2f68fd23ff2e8=
5fc
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e95c8a75bc682042e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e95c8a75bc682042e8=
5f3
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93c5fa3dd8b75c2e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93c5fa3dd8b75c2e8=
5f2
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9257fdfea10c782e8616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9257fdfea10c782e8=
617
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e92bbe22d51eec82e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e92bbe22d51eec82e8=
5ea
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e953c31a483d3e72e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e953c31a483d3e72e8=
611
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e941478e5ca9a072e8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e941478e5ca9a072e8=
642
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e901484284c162d2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e901484284c162d2e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91e34a3fcd849f2e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-imx6q-udoo.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91e34a3fcd849f2e8=
5fd
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9244fdfea10c782e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9244fdfea10c782e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e94d820c6a43e9e2e8615

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e94d820c6a43e9e2e8=
616
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e979044b78d7f4c2e8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6qp-wandboard-revd1=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-pengutronix/baseline-imx6qp-wandboard-revd1=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e979044b78d7f4c2e8=
649
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90d9cf5e0a31322e8612

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90d9cf5e0a31322e8=
613
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e922bd0e2eaef382e8625

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6qp-wa=
ndboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6qp-wa=
ndboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e922bd0e2eaef382e8=
626
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9380c2d8c028ef2e8606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9380c2d8c028ef2e8=
607
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643e963c956fa88f6b2e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e963c956fa88f6b2e8=
5ee
        failing since 238 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e98e41a972a2ab82e868b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e98e41a972a2ab82e8=
68c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e95aa46243d201e2e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e95aa46243d201e2e8=
60a
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9024190ce8a7712e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9024190ce8a7712e8=
5e9
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90ba5b3f20fc132e863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90ba5b3f20fc132e8=
63c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91d538f4edffc62e861a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91d538f4edffc62e8=
61b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9614eb81e020942e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9614eb81e020942e8=
5f3
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e94482ceb3686752e85ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e94482ceb3686752e8=
5f0
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e903b5da23c211b2e86e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e903b5da23c211b2e8=
6e1
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90a63ffac3bcb22e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90a63ffac3bcb22e8=
600
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9218a6c4e445932e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9218a6c4e445932e8=
5ef
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e950abcc42edfbc2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e950abcc42edfbc2e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e95f10b0eb703942e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e95f10b0eb703942e8=
611
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9027ea9a879be42e860c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9027ea9a879be42e8=
60d
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90aabd4fa178cc2e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90aabd4fa178cc2e8=
60a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9215276768a0822e8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9215276768a0822e8=
664
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e967dded457ad332e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e967dded457ad332e8=
5f4
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9748b9615eddac2e85f6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-imx8m=
n-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-imx8m=
n-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e9748b9615eddac2e85fb
        new failure (last pass: next-20230412)

    2023-04-18T13:12:08.998393  / # #
    2023-04-18T13:12:10.167921  export SHELL=3D/bin/sh
    2023-04-18T13:12:10.176376  #
    2023-04-18T13:12:11.734743  / # export SHELL=3D/bin/sh. /lava-3507414/e=
nvironment
    2023-04-18T13:12:11.742286  =

    2023-04-18T13:12:14.576681  / # . /lava-3507414/environment/lava-350741=
4/bin/lava-test-runner /lava-3507414/1
    2023-04-18T13:12:14.584503  =

    2023-04-18T13:12:14.585519  / # /lava-3507414/bin/lava<6>[   27.529054]=
 platform 30030000.sai: deferred probe pending
    2023-04-18T13:12:14.586751  <6>[   27.534753] i2c 1-0050: deferred prob=
e pending
    2023-04-18T13:12:14.587874  <6>[   27.539473] platform 30090000.spdif: =
deferred probe pending =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9a2c6707b4def22e8626

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e9a2c6707b4def22e862b
        new failure (last pass: next-20230405)

    2023-04-18T13:24:25.498713  + set<8>[   23.100260] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3507470_1.5.2.4.1>
    2023-04-18T13:24:25.499684   +x
    2023-04-18T13:24:25.620024  / # #
    2023-04-18T13:24:26.788299  export SHELL=3D/bin/sh
    2023-04-18T13:24:26.795045  #
    2023-04-18T13:24:28.350850  / # export SHELL=3D/bin/sh. /lava-3507470/e=
nvironment
    2023-04-18T13:24:28.357591  =

    2023-04-18T13:24:31.192404  / # . /lava-3507470/environment/lava-350747=
0/bin/lava-test-runner /lava-3507470/1
    2023-04-18T13:24:31.200195  =

    2023-04-18T13:24:31.201206  / # /lava-3507470/bin/lava-<6>[   27.283668=
] platform sound-bt-sco: deferred probe pending =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9b455f9529a0972e8619

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e9b455f9529a0972e861e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T13:29:17.509930  + set<8>[   24.457541] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3507555_1.5.2.4.1>
    2023-04-18T13:29:17.510912   +x
    2023-04-18T13:29:17.630357  / # #
    2023-04-18T13:29:18.796435  export SHELL=3D/bin/sh
    2023-04-18T13:29:18.803036  #
    2023-04-18T13:29:20.355765  / # export SHELL=3D/bin/sh. /lava-3507555/e=
nvironment
    2023-04-18T13:29:20.362361  =

    2023-04-18T13:29:23.193922  / # . /lava-3507555/environment/lava-350755=
5/bin/lava-test-runner /lava-3507555/1
    2023-04-18T13:29:23.204460  =

    2023-04-18T13:29:23.217081  / # /lava-3507555/bin/lava-test-runner /lav=
a-3507555/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643ea0bdb64c9463612e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643ea0bdb64c9463612e85eb
        new failure (last pass: next-20230412)

    2023-04-18T13:52:43.022104  / # #
    2023-04-18T13:52:44.190871  export SHELL=3D/bin/sh
    2023-04-18T13:52:44.197568  #
    2023-04-18T13:52:45.753253  / # export SHELL=3D/bin/sh. /lava-3507791/e=
nvironment
    2023-04-18T13:52:45.760088  =

    2023-04-18T13:52:48.592759  / # . /lava-3507791/environment/lava-350779=
1/bin/lava-test-runner /lava-3507791/1
    2023-04-18T13:52:48.600715  =

    2023-04-18T13:52:48.603737  / # /lava-3507791/bin/lava-test-runner /lav=
a-3507791/1
    2023-04-18T13:52:48.669105  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T13:52:48.670311  + cd /lava-3507791/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | clang-13   | cros=
://chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8b75f2c94c0f3b2e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-bayli=
bre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-bayli=
bre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8b75f2c94c0f3b2e8=
5e9
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91b3f2456f8f412e876e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91b3f2456f8f412e8=
76f
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9201a82b5455432e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9201a82b5455432e8=
5e9
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9399f8b66e5dd52e8627

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9399f8b66e5dd52e8=
628
        failing since 371 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9517f72455ad492e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9517f72455ad492e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | tegr=
a_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643e900d2246a64d272e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e900d2246a64d272e8=
5fd
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90253942d86e5a2e866c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-k3-j7=
21e-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-k3-j7=
21e-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90253942d86e5a2e8=
66d
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9189a1753a8b7e2e864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-j721e-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-j721e-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9189a1753a8b7e2e8=
64e
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e92e7cbb6f328312e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-j721=
e-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e92e7cbb6f328312e8=
5f1
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
k3-j721e-beagleboneai64      | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e961cb3168e9e852e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-j721e-beagleboneai64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-j721e-beagleboneai64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e961cb3168e9e852e8=
5eb
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e94cab258fa11632e862b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e94cab258fa11632e8=
62c
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e911dcdc60730982e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e911dcdc60730982e8=
5ea
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9236a27851c6d92e861e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9236a27851c6d92e8=
61f
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e953231a483d3e72e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e953231a483d3e72e8=
5f7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e94022ad99e6a742e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e94022ad99e6a742e8=
5f5
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91bee74fbf32ea2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91bee74fbf32ea2e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9222a6c4e445932e8607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9222a6c4e445932e8=
608
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e951af72455ad492e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e951af72455ad492e8=
5fb
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 7          =


  Details:     https://kernelci.org/test/plan/id/643e9593a18aea816a2e8613

  Results:     45 PASS, 7 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e9593a18aea816a2e8616
        new failure (last pass: next-20230412)

    2023-04-18T13:04:58.617968  / # #
    2023-04-18T13:04:58.719533  export SHELL=3D/bin/sh
    2023-04-18T13:04:58.720720  #
    2023-04-18T13:04:58.822874  / # export SHELL=3D/bin/sh. /lava-321085/en=
vironment
    2023-04-18T13:04:58.823226  =

    2023-04-18T13:04:58.924568  / # . /lava-321085/environment/lava-321085/=
bin/lava-test-runner /lava-321085/1
    2023-04-18T13:04:58.925186  =

    2023-04-18T13:04:58.942530  / # /lava-321085/bin/lava-test-runner /lava=
-321085/1
    2023-04-18T13:04:58.998639  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T13:04:58.998912  + cd /l<8>[   18.237902] <LAVA_SIGNAL_START=
RUN 1_bootrr 321085_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/643e9593a18aea816a2e8621
        new failure (last pass: next-20230412)

    2023-04-18T13:05:01.229209  /lava-321085/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/643=
e9593a18aea816a2e8623
        new failure (last pass: next-20230412)

    2023-04-18T13:05:02.254584  /lava-321085/1/../bin/lava-test-case
    2023-04-18T13:05:02.255072  <8>[   21.631270] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-04-18T13:05:02.255420  /lava-321085/1/../bin/lava-test-case   =


  * baseline.bootrr.dwc3-usb0-probed: https://kernelci.org/test/case/id/643=
e9593a18aea816a2e8625
        new failure (last pass: next-20230412)

    2023-04-18T13:05:03.241301  /lava-321085/1/../bin/lava-test-case
    2023-04-18T13:05:03.244597  <8>[   22.681670] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/643=
e9593a18aea816a2e8626
        new failure (last pass: next-20230412)

    2023-04-18T13:05:04.254901  /lava-321085/1/../bin/lava-test-case
    2023-04-18T13:05:04.255387  <8>[   23.709821] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-04-18T13:05:04.255728  /lava-321085/1/../bin/lava-test-case   =


  * baseline.bootrr.imx-sdma-0-probed: https://kernelci.org/test/case/id/64=
3e9593a18aea816a2e862d
        new failure (last pass: next-20230412)

    2023-04-18T13:05:05.356499  /lava-321085/1/../bin/lava-test-case
    2023-04-18T13:05:05.359765  <8>[   24.884041] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-sdma-0-probed RESULT=3Dfail>   =


  * baseline.bootrr.imx-sdma-1-probed: https://kernelci.org/test/case/id/64=
3e9593a18aea816a2e862e
        new failure (last pass: next-20230412)

    2023-04-18T13:05:06.369088  /lava-321085/1/../bin/lava-test-case
    2023-04-18T13:05:06.369598  <8>[   25.912154] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx-sdma-1-probed RESULT=3Dfail>
    2023-04-18T13:05:06.369933  /lava-321085/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8dc6b5dd1e46342e861f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8dc6b5dd1e46342e8624
        failing since 20 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-04-18T12:31:54.570325  + set<8>[   10.871279] <LAVA_SIGNAL_ENDRUN =
0_dmesg 10030151_1.4.2.3.1>

    2023-04-18T12:31:54.570414   +x

    2023-04-18T12:31:54.675179  / # #

    2023-04-18T12:31:54.776157  export SHELL=3D/bin/sh

    2023-04-18T12:31:54.776358  #

    2023-04-18T12:31:54.877250  / # export SHELL=3D/bin/sh. /lava-10030151/=
environment

    2023-04-18T12:31:54.877526  =


    2023-04-18T12:31:54.978460  / # . /lava-10030151/environment/lava-10030=
151/bin/lava-test-runner /lava-10030151/1

    2023-04-18T12:31:54.978762  =


    2023-04-18T12:31:54.983813  / # /lava-10030151/bin/lava-test-runner /la=
va-10030151/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ebf9abc686caa2e861c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ebf9abc686caa2e8621
        failing since 20 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-04-18T12:36:02.294907  + set +x<8>[   10.993591] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 10030327_1.4.2.3.1>

    2023-04-18T12:36:02.295334  =


    2023-04-18T12:36:02.403802  / # #

    2023-04-18T12:36:02.506554  export SHELL=3D/bin/sh

    2023-04-18T12:36:02.507202  #

    2023-04-18T12:36:02.608958  / # export SHELL=3D/bin/sh. /lava-10030327/=
environment

    2023-04-18T12:36:02.609776  =


    2023-04-18T12:36:02.711396  / # . /lava-10030327/environment/lava-10030=
327/bin/lava-test-runner /lava-10030327/1

    2023-04-18T12:36:02.712518  =


    2023-04-18T12:36:02.717708  / # /lava-10030327/bin/lava-test-runner /la=
va-10030327/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ec83449941e232e8677

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ec83449941e232e867c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:36:17.958801  / # #
    2023-04-18T12:36:18.060645  export SHELL=3D/bin/sh
    2023-04-18T12:36:18.061106  #
    2023-04-18T12:36:18.162543  / # export SHELL=3D/bin/sh. /lava-3507396/e=
nvironment
    2023-04-18T12:36:18.163376  =

    2023-04-18T12:36:18.265329  / # . /lava-3507396/environment/lava-350739=
6/bin/lava-test-runner /lava-3507396/1
    2023-04-18T12:36:18.266016  =

    2023-04-18T12:36:18.272018  / # /lava-3507396/bin/lava-test-runner /lav=
a-3507396/1
    2023-04-18T12:36:18.342891  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:36:18.343192  + cd /lava-3507396/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fcd71747155d52e85e9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8fcd71747155d52e85ee
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:36.141499  / # #
    2023-04-18T12:40:36.243252  export SHELL=3D/bin/sh
    2023-04-18T12:40:36.243908  #
    2023-04-18T12:40:36.345381  / # export SHELL=3D/bin/sh. /lava-3507475/e=
nvironment
    2023-04-18T12:40:36.345829  =

    2023-04-18T12:40:36.447610  / # . /lava-3507475/environment/lava-350747=
5/bin/lava-test-runner /lava-3507475/1
    2023-04-18T12:40:36.449078  =

    2023-04-18T12:40:36.454017  / # /lava-3507475/bin/lava-test-runner /lav=
a-3507475/1
    2023-04-18T12:40:36.486584  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:40:36.525430  + cd /lava-3507475/1/tests/1_bootrr =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90d00a524be4172e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e90d00a524be4172e85eb
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:44:59.869623  / # #
    2023-04-18T12:44:59.971552  export SHELL=3D/bin/sh
    2023-04-18T12:44:59.972317  #
    2023-04-18T12:45:00.073852  / # export SHELL=3D/bin/sh. /lava-3507549/e=
nvironment
    2023-04-18T12:45:00.074244  =

    2023-04-18T12:45:00.175683  / # . /lava-3507549/environment/lava-350754=
9/bin/lava-test-runner /lava-3507549/1
    2023-04-18T12:45:00.176379  =

    2023-04-18T12:45:00.182953  / # /lava-3507549/bin/lava-test-runner /lav=
a-3507549/1
    2023-04-18T12:45:00.253811  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:45:00.254317  + cd /lava-3507549/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e94932516f88e9b2e85f5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e94932516f88e9b2e85fa
        new failure (last pass: next-20230412)

    2023-04-18T13:00:46.866746  / # #
    2023-04-18T13:00:46.968690  export SHELL=3D/bin/sh
    2023-04-18T13:00:46.969198  #
    2023-04-18T13:00:47.071186  / # export SHELL=3D/bin/sh. /lava-3507801/e=
nvironment
    2023-04-18T13:00:47.071640  =

    2023-04-18T13:00:47.173107  / # . /lava-3507801/environment/lava-350780=
1/bin/lava-test-runner /lava-3507801/1
    2023-04-18T13:00:47.173907  =

    2023-04-18T13:00:47.179956  / # /lava-3507801/bin/lava-test-runner /lav=
a-3507801/1
    2023-04-18T13:00:47.244962  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T13:00:47.245295  + cd /lava-3507801/1/tests/1_bootrr =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ed44198a9d03a2e8621

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ed44198a9d03a2e8626
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:36:18.612904  / # #

    2023-04-18T12:36:18.714199  export SHELL=3D/bin/sh

    2023-04-18T12:36:18.714553  #

    2023-04-18T12:36:18.815864  / # export SHELL=3D/bin/sh. /lava-10030376/=
environment

    2023-04-18T12:36:18.816685  =


    2023-04-18T12:36:18.918545  / # . /lava-10030376/environment/lava-10030=
376/bin/lava-test-runner /lava-10030376/1

    2023-04-18T12:36:18.918870  =


    2023-04-18T12:36:18.920799  / # /lava-10030376/bin/lava-test-runner /la=
va-10030376/1

    2023-04-18T12:36:18.983677  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-18T12:36:18.983791  + cd /lava-10030376/1/tests/1_bootrr
 =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-17   | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fc595fab8d70f2e85fa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8fc595fab8d70f2e85ff
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:31.412031  / # #

    2023-04-18T12:40:31.513269  export SHELL=3D/bin/sh

    2023-04-18T12:40:31.513517  #

    2023-04-18T12:40:31.614485  / # export SHELL=3D/bin/sh. /lava-10030427/=
environment

    2023-04-18T12:40:31.614697  =


    2023-04-18T12:40:31.715661  / # . /lava-10030427/environment/lava-10030=
427/bin/lava-test-runner /lava-10030427/1

    2023-04-18T12:40:31.715993  =


    2023-04-18T12:40:31.724919  / # /lava-10030427/bin/lava-test-runner /la=
va-10030427/1

    2023-04-18T12:40:31.765478  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-18T12:40:31.782873  + cd /lava-10030427/1/tests/1_bootrr
 =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90cafb867c04a22e8653

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e90cafb867c04a22e8658
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:44:37.200358  / # #

    2023-04-18T12:44:37.301305  export SHELL=3D/bin/sh

    2023-04-18T12:44:37.301553  #

    2023-04-18T12:44:37.402522  / # export SHELL=3D/bin/sh. /lava-10030543/=
environment

    2023-04-18T12:44:37.402742  =


    2023-04-18T12:44:37.503584  / # . /lava-10030543/environment/lava-10030=
543/bin/lava-test-runner /lava-10030543/1

    2023-04-18T12:44:37.503890  =


    2023-04-18T12:44:37.514098  / # /lava-10030543/bin/lava-test-runner /la=
va-10030543/1

    2023-04-18T12:44:37.557415  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-18T12:44:37.567155  + cd /lava-10030543/1/tests/1_bootrr
 =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e948a6b2650dc5e2e85e6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vi=
m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vi=
m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e948a6b2650dc5e2e85eb
        new failure (last pass: next-20230411)

    2023-04-18T13:00:40.174682  / # #

    2023-04-18T13:00:40.277579  export SHELL=3D/bin/sh

    2023-04-18T13:00:40.278391  #

    2023-04-18T13:00:40.380608  / # export SHELL=3D/bin/sh. /lava-10030784/=
environment

    2023-04-18T13:00:40.381473  =


    2023-04-18T13:00:40.483254  / # . /lava-10030784/environment/lava-10030=
784/bin/lava-test-runner /lava-10030784/1

    2023-04-18T13:00:40.483630  =


    2023-04-18T13:00:40.496815  / # /lava-10030784/bin/lava-test-runner /la=
va-10030784/1

    2023-04-18T13:00:40.537473  + export 'TESTRUN_ID=3D1_bootrr'

    2023-04-18T13:00:40.554791  + cd /lava-10030784/1/tests/1_bootrr
 =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f7ce7fc013c712e864c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8f7ce7fc013c712e8651
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:39:10.251292  / # #
    2023-04-18T12:39:10.353078  export SHELL=3D/bin/sh
    2023-04-18T12:39:10.353518  #
    2023-04-18T12:39:10.454889  / # export SHELL=3D/bin/sh. /lava-3507409/e=
nvironment
    2023-04-18T12:39:10.455327  =

    2023-04-18T12:39:10.556734  / # . /lava-3507409/environment/lava-350740=
9/bin/lava-test-runner /lava-3507409/1
    2023-04-18T12:39:10.557472  =

    2023-04-18T12:39:10.563930  / # /lava-3507409/bin/lava-test-runner /lav=
a-3507409/1
    2023-04-18T12:39:10.623856  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:39:10.624148  + cd /lava-3507409/1/tests/1_bootrr =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fce8738f2fcd52e85ff

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8fce8738f2fcd52e8604
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:36.396315  / # #
    2023-04-18T12:40:36.498133  export SHELL=3D/bin/sh
    2023-04-18T12:40:36.498569  #
    2023-04-18T12:40:36.599924  / # export SHELL=3D/bin/sh. /lava-3507482/e=
nvironment
    2023-04-18T12:40:36.600365  =

    2023-04-18T12:40:36.701729  / # . /lava-3507482/environment/lava-350748=
2/bin/lava-test-runner /lava-3507482/1
    2023-04-18T12:40:36.702638  =

    2023-04-18T12:40:36.708063  / # /lava-3507482/bin/lava-test-runner /lav=
a-3507482/1
    2023-04-18T12:40:36.766820  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:40:36.768099  + cd /lava-3507482/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91c0d7db67e2532e8652

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e91c0d7db67e2532e8657
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:48:50.952562  / # #
    2023-04-18T12:48:51.054259  export SHELL=3D/bin/sh
    2023-04-18T12:48:51.054633  #
    2023-04-18T12:48:51.155996  / # export SHELL=3D/bin/sh. /lava-3507554/e=
nvironment
    2023-04-18T12:48:51.156641  =

    2023-04-18T12:48:51.257997  / # . /lava-3507554/environment/lava-350755=
4/bin/lava-test-runner /lava-3507554/1
    2023-04-18T12:48:51.258617  =

    2023-04-18T12:48:51.264869  / # /lava-3507554/bin/lava-test-runner /lav=
a-3507554/1
    2023-04-18T12:48:51.321980  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:48:51.322465  + cd /lava-3507554/1/tests/1_bootrr =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e955801941fd0332e8604

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e955801941fd0332e8609
        new failure (last pass: next-20230412)

    2023-04-18T13:04:13.714226  / # #
    2023-04-18T13:04:13.816492  export SHELL=3D/bin/sh
    2023-04-18T13:04:13.817250  #
    2023-04-18T13:04:13.918694  / # export SHELL=3D/bin/sh. /lava-3507793/e=
nvironment
    2023-04-18T13:04:13.919509  =

    2023-04-18T13:04:14.021513  / # . /lava-3507793/environment/lava-350779=
3/bin/lava-test-runner /lava-3507793/1
    2023-04-18T13:04:14.023038  =

    2023-04-18T13:04:14.026821  / # /lava-3507793/bin/lava-test-runner /lav=
a-3507793/1
    2023-04-18T13:04:14.088781  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T13:04:14.089321  + cd /lava-3507793/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e8ef62eb1cc70c62e862a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8ef62eb1cc7=
0c62e8631
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:36:46.015565  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-18T12:36:46.054966  kern  :alert : Data abort info:
    2023-04-18T12:36:46.055218  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-18T12:36:46.055441  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:36:46.055881  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D0000000009<8>[   16.467939] <LAVA_SIGNAL_TESTCASE TEST_CASE=
_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:36:46.056105  c41000
    2023-04-18T12:36:46.056312  kern  :alert : <8>[   16.477347] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 3507412_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8ef62eb1cc7=
0c62e8633
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:36:46.012205  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:36:46.012473  kern  :alert : Mem abort info:
    2023-04-18T12:36:46.012924  kern  :alert :   ESR =3D 0x000000<8>[   16.=
427033] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dli=
nes MEASUREMENT=3D12>
    2023-04-18T12:36:46.013151  0096000007
    2023-04-18T12:36:46.013368  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:36:46.013575  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:36:46.013777  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/643e90038db3c8d6332e860a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e90038db3c8d=
6332e8611
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:41:27.342075  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:41:27.381010  kern  :alert : Data abort info:
    2023-04-18T12:41:27.381303  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-18T12:41:27.381760  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:41:27.381988  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000001b9b9000
    2023-04-18T12:41:27.382202  kern  :alert : [00000000000<8>[   16.294266=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D2>
    2023-04-18T12:41:27.382412  00038] pgd=3D0800<8>[   16.303446] <LAVA_SI=
GNAL_ENDRUN 0_dmesg 3507471_1.5.2.4.1>
    2023-04-18T12:41:27.382622  00001b9bb003, p4d=3D080000001b9bb003, pud=
=3D080000001b9bc003, pmd=3D0000000000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e90038db3c8d=
6332e8612
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:41:27.338571  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:41:27.338929  kern  :alert : Mem abort info:
    2023-04-18T12:41:27.339193  kern  :alert :   ESR =3D 0x000<8>[   16.249=
842] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2023-04-18T12:41:27.339416  0000096000006
    2023-04-18T12:41:27.339633  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:41:27.339840  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:41:27.340041  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e8f9db9d427939b2e8612

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8f9db9d4279=
39b2e8619
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:39:30.569038  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:39:30.607960  kern  :alert : Data abort info:
    2023-04-18T12:39:30.608291  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-18T12:39:30.608770  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:39:30.608994  kern  :a<8>[   16.202129] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:39:30.609209  lert : user pgtable: 4<8>[   16.212208] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 3507440_1.5.2.4.1>
    2023-04-18T12:39:30.609416  k pages, 48-bit VAs, pgdp=3D0000000009f66000
    2023-04-18T12:39:30.609617  kern  :alert : [0000000000000038] pgd=3D080=
0000009e54003, p4d=3D0800000009e54003, pud=3D0800000009e53003, pmd=3D000000=
0000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8f9db9d4279=
39b2e861a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:39:30.565360  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:39:30.565702  kern  :alert : Mem abort info:
    2023-04-18T12:39:30.566043  kern  :alert :   ESR =3D 0x000<8>[   16.165=
823] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2023-04-18T12:39:30.566332  0000096000006
    2023-04-18T12:39:30.566582  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:39:30.566791  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:39:30.566994  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e910a0e3714b6e62e862c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e910a0e3714b=
6e62e8633
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:45:39.924596  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-18T12:45:39.963489  kern  :alert : Data abort info:
    2023-04-18T12:45:39.963754  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-18T12:45:39.964204  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:45:39.964429  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D00000000075c2000<8>[   16.479018] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:45:39.964663  kern  :a<8>[   16.485904] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3507557_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e910a0e3714b=
6e62e8634
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:45:39.920897  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:45:39.921186  kern  :alert : Mem abort info:
    2023-04-18T12:45:39.921450  kern  :alert :   ESR =3D 0x000<8>[   16.435=
706] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2023-04-18T12:45:39.921672  0000096000007
    2023-04-18T12:45:39.921890  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:45:39.922097  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:45:39.922300  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/643e94c7ccf72a10e52e8622

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-a=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-a=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e94c7ccf72a1=
0e52e8629
        new failure (last pass: next-20230412)
        2 lines

    2023-04-18T13:01:30.096297  kern  :alert : Data abort info:
    2023-04-18T13:01:30.134654  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-18T13:01:30.135138  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T13:01:30.135730  kern  :alert : u<8>[   19.706265] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D2>
    2023-04-18T13:01:30.136064  ser pgtable: 4k pages,<8>[   19.716457] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 3507797_1.5.2.4.1>
    2023-04-18T13:01:30.136376   48-bit VAs, pgdp=3D000000000c2f2000
    2023-04-18T13:01:30.136711  kern  :alert : [0000000000000038] pgd=3D080=
000000c2f3003, p4d=3D080000000c2f3003, pud=3D080000000c2fc003, pmd=3D000000=
0000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e94c7ccf72a1=
0e52e862a
        new failure (last pass: next-20230412)
        12 lines

    2023-04-18T13:01:30.092181  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T13:01:30.092691  kern  :alert : Mem abort info:
    2023-04-18T13:01:30.093074  kern  :alert :   ESR =3D 0x000<8>[   19.669=
352] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2023-04-18T13:01:30.093395  0000096000006
    2023-04-18T13:01:30.093705  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T13:01:30.094008  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T13:01:30.094313  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T13:01:30.094609  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e90a0bd4fa178cc2e85fa

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e90a0bd4fa17=
8cc2e8601
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:43:57.265198  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-18T12:43:57.270624  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:43:57.271112  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:43:57.276252  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:43:57.287445  kern  :alert :   FSC =3D 0x06: level 2 tran=
sla<8>[   15.619507] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfa=
il UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:43:57.287821  tion fault   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e90a0bd4fa17=
8cc2e8602
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:43:57.249071  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:43:57.260016  kern  :alert : Mem abort inf<8>[   15.59065=
1] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>
    2023-04-18T12:43:57.260363  o:   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/643e950713b4a3e5f62e8603

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e950713b4a3e=
5f62e860a
        new failure (last pass: next-20230412)
        2 lines

    2023-04-18T13:02:45.268305  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T13:02:45.268617  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T13:02:45.273836  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T13:02:45.279394  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T13:02:45.290346  kern  :alert : Data abor<8>[   19.203298] <=
LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASU=
REMENT=3D2>
    2023-04-18T13:02:45.290724  t info:   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e950713b4a3e=
5f62e860b
        new failure (last pass: next-20230412)
        12 lines

    2023-04-18T13:02:45.246153  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T13:02:45.251669  kern  :alert : Mem abort info:
    2023-04-18T13:02:45.262722  kern  :alert :   ESR =3D 0x000<8>[   19.174=
315] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2023-04-18T13:02:45.263048  0000096000006   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e8ef48c87c47f582e8646

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8ef48c87c47=
f582e864d
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:36:46.371668  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:36:46.410574  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:36:46.411058  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-18T12:36:46.411294  kern  :alert : Data abort info:
    2023-04-18T12:36:46.411513  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-18T12:36:46.411725  ke<8>[   16.050659] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:36:46.411934  rn  :alert<8>[   16.059440] <LAVA_SIGNAL_EN=
DRUN 0_dmesg 3507410_1.5.2.4.1>
    2023-04-18T12:36:46.412138   :   CM =3D 0, WnR =3D 0
    2023-04-18T12:36:46.412339  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D0000000020cb1a00   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8ef48c87c47=
f582e864e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/643e90018db3c8d6332e85ff

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e90018db3c8d=
6332e8606
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:41:22.734255  kern  :alert : Data abort info:
    2023-04-18T12:41:22.773261  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-18T12:41:22.773656  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:41:22.774128  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000007d747000
    2023-04-18T12:41:22.774358  kern  :alert : [000000000000003<8>[   16.10=
2971] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dline=
s MEASUREMENT=3D2>
    2023-04-18T12:41:22.774576  8] pgd=3D08000000<8>[   16.111923] <LAVA_SI=
GNAL_ENDRUN 0_dmesg 3507466_1.5.2.4.1>
    2023-04-18T12:41:22.774789  7d746003, p4d=3D080000007d746003, pud=3D080=
000007d745003, pmd=3D0000000000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e90018db3c8d=
6332e8607
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:41:22.730693  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:41:22.731102  kern  :alert : Mem abort info:
    2023-04-18T12:41:22.731372  kern  :alert :   ESR =3D 0x000<8>[   16.057=
409] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2023-04-18T12:41:22.731597  0000096000006
    2023-04-18T12:41:22.731816  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:41:22.732023  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:41:22.732226  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:41:22.732427  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e8f918494d6e14f2e862c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8f918494d6e=
14f2e8633
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:39:26.024014  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:39:26.062804  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:39:26.063312  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:39:26.063552  kern  :alert : Data abort info:
    2023-04-18T12:39:26.063803  k<8>[   16.047194] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:39:26.064019  ern  :alert :  <8>[   16.056711] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 3507447_1.5.2.4.1>
    2023-04-18T12:39:26.064226   ISV =3D 0, ISS =3D 0x00000006
    2023-04-18T12:39:26.064490  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:39:26.064725  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000007d950000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8f918494d6e=
14f2e8634
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:39:26.021845  kern  :alert : Mem abort inf<8>[   16.01751=
2] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>
    2023-04-18T12:39:26.022077  o:
    2023-04-18T12:39:26.022288  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-18T12:39:26.022495  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e90f30e3714b6e62e85f2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e90f30e3714b=
6e62e85f9
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:45:27.449882  kern  :alert : Data abort info:
    2023-04-18T12:45:27.488694  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-18T12:45:27.488949  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:45:27.489440  kern  :aler<8>[   15.922497] <LAVA_SIGNAL_T=
ESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:45:27.489702  t : user pgtab<8>[   15.932156] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 3507563_1.5.2.4.1>
    2023-04-18T12:45:27.489917  le: 64k pages, 48-bit VAs, pgdp=3D000000002=
0cb1600
    2023-04-18T12:45:27.490161  kern  :alert : [0000000000000038] pgd=3D080=
000002de60003, p4d=3D080000002de60003, pud=3D080000002de60003, pmd=3D080000=
002de70003, pte=3D0000000000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e90f30e3714b=
6e62e85fa
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:45:27.446032  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:45:27.446319  kern  :alert : Mem abort info:
    2023-04-18T12:45:27.446582  kern  :alert :   ESR =3D 0x00000<8>[   15.8=
86408] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlin=
es MEASUREMENT=3D12>
    2023-04-18T12:45:27.446840  00096000007
    2023-04-18T12:45:27.447098  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:45:27.447312  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:45:27.447516  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:45:27.447716  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/643e94b4478d995b742e862a

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e94b4478d995=
b742e8631
        new failure (last pass: next-20230412)
        2 lines

    2023-04-18T13:01:21.526582  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T13:01:21.565497  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T13:01:21.566125  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T13:01:21.566362  <8>[   19.508423] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T13:01:21.566581  kern  :alert : D<8>[   19.517270] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 3507809_1.5.2.4.1>
    2023-04-18T13:01:21.566798  ata abort info:
    2023-04-18T13:01:21.567003  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-18T13:01:21.567204  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T13:01:21.567403  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000007d927000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e94b4478d995=
b742e8632
        new failure (last pass: next-20230412)
        12 lines =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-13   | defc=
onfig+arm64-chromebook   | 7          =


  Details:     https://kernelci.org/test/plan/id/643e8eead751c810ac2e86ca

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-meson-gxl-s905x=
-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-meson-gxl-s905x=
-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e8eea=
d751c810ac2e86da
        new failure (last pass: next-20230412)

    2023-04-18T12:36:24.432256  /lava-3507370/1/../bin/lava-test-case
    2023-04-18T12:36:24.453367  <8>[   22.575463] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e8eea=
d751c810ac2e86ec
        new failure (last pass: next-20230412)

    2023-04-18T12:36:23.019506  /lava-3507370/1/../bin/lava-test-case
    2023-04-18T12:36:23.056520  <8>[   21.162642] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>
    2023-04-18T12:36:23.056781  /lava-3507370/1/../bin/lava-test-case   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e8eea=
d751c810ac2e86f0
        new failure (last pass: next-20230412)

    2023-04-18T12:36:21.914660  /lava-3507370/1/../bin/lava-test-case   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e8eea=
d751c810ac2e86f8
        new failure (last pass: next-20230412)

    2023-04-18T12:36:19.719293  <8>[   17.840464] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>
    2023-04-18T12:36:20.776778  /lava-3507370/1/../bin/lava-test-case
    2023-04-18T12:36:20.777379  <8>[   18.882157] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>
    2023-04-18T12:36:20.777627  /lava-3507370/1/../bin/lava-test-case
    2023-04-18T12:36:20.777852  <8>[   18.899960] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dscpi-cpufreq-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e8eead7=
51c810ac2e86f9
        new failure (last pass: next-20230412)

    2023-04-18T12:36:19.697198  /lava-3507370/1/../bin/lava-test-case   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8eead751c81=
0ac2e8701
        new failure (last pass: next-20230412)
        2 lines

    2023-04-18T12:36:17.994976  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:36:18.033961  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:36:18.034448  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:36:18.034687  kern  :alert : Data abort info:
    2023-04-18T12:36:18.034918  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-18T12:36:18.035139  k<8>[   16.146382] <LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:36:18.035358  ern  :alert :   <8>[   16.154572] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 3507370_1.5.2.4.1>
    2023-04-18T12:36:18.035579  CM =3D 0, WnR =3D 0
    2023-04-18T12:36:18.035832  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000000c3af000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8eead751c81=
0ac2e8702
        new failure (last pass: next-20230412)
        12 lines =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | clang-13   | defc=
onfig+arm64-chromebook   | 7          =


  Details:     https://kernelci.org/test/plan/id/643e8ea4bb5b2cc99b2e8607

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-meson-gxl-s905x-=
libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-meson-gxl-s905x-=
libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e8ea4=
bb5b2cc99b2e8617
        new failure (last pass: next-20230412)

    2023-04-18T12:35:32.387070  /lava-347109/1/../bin/lava-test-case
    2023-04-18T12:35:32.398555  <8>[   22.483728] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e8ea4=
bb5b2cc99b2e8629
        new failure (last pass: next-20230412)

    2023-04-18T12:35:30.994210  /lava-347109/1/../bin/lava-test-case
    2023-04-18T12:35:31.005857  <8>[   21.091355] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e8ea4=
bb5b2cc99b2e862d
        new failure (last pass: next-20230412)

    2023-04-18T12:35:29.881176  /lava-347109/1/../bin/lava-test-case
    2023-04-18T12:35:29.892504  <8>[   19.977572] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e8ea4=
bb5b2cc99b2e8635
        new failure (last pass: next-20230412)

    2023-04-18T12:35:28.693163  /lava-347109/1/../bin/lava-test-case
    2023-04-18T12:35:28.704649  <8>[   18.790640] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e8ea4bb=
5b2cc99b2e8636
        new failure (last pass: next-20230412)

    2023-04-18T12:35:27.666949  /lava-347109/1/../bin/lava-test-case
    2023-04-18T12:35:27.678344  <8>[   17.763446] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8ea4bb5b2cc=
99b2e863e
        new failure (last pass: next-20230412)
        2 lines

    2023-04-18T12:35:25.960843  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-18T12:35:25.966243  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:35:25.966702  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:35:25.971735  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:35:25.982870  kern  :alert :   FSC =3D 0x06: level 2 tra<=
8>[   16.063018] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail U=
NITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:35:25.983291  nslation fault   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8ea4bb5b2cc=
99b2e863f
        new failure (last pass: next-20230412)
        12 lines

    2023-04-18T12:35:25.944169  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:35:25.955320  kern  :alert : Mem abort inf<8>[   16.03546=
2] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>
    2023-04-18T12:35:25.955715  o:   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 7          =


  Details:     https://kernelci.org/test/plan/id/643e8f4ed6d80174702e8601

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e8f4e=
d6d80174702e8611
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:38:10.790329  /lava-3507395/1/../bin/lava-test-case
    2023-04-18T12:38:10.814242  <8>[   22.479026] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e8f4e=
d6d80174702e8623
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:38:09.389850  /lava-3507395/1/../bin/lava-test-case
    2023-04-18T12:38:09.410797  <8>[   21.074582] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e8f4e=
d6d80174702e8627
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:38:08.288089  /lava-3507395/1/../bin/lava-test-case
    2023-04-18T12:38:08.309017  <8>[   19.974261] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e8f4e=
d6d80174702e8634
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:38:06.095485  <8>[   17.759284] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>
    2023-04-18T12:38:07.125044  /lava-3507395/1/../bin/lava-test-case
    2023-04-18T12:38:07.128310  <8>[   18.796566] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e8f4ed6=
d80174702e8635
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:38:06.074449  /lava-3507395/1/../bin/lava-test-case   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8f4ed6d8017=
4702e8638
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:38:04.360557  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:38:04.399872  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:38:04.400354  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault<8>[   16.048137] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:38:04.400693  =

    2023-04-18T12:38:04.400977  kern  :ale<8>[   16.056060] <LAVA_SIGNAL_EN=
DRUN 0_dmesg 3507395_1.5.2.4.1>
    2023-04-18T12:38:04.401271  rt : Data abort info:
    2023-04-18T12:38:04.401506  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-18T12:38:04.401713  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:38:04.401943  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D000000002c750a00   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8f4ed6d8017=
4702e8639
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:38:04.358505  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:38:04.358737  kern  :alert : Mem abort inf<8>[   16.01876=
6] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>
    2023-04-18T12:38:04.358952  o:
    2023-04-18T12:38:04.359157  kern  :alert :   ESR =3D 0x0000000096000007
    2023-04-18T12:38:04.359359  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 7          =


  Details:     https://kernelci.org/test/plan/id/643e903b84284c162d2e8605

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e903b=
84284c162d2e8615
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:13.843320  /lava-3507485/1/../bin/lava-test-case
    2023-04-18T12:42:13.866317  <8>[   22.441467] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e903b=
84284c162d2e8624
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:12.435719  /lava-3507485/1/../bin/lava-test-case
    2023-04-18T12:42:12.473515  <8>[   21.033028] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>
    2023-04-18T12:42:12.473767  /lava-3507485/1/../bin/lava-test-case   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e903b=
84284c162d2e8628
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:11.335567  /lava-3507485/1/../bin/lava-test-case   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e903b=
84284c162d2e8630
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:10.159772  /lava-3507485/1/../bin/lava-test-case
    2023-04-18T12:42:10.218571  <8>[   18.757103] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>
    2023-04-18T12:42:10.218827  /lava-3507485/1/../bin/lava-test-case   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e903b84=
284c162d2e8631
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:09.148936  /lava-3507485/1/../bin/lava-test-case
    2023-04-18T12:42:09.152172  <8>[   17.730652] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e903b84284c1=
62d2e863c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:42:07.440645  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:42:07.479945  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:42:07.480196  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:42:07.480418  kern  <8>[   16.038443] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e903b84284c1=
62d2e863d
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:42:07.438552  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:42:07.438778  kern  :alert : Mem abort inf<8>[   16.00992=
3] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>
    2023-04-18T12:42:07.438998  o:
    2023-04-18T12:42:07.439205  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-18T12:42:07.439408  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 7          =


  Details:     https://kernelci.org/test/plan/id/643e8f300ae9cfc2c92e8634

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e8f30=
0ae9cfc2c92e8643
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:37:53.857355  /lava-347134/1/../bin/lava-test-case
    2023-04-18T12:37:53.869600  <8>[   22.498689] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e8f30=
0ae9cfc2c92e8655
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:37:52.443898  /lava-347134/1/../bin/lava-test-case
    2023-04-18T12:37:52.456213  <8>[   21.085274] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e8f30=
0ae9cfc2c92e8659
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:37:51.347921  /lava-347134/1/../bin/lava-test-case
    2023-04-18T12:37:51.360077  <8>[   19.989072] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e8f30=
0ae9cfc2c92e8662
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:37:50.164444  /lava-347134/1/../bin/lava-test-case
    2023-04-18T12:37:50.176496  <8>[   18.805821] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e8f300a=
e9cfc2c92e8663
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:37:49.123659  /lava-347134/1/../bin/lava-test-case
    2023-04-18T12:37:49.136543  <8>[   17.766188] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8f300ae9cfc=
2c92e866b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:37:47.406601  kern  :alert :   ESR =3D 0x0000000096000007
    2023-04-18T12:37:47.412199  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:37:47.412714  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:37:47.417515  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:37:47.423263  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8f300ae9cfc=
2c92e866c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:37:47.389839  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:37:47.401363  kern  :alert : Mem abort inf<8>[   16.02566=
0] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>
    2023-04-18T12:37:47.401834  o:   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | clang-17   | defc=
onfig                    | 7          =


  Details:     https://kernelci.org/test/plan/id/643e8ff8a2f602b5ba2e8631

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e8ff8=
a2f602b5ba2e8641
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:06.783532  /lava-347198/1/../bin/lava-test-case
    2023-04-18T12:41:06.795102  <8>[   22.441235] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e8ff8=
a2f602b5ba2e8653
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:05.391445  /lava-347198/1/../bin/lava-test-case
    2023-04-18T12:41:05.402776  <8>[   21.049019] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e8ff8=
a2f602b5ba2e8657
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:04.290670  /lava-347198/1/../bin/lava-test-case
    2023-04-18T12:41:04.302046  <8>[   19.948311] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e8ff8=
a2f602b5ba2e865f
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:03.091420  /lava-347198/1/../bin/lava-test-case
    2023-04-18T12:41:03.102742  <8>[   18.749096] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e8ff8a2=
f602b5ba2e8660
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:02.064349  /lava-347198/1/../bin/lava-test-case
    2023-04-18T12:41:02.075890  <8>[   17.722409] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8ff8a2f602b=
5ba2e8668
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:41:00.363626  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-18T12:41:00.369319  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:41:00.369717  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:41:00.374760  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:41:00.380264  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:41:00.380623  kern  :alert : Data abort info:
    2023-04-18T12:41:00.391329  kern  :alert :   ISV =3D 0, ISS =3D 0x0<8>[=
   16.034904] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNIT=
S=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:41:00.391650  0000006   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8ff8a2f602b=
5ba2e8669
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:41:00.347074  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:41:00.358208  kern  :alert : Mem abort inf<8>[   16.00013=
4] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>
    2023-04-18T12:41:00.358579  o:   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 7          =


  Details:     https://kernelci.org/test/plan/id/643e8fde71747155d52e85fa

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e8fde=
71747155d52e8607
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:41.743504  /lava-3507443/1/../bin/lava-test-case
    2023-04-18T12:40:41.820435  <8>[   22.445410] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>
    2023-04-18T12:40:41.820715  /lava-3507443/1/../bin/lava-test-case
    2023-04-18T12:40:41.820977  <8>[   22.463944] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Damlogic-canvas-driver-present RESULT=3Dpass>
    2023-04-18T12:40:41.821206  /lava-3507443/1/../bin/lava-test-case
    2023-04-18T12:40:41.821417  <8>[   22.487370] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dvideo-lut-probed RESULT=3Dpass>
    2023-04-18T12:40:41.821626  /lava-3507443/1/../bin/lava-test-case   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e8fde=
71747155d52e8619
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:40.342829  /lava-3507443/1/../bin/lava-test-case
    2023-04-18T12:40:40.358683  <8>[   21.043392] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e8fde=
71747155d52e861d
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:39.243880  /lava-3507443/1/../bin/lava-test-case
    2023-04-18T12:40:39.247177  <8>[   19.930969] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e8fde=
71747155d52e8627
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:38.096133  /lava-3507443/1/../bin/lava-test-case
    2023-04-18T12:40:38.096755  <8>[   18.759129] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>
    2023-04-18T12:40:38.096995  /lava-3507443/1/../bin/lava-test-case
    2023-04-18T12:40:38.097210  <8>[   18.776837] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dscpi-cpufreq-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e8fde71=
747155d52e8628
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:37.030667  /lava-3507443/1/../bin/lava-test-case
    2023-04-18T12:40:37.051356  <8>[   17.731560] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8fde7174715=
5d52e8631
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:40:35.329613  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:40:35.368325  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:40:35.368825  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:40:35.369062  kern  :alert<8>[   16.033121] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:40:35.369284   : Data abort info:
    2023-04-18T12:40:35.369534  <8>[   16.041991] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3507443_1.5.2.4.1>
    2023-04-18T12:40:35.369750  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-18T12:40:35.369959  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:40:35.370163  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000007b888000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8fde7174715=
5d52e8632
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:40:35.327392  kern  :alert : Mem abort inf<8>[   16.00322=
0] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>
    2023-04-18T12:40:35.327621  o:
    2023-04-18T12:40:35.327833  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-18T12:40:35.328043  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+arm64-chromebook   | 7          =


  Details:     https://kernelci.org/test/plan/id/643e90653620b62a4a2e8620

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-l=
ibretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-l=
ibretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e9065=
3620b62a4a2e8630
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:43:04.410014  /lava-3507496/1/../bin/lava-test-case
    2023-04-18T12:43:04.431897  <8>[   22.563826] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e9065=
3620b62a4a2e8642
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:43:02.993229  /lava-3507496/1/../bin/lava-test-case
    2023-04-18T12:43:03.014218  <8>[   21.146329] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e9065=
3620b62a4a2e8646
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:43:01.888711  /lava-3507496/1/../bin/lava-test-case
    2023-04-18T12:43:01.910777  <8>[   20.041306] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e9065=
3620b62a4a2e864c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:43:00.754615  /lava-3507496/1/../bin/lava-test-case
    2023-04-18T12:43:00.755325  <8>[   18.868644] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>
    2023-04-18T12:43:00.755646  /lava-3507496/1/../bin/lava-test-case
    2023-04-18T12:43:00.755944  <8>[   18.887356] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dscpi-cpufreq-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e906536=
20b62a4a2e864d
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:59.688008  /lava-3507496/1/../bin/lava-test-case
    2023-04-18T12:42:59.709916  <8>[   17.841235] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e90653620b62=
a4a2e8657
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:42:57.986127  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:42:58.024133  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:42:58.024727  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:42:58.025043  kern <8>[   16.140631] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:42:58.025348   :alert : Data <8>[   16.148128] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 3507496_1.5.2.4.1>
    2023-04-18T12:42:58.025641  abort info:
    2023-04-18T12:42:58.025942  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-18T12:42:58.026330  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:42:58.026843  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000007b4b5000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e90653620b62=
a4a2e8658
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 7          =


  Details:     https://kernelci.org/test/plan/id/643e916cd57b1e17dc2e85ec

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e916c=
d57b1e17dc2e85fc
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:47:18.601564  /lava-3507556/1/../bin/lava-test-case
    2023-04-18T12:47:18.602318  <8>[   22.467769] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>
    2023-04-18T12:47:18.602654  /lava-3507556/1/../bin/lava-test-case
    2023-04-18T12:47:18.602961  <8>[   22.485565] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Damlogic-canvas-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e916c=
d57b1e17dc2e860b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:47:17.151134  /lava-3507556/1/../bin/lava-test-case
    2023-04-18T12:47:17.229674  <8>[   21.056052] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>
    2023-04-18T12:47:17.229948  /lava-3507556/1/../bin/lava-test-case
    2023-04-18T12:47:17.230207  <8>[   21.073482] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dphy-meson-gxl-usb2-driver-present RESULT=3Dpass>
    2023-04-18T12:47:17.230425  /lava-3507556/1/../bin/lava-test-case
    2023-04-18T12:47:17.230632  <8>[   21.099736] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dusb2-phy-present RESULT=3Dpass>
    2023-04-18T12:47:17.230838  /lava-3507556/1/../bin/lava-test-case   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e916c=
d57b1e17dc2e860f
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:47:16.050365  /lava-3507556/1/../bin/lava-test-case
    2023-04-18T12:47:16.072221  <8>[   19.954705] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e916c=
d57b1e17dc2e8617
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:47:14.869622  /lava-3507556/1/../bin/lava-test-case
    2023-04-18T12:47:14.910257  <8>[   18.773244] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e916cd5=
7b1e17dc2e8618
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:47:13.840717  /lava-3507556/1/../bin/lava-test-case
    2023-04-18T12:47:13.862741  <8>[   17.746282] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e916cd57b1e1=
7dc2e8623
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:47:12.130319  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:47:12.169161  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:47:12.169643  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-18T12:47:12.169876  kern  :alert : Data abort info:
    2023-04-18T12:47:12.170093  kern  :al<8>[   16.039751] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:47:12.170307  ert :   <8>[   16.047113] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3507556_1.5.2.4.1>
    2023-04-18T12:47:12.170515  ISV =3D 0, ISS =3D 0x00000007
    2023-04-18T12:47:12.170717  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:47:12.170957  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D000000002c4e1200   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e916cd57b1e1=
7dc2e8624
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 7          =


  Details:     https://kernelci.org/test/plan/id/643e94c55b320bf6ac2e85f5

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e94c5=
5b320bf6ac2e8614
        new failure (last pass: next-20230412)

    2023-04-18T13:01:31.121203  /lava-3507796/1/../bin/lava-test-case
    2023-04-18T13:01:31.143455  <8>[   24.608351] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e94c5=
5b320bf6ac2e8618
        new failure (last pass: next-20230412)

    2023-04-18T13:01:30.021455  /lava-3507796/1/../bin/lava-test-case
    2023-04-18T13:01:30.043498  <8>[   23.508227] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e94c5=
5b320bf6ac2e861c
        new failure (last pass: next-20230412)

    2023-04-18T13:01:32.521006  /lava-3507796/1/../bin/lava-test-case
    2023-04-18T13:01:32.599047  <8>[   26.010174] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>
    2023-04-18T13:01:32.599414  /lava-3507796/1/../bin/lava-test-case
    2023-04-18T13:01:32.599677  <8>[   26.028754] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Damlogic-canvas-driver-present RESULT=3Dpass>
    2023-04-18T13:01:32.599899  /lava-3507796/1/../bin/lava-test-case
    2023-04-18T13:01:32.600109  <8>[   26.052197] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dvideo-lut-probed RESULT=3Dpass>
    2023-04-18T13:01:32.600316  /lava-3507796/1/../bin/lava-test-case   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e94c5=
5b320bf6ac2e8622
        new failure (last pass: next-20230412)

    2023-04-18T13:01:28.883453  /lava-3507796/1/../bin/lava-test-case
    2023-04-18T13:01:28.884062  <8>[   22.331549] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>
    2023-04-18T13:01:28.884296  /lava-3507796/1/../bin/lava-test-case
    2023-04-18T13:01:28.884528  <8>[   22.350029] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dscpi-cpufreq-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e94c55b=
320bf6ac2e8623
        new failure (last pass: next-20230412)

    2023-04-18T13:01:27.807995  /lava-3507796/1/../bin/lava-test-case
    2023-04-18T13:01:27.823895  <8>[   21.294134] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e94c55b320bf=
6ac2e862c
        new failure (last pass: next-20230412)
        2 lines

    2023-04-18T13:01:26.106761  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T13:01:26.144511  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T13:01:26.145276  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T13:01:26.145612  kern  :<8>[   19.594972] <LAVA_SIGNAL_TESTC=
ASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T13:01:26.145932  alert : Data abort in<8>[   19.603142] <LAV=
A_SIGNAL_ENDRUN 0_dmesg 3507796_1.5.2.4.1>
    2023-04-18T13:01:26.146247  fo:
    2023-04-18T13:01:26.146554  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-18T13:01:26.146910  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T13:01:26.147228  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000004281000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e94c55b320bf=
6ac2e862d
        new failure (last pass: next-20230412)
        12 lines =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 7          =


  Details:     https://kernelci.org/test/plan/id/643e8fbd882960da902e864d

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e8fbd=
882960da902e865d
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:05.713182  /lava-347156/1/../bin/lava-test-case
    2023-04-18T12:40:05.713767  <8>[   22.389408] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>
    2023-04-18T12:40:05.714165  /lava-347156/1/../bin/lava-test-case   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e8fbd=
882960da902e866f
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:04.016527  /lava-347156/1/../bin/lava-test-case
    2023-04-18T12:40:04.028037  <8>[   20.996515] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e8fbd=
882960da902e8673
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:02.913091  /lava-347156/1/../bin/lava-test-case
    2023-04-18T12:40:02.924343  <8>[   19.892933] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e8fbd=
882960da902e867b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:01.727867  /lava-347156/1/../bin/lava-test-case
    2023-04-18T12:40:01.739230  <8>[   18.707712] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e8fbd88=
2960da902e867c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:00.688365  /lava-347156/1/../bin/lava-test-case
    2023-04-18T12:40:00.699816  <8>[   17.669476] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8fbd882960d=
a902e8684
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:39:58.990437  o:
    2023-04-18T12:39:58.990817  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-18T12:39:58.996062  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:39:59.001747  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:39:59.002125  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:39:59.007172  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:39:59.012653  kern  :alert : Data abort info:
    2023-04-18T12:39:59.023628  kern  :alert :   ISV =3D 0, ISS =3D 0x000<8=
>[   15.983976] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UN=
ITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:39:59.024118  00006   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8fbd882960d=
a902e8685
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:39:58.975956  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:39:58.984998  kern  :alert : Mem abort inf<8>[   15.94970=
6] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+arm64-chromebook   | 7          =


  Details:     https://kernelci.org/test/plan/id/643e9048190ce8a7712e85fe

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-meson-gxl-s905x-li=
bretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-meson-gxl-s905x-li=
bretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e9048=
190ce8a7712e860e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:26.763498  /lava-347211/1/../bin/lava-test-case
    2023-04-18T12:42:26.774765  <8>[   22.460071] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e9048=
190ce8a7712e861a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:25.354840  /lava-347211/1/../bin/lava-test-case
    2023-04-18T12:42:25.366076  <8>[   21.052442] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e9048=
190ce8a7712e861e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:24.254794  /lava-347211/1/../bin/lava-test-case
    2023-04-18T12:42:24.266200  <8>[   19.951517] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e9048=
190ce8a7712e8627
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:23.082102  /lava-347211/1/../bin/lava-test-case
    2023-04-18T12:42:23.093488  <8>[   18.779075] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e904819=
0ce8a7712e8628
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:22.045441  /lava-347211/1/../bin/lava-test-case
    2023-04-18T12:42:22.056700  <8>[   17.742350] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e9048190ce8a=
7712e8635
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:42:20.352403  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-18T12:42:20.357582  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:42:20.357903  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:42:20.363086  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:42:20.368985  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:42:20.369303  kern  :alert : Data abort info:
    2023-04-18T12:42:20.379688  kern  :alert :   ISV =3D 0, ISS =3D 0x00<8>=
[   16.060342] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNI=
TS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:42:20.380014  000006   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e9048190ce8a=
7712e8636
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:42:20.335800  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:42:20.346583  kern  :alert : Mem abort inf<8>[   16.02652=
6] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>
    2023-04-18T12:42:20.346906  o:   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 7          =


  Details:     https://kernelci.org/test/plan/id/643e9125cdc60730982e8663

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e9125=
cdc60730982e8673
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:46:09.401341  /lava-347267/1/../bin/lava-test-case
    2023-04-18T12:46:09.413500  <8>[   22.540250] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e9125=
cdc60730982e8685
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:46:07.987087  /lava-347267/1/../bin/lava-test-case
    2023-04-18T12:46:07.998880  <8>[   21.125749] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e9125=
cdc60730982e8689
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:46:06.895539  /lava-347267/1/../bin/lava-test-case
    2023-04-18T12:46:06.907558  <8>[   20.034492] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e9125=
cdc60730982e8691
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:46:05.718284  /lava-347267/1/../bin/lava-test-case
    2023-04-18T12:46:05.730255  <8>[   18.857270] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e9125cd=
c60730982e8698
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:46:04.690885  /lava-347267/1/../bin/lava-test-case
    2023-04-18T12:46:04.702641  <8>[   17.829541] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e9125cdc6073=
0982e869a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:46:02.980321  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:46:02.980935  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:46:02.985473  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T12:46:02.991473  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-18T12:46:02.991946  kern  :alert : Data abort info:
    2023-04-18T12:46:03.002281  kern  :alert :   ISV =3D 0<8>[   16.125218]=
 <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEA=
SUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e9125cdc6073=
0982e869b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:46:02.958151  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:46:02.963660  kern  :alert : Mem abort info:
    2023-04-18T12:46:02.974420  kern  :alert :   ESR =3D 0x000<8>[   16.092=
432] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2023-04-18T12:46:02.974808  0000096000007   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 7          =


  Details:     https://kernelci.org/test/plan/id/643e94d3d3753616d32e8601

  Results:     45 PASS, 9 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.lima-probed: https://kernelci.org/test/case/id/643e94d3=
d3753616d32e8611
        new failure (last pass: next-20230412)

    2023-04-18T13:02:02.614282  /lava-347503/1/../bin/lava-test-case
    2023-04-18T13:02:02.625251  <8>[   25.973769] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlima-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc2-probed: https://kernelci.org/test/case/id/643e94d3=
d3753616d32e8620
        new failure (last pass: next-20230412)

    2023-04-18T13:02:01.210762  /lava-347503/1/../bin/lava-test-case
    2023-04-18T13:02:01.222196  <8>[   24.570365] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.xhci-probed: https://kernelci.org/test/case/id/643e94d3=
d3753616d32e8624
        new failure (last pass: next-20230412)

    2023-04-18T13:02:00.098654  /lava-347503/1/../bin/lava-test-case
    2023-04-18T13:02:00.110021  <8>[   23.458207] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dxhci-probed RESULT=3Dfail>   =


  * baseline.bootrr.emmc-probed: https://kernelci.org/test/case/id/643e94d3=
d3753616d32e862c
        new failure (last pass: next-20230412)

    2023-04-18T13:01:58.917864  /lava-347503/1/../bin/lava-test-case
    2023-04-18T13:01:58.929262  <8>[   22.277670] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demmc-probed RESULT=3Dfail>   =


  * baseline.bootrr.sd-probed: https://kernelci.org/test/case/id/643e94d3d3=
753616d32e862d
        new failure (last pass: next-20230412)

    2023-04-18T13:01:57.879983  /lava-347503/1/../bin/lava-test-case
    2023-04-18T13:01:57.891998  <8>[   21.240555] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsd-probed RESULT=3Dfail>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e94d3d375361=
6d32e8638
        new failure (last pass: next-20230412)
        2 lines

    2023-04-18T13:01:56.182429  o:
    2023-04-18T13:01:56.182817  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-18T13:01:56.187755  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T13:01:56.193476  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T13:01:56.193863  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T13:01:56.204550  kern  :alert :   FSC =3D 0x06: level 2 <8>[=
   19.549824] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNIT=
S=3Dlines MEASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e94d3d375361=
6d32e8639
        new failure (last pass: next-20230412)
        12 lines

    2023-04-18T13:01:56.168035  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T13:01:56.177068  kern  :alert : Mem abort inf<8>[   19.52269=
2] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e8f376ee999f70d2e85fc

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8f376ee999f=
70d2e8603
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:37:51.376646  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-18T12:37:51.415553  kern  :alert : Data abort info:
    2023-04-18T12:37:51.415807  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-18T12:37:51.416258  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:37:51.416498  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D0000000020fc0e00
    2023-04-18T12:37:51.416715  kern  :alert : [0000000000000038] pgd=3D080=
000002ed90003, p4d=3D080000002ed90003, pud=3D080000002ed90003, pmd=3D080000=
002e440003, pte=3D0000000000000000
    2023-04-18T12:37:51.416926  kern  :emerg : Internal erro<8>[   16.17398=
8] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D2>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8f376ee999f=
70d2e8604
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:37:51.372974  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:37:51.373230  kern  :alert : Mem abort info:
    2023-04-18T12:37:51.373495  kern  :alert :   ESR =3D 0x000<8>[   16.118=
201] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2023-04-18T12:37:51.373720  0000096000007
    2023-04-18T12:37:51.373937  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:37:51.374141  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:37:51.374381  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/643e901b0231938eca2e85ea

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e901b0231938=
eca2e85f1
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:41:36.986174  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:41:37.025172  kern  :alert : Data abort info:
    2023-04-18T12:41:37.025432  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-18T12:41:37.025886  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:41:37.026116  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000bd583000
    2023-04-18T12:41:37.026333  kern  :alert : [0<8>[   16.125116] <LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D2>
    2023-04-18T12:41:37.026582  000000000000038] pgd=3D08000000bd584003, p4=
d=3D08000000bd<8>[   16.138309] <LAVA_SIGNAL_ENDRUN 0_dmesg 3507473_1.5.2.4=
.1>
    2023-04-18T12:41:37.026807  584003, pud=3D08000000bd585003, pmd=3D00000=
00000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e901b0231938=
eca2e85f2
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:41:36.982608  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:41:36.982875  kern  :alert : Mem abort info:
    2023-04-18T12:41:36.983101  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-18T12:41:36.983359  kern  :alert :   <8>[   16.084465] <LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D12>
    2023-04-18T12:41:36.983578  EC =3D 0x25: DABT (current EL), IL =3D 32 b=
its
    2023-04-18T12:41:36.983787  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:41:36.983992  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e8f9f5060b8b2e22e85f2

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8f9f5060b8b=
2e22e85f9
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:39:38.819013  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2023-04-18T12:39:38.857916  kern  :alert : Data abort info:
    2023-04-18T12:39:38.858169  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-04-18T12:39:38.858618  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:39:38.858844  kern  :alert : user pgtable: 4k pages, 48-b=
<8>[   16.031535] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail =
UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:39:38.859061  it VAs, pgdp=3D0000000007563000
    2023-04-18T12:39:38.859266  kern  <8>[   16.042691] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 3507445_1.5.2.4.1>
    2023-04-18T12:39:38.859470  :alert : [0000000000000038] pgd=3D080000000=
9dbc003, p4d=3D0800000009dbc003, pud=3D0800000009dbf003, pmd=3D000000000000=
0000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8f9f5060b8b=
2e22e85fa
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:39:38.815123  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:39:38.815602  kern  :alert : Mem abort info:
    2023-04-18T12:39:38.815869  kern  :alert :   ESR =3D 0x000<8>[   15.991=
913] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2023-04-18T12:39:38.816095  0000096000006
    2023-04-18T12:39:38.816314  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:39:38.816540  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:39:38.816749  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e9107683b38e6d32e85f6

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e9107683b38e=
6d32e85fd
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:45:39.212720  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2023-04-18T12:45:39.212975  kern  :alert : Data abort info:
    2023-04-18T12:45:39.251657  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007
    2023-04-18T12:45:39.252162  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T12:45:39.252393  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D0000000020fc0800
    2023-04-18T12:45:39.252629  kern  :alert : [0000000000000038] pgd=3D080=
000002e840003, p4d=3D080<8>[   16.070175] <LAVA_SIGNAL_TESTCASE TEST_CASE_I=
D=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2023-04-18T12:45:39.252884  000002e840003,<8>[   16.079587] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 3507552_1.5.2.4.1>
    2023-04-18T12:45:39.253106   pud=3D080000002e840003, pmd=3D080000002e36=
0003   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e9107683b38e=
6d32e85fe
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:45:39.209179  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T12:45:39.209473  kern  :alert : Mem abort info:
    2023-04-18T12:45:39.209739  kern  :alert :   ESR =3D 0x000<8>[   16.022=
813] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2023-04-18T12:45:39.209965  0000096000007
    2023-04-18T12:45:39.210183  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T12:45:39.210390  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T12:45:39.210592  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/643e949a2516f88e9b2e8602

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e949a2516f88=
e9b2e8609
        new failure (last pass: next-20230412)
        2 lines

    2023-04-18T13:01:05.885465  kern  :alert : Data abort info:
    2023-04-18T13:01:05.924551  kern  :alert :   ISV =3D 0, I<8>[   19.6231=
74] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D2>
    2023-04-18T13:01:05.924883  SS =3D 0x00000006
    2023-04-18T13:01:05.925149  kern  <8>[   19.633627] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 3507803_1.5.2.4.1>
    2023-04-18T13:01:05.925372  :alert :   CM =3D 0, WnR =3D 0
    2023-04-18T13:01:05.925584  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000bd35a000
    2023-04-18T13:01:05.925791  kern  :alert : [0000000000000038] pgd=3D080=
00000bd35b003, p4d=3D08000000bd35b003, pud=3D08000000bd35c003, pmd=3D000000=
0000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e949a2516f88=
e9b2e860a
        new failure (last pass: next-20230412)
        12 lines

    2023-04-18T13:01:05.881656  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000038
    2023-04-18T13:01:05.882244  kern  :alert : Mem abort inf<8>[   19.59141=
4] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D12>
    2023-04-18T13:01:05.882483  o:
    2023-04-18T13:01:05.882715  kern  :alert :   ESR =3D 0x0000000096000006
    2023-04-18T13:01:05.882971  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-04-18T13:01:05.883277  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-04-18T13:01:05.883545  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-04-18T13:01:05.883755  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ec99abc686caa2e862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ec99abc686caa2e8634
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:36:19.561860  / # #
    2023-04-18T12:36:19.663145  export SHELL=3D/bin/sh
    2023-04-18T12:36:19.663411  #
    2023-04-18T12:36:19.764561  / # export SHELL=3D/bin/sh. /lava-3507399/e=
nvironment
    2023-04-18T12:36:19.765006  =

    2023-04-18T12:36:19.866329  / # . /lava-3507399/environment/lava-350739=
9/bin/lava-test-runner /lava-3507399/1
    2023-04-18T12:36:19.867031  =

    2023-04-18T12:36:19.874933  / # /lava-3507399/bin/lava-test-runner /lav=
a-3507399/1
    2023-04-18T12:36:19.935593  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:36:19.935880  + cd /lava-3507399/1/tests/1_bootrr =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-17   | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fcc8738f2fcd52e85f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8fcc8738f2fcd52e85f9
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:38.169977  / # #
    2023-04-18T12:40:38.271728  export SHELL=3D/bin/sh
    2023-04-18T12:40:38.272147  #
    2023-04-18T12:40:38.373483  / # export SHELL=3D/bin/sh. /lava-3507469/e=
nvironment
    2023-04-18T12:40:38.373897  =

    2023-04-18T12:40:38.475307  / # . /lava-3507469/environment/lava-350746=
9/bin/lava-test-runner /lava-3507469/1
    2023-04-18T12:40:38.475929  =

    2023-04-18T12:40:38.483624  / # /lava-3507469/bin/lava-test-runner /lav=
a-3507469/1
    2023-04-18T12:40:38.547564  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:40:38.547837  + cd /lava-3507469/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90e4cf5e0a31322e861d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e90e4cf5e0a31322e8622
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:45:06.444486  / # #
    2023-04-18T12:45:06.546345  export SHELL=3D/bin/sh
    2023-04-18T12:45:06.546847  #
    2023-04-18T12:45:06.648260  / # export SHELL=3D/bin/sh. /lava-3507553/e=
nvironment
    2023-04-18T12:45:06.648729  =

    2023-04-18T12:45:06.750070  / # . /lava-3507553/environment/lava-350755=
3/bin/lava-test-runner /lava-3507553/1
    2023-04-18T12:45:06.750802  =

    2023-04-18T12:45:06.754991  / # /lava-3507553/bin/lava-test-runner /lav=
a-3507553/1
    2023-04-18T12:45:06.818608  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:45:06.818920  + cd /lava-3507553/1/tests/1_bootrr =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9316d999c1a8242e8627

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e9316d999c1a8242e862a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:54:24.011223  / # #
    2023-04-18T12:54:24.113163  export SHELL=3D/bin/sh
    2023-04-18T12:54:24.113657  #
    2023-04-18T12:54:24.215064  / # export SHELL=3D/bin/sh. /lava-3507696/e=
nvironment
    2023-04-18T12:54:24.215547  =

    2023-04-18T12:54:24.316917  / # . /lava-3507696/environment/lava-350769=
6/bin/lava-test-runner /lava-3507696/1
    2023-04-18T12:54:24.317688  =

    2023-04-18T12:54:24.324674  / # /lava-3507696/bin/lava-test-runner /lav=
a-3507696/1
    2023-04-18T12:54:24.382527  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:54:24.382756  + cd /lava-3507696/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e949260be97fae82e85f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e949260be97fae82e85fc
        new failure (last pass: next-20230412)

    2023-04-18T13:00:47.945082  <8>[   18.897676] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3507799_1.5.2.4.1>
    2023-04-18T13:00:48.049075  / # #
    2023-04-18T13:00:48.150731  export SHELL=3D/bin/sh
    2023-04-18T13:00:48.151159  #
    2023-04-18T13:00:48.252521  / # export SHELL=3D/bin/sh. /lava-3507799/e=
nvironment
    2023-04-18T13:00:48.253015  =

    2023-04-18T13:00:48.354459  / # . /lava-3507799/environment/lava-350779=
9/bin/lava-test-runner /lava-3507799/1
    2023-04-18T13:00:48.355036  =

    2023-04-18T13:00:48.360631  / # /lava-3507799/bin/lava-test-runner /lav=
a-3507799/1
    2023-04-18T13:00:48.425621  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson8b-odroidc1             | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93c4674104389c2e8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93c4674104389c2e8=
633
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson8b-odroidc1             | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91b81fc3d6f24c2e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91b81fc3d6f24c2e8=
60b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson8b-odroidc1             | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e94ea261d2834962e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-me=
son8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-me=
son8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e94ea261d2834962e8=
606
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8faf3180fc89b12e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8faf3180fc89b12e8=
60a
        new failure (last pass: next-20230404) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9128b45b66d2e62e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9128b45b66d2e62e8=
5f2
        failing since 18 days (last pass: next-20230324, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93beb441f0533b2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93beb441f0533b2e8=
5e7
        failing since 84 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f968494d6e14f2e863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f968494d6e14f2e8=
63b
        new failure (last pass: next-20230404) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9126b49fb1bc452e860b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9126b49fb1bc452e8=
60c
        failing since 18 days (last pass: next-20230324, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93f9b703fdaf192e861a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93f9b703fdaf192e8=
61b
        failing since 69 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8faf895b98236f2e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8faf895b98236f2e8=
5f6
        new failure (last pass: next-20230404) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643e913fb45b66d2e62e8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e913fb45b66d2e62e8=
653
        failing since 3 days (last pass: next-20230411, first fail: v6.3-rc=
6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93f8b703fdaf192e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93f8b703fdaf192e8=
618
        failing since 69 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e95276c590068f92e8abb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e95276c590068f92e8=
abc
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10     | exyn=
os_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f736db105c3c62e8625

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f736db105c3c62e8=
626
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90b2d557308d8a2e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-odroid-xu3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-odroid-xu3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90b2d557308d8a2e8=
5f2
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91de38f4edffc62e8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91de38f4edffc62e8=
631
        failing since 3 days (last pass: next-20230411, first fail: v6.3-rc=
6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e949b6b2650dc5e2e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e949b6b2650dc5e2e8=
60e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e95b3ba33262af02e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e95b3ba33262af02e8=
5f4
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e939668be4148f72e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e939668be4148f72e8=
5e9
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9385176aaaea872e87eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9385176aaaea872e8=
7ec
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90dc0a524be4172e8600

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90dc0a524be4172e8=
601
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e920ea82b5455432e8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e920ea82b5455432e8=
63a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643e933216029f33d02e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e933216029f33d02e8=
5fe
        failing since 217 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9599a18aea816a2e8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9599a18aea816a2e8=
653
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e909fd804d87e092e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e909fd804d87e092e8=
5e8
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e918cd05da27f202e8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e918cd05da27f202e8=
634
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643e92a655669e4e652e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e92a655669e4e652e8=
619
        failing since 217 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e953a31a483d3e72e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e953a31a483d3e72e8=
60b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e939564dfffaf622e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e939564dfffaf622e8=
5e9
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9384c2d8c028ef2e865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9384c2d8c028ef2e8=
65b
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90dedc309cd6b62e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90dedc309cd6b62e8=
5fb
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e920b310f7f6dd92e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e920b310f7f6dd92e8=
605
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9336bb1fc5de462e8607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9336bb1fc5de462e8=
608
        failing since 215 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9595a18aea816a2e864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9595a18aea816a2e8=
64c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90a0d1679371b22e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90a0d1679371b22e8=
600
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9179249065946b2e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9179249065946b2e8=
602
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643e92d0967803950d2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e92d0967803950d2e8=
5f8
        failing since 215 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9515bcc42edfbc2e861e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9515bcc42edfbc2e8=
61f
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93dc1653d89bcb2e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93dc1653d89bcb2e8=
619
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9387c2d8c028ef2e885f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9387c2d8c028ef2e8=
860
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90efeaab034b0f2e8607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90efeaab034b0f2e8=
608
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e920c310f7f6dd92e860a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e920c310f7f6dd92e8=
60b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643e933416029f33d02e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e933416029f33d02e8=
603
        failing since 215 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e959c70ebea990c2e8616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e959c70ebea990c2e8=
617
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e909d3ffac3bcb22e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e909e3ffac3bcb22e8=
5f7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e917bd57b1e17dc2e863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e917bd57b1e17dc2e8=
63b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643e92bce22d51eec82e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e92bce22d51eec82e8=
5ed
        failing since 215 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e953b31a483d3e72e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e953b31a483d3e72e8=
60e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93a968be4148f72e8600

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93a968be4148f72e8=
601
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9397022d7a851b2e8600

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9397022d7a851b2e8=
601
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90da7b1cb8c6e02e8699

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90da7b1cb8c6e02e8=
69a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e920f276768a0822e8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e920f276768a0822e8=
648
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643e930bd999c1a8242e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e930bd999c1a8242e8=
5fc
        failing since 217 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e959761699bb59a2e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e959761699bb59a2e8=
5ff
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90880baaab1adb2e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90880baaab1adb2e8=
610
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91a15f8608ab352e860b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91a15f8608ab352e8=
60c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/643e927e4e0b5b4a762e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e927e4e0b5b4a762e8=
5ef
        failing since 217 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e953931a483d3e72e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e953931a483d3e72e8=
605
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386                    | i386   | lab-baylibre    | clang-17   | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/643e92bae22d51eec82e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e92bae22d51eec82e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386                    | i386   | lab-collabora   | clang-17   | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/643e92903df1cf9fd72e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e92903df1cf9fd72e8=
5f6
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386                    | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fd973b1a0b7d32e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8fd973b1a0b7d32e8=
606
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386                    | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/643e915593d04072672e8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e915593d04072672e8=
651
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386                    | i386   | lab-collabora   | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fe953ec843b972e862a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8fe953ec843b972e8=
62b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386                    | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91169439ab20162e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91169439ab20162e8=
600
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | clang-17   | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9309d999c1a8242e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/clang-17/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9309d999c1a8242e8=
5f9
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | clang-17   | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/643e92922c257cf0ec2e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/clang-17/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e92922c257cf0ec2e8=
5fb
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fd891e0f8f7b02e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8fd891e0f8f7b02e8=
5f1
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91531e8fa9f5632e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91531e8fa9f5632e8=
5fb
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fd48738f2fcd52e8621

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8fd48738f2fcd52e8=
622
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9114b49fb1bc452e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9114b49fb1bc452e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8a5d82b17562b72e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8a5d82b17562b72e8=
5f2
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643ec0859a9e9c4e282e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ec0859a9e9c4e282e8=
5e9
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8a0ccdf3493ef92e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8a0ccdf3493ef92e8=
5eb
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | clang-17   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e95186a238ee78c2e8600

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e95186a238ee78c2e8=
601
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | clang-17   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e94865fb94bb6d72e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e94865fb94bb6d72e8=
5f3
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ecf13f6fedafb2e8629

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8ecf13f6fedafb2e8=
62a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ee5d751c810ac2e86a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8ee5d751c810ac2e8=
6aa
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f6086096a37532e86b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f6086096a37532e8=
6b1
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f888494d6e14f2e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f888494d6e14f2e8=
5f3
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fb695fab8d70f2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8fb695fab8d70f2e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9052190ce8a7712e863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9052190ce8a7712e8=
63d
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9121cdc60730982e8655

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9121cdc60730982e8=
656
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93d5842210df9e2e8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93d5842210df9e2e8=
661
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8e95bb5b2cc99b2e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8e95bb5b2cc99b2e8=
5fc
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ed14198a9d03a2e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8ed14198a9d03a2e8=
5f6
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f370ae9cfc2c92e869f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f370ae9cfc2c92e8=
6a0
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f5e86096a37532e86a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f5e86096a37532e8=
6a4
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fae47a90f3f5d2e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8fae47a90f3f5d2e8=
5ee
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fea91e0f8f7b02e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8fea91e0f8f7b02e8=
60a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e908a0463fb1ccd2e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e908a0463fb1ccd2e8=
5f5
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e936316ad9b62f82e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e936316ad9b62f82e8=
5fd
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91a2785ff945ab2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91a2785ff945ab2e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9219a6c4e445932e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9219a6c4e445932e8=
5f2
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93d7e60b7601582e861b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93d7e60b7601582e8=
61c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91179439ab20162e8602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91179439ab20162e8=
603
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91c82f68fd23ff2e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91c82f68fd23ff2e8=
5ec
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/643e936ddecc8f1f2a2e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-collabora/baseline-qemu_x86=
_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-collabora/baseline-qemu_x86=
_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e936ddecc8f1f2a2e8=
609
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8a5cc9bec9c5aa2e861b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8a5cc9bec9c5aa2e8=
61c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643ec070f2231ccfdb2e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ec070f2231ccfdb2e8=
5f2
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e89f9ac4f3197fe2e8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e89f9ac4f3197fe2e8=
651
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-17   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e951a6a238ee78c2e8604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e951a6a238ee78c2e8=
605
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-17   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e94c2ccf72a10e52e860d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e94c2ccf72a10e52e8=
60e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ed19499c03bf52e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8ed19499c03bf52e8=
606
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8efc0512e5c9772e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8efc0512e5c9772e8=
619
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f5fcd971eb1852e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f5fcd971eb1852e8=
618
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f8c8494d6e14f2e8608

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f8c8494d6e14f2e8=
609
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fdc8738f2fcd52e8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8fdc8738f2fcd52e8=
632
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/643e902565d9c599972e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e902565d9c599972e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e911fcdc60730982e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e911fcdc60730982e8=
5ed
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93c1b441f0533b2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93c1b441f0533b2e8=
5f8
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8e96543ff508b02e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8e96543ff508b02e8=
5fc
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ed09499c03bf52e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8ed09499c03bf52e8=
600
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f366ee999f70d2e85f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f366ee999f70d2e8=
5f7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f5f06ef7bd2822e85e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f5f06ef7bd2822e8=
5e9
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fac3180fc89b12e8603

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8fac3180fc89b12e8=
604
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fe80692a399bf2e8615

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8fe80692a399bf2e8=
616
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9078777a72c8af2e863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9078777a72c8af2e8=
640
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9361decc8f1f2a2e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9361decc8f1f2a2e8=
5ed
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91a4d7db67e2532e85e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91a4d7db67e2532e8=
5e8
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e921b276768a0822e8671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e921b276768a0822e8=
672
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93dbb0005c7fa82e85f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93dbb0005c7fa82e8=
5f9
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/643e913cb45b66d2e62e864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e913cb45b66d2e62e8=
64d
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91ca5aed5acdb92e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91ca5aed5acdb92e8=
5fc
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9382f8b66e5dd52e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-collabora/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-collabora/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9382f8b66e5dd52e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8a5bf287b961552e8668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8a5bf287b961552e8=
669
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643ec05c8f515437392e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ec05c8f515437392e8=
600
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e89e4274244d3972e8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e89e4274244d3972e8=
635
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-17   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e94e1261d2834962e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e94e1261d2834962e8=
5fa
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-17   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e947129259dad612e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/clang-17/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e947129259dad612e8=
602
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ed39499c03bf52e8613

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8ed39499c03bf52e8=
614
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ee76ae38dd9222e85f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8ee76ae38dd9222e8=
5f5
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f4cd6d80174702e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f4cd6d80174702e8=
5ff
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f8a8494d6e14f2e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f8a8494d6e14f2e8=
5f6
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fb886bd46f2132e85f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8fb886bd46f2132e8=
5f1
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90140231938eca2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90140231938eca2e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e911dcdc60730982e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e911dcdc60730982e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93c3b441f0533b2e85fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93c3b441f0533b2e8=
5fb
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ea85bc74638f02e8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8ea85bc74638f02e8=
631
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8ed39499c03bf52e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8ed39499c03bf52e8=
618
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f3536fd0639892e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f3536fd0639892e8=
5ef
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f4a2e76fe469b2e85f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f4a2e76fe469b2e8=
5f3
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f998494d6e14f2e864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f998494d6e14f2e8=
64d
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8faf47a90f3f5d2e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8faf47a90f3f5d2e8=
5f4
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9077777a72c8af2e863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9077777a72c8af2e8=
63d
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9362decc8f1f2a2e85fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9362decc8f1f2a2e8=
5fc
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/643e916e249065946b2e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-=
mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-=
mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e916e249065946b2e8=
5fd
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9259fdfea10c782e8624

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9259fdfea10c782e8=
625
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93d9842210df9e2e866a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93d9842210df9e2e8=
66b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig+rust        | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9102683b38e6d32e85ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi=
-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi=
-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9102683b38e6d32e8=
5ef
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91cb2f68fd23ff2e85f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91cb2f68fd23ff2e8=
5f6
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9386f8b66e5dd52e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9386f8b66e5dd52e8=
5ed
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10     | shmo=
bile_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8d3c3410f4abb92e8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8d3c3410f4abb92e8=
641
        failing since 3 days (last pass: next-20230411, first fail: v6.3-rc=
6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643eaa1f74ddbe07f02e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eaa1f74ddbe07f02e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643eab9aa8b3164e122e8616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eab9aa8b3164e122e8=
617
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f1db9d792355d2e865d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8f1db9d792355d2e8660
        new failure (last pass: next-20230412)

    2023-04-18T12:37:19.654550  / # #
    2023-04-18T12:37:21.114170  export SHELL=3D/bin/sh
    2023-04-18T12:37:21.134612  #
    2023-04-18T12:37:21.134767  / # export SHELL=3D/bin/sh
    2023-04-18T12:37:23.017171  / # . /lava-908160/environment
    2023-04-18T12:37:26.469251  /lava-908160/bin/lava-test-runner /lava-908=
160/1
    2023-04-18T12:37:26.489912  . /lava-908160/environment
    2023-04-18T12:37:26.490042  / # /lava-908160/bin/lava-test-runner /lava=
-908160/1
    2023-04-18T12:37:26.536020  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:37:26.573582  + cd /lava-908160/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8fe591e0f8f7b02e85fc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8fe591e0f8f7b02e85ff
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:40:52.655887  / # #
    2023-04-18T12:40:54.115358  export SHELL=3D/bin/sh
    2023-04-18T12:40:54.135845  #
    2023-04-18T12:40:54.135966  / # export SHELL=3D/bin/sh
    2023-04-18T12:40:56.017744  / # . /lava-908170/environment
    2023-04-18T12:40:59.471447  /lava-908170/bin/lava-test-runner /lava-908=
170/1
    2023-04-18T12:40:59.492115  . /lava-908170/environment
    2023-04-18T12:40:59.492261  / # /lava-908170/bin/lava-test-runner /lava=
-908170/1
    2023-04-18T12:40:59.572872  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:40:59.573011  + cd /lava-908170/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-17   | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90993ffac3bcb22e85e9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e90993ffac3bcb22e85ec
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:43:52.833762  / # #
    2023-04-18T12:43:54.296271  export SHELL=3D/bin/sh
    2023-04-18T12:43:54.316903  #
    2023-04-18T12:43:54.317112  / # export SHELL=3D/bin/sh
    2023-04-18T12:43:56.202839  / # . /lava-908201/environment
    2023-04-18T12:43:59.660890  /lava-908201/bin/lava-test-runner /lava-908=
201/1
    2023-04-18T12:43:59.681685  . /lava-908201/environment
    2023-04-18T12:43:59.681796  / # /lava-908201/bin/lava-test-runner /lava=
-908201/1
    2023-04-18T12:43:59.766781  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:43:59.767109  + cd /lava-908201/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/643e919ca1753a8b7e2e8739

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e919ca1753a8b7e2e873c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:48:10.276728  / # #
    2023-04-18T12:48:11.736567  export SHELL=3D/bin/sh
    2023-04-18T12:48:11.757016  #
    2023-04-18T12:48:11.757134  / # export SHELL=3D/bin/sh
    2023-04-18T12:48:13.640906  / # . /lava-908227/environment
    2023-04-18T12:48:17.092107  /lava-908227/bin/lava-test-runner /lava-908=
227/1
    2023-04-18T12:48:17.112784  . /lava-908227/environment
    2023-04-18T12:48:17.112910  / # /lava-908227/bin/lava-test-runner /lava=
-908227/1
    2023-04-18T12:48:17.158145  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:48:17.195143  + cd /lava-908227/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9250fdfea10c782e85f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e9250fdfea10c782e85f7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:51:10.126413  / # #
    2023-04-18T12:51:11.588984  export SHELL=3D/bin/sh
    2023-04-18T12:51:11.609702  #
    2023-04-18T12:51:11.609911  / # export SHELL=3D/bin/sh
    2023-04-18T12:51:13.495558  / # . /lava-908245/environment
    2023-04-18T12:51:16.953240  /lava-908245/bin/lava-test-runner /lava-908=
245/1
    2023-04-18T12:51:16.974050  . /lava-908245/environment
    2023-04-18T12:51:16.974161  / # /lava-908245/bin/lava-test-runner /lava=
-908245/1
    2023-04-18T12:51:17.054704  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T12:51:17.055323  + cd /lava-908245/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93e091269040282e85ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93e091269040282e8=
5ee
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e963a9c755d53ea2e85ed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e963a9c755d53ea2e85f0
        new failure (last pass: next-20230412)

    2023-04-18T13:07:56.707447  / # #
    2023-04-18T13:07:58.167439  export SHELL=3D/bin/sh
    2023-04-18T13:07:58.187885  #
    2023-04-18T13:07:58.188075  / # export SHELL=3D/bin/sh
    2023-04-18T13:08:00.070188  / # . /lava-908322/environment
    2023-04-18T13:08:03.522423  /lava-908322/bin/lava-test-runner /lava-908=
322/1
    2023-04-18T13:08:03.543160  . /lava-908322/environment
    2023-04-18T13:08:03.543271  / # /lava-908322/bin/lava-test-runner /lava=
-908322/1
    2023-04-18T13:08:03.587899  + export 'TESTRUN_ID=3D1_bootrr'
    2023-04-18T13:08:03.630776  + cd /lava-908322/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13   | cros=
://chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8d42e7dd4458c42e8662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-arm.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
cros---chromeos-5.10-armel-chromiumos-arm.flavour.config/clang-13/lab-colla=
bora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8d42e7dd4458c42e8=
663
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-13   | cros=
://chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8e96f057976c9f2e8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
cros---chromeos-5.10-armel-chromiumos-rockchip.flavour.config/clang-13/lab-=
collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8e96f057976c9f2e8=
664
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9076777a72c8af2e8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9076777a72c8af2e8=
63a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91a2785ff945ab2e85e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91a2785ff945ab2e8=
5ea
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e962b64d4f43ec12e864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e962b64d4f43ec12e8=
64c
        failing since 147 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e972f8b473b44242e863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e972f8b473b44242e8=
640
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9397dd1ae835702e8618

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9397dd1ae835702e8=
619
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e908d0463fb1ccd2e85ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e908d0463fb1ccd2e8=
600
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91a30594a5725e2e85ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91a30594a5725e2e8=
5ed
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9333bb1fc5de462e8601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9333bb1fc5de462e8=
602
        failing since 147 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e94ff9376bac93c2e868f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e94ff9376bac93c2e8=
690
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8b1047ee1b1ebf2e85ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8b1047ee1b1ebf2e8=
5eb
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 25         =


  Details:     https://kernelci.org/test/plan/id/643e8ef68c87c47f582e8656

  Results:     58 PASS, 25 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-typec-phy1-probed: https://kernelci.org/test/c=
ase/id/643e8ef68c87c47f582e865f
        new failure (last pass: next-20230404)

    2023-04-18T12:36:48.671392  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:48.682360  <8>[   55.533738] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy1-probed RESULT=3Dfail>
   =


  * baseline.bootrr.rockchip-typec-phy0-probed: https://kernelci.org/test/c=
ase/id/643e8ef68c87c47f582e8660
        new failure (last pass: next-20230404)

    2023-04-18T12:36:46.614281  <8>[   53.463446] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy-driver-present RESULT=3Dpass>

    2023-04-18T12:36:47.638799  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:47.649539  <8>[   54.500479] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.rockchip-spi2-probed: https://kernelci.org/test/case/id=
/643e8ef68c87c47f582e8664
        new failure (last pass: next-20230404)

    2023-04-18T12:36:45.488819  <8>[   52.339180] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-spi1-probed RESULT=3Dfail>

    2023-04-18T12:36:46.512453  /lava-10030219/1/../bin/lava-test-case
   =


  * baseline.bootrr.rockchip-spi1-probed: https://kernelci.org/test/case/id=
/643e8ef68c87c47f582e8665
        new failure (last pass: next-20230404)

    2023-04-18T12:36:45.478175  /lava-10030219/1/../bin/lava-test-case
   =


  * baseline.bootrr.rockchip-spi0-probed: https://kernelci.org/test/case/id=
/643e8ef68c87c47f582e8666
        new failure (last pass: next-20230404)

    2023-04-18T12:36:44.443615  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:44.453316  <8>[   51.304955] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-spi0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.rockchip-i2s0-probed: https://kernelci.org/test/case/id=
/643e8ef68c87c47f582e8678
        new failure (last pass: next-20230404)

    2023-04-18T12:36:42.944221  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:42.955208  <8>[   49.806859] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
43e8ef68c87c47f582e867f
        new failure (last pass: next-20230404)

    2023-04-18T12:36:41.740361  /lava-10030219/1/../bin/lava-test-case
   =


  * baseline.bootrr.hdmi-audio-codec-probed: https://kernelci.org/test/case=
/id/643e8ef68c87c47f582e868d
        new failure (last pass: next-20230404)

    2023-04-18T12:36:40.334541  /lava-10030219/1/../bin/lava-test-case
   =


  * baseline.bootrr.cros-ec-sysfs-attr-version: https://kernelci.org/test/c=
ase/id/643e8ef68c87c47f582e868f
        new failure (last pass: next-20230404)

    2023-04-18T12:36:39.274407  /lava-10030219/1/../bin/lava-test-case
   =


  * baseline.bootrr.cros-ec-sysfs-attr-kb_wake_angle: https://kernelci.org/=
test/case/id/643e8ef68c87c47f582e8690
        new failure (last pass: next-20230404)

    2023-04-18T12:36:38.245374  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:38.256012  <8>[   45.106260] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-kb_wake_angle RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-sysfs-attr-flashinfo: https://kernelci.org/test=
/case/id/643e8ef68c87c47f582e8691
        new failure (last pass: next-20230404)

    2023-04-18T12:36:37.213372  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:37.223903  <8>[   44.074869] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-flashinfo RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-sysfs-probed: https://kernelci.org/test/case/id=
/643e8ef68c87c47f582e8692
        new failure (last pass: next-20230404)

    2023-04-18T12:36:36.181384  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:36.191101  <8>[   43.042707] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-probed RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-sensorhub-probed: https://kernelci.org/test/cas=
e/id/643e8ef68c87c47f582e8694
        new failure (last pass: next-20230404)

    2023-04-18T12:36:35.114752  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:35.125602  <8>[   41.976595] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensorhub-probed RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/643e8ef68c87c47f582e8696
        new failure (last pass: next-20230404)

    2023-04-18T12:36:30.971024  <8>[   37.821231] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>

    2023-04-18T12:36:31.992528  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:32.003736  <8>[   38.853895] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
43e8ef68c87c47f582e8697
        new failure (last pass: next-20230404)

    2023-04-18T12:36:30.960380  /lava-10030219/1/../bin/lava-test-case
   =


  * baseline.bootrr.cros-ec-pwm-probed: https://kernelci.org/test/case/id/6=
43e8ef68c87c47f582e8699
        new failure (last pass: next-20230404)

    2023-04-18T12:36:29.902894  /lava-10030219/1/../bin/lava-test-case
   =


  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
643e8ef68c87c47f582e869c
        new failure (last pass: next-20230404)

    2023-04-18T12:36:28.813815  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:28.823751  <8>[   35.675014] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-i2c-tunnel-probed: https://kernelci.org/test/ca=
se/id/643e8ef68c87c47f582e869e
        new failure (last pass: next-20230404)

    2023-04-18T12:36:27.746445  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:27.758415  <8>[   34.609595] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-i2c-tunnel-probed RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-dev-probed: https://kernelci.org/test/case/id/6=
43e8ef68c87c47f582e86a0
        new failure (last pass: next-20230404)

    2023-04-18T12:36:26.677342  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:26.687047  <8>[   33.538664] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-dev-probed RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-debugfs-attr-pdinfo: https://kernelci.org/test/=
case/id/643e8ef68c87c47f582e86a2
        new failure (last pass: next-20230404)

    2023-04-18T12:36:25.614479  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:25.626467  <8>[   32.477327] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-attr-pdinfo RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-debugfs-attr-console_log: https://kernelci.org/=
test/case/id/643e8ef68c87c47f582e86a3
        new failure (last pass: next-20230404)

    2023-04-18T12:36:24.584196  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:24.594595  <8>[   31.444394] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-attr-console_log RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-debugfs-probed: https://kernelci.org/test/case/=
id/643e8ef68c87c47f582e86a4
        new failure (last pass: next-20230404)

    2023-04-18T12:36:23.555604  /lava-10030219/1/../bin/lava-test-case

    2023-04-18T12:36:23.567870  <8>[   30.419003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-probed RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e8ef68c87c47f582e86a8
        new failure (last pass: next-20230404)

    2023-04-18T12:36:10.559240  abort info:

    2023-04-18T12:36:10.563924  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-18T12:36:10.570450  kern  :<8>[   17.419541] <LAVA_SIGNAL_ENDRU=
N 0_dmesg 10030219_1.5.2.3.1>

    2023-04-18T12:36:10.573751  alert :   CM =3D 0, WnR =3D 0

    2023-04-18T12:36:10.580712  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D000000000961a000

    2023-04-18T12:36:10.586743  kern  :alert : [0000000000000008] pgd=3D080=
0000009626003

    2023-04-18T12:36:10.593896  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-18T12:36:10.599943  kern  :emerg : Code: 97fdee78 f9405688 5286=
4a69 72a686c9 (b9400908) =


    2023-04-18T12:36:10.600980  + set +x

    2023-04-18T12:36:10.705469  #
 =

    ... (33 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8ef68c87c47=
f582e86aa
        new failure (last pass: next-20230404)
        2 lines

    2023-04-18T12:36:10.525554  fo:

    2023-04-18T12:36:10.528242  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-18T12:36:10.534676  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-18T12:36:10.537412  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-18T12:36:10.541064  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-18T12:36:10.546970  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-18T12:36:10.557899  kern  :alert : Data <8>[   17.402901] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8ef68c87c47=
f582e86ab
        new failure (last pass: next-20230404)
        12 lines

    2023-04-18T12:36:10.488116  <8>[   17.336785] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>

    2023-04-18T12:36:10.511456  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-18T12:36:10.523630  kern  :alert : Mem abort in<8>[   17.367274=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 25         =


  Details:     https://kernelci.org/test/plan/id/643e90250231938eca2e85f7

  Results:     58 PASS, 25 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-typec-phy1-probed: https://kernelci.org/test/c=
ase/id/643e90250231938eca2e8600
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:06.949582  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:42:06.960729  <8>[   55.550659] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy1-probed RESULT=3Dfail>
   =


  * baseline.bootrr.rockchip-typec-phy0-probed: https://kernelci.org/test/c=
ase/id/643e90250231938eca2e8601
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:04.898320  <8>[   53.486792] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy-driver-present RESULT=3Dpass>

    2023-04-18T12:42:05.913924  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:42:05.924029  <8>[   54.514102] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.rockchip-spi2-probed: https://kernelci.org/test/case/id=
/643e90250231938eca2e8605
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:03.788708  <8>[   52.378549] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-spi1-probed RESULT=3Dfail>

    2023-04-18T12:42:04.805188  /lava-10030488/1/../bin/lava-test-case
   =


  * baseline.bootrr.rockchip-spi1-probed: https://kernelci.org/test/case/id=
/643e90250231938eca2e8606
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:03.778085  /lava-10030488/1/../bin/lava-test-case
   =


  * baseline.bootrr.rockchip-spi0-probed: https://kernelci.org/test/case/id=
/643e90250231938eca2e8607
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:01.721772  <8>[   50.310495] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-spi-driver-present RESULT=3Dpass>

    2023-04-18T12:42:02.743356  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:42:02.753111  <8>[   51.342851] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-spi0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.rockchip-i2s0-probed: https://kernelci.org/test/case/id=
/643e90250231938eca2e8619
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:01.247340  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:42:01.257090  <8>[   49.846908] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dfail>
   =


  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
43e90250231938eca2e8620
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:42:00.042262  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:42:00.052471  <8>[   48.642179] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.hdmi-audio-codec-probed: https://kernelci.org/test/case=
/id/643e90250231938eca2e862e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:58.619990  /lava-10030488/1/../bin/lava-test-case
   =


  * baseline.bootrr.cros-ec-sysfs-attr-version: https://kernelci.org/test/c=
ase/id/643e90250231938eca2e8630
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:56.537018  <8>[   45.124916] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-kb_wake_angle RESULT=3Dfail>

    2023-04-18T12:41:57.557945  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:41:57.568010  <8>[   46.157116] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-version RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-sysfs-attr-kb_wake_angle: https://kernelci.org/=
test/case/id/643e90250231938eca2e8631
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:56.525195  /lava-10030488/1/../bin/lava-test-case
   =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/643e90250231938eca2e8632
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:49.269167  <8>[   37.859311] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>

    2023-04-18T12:41:50.287100  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:41:50.299268  <8>[   38.888786] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
43e90250231938eca2e8633
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:49.259420  /lava-10030488/1/../bin/lava-test-case
   =


  * baseline.bootrr.cros-ec-pwm-probed: https://kernelci.org/test/case/id/6=
43e90250231938eca2e8635
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:48.200327  /lava-10030488/1/../bin/lava-test-case
   =


  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
643e90250231938eca2e8638
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:47.114524  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:41:47.124494  <8>[   35.714626] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-i2c-tunnel-probed: https://kernelci.org/test/ca=
se/id/643e90250231938eca2e863a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:45.041959  <8>[   33.630012] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-i2c-tunnel-driver-present RESULT=3Dpass>

    2023-04-18T12:41:46.059223  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:41:46.069378  <8>[   34.658704] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-i2c-tunnel-probed RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-sysfs-attr-flashinfo: https://kernelci.org/test=
/case/id/643e90250231938eca2e863b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:55.493383  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:41:55.504141  <8>[   44.093654] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-flashinfo RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-sysfs-probed: https://kernelci.org/test/case/id=
/643e90250231938eca2e863c
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:53.440878  <8>[   42.030371] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-driver-present RESULT=3Dpass>

    2023-04-18T12:41:54.463216  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:41:54.472610  <8>[   43.062135] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-probed RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-sensorhub-probed: https://kernelci.org/test/cas=
e/id/643e90250231938eca2e863e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:53.407907  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:41:53.418996  <8>[   42.008985] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensorhub-probed RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/643e90250231938eca2e8641
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:28.896467  abort info:

    2023-04-18T12:41:28.900102  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-18T12:41:28.907539  kern  :<8>[   17.493945] <LAVA_SIGNAL_ENDRU=
N 0_dmesg 10030488_1.5.2.3.1>

    2023-04-18T12:41:28.909748  alert :   CM =3D 0, WnR =3D 0

    2023-04-18T12:41:28.917727  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000020ea1000

    2023-04-18T12:41:28.928799  kern  :alert : [0000000000000008] pgd=3D080=
0000020ea7003, p4d=3D0800000020ea7003, pud=3D0800000020ea8003, pmd=3D000000=
0000000000

    2023-04-18T12:41:28.936370  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-18T12:41:28.942780  kern  :emerg : Code: 97fe7110 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-18T12:41:28.943385  + set +x

    2023-04-18T12:41:29.047361  =

 =

    ... (32 line(s) more)  =


  * baseline.bootrr.cros-ec-dev-probed: https://kernelci.org/test/case/id/6=
43e90250231938eca2e8643
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:45.003791  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:41:45.011945  <8>[   33.602475] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-dev-probed RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-debugfs-attr-pdinfo: https://kernelci.org/test/=
case/id/643e90250231938eca2e8645
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:43.942387  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:41:43.952694  <8>[   32.542261] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-attr-pdinfo RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-debugfs-attr-console_log: https://kernelci.org/=
test/case/id/643e90250231938eca2e8646
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:42.917337  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:41:42.929205  <8>[   31.518460] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-attr-console_log RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-debugfs-probed: https://kernelci.org/test/case/=
id/643e90250231938eca2e8647
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:41:41.886353  /lava-10030488/1/../bin/lava-test-case

    2023-04-18T12:41:41.894294  <8>[   30.484356] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-probed RESULT=3Dfail>
   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e90250231938=
eca2e864b
        failing since 7 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-18T12:41:28.861694  kern  :alert : Mem abort in<8>[   17.442756=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D12>

    2023-04-18T12:41:28.862206  fo:

    2023-04-18T12:41:28.865393  kern  :alert :   ESR =3D 0x0000000096000006

    2023-04-18T12:41:28.870819  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-18T12:41:28.874199  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-18T12:41:28.878317  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-18T12:41:28.882811  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-18T12:41:28.894480  kern  :alert : Data <8>[   17.478444] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D2>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e90250231938=
eca2e864c
        failing since 7 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-18T12:41:28.847557  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008
   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e940a977ae6dffb2e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e940a977ae6dffb2e8=
5ec
        failing since 69 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e8efd8c87c47f582e86b7

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-rk33=
99-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-collabora/baseline-rk33=
99-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e8efd8c87c47=
f582e86be
        failing since 3 days (last pass: next-20230406, first fail: v6.3-rc=
6-12018-gd3f2cd248191)
        2 lines

    2023-04-18T12:36:56.371332  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP

    2023-04-18T12:36:56.371904  kern  :emerg : Code: 97ee2e87 f9405688 5286=
4a69 72a686c9 (b9400908) =


    2023-04-18T12:36:56.372284  <8>[   24.473478] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-18T12:36:56.372640  + set +x

    2023-04-18T12:36:56.372983  <8>[   24.475323] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030374_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e8efd8c87c47=
f582e86bf
        failing since 3 days (last pass: next-20230406, first fail: v6.3-rc=
6-12018-gd3f2cd248191)
        12 lines

    2023-04-18T12:36:56.324606  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000008

    2023-04-18T12:36:56.325178  kern  :alert : Mem abort info:

    2023-04-18T12:36:56.325606  kern  :alert :   ESR =3D 0x0000000096000007

    2023-04-18T12:36:56.325962  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-18T12:36:56.326300  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-18T12:36:56.326630  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-18T12:36:56.326954  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault

    2023-04-18T12:36:56.327275  kern  :alert : Data abort info:

    2023-04-18T12:36:56.327589  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-04-18T12:36:56.327904  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (3 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-17   | defc=
onfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/643e9005e824a337672e8606

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e9005e824a33=
7672e860d
        failing since 7 days (last pass: next-20230405, first fail: next-20=
230411)
        2 lines

    2023-04-18T12:41:30.128542  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-18T12:41:30.129146  kern  :emerg : Code: 97fdf6df f9405688 5286=
4a69 72a686c9 (b9400908) =


    2023-04-18T12:41:30.129548  <8>[   18.849249] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-18T12:41:30.129973  + set +x

    2023-04-18T12:41:30.130341  <8>[   18.851088] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030421_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e9005e824a33=
7672e860e
        failing since 7 days (last pass: next-20230405, first fail: next-20=
230411)
        12 lines

    2023-04-18T12:41:30.101960  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault

    2023-04-18T12:41:30.102556  kern  :alert : Data abort info:

    2023-04-18T12:41:30.102950  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-18T12:41:30.103316  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-18T12:41:30.103669  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000009d03000

    2023-04-18T12:41:30.104035  kern  :alert : [0000000000000008] pgd=3D080=
0000009cfc003, p4d=3D0800000009cfc003, pud=3D0800000009cfb003, pmd=3D000000=
0000000000

    2023-04-18T12:41:30.104433  <8>[   18.824380] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/643e91089439ab20162e85e6

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e91089439ab2=
0162e85ed
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411)
        4 lines

    2023-04-18T12:45:44.225421  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#1] PREEMPT SMP

    2023-04-18T12:45:44.225580  kern  :emerg : Code: 54000520 d1008061 f900=
06c1 9100c060 (b9403062) =


    2023-04-18T12:45:44.225692  kern  :emerg : Internal error: Oops: 000000=
0096000007 [#2] PREEMPT SMP

    2023-04-18T12:45:44.225786  kern  :emerg : Code: 97da30be f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-18T12:45:44.225863  <8>[   51.590212] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D4>

    2023-04-18T12:45:44.225955  + set +x

    2023-04-18T12:45:44.226031  <8>[   51.591795] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030545_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e91089439ab2=
0162e85ee
        failing since 7 days (last pass: next-20230406, first fail: next-20=
230411)
        24 lines

    2023-04-18T12:45:44.136774  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000030

    2023-04-18T12:45:44.136875  kern  :alert : Mem abort info:

    2023-04-18T12:45:44.136972  kern  :alert :   ESR =3D 0x0000000096000007

    2023-04-18T12:45:44.137066  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits

    2023-04-18T12:45:44.137142  kern  :alert :   SET =3D 0, FnV =3D 0

    2023-04-18T12:45:44.137218  kern  :alert :   EA =3D 0, S1PTW =3D 0

    2023-04-18T12:45:44.137341  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault

    2023-04-18T12:45:44.137402  kern  :alert : Data abort info:

    2023-04-18T12:45:44.137488  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
007

    2023-04-18T12:45:44.137546  kern  :alert :   CM =3D 0, WnR =3D 0
 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/643e94b106706267172e8632

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/643e94b10670626=
7172e8639
        failing since 7 days (last pass: next-20230404, first fail: next-20=
230411)
        2 lines

    2023-04-18T13:01:19.252590  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP

    2023-04-18T13:01:19.252922  kern  :emerg : Code: 97fc1510 f9405680 5286=
4a61 72a686c1 (b9400800) =


    2023-04-18T13:01:19.253183  <8>[   26.583553] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>

    2023-04-18T13:01:19.253431  + set +x

    2023-04-18T13:01:19.253701  <8>[   26.585419] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10030781_1.5.2.4.1>
   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/643e94b10670626=
7172e863a
        failing since 7 days (last pass: next-20230404, first fail: next-20=
230411)
        12 lines

    2023-04-18T13:01:19.223444  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006

    2023-04-18T13:01:19.223658  kern  :alert :   CM =3D 0, WnR =3D 0

    2023-04-18T13:01:19.223800  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D0000000009ec6000

    2023-04-18T13:01:19.223923  kern  :alert : [0000000000000008] pgd=3D080=
000000a071003, p4d=3D080000000a071003, pud=3D080000000a072003, pmd=3D000000=
0000000000

    2023-04-18T13:01:19.224044  <8>[   26.555981] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93e2b0005c7fa82e8609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93e2b0005c7fa82e8=
60a
        failing since 69 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e908b0463fb1ccd2e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e908b0463fb1ccd2e8=
5f8
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17   | defc=
onfig                    | 7          =


  Details:     https://kernelci.org/test/plan/id/643e925896926225812e85e8

  Results:     37 PASS, 11 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.gpu-probed: https://kernelci.org/test/case/id/643e92589=
6926225812e85eb
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:51:14.105435  /lava-347167/1/../bin/lava-test-case
    2023-04-18T12:51:14.117367  <8>[   26.440214] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dgpu-probed RESULT=3Dfail>   =


  * baseline.bootrr.soc-crypto-probed: https://kernelci.org/test/case/id/64=
3e925896926225812e85f6
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:51:12.720225  /lava-347167/1/../bin/lava-test-case
    2023-04-18T12:51:12.732935  <8>[   25.055893] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsoc-crypto-probed RESULT=3Dfail>   =


  * baseline.bootrr.usb3-probed: https://kernelci.org/test/case/id/643e9258=
96926225812e8603
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:51:11.053427  /lava-347167/1/../bin/lava-test-case
    2023-04-18T12:51:11.065209  <8>[   23.388466] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dusb3-probed RESULT=3Dfail>   =


  * baseline.bootrr.usb1-probed: https://kernelci.org/test/case/id/643e9258=
96926225812e8604
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:51:10.008288  /lava-347167/1/../bin/lava-test-case
    2023-04-18T12:51:10.021111  <8>[   22.344105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dusb1-probed RESULT=3Dfail>   =


  * baseline.bootrr.usb4-probed: https://kernelci.org/test/case/id/643e9258=
96926225812e8606
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:51:08.932573  /lava-347167/1/../bin/lava-test-case
    2023-04-18T12:51:08.944168  <8>[   21.267963] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dusb4-probed RESULT=3Dfail>   =


  * baseline.bootrr.usb2-probed: https://kernelci.org/test/case/id/643e9258=
96926225812e8607
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:51:07.888543  /lava-347167/1/../bin/lava-test-case
    2023-04-18T12:51:07.900335  <8>[   20.223342] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dusb2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mmc-probed: https://kernelci.org/test/case/id/643e92589=
6926225812e860b
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191)

    2023-04-18T12:51:06.740775  /lava-347167/1/../bin/lava-test-case
    2023-04-18T12:51:06.752583  <8>[   19.075666] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmmc-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91e04a3fcd849f2e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91e04a3fcd849f2e8=
5f4
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93aca60315a5fd2e8626

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93aca60315a5fd2e8=
627
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 7          =


  Details:     https://kernelci.org/test/plan/id/643e95dda75bc682042e866b

  Results:     37 PASS, 11 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.gpu-probed: https://kernelci.org/test/case/id/643e95dda=
75bc682042e866e
        new failure (last pass: next-20230412)

    2023-04-18T13:06:18.677962  /lava-347500/1/../bin/lava-test-case
    2023-04-18T13:06:18.689561  <8>[   31.580960] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dgpu-probed RESULT=3Dfail>   =


  * baseline.bootrr.soc-crypto-probed: https://kernelci.org/test/case/id/64=
3e95dda75bc682042e8679
        new failure (last pass: next-20230412)

    2023-04-18T13:06:17.313592  /lava-347500/1/../bin/lava-test-case
    2023-04-18T13:06:17.325563  <8>[   30.216436] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsoc-crypto-probed RESULT=3Dfail>   =


  * baseline.bootrr.usb3-probed: https://kernelci.org/test/case/id/643e95dd=
a75bc682042e868c
        new failure (last pass: next-20230412)

    2023-04-18T13:06:15.641200  /lava-347500/1/../bin/lava-test-case
    2023-04-18T13:06:15.652773  <8>[   28.544213] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dusb3-probed RESULT=3Dfail>   =


  * baseline.bootrr.usb1-probed: https://kernelci.org/test/case/id/643e95dd=
a75bc682042e868d
        new failure (last pass: next-20230412)

    2023-04-18T13:06:14.597691  /lava-347500/1/../bin/lava-test-case
    2023-04-18T13:06:14.609409  <8>[   27.500746] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dusb1-probed RESULT=3Dfail>   =


  * baseline.bootrr.usb4-probed: https://kernelci.org/test/case/id/643e95dd=
a75bc682042e868f
        new failure (last pass: next-20230412)

    2023-04-18T13:06:13.520980  /lava-347500/1/../bin/lava-test-case
    2023-04-18T13:06:13.532675  <8>[   26.424216] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dusb4-probed RESULT=3Dfail>   =


  * baseline.bootrr.usb2-probed: https://kernelci.org/test/case/id/643e95dd=
a75bc682042e8690
        new failure (last pass: next-20230412)

    2023-04-18T13:06:12.477831  /lava-347500/1/../bin/lava-test-case
    2023-04-18T13:06:12.489563  <8>[   25.380961] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dusb2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mmc-probed: https://kernelci.org/test/case/id/643e95dda=
75bc682042e8694
        new failure (last pass: next-20230412)

    2023-04-18T13:06:11.336566  /lava-347500/1/../bin/lava-test-case
    2023-04-18T13:06:11.348299  <8>[   24.239881] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmmc-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90cc7b1cb8c6e02e85eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-broonie/baseline-sun50i=
-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90cc7b1cb8c6e02e8=
5ec
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17   | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91cb38f4edffc62e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91cb38f4edffc62e8=
606
        new failure (last pass: next-20230411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9233a27851c6d92e8610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9233a27851c6d92e8=
611
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/643e952931a483d3e72e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e952931a483d3e72e8=
5e7
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91cbe74fbf32ea2e8605

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91cbe74fbf32ea2e8=
606
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9552d58d0cd4d02e8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9552d58d0cd4d02e8=
638
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90a23ffac3bcb22e85fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90a23ffac3bcb22e8=
5fd
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91b4785ff945ab2e863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91b4785ff945ab2e8=
63e
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e95a2ba33262af02e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e95a2ba33262af02e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f292a56dc58ae2e8662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f292a56dc58ae2e8=
663
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9c21710d2a1f292e85fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9c21710d2a1f292e8=
5ff
        new failure (last pass: next-20230303) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e953fd436390ea12e8606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e953fd436390ea12e8=
607
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e963064d4f43ec12e8672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e963064d4f43ec12e8=
673
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9d116621919b022e8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9d116621919b022e8=
652
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643e92fbeb85feae5f2e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e92fbeb85feae5f2e8=
618
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9cd501006bbfd62e85fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9cd501006bbfd62e8=
5fe
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e958fb4fcf597e82e8612

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e958fb4fcf597e82e8=
613
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e96f837eb3d730b2e8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e96f837eb3d730b2e8=
648
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9d75f5fccf203a2e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9d75f5fccf203a2e8=
5e7
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h2-plus-orangepi-r1    | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643e9388f8b66e5dd52e85f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e9388f8b66e5dd52e8=
5f2
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643eb308cd867d771d2e8617

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eb308cd867d771d2e8=
618
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643eab9ba8b3164e122e8619

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eab9ba8b3164e122e8=
61a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643ead2bb75abc73bf2e85f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643ead2bb75abc73bf2e8=
5f4
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643eb3e452102b64642e85f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eb3e452102b64642e8=
5fa
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643eaa337d6a7e50e52e8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643eaa337d6a7e50e52e8=
643
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | clang-17   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e93deb703fdaf192e85e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230417071830+ae77=
aceba5ad-1~exp1~20230417071935.630))
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e93deb703fdaf192e8=
5e7
        new failure (last pass: next-20230412) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/643e90956e7d2473c92e86eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-lib=
retech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-lib=
retech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e90956e7d2473c92e8=
6ec
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/643e91cde74fbf32ea2e860f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e91cde74fbf32ea2e8=
610
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/643e950213b4a3e5f62e85f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e950213b4a3e5f62e8=
5f8
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/643e8f11b9d792355d2e8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230417/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230414.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/643e8f11b9d792355d2e8=
65a
        new failure (last pass: v6.3-rc6-12018-gd3f2cd248191) =

 =20
