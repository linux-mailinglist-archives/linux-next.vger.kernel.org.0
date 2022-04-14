Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544AE500A61
	for <lists+linux-next@lfdr.de>; Thu, 14 Apr 2022 11:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiDNJuN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Apr 2022 05:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242089AbiDNJuJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Apr 2022 05:50:09 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0893412608
        for <linux-next@vger.kernel.org>; Thu, 14 Apr 2022 02:47:35 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id b15so4383531pfm.5
        for <linux-next@vger.kernel.org>; Thu, 14 Apr 2022 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=isCeNVIiCHmolcYwrgu5Os+7B74Rdo2QFVeisfx6wVo=;
        b=MCw8XAsZNavKon1tzE9L9NT5l3AQXXSzzei8J6KQpEpvDkPZ/XEyjeBcKAsI5Z/xuX
         xfA4BS8vT20/ptw0cypSSxZTV0qWe3XVLGedqgATVB9waq6LCPhPqsewLEaxu8DNfaFP
         RVT8FU0P6EhY1IzXJrl45hELvNEC2HEHAl6ood1XadaRee5swzIw58ZqWWQah06sTFMV
         2iqyBIvx+8z5/q71JoDXTbZA0qzfldUVkfNZ45kx7UfaHOd4Pvfo1hBFudwpJJ8fc8qS
         MBb9+kh6REQcX58dGQtWeo/ogI3oUDFebhrImEGBdHx3ZKxHDQTZTCcmaCGiGJC8KL/c
         e9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=isCeNVIiCHmolcYwrgu5Os+7B74Rdo2QFVeisfx6wVo=;
        b=MxBZdQLgrmZTUpSF+FloGOGoCLwT8vN/5wWNfoB2Q1179eUXh5IK4aQBUtRk0TQYkk
         culQ2wFiWyYG7X+RjmYU9++iwEjjkDtbWouHc32FU+9eQ2PVxmoeRZZD+p7TuwClOM1d
         JfsuquYqzNNnblbIcdoOEDlgry7D7IdaDn6BDKpagc9deu1hMAGpS5URYh7yMpQCj4dK
         ruNxPjKIp4OFrxPfvWXVfzkRfbFjWJNS03WzM/wqrwWOr5dDm/hIg+V8qYJN7MGyKCSC
         78alY7GvplzKl1jHA22a9DIdMhppteLgtxxIDpkUQLathRWqZNuGtUvig8rekpGkGC77
         JVFQ==
X-Gm-Message-State: AOAM533zzJgXBVU4reBuRS0GTMtxhMJ6OCOkicSUATA5bPDVUY/DkBZ4
        66Oxni3H21dD1aBJg4jpJOSvse1RG9xkSTa3
X-Google-Smtp-Source: ABdhPJyRO6eQ/eFBhtGoqvSFP9Sg5Fxv9RsKDYNKcMPRXh7l/TLDD17r/+cBuJOADnZh1W8IFgC/SA==
X-Received: by 2002:a62:1714:0:b0:505:fbff:fe8e with SMTP id 20-20020a621714000000b00505fbfffe8emr12895092pfx.49.1649929653055;
        Thu, 14 Apr 2022 02:47:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c15-20020a63350f000000b003992202f95fsm1488795pga.38.2022.04.14.02.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 02:47:32 -0700 (PDT)
Message-ID: <6257edb4.1c69fb81.ca839.418f@mx.google.com>
Date:   Thu, 14 Apr 2022 02:47:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220414
X-Kernelci-Report-Type: test
Subject: next/master baseline: 536 runs, 215 regressions (next-20220414)
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

next/master baseline: 536 runs, 215 regressions (next-20220414)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =

at91sam9g20ek                | arm   | lab-broonie   | clang-14 | multi_v5_=
defconfig           | 1          =

at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

beaglebone-black             | arm   | lab-cip       | clang-14 | multi_v7_=
defconfig           | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =

cubietruck                   | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

da850-lcdk                   | arm   | lab-baylibre  | clang-14 | multi_v5_=
defconfig           | 1          =

da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =

imx6q-sabrelite              | arm   | lab-collabora | clang-14 | multi_v7_=
defconfig           | 1          =

imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig           | 1          =

imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx6q-sabresd                | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =

imx6q-sabresd                | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =

imx6q-sabresd                | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabresd                | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx6qp-sabresd               | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =

imx6qp-sabresd               | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6qp-sabresd               | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =

imx6qp-sabresd               | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6qp-sabresd               | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                    | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =

imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =

imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config              | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | clang-14 | defconfig=
                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+debug              | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | clang-14 | defconfig=
                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson8b-odroidc1             | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

meson8b-odroidc1             | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220414/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220414
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      40354149f4d738dc3492d9998e45b3f02950369a =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b8b7da5790415aae06a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b8b7da5790415aae0=
6a4
        failing since 2 days (last pass: next-20220315, first fail: next-20=
220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bbb0a0ac3b5b64ae069f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-am57xx-beagl=
e-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-am57xx-beagl=
e-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bbb0a0ac3b5b64ae0=
6a0
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc6423faaee4ceae069f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-am=
57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-am=
57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc6423faaee4ceae0=
6a0
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
am57xx-beagle-x15            | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b868c6231454baae0685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b868c6231454baae0=
686
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | clang-14 | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b5c01f72aaff55ae06a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v5_defconfig/clang-14/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v5_defconfig/clang-14/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b5c01f72aaff55ae0=
6a1
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b63868deda3500ae0692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b63868deda3500ae0=
693
        failing since 2 days (last pass: next-20220408, first fail: next-20=
220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc3103ccca778eae06ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc3103ccca778eae0=
6ad
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bce22497894447ae0681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bce22497894447ae0=
682
        failing since 13 days (last pass: next-20220328, first fail: next-2=
0220329) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c247e29ebe412bae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c247e29ebe412bae0=
67d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc07755850574eae06cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc07755850574eae0=
6ce
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257beb080b44f500cae068f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257beb080b44f500cae0=
690
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c1cf76c161c187ae0694

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c1cf76c161c187ae0=
695
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b9877839101cf6ae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b9877839101cf6ae0=
67e
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bcf2999584bebaae067f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bcf2999584bebaae0=
680
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b8e24785797e32ae06a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b8e24785797e32ae0=
6a3
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257ba720bacebd1a2ae068a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257ba720bacebd1a2ae0=
68b
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb8a447f3939f9ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb8a447f3939f9ae0=
67d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b4cf942ef5f891ae0680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b4cf942ef5f891ae0=
681
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | clang-14 | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b597a92514dd4bae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v5_defconfig/clang-14/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v5_defconfig/clang-14/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b597a92514dd4bae0=
67e
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b60f61b867db5cae0726

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b60f61b867db5cae0=
727
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabrelite              | arm   | lab-collabora | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bcf32497894447ae077e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bcf32497894447ae0=
77f
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc3f371dd43d6eae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc3f371dd43d6eae0=
67f
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc9bf70d575199ae068b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc9bf70d575199ae0=
68c
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bce89245967eb6ae0683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bce89245967eb6ae0=
684
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabresd                | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257be0b013ef7b340ae06d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257be0b013ef7b340ae0=
6d8
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabresd                | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb16e3a8740b00ae069b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb16e3a8740b00ae0=
69c
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabresd                | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc1701567618aaae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc1701567618aaae0=
67f
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabresd                | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd45ad466939f6ae069c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6q-s=
abresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6q-s=
abresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd45ad466939f6ae0=
69d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bcc6fe4f25606cae06b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-imx6q-var-dt6customboard.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-imx6q-var-dt6customboard.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bcc6fe4f25606cae0=
6b2
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b8879bbb0cefa6ae0698

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b8879bbb0cefa6ae0=
699
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b8e94785797e32ae06ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b8e94785797e32ae0=
6ac
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257ba3fc01b99d2e0ae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-imx6q-var-dt=
6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-imx6q-var-dt=
6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257ba3fc01b99d2e0ae0=
67e
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257baa85af469009eae06b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-im=
x6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-im=
x6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257baa85af469009eae0=
6b9
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6qp-sabresd               | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd6b48d2f2e983ae06a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd6b48d2f2e983ae0=
6a9
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6qp-sabresd               | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b90218e6182f2bae0693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b90218e6182f2bae0=
694
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6qp-sabresd               | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b98ee63e0ae27fae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6qp-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b98ee63e0ae27fae0=
67f
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6qp-sabresd               | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb21e3a8740b00ae06a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6qp-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6qp-sabresd.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb21e3a8740b00ae0=
6a7
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6qp-sabresd               | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc06755850574eae06c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6qp-=
sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6qp-=
sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc06755850574eae0=
6c9
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd94ce6604e47bae0689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd94ce6604e47bae0=
68a
        failing since 0 day (last pass: next-20220406, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b91b0a8dc30304ae068b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b91b0a8dc30304ae0=
68c
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b9bbece6ec5efeae0684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b9bbece6ec5efeae0=
685
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bad62698d32c18ae068c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bad62698d32c18ae0=
68d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bbd3ce9267a623ae0690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6sx-=
sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6sx-=
sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bbd3ce9267a623ae0=
691
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd86ce6604e47bae0684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd86ce6604e47bae0=
685
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b9298c7184b53fae06a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b9298c7184b53fae0=
6a3
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b9ddece6ec5efeae0698

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b9ddece6ec5efeae0=
699
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257baebd5039d58c8ae06a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257baebd5039d58c8ae0=
6a7
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bbe021e1880896ae06e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx6ul-=
14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bbe021e1880896ae0=
6e2
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd81fa4725cbceae0683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd81fa4725cbceae0=
684
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b916325b978781ae068e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b916325b978781ae0=
68f
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b930325b978781ae06b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b930325b978781ae0=
6b2
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb1c718f7f3c9aae068b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb1c718f7f3c9aae0=
68c
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb6afcb8aeadd7ae069d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7d-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb6afcb8aeadd7ae0=
69e
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd89ed0fbc7fa6ae068d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd89ed0fbc7fa6ae0=
68e
        failing since 0 day (last pass: next-20220406, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b94fce5ee03528ae06dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b94fce5ee03528ae0=
6de
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b9e4ff34d450b0ae068a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b9e4ff34d450b0ae0=
68b
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb25e3a8740b00ae06ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb25e3a8740b00ae0=
6ac
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc2a01567618aaae068c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc2a01567618aaae0=
68d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bae41d5fd3e885ae06bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bae41d5fd3e885ae0=
6bd
        new failure (last pass: next-20220413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd2dad466939f6ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd2dad466939f6ae0=
67d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257baac10b1a06afbae069c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257baac10b1a06afbae0=
69d
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bafcd5039d58c8ae06b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bafcd5039d58c8ae0=
6b2
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bbb221e1880896ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bbb221e1880896ae0=
67d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | tegra_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b803e43c38ff05ae06a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b803e43c38ff05ae0=
6a3
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b60861b867db5cae06b1

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
57b60861b867db5cae06ba
        failing since 0 day (last pass: next-20220408, first fail: next-202=
20413)

    2022-04-14T05:49:51.606822  /lava-108586/1/../bin/lava-test-case
    2022-04-14T05:49:51.607197  <8>[   17.479904] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-14T05:49:51.607430  /lava-108586/1/../bin/lava-test-case
    2022-04-14T05:49:51.607651  <8>[   17.496087] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-14T05:49:51.607872  /lava-108586/1/../bin/lava-test-case
    2022-04-14T05:49:51.608084  <8>[   17.511577] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-04-14T05:49:51.608321  /lava-108586/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bfe21a44a81fb3ae06f9

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
57bfe21a44a81fb3ae0702
        new failure (last pass: next-20220411)

    2022-04-14T06:31:49.600673  /lava-108628/1/../bin/lava-test-case
    2022-04-14T06:31:49.601066  <8>[   17.891728] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-14T06:31:49.601301  /lava-108628/1/../bin/lava-test-case
    2022-04-14T06:31:49.601522  <8>[   17.907839] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-14T06:31:49.601742  /lava-108628/1/../bin/lava-test-case
    2022-04-14T06:31:49.601954  <8>[   17.923256] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-04-14T06:31:49.602166  /lava-108628/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb45934c94351cae0688

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
57bb45934c94351cae0691
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413)

    2022-04-14T06:12:00.109251  /lava-108600/1/../bin/lava-test-case
    2022-04-14T06:12:00.109518  <8>[   18.243620] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-14T06:12:00.109669  /lava-108600/1/../bin/lava-test-case
    2022-04-14T06:12:00.109808  <8>[   18.260125] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-14T06:12:00.109949  /lava-108600/1/../bin/lava-test-case
    2022-04-14T06:12:00.110088  <8>[   18.276577] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-04-14T06:12:00.110228  /lava-108600/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc3501567618aaae06ad

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
57bc3501567618aaae06b6
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413)

    2022-04-14T06:16:09.902068  /lava-108608/1/../bin/lava-test-case
    2022-04-14T06:16:09.902372  <8>[   17.222932] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-14T06:16:09.902556  /lava-108608/1/../bin/lava-test-case
    2022-04-14T06:16:09.902730  <8>[   17.239788] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-14T06:16:09.902902  /lava-108608/1/../bin/lava-test-case
    2022-04-14T06:16:09.903070  <8>[   17.255410] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-04-14T06:16:09.903238  /lava-108608/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd129245967eb6ae0699

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
57bd129245967eb6ae06a2
        new failure (last pass: next-20220411)

    2022-04-14T06:19:37.762408  /lava-108612/1/../bin/lava-test-case
    2022-04-14T06:19:37.762696  <8>[   17.570096] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-14T06:19:37.762853  /lava-108612/1/../bin/lava-test-case
    2022-04-14T06:19:37.763002  <8>[   17.587358] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-14T06:19:37.763151  /lava-108612/1/../bin/lava-test-case
    2022-04-14T06:19:37.763293  <8>[   17.602907] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-04-14T06:19:37.763435  /lava-108612/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd6291ec0ba5f6ae06ce

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
57bd6291ec0ba5f6ae06d7
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413)

    2022-04-14T06:21:11.468198  <8>[   17.193069] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-driver-present RESULT=3Dpass>
    2022-04-14T06:21:12.515590  /lava-108618/1/../bin/lava-test-case
    2022-04-14T06:21:12.515983  <8>[   18.210842] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2022-04-14T06:21:12.516197  /lava-108618/1/../bin/lava-test-case
    2022-04-14T06:21:12.516525  <8>[   18.227803] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2022-04-14T06:21:12.516833  /lava-108618/1/../bin/lava-test-case
    2022-04-14T06:21:12.517124  <8>[   18.244335] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2022-04-14T06:21:12.517425  /lava-108618/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bf2e7b2aac1551ae06a9

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
57bf2e7b2aac1551ae06b2
        new failure (last pass: next-20220411)

    2022-04-14T06:28:36.137866  <8>[   37.415960][  T311] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-driver-present RESULT=3Dpass>
    2022-04-14T06:28:37.289414  /lava-108625/1/../bin/lava-test-case
    2022-04-14T06:28:37.376324  <8>[   38.657246][  T316] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b71714d8a19473ae0687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b71714d8a19473ae0=
688
        failing since 0 day (last pass: next-20220401, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bdd07f07a1503bae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bdd07f07a1503bae0=
67e
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bac068b71ae48dae069a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bac068b71ae48dae0=
69b
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb276c3435e2f6ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb276c3435e2f6ae0=
67d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc2a01567618aaae068f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc2a01567618aaae0=
690
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc7b19f9f3f8beae06ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc7b19f9f3f8beae0=
6f0
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b82b89ead9a2b8ae0692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b82b89ead9a2b8ae0=
693
        failing since 0 day (last pass: next-20220330, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c3e5b466c0f69cae069d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c3e5b466c0f69cae0=
69e
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c009a130da26a4ae06b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c009a130da26a4ae0=
6b6
        failing since 0 day (last pass: next-20220330, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257ce3be798bb9263ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257ce3be798bb9263ae0=
67d
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd2c7c03cf8734ae06ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd2c7c03cf8734ae0=
6ac
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bf34403145e52aae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim=
3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim=
3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bf34403145e52aae0=
67d
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bf5c717a625147ae06ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bf5c717a625147ae0=
6ed
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c1c976c161c187ae068f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c1c976c161c187ae0=
690
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c26f016e7c8cc5ae0786

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c26f016e7c8cc5ae0=
787
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c3d1ee09a84895ae0684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c3d1ee09a84895ae0=
685
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c74ee314cb10b8ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vi=
m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vi=
m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c74ee314cb10b8ae0=
67d
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257ca852d93c388deae0682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257ca852d93c388deae0=
683
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b72714d8a19473ae069a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b72714d8a19473ae0=
69b
        failing since 16 days (last pass: next-20220322, first fail: next-2=
0220328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c1b576c161c187ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c1b576c161c187ae0=
67d
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb886fc9acb8e5ae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb886fc9acb8e5ae0=
67f
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bcdc2497894447ae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bcdc2497894447ae0=
67e
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257be30d5c0d4b2e4ae067f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257be30d5c0d4b2e4ae0=
680
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bf84919cff99c3ae068f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bf84919cff99c3ae0=
690
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b79f385d05c0a0ae0688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b79f385d05c0a0ae0=
689
        failing since 0 day (last pass: next-20220322, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c99aee376d00d8ae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c99aee376d00d8ae0=
67e
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bcb4fe4f25606cae068b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bcb4fe4f25606cae0=
68c
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bef87b2aac1551ae068d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bef87b2aac1551ae0=
68e
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c18dfaf00bfa35ae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c18dfaf00bfa35ae0=
67e
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c381b466c0f69cae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c381b466c0f69cae0=
67d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b72114d8a19473ae0694

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b72114d8a19473ae0=
695
        failing since 0 day (last pass: next-20220408, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c1bdd109fd01f2ae069f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c1bdd109fd01f2ae0=
6a0
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bab710b1a06afbae06b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bab710b1a06afbae0=
6b1
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc2003ccca778eae0694

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc2003ccca778eae0=
695
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd8432212884cfae0690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-a=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-a=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd8432212884cfae0=
691
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257beec755ef65355ae0696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257beec755ef65355ae0=
697
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b7c89cc32cd2cdae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b7c89cc32cd2cdae0=
67d
        failing since 0 day (last pass: next-20220406, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c88338f1ed08adae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c88338f1ed08adae0=
67d
        new failure (last pass: next-20220121) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bcc82b0fb475fdae067f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bcc82b0fb475fdae0=
680
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c128aaf36e97ddae067f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c128aaf36e97ddae0=
680
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c3083046a24399ae06ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c3083046a24399ae0=
6af
        failing since 2 days (last pass: next-20220406, first fail: next-20=
220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257ca642d93c388deae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257ca642d93c388deae0=
67d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257d0f3ff3c52a9f8ae0685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257d0f3ff3c52a9f8ae0=
686
        failing since 88 days (last pass: next-20220105, first fail: next-2=
0220116) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b88f9bbb0cefa6ae06a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b88f9bbb0cefa6ae0=
6a7
        failing since 0 day (last pass: next-20220408, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc63eb4b298504ae06f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc63eb4b298504ae0=
6f5
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bee434c6c95d81ae06bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bee434c6c95d81ae0=
6bc
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c09c8d642cf5c1ae06f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c09c8d642cf5c1ae0=
6f1
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c268016e7c8cc5ae0780

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c268016e7c8cc5ae0=
781
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b708ef47ed5a93ae06b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b708ef47ed5a93ae0=
6ba
        failing since 0 day (last pass: next-20220408, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bdfe20b735be1fae06e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bdfe20b735be1fae0=
6e4
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bab95af469009eae06c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bab95af469009eae0=
6c8
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb2c6c3435e2f6ae0683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb2c6c3435e2f6ae0=
684
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc3203ccca778eae06af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc3203ccca778eae0=
6b0
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc9efe4f25606cae0686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc9efe4f25606cae0=
687
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bdadce6604e47bae068e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bdadce6604e47bae0=
68f
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257d5b71fc4106f4bae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257d5b71fc4106f4bae0=
67f
        failing since 0 day (last pass: next-20220408, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257ed2a7d9088e332ae069e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257ed2a7d9088e332ae0=
69f
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257e081b688069ab3ae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257e081b688069ab3ae0=
67e
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257e2edfd84d4f387ae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257e2edfd84d4f387ae0=
67e
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257e699b0c943f1c6ae0690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257e699b0c943f1c6ae0=
691
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257eb5e2d9cf5bc9fae067f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257eb5e2d9cf5bc9fae0=
680
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257ec63a6bbda4fd3ae068c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257ec63a6bbda4fd3ae0=
68d
        failing since 2 days (last pass: next-20220408, first fail: next-20=
220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b71d14d8a19473ae068e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b71d14d8a19473ae0=
68f
        failing since 0 day (last pass: next-20220401, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bdff013ef7b340ae0699

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bdff013ef7b340ae0=
69a
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b8fd18e6182f2bae0683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b8fd18e6182f2bae0=
684
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bac49ad7649647ae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bac49ad7649647ae0=
67f
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb2eb4cce20c10ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb2eb4cce20c10ae0=
67d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc2c01567618aaae0692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc2c01567618aaae0=
693
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc9cfe4f25606cae0683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc9cfe4f25606cae0=
684
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre  | clang-14 | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b6ffef47ed5a93ae06a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-14/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b6ffef47ed5a93ae0=
6a6
        failing since 0 day (last pass: next-20220330, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre  | clang-14 | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c100d6f87c47c1ae067f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c100d6f87c47c1ae0=
680
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b8f44785797e32ae06ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b8f44785797e32ae0=
6af
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bac28ebe4ddf53ae06a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bac28ebe4ddf53ae0=
6a3
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc283a05c06b91ae069b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc283a05c06b91ae0=
69c
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd9048d2f2e983ae06b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd9048d2f2e983ae0=
6ba
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bee4755ef65355ae0692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bee4755ef65355ae0=
693
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b9c474ee563c2fae0685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b9c474ee563c2fae0=
686
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257baa610b1a06afbae0699

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-me=
son8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-me=
son8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257baa610b1a06afbae0=
69a
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bed0755ef65355ae0686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bed0755ef65355ae0=
687
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b96cce5ee03528ae06ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b96cce5ee03528ae0=
6f0
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd6891ec0ba5f6ae072f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd6891ec0ba5f6ae0=
730
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257be0820b735be1fae06e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257be0820b735be1fae0=
6ea
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b8a39bbb0cefa6ae06b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b8a39bbb0cefa6ae0=
6b5
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c0423f9a9d4274ae06ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c0423f9a9d4274ae0=
6ad
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd21b870dc33a8ae0698

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd21b870dc33a8ae0=
699
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257baa268b71ae48dae0689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257baa268b71ae48dae0=
68a
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc9afe4f25606cae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc9afe4f25606cae0=
67f
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd247c03cf8734ae06a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd247c03cf8734ae0=
6a6
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b9ad74ee563c2fae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b9ad74ee563c2fae0=
67d
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bac69ad7649647ae0686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bac69ad7649647ae0=
687
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb02d5039d58c8ae06b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb02d5039d58c8ae0=
6b8
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c0413f9a9d4274ae06a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c0413f9a9d4274ae0=
6a7
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd1fb870dc33a8ae0692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd1fb870dc33a8ae0=
693
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257badec5cc84b1aaae0690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257badec5cc84b1aaae0=
691
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc98f70d575199ae0684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc98f70d575199ae0=
685
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd227c03cf8734ae069f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd227c03cf8734ae0=
6a0
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b9d4158115d9feae06af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b9d4158115d9feae0=
6b0
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bac5524a15eb96ae0708

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bac5524a15eb96ae0=
709
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257baeec5cc84b1aaae06a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257baeec5cc84b1aaae0=
6a1
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257c005e1ba996b54ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257c005e1ba996b54ae0=
67d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd1eb870dc33a8ae068f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd1eb870dc33a8ae0=
690
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bab65af469009eae06c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bab65af469009eae0=
6c5
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc96decde7f6d9ae0692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc96decde7f6d9ae0=
693
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd20b870dc33a8ae0695

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd20b870dc33a8ae0=
696
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b9d3158115d9feae06ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b9d3158115d9feae0=
6ad
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bab210b1a06afbae06aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bab210b1a06afbae0=
6ab
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257baed2698d32c18ae069e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257baed2698d32c18ae0=
69f
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bfe01a44a81fb3ae06a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bfe01a44a81fb3ae0=
6aa
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bcf6999584bebaae0684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bcf6999584bebaae0=
685
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bab410b1a06afbae06ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bab410b1a06afbae0=
6ae
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bcc14784ed3402ae0693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bcc14784ed3402ae0=
694
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd237c03cf8734ae06a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd237c03cf8734ae0=
6a3
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b99af0f098975cae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b99af0f098975cae0=
67f
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bad91d5fd3e885ae06b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bad91d5fd3e885ae0=
6b7
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb00d5039d58c8ae06b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb00d5039d58c8ae0=
6b5
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bfdd1a44a81fb3ae069b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bfdd1a44a81fb3ae0=
69c
        failing since 63 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bce2a377a6d6e4ae0697

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bce2a377a6d6e4ae0=
698
        failing since 63 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bf8d251ce11dc9ae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bf8d251ce11dc9ae0=
67d
        failing since 63 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bce0a377a6d6e4ae0694

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bce0a377a6d6e4ae0=
695
        failing since 63 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bcc8a377a6d6e4ae0682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bcc8a377a6d6e4ae0=
683
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b8cf8c1b73112cae068c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b8cf8c1b73112cae0=
68d
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257ba4847c817f0b5ae06f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257ba4847c817f0b5ae0=
6fa
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257baad5af469009eae06bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257baad5af469009eae0=
6bc
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b4a69d6f4a943aae06ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b4a69d6f4a943aae0=
6ae
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bd01999584bebaae068c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bd01999584bebaae0=
68d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b8dc4785797e32ae0699

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b8dc4785797e32ae0=
69a
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257ba9468b71ae48dae0681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257ba9468b71ae48dae0=
682
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bb0de3a8740b00ae068a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bb0de3a8740b00ae0=
68b
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b4a39d6f4a943aae069f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b4a39d6f4a943aae0=
6a0
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257be057f07a1503bae0704

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h2-plus-orangepi-ze=
ro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257be057f07a1503bae0=
705
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b969ce5ee03528ae06ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b969ce5ee03528ae0=
6ed
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bbaea0ac3b5b64ae069c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bbaea0ac3b5b64ae0=
69d
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bc6123faaee4ceae0699

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bc6123faaee4ceae0=
69a
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b4f4738ebb4e38ae067d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b4f4738ebb4e38ae0=
67e
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bcc34784ed3402ae0696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bcc34784ed3402ae0=
697
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b8c34785797e32ae067e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b8c34785797e32ae0=
67f
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257ba4047c817f0b5ae0686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-ban=
anapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-ban=
anapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257ba4047c817f0b5ae0=
687
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257baa55af469009eae06b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257baa55af469009eae0=
6b6
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b4af9d6f4a943aae06b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b4af9d6f4a943aae0=
6b4
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | clang-14 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bcd42b0fb475fdae0699

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.1-++20220407063018+ec13f=
ed5867f-1~exp1~20220407063103.113)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-sun8i-h3-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bcd42b0fb475fdae0=
69a
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b8d54785797e32ae0683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b8d54785797e32ae0=
684
        new failure (last pass: next-20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6257ba5288c33257e9ae0696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-lib=
retech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun8i-h3-lib=
retech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257ba5288c33257e9ae0=
697
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6257bacb9ad7649647ae0689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n8i-h3-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257bacb9ad7649647ae0=
68a
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/6257b49b9d6f4a943aae0699

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220414/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6257b49b9d6f4a943aae0=
69a
        failing since 0 day (last pass: next-20220411, first fail: next-202=
20413) =

 =20
